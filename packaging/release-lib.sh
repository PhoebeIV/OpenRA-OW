#!/usr/bin/env bash
# Shared helpers for make-release.sh and make-full-release.sh
set -euo pipefail

# Clone the latest source; the engine submodule is listed as an ssh url,
# so switch to https to avoid needing ssh keys.
fetch_source() {
	local work="$1"
	git clone --quiet https://github.com/PhoebeIV/OpenRA-OW.git "$work/OpenRA-OW"
	git -C "$work/OpenRA-OW" config url."https://github.com/".insteadOf "git@github.com:"
	git -C "$work/OpenRA-OW" submodule update --init --recursive --quiet
}

# Publish the engine self-contained + copy the mod/data files into <build>
publish_and_copy() {
	local src="$1" version="$2" rid="$3" build="$4"

	"$src/fetch-geoip.sh"

	local bin_dir="$build"
	[ "$rid" != "win-x64" ] && bin_dir="$build/bin"

	dotnet publish "$src/OpenRA-OWEngine/OpenRA.slnx" -c Release -r "$rid" --self-contained true \
		-p:TargetPlatform="$rid" -p:CopyCncDll=True -p:CopyD2kDll=True \
		-p:CopyGenericLauncher="$([ "$rid" = "win-x64" ] && echo False || echo True)" \
		-p:PublishDir="$bin_dir"

	for d in ow common common-content ra ra-content all; do
		cp -r "$src/mods/$d" "$build/mods/"
	done
	cp -r "$src/glsl" "$build/"
	cp "$src/VERSION" "$src/AUTHORS" "$src/COPYING" "$build/"
	cp "$src/global mix database.dat" "$build/"
	cp "$src/IP2LOCATION-LITE-DB1.IPV6.BIN.ZIP" "$build/" 2>/dev/null || true
	echo "$version" > "$build/VERSION"
	sed -i.bak "s/Version:.*/Version: $version/" "$build/mods/ow/mod.yaml"
	rm -f "$build/mods/ow/mod.yaml.bak"

	if [ "$rid" = "win-x64" ]; then
		dotnet publish "$src/OpenRA-OWEngine/OpenRA.WindowsLauncher" -c Release -r win-x64 --self-contained true \
			-p:ModID=ow -p:LauncherName=OW -p:DisplayName="Opposing Worlds" \
			-p:FaqUrl="https://wiki.openra.net/FAQ" -p:PublishDir="$build"
	else
		printf '#!/bin/bash\ncd "$(dirname "$0")"\nexec ./bin/OpenRA Game.Mod=ow Engine.EngineDir=".."\n' \
			> "$build/OpenRA-OW.command"
		chmod +x "$build/OpenRA-OW.command"
	fi
}

zip_dir() {
	local build="$1" outfile="$2"
	if command -v zip >/dev/null 2>&1; then
		(cd "$build" && zip -qr "$outfile" .)
	elif command -v python3 >/dev/null 2>&1; then
		python3 - "$build" "$outfile" <<'EOF'
import sys, zipfile, os
src, dst = sys.argv[1], sys.argv[2]
with zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED) as z:
    for root, dirs, files in os.walk(src):
        for f in files:
            p = os.path.join(root, f)
            z.write(p, os.path.relpath(p, src))
EOF
	else
		echo "zip or python3 is required to create the release archive" >&2
		exit 1
	fi
}

make_appimage() {
	local build="$1" outfile="$2"
	local appdir="$build/AppDir"

	mkdir -p "$appdir/usr/lib/openra"
	cp -r "$build/bin" "$build/mods" "$build/glsl" "$appdir/usr/lib/openra/"
	cp "$build/VERSION" "$build/AUTHORS" "$build/COPYING" "$appdir/usr/lib/openra/"
	cp "$build/global mix database.dat" "$appdir/usr/lib/openra/"

	printf '#!/bin/sh\nset -e\nHERE="$(dirname "$0")"\ncd "$HERE/usr/lib/openra"\nexec ./bin/OpenRA Game.Mod=ow Engine.EngineDir=".."\n' \
		> "$appdir/AppRun"
	chmod +x "$appdir/AppRun"

	mkdir -p "$appdir/usr/share/applications" "$appdir/usr/share/icons/hicolor/256x256/apps"
	cat > "$appdir/usr/share/applications/openra-ow.desktop" <<-EOF
	[Desktop Entry]
	Type=Application
	Name=OpenRA - Opposing Worlds
	Comment=Opposing Worlds mod for OpenRA
	Exec=AppRun
	Icon=openra-ow
	Terminal=false
	Categories=Game;StrategyGame;
	EOF
	cp "$build/mods/ow/icon.png" "$appdir/usr/share/icons/hicolor/256x256/apps/openra-ow.png"

	local tool="$HOME/.cache/openra-ow/appimagetool"
	if [ ! -x "$tool" ]; then
		echo "==> Downloading appimagetool"
		mkdir -p "$(dirname "$tool")"
		curl -sL -o "$tool" https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
		chmod +x "$tool"
	fi

	# --appimage-extract-and-run avoids needing FUSE, so this works inside WSL2
	ARCH=x86_64 "$tool" --appimage-extract-and-run --no-appstream "$appdir" "$outfile"
}
