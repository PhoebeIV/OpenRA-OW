#!/usr/bin/env bash
# Builds an OpenRA-OW release for THIS computer. No input needed.
# Downloads the latest source and leaves the finished file in ./release/
set -euo pipefail

. "$(dirname "$0")/packaging/release-lib.sh"

case "$(uname -s)-$(uname -m)" in
	Darwin-arm64) rid="osx-arm64"; name="macos-arm64.zip" ;;
	Darwin-x86_64) rid="osx-x64";  name="macos-x64.zip" ;;
	Linux-x86_64) rid="linux-x64"; name="linux-x86_64.AppImage" ;;
	MINGW*|MSYS*|CYGWIN*) rid="win-x64"; name="windows-x64.zip" ;;
	*) echo "Unsupported: $(uname -s) $(uname -m)"; exit 1 ;;
esac

version="$(date +%Y%m%d)"               # e.g. 20260803
mkdir -p ./release
work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT

echo "==> Downloading the latest OpenRA-OW source"
fetch_source "$work"

echo "==> Building $rid"
publish_and_copy "$work/OpenRA-OW" "$version" "$rid" "$work/build"
if [ "$rid" = "linux-x64" ]; then
	make_appimage "$work/build" "./release/OpenRA-OW-$version-$name"
else
	zip_dir "$work/build" "./release/OpenRA-OW-$version-$name"
fi

echo
echo "Done. Your release file is in ./release/"
ls -lh ./release/
