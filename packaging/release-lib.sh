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
find_icon_png() {
	local src="$1"
	local name="ow"
	for size in 1024 512 256 128 64 48 32 24 16; do
		if [ -f "$src/packaging/artwork/${name}_${size}x${size}.png" ]; then
			echo "$src/packaging/artwork/${name}_${size}x${size}.png"
			return
		fi
	done
	echo "$src/mods/ow/icon.png"
}
make_ico() {
	local out="$1" src="$2"
	local pngs=()
	local size
	for size in 16 24 32 48 64 128 256 512 1024; do
		if [ -f "$src/packaging/artwork/ow_${size}x${size}.png" ]; then
			pngs+=("$src/packaging/artwork/ow_${size}x${size}.png")
		fi
	done
	[ ${#pngs[@]} -eq 0 ] && pngs+=("$src/mods/ow/icon.png")

	python3 - "$out" "${pngs[@]}" <<'PYEOF'
import struct, sys

out, pngs = sys.argv[1], sys.argv[2:]
offset = 6 + 16 * len(pngs)
entries, blobs = [], []
for p in pngs:
    with open(p, 'rb') as f:
        data = f.read()
    w, h = struct.unpack_from('>II', data, 16)
    blobs.append(data)
    entries.append(struct.pack(
        '<BBBBHHII',
        w if w < 256 else 0,   # width (0 means 256)
        h if h < 256 else 0,   # height (0 means 256)
        0,                     # colors
        0,                     # reserved
        1,                     # planes
        32,                    # bpp
        len(data),             # bytes in resource
        offset                 # image offset
    ))
    offset += len(data)
with open(out, 'wb') as f:
    f.write(struct.pack('<HHH', 0, 1, len(pngs))
            + b''.join(entries) + b''.join(blobs))
PYEOF
}
# Publish the engine self-contained + copy the mod/data files into <build>
publish_and_copy() {
	local src="$1" version="$2" rid="$3" build="$4"

	if [ ! -f "$src/OpenRA-OWEngine/OpenRA.slnx" ]; then
		echo "Engine source not found at $src/OpenRA-OWEngine" >&2
		echo "Run 'git submodule update --init --recursive' in the repo, or use --remote." >&2
		exit 1
	fi

	sh "$src/fetch-geoip.sh"
	
	
	local bin_dir="$build"
	[ "$rid" != "win-x64" ] && bin_dir="$build/bin"

	dotnet publish "$src/OpenRA-OWEngine/OpenRA.slnx" -c Release -r "$rid" --self-contained true \
		-p:TargetPlatform="$rid" -p:CopyCncDll=True -p:CopyD2kDll=True \
		-p:CopyGenericLauncher="$([ "$rid" = "win-x64" ] && echo False || echo True)" \
		-p:PublishDir="$bin_dir"

	mkdir -p "$build/mods"
	for d in ow common common-content ra ra-content all; do
		cp -r "$src/mods/$d" "$build/mods/"
	done
	local icon="$(find_icon_png "$src")"
	if [ -n "$icon" ] && [ "$icon" != "$src/mods/ow/icon.png" ]; then
		cp "$icon" "$build/mods/ow/icon.png"
	fi
	cp "$(find_icon_png "$src")" "$build/mods/ow/icon.png"
	cp -r "$src/glsl" "$build/"
	cp "$src/VERSION" "$src/AUTHORS" "$src/COPYING" "$build/"
	cp "$src/global mix database.dat" "$build/"
	cp "$src/IP2LOCATION-LITE-DB1.IPV6.BIN.ZIP" "$build/" 2>/dev/null || true
	echo "OpenRA-OW-$version" > "$build/VERSION"
	sed -i.bak "s/Version:.*/Version: OpenRA-OW-$version/" "$build/mods/ow/mod.yaml"
	rm -f "$build/mods/ow/mod.yaml.bak"
	cat > "$build/server.conf" <<'EOF'
# OW dedicated server settings. Command-line args (--port/--name/--map) override these.
Name=OW Server
ListenPort=10668
Map=
Password=
AdvertiseOnline=True
AdvertiseOnLocalNetwork=True
RecordReplays=False
RequireAuthentication=False
ProfileIDBlacklist=
ProfileIDWhitelist=
EnableSingleplayer=False
EnableSyncReports=False
EnableGeoIP=True
EnableLintChecks=True
ShareAnonymizedIPs=True
FloodLimitJoinCooldown=5000
EOF
	
case "$rid" in
    osx-*)
        cat > "$build/launch-game.command" <<'EOF'
#!/bin/sh
set -e
HERE=$(dirname "$0")
cd "$HERE"
exec ./bin/OpenRA Game.Mod=ow Engine.EngineDir=".." Engine.LaunchPath="$HERE/bin/OpenRA"
EOF
        cat > "$build/launch-server.command" <<'EOF'
#!/bin/sh
set -e
HERE=$(dirname "$0")
cd "$HERE"
CONF="${CONF:-"$HERE/server.conf"}"
exec ./bin/OpenRA.Server Engine.EngineDir=".." Game.Mod=ow --conf "$CONF" "$@"
EOF
        chmod +x "$build/launch-game.command" "$build/launch-server.command"
        ;;
    linux-x64)
        cat > "$build/launch-server.sh" <<'EOF'
#!/bin/sh
set -e
HERE=$(dirname "$0")
CONF="${CONF:-"$HERE/server.conf"}"
exec ./bin/OpenRA.Server Engine.EngineDir=".." Game.Mod=ow --conf "$CONF" "$@"
EOF
        chmod +x "$build/launch-server.sh"
        ;;
    win-x64)
        cat > "$build/launch-server.bat" <<'EOF'
@echo off
if exist "%~dp0bin\OpenRA.Server.exe" (
    bin\OpenRA.Server.exe Engine.EngineDir=".." Game.Mod=ow --conf "%~dp0server.conf" %*
) else (
    OpenRA.Server.exe Game.Mod=ow --conf "%~dp0server.conf" %*
)
EOF
        ;;
esac

if [ "$rid" = "win-x64" ]; then
	local launcher_icon=""
	if command -v python3 >/dev/null 2>&1; then
		launcher_icon="$build/mods/ow/icon.ico"
		make_ico "$launcher_icon" "$src"
	fi
	dotnet publish "$src/OpenRA-OWEngine/OpenRA.WindowsLauncher" -c Release -r win-x64 --self-contained true \
		-p:ModID=ow -p:LauncherName=OW -p:DisplayName="Opposing Worlds" \
		-p:FaqUrl="https://wiki.openra.net/FAQ" \
		${launcher_icon:+-p:LauncherIcon="$launcher_icon"} \
		-p:PublishDir="$build"
fi
}

zip_dir() {
	local build="$1" outfile="$2"
	outfile="$(cd "$(dirname "$outfile")" && pwd)/$(basename "$outfile")"
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

	for tool in file desktop-file-validate; do
		if ! command -v "$tool" >/dev/null 2>&1; then
			echo "appimagetool requires '$tool'. Install it, e.g. apt install file desktop-file-utils" >&2
			exit 1
		fi
	done

	mkdir -p "$appdir/usr/lib/openra"
	cp -r "$build/bin" "$build/mods" "$build/glsl" "$appdir/usr/lib/openra/"
	cp "$build/VERSION" "$build/AUTHORS" "$build/COPYING" "$appdir/usr/lib/openra/"
	cp "$build/global mix database.dat" "$appdir/usr/lib/openra/"
	cp "$build/server.conf" "$build/launch-server.sh" "$appdir/usr/lib/openra/"

	printf '#!/bin/sh\nset -e\nHERE="$(dirname "$0")"\ncd "$HERE/usr/lib/openra"\nexec ./bin/OpenRA Game.Mod=ow Engine.EngineDir=".." Engine.LaunchPath="$HERE/usr/lib/openra/bin/OpenRA"\n' \
		> "$appdir/AppRun"
	chmod +x "$appdir/AppRun"

	mkdir -p "$appdir/usr/share/applications" "$appdir/usr/share/icons/hicolor/256x256/apps"
	# appimagetool only looks for *.desktop in the AppDir root, so write it
	# there as well as in the FSH-standard location.
	
	cat > "$appdir/openra-ow.desktop" <<-EOF
	[Desktop Entry]
	Type=Application
	Name=OpenRA - Opposing Worlds
	Comment=Opposing Worlds mod for OpenRA
	Exec=AppRun
	Icon=openra-ow
	Terminal=false
	Categories=Game;StrategyGame;
	EOF
	cp "$appdir/openra-ow.desktop" "$appdir/usr/share/applications/openra-ow.desktop"
	# appimagetool also resolves Icon=<name> against the AppDir root.
	cp "$build/mods/ow/icon.png" "$appdir/openra-ow.png"
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
