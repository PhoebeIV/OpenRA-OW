#!/usr/bin/env bash
# Builds the FULL set of OpenRA-OW release files for the GitHub Releases tab.
# Run this on Linux (WSL2 or a VM). No input needed.
set -euo pipefail

. "$(dirname "$0")/packaging/release-lib.sh"

if [ "$(uname -s)" != "Linux" ]; then
	echo "Full builds must run on Linux (WSL2 or a VM)."
	echo "On other systems use ./make-release.sh to build that platform alone."
	exit 1
fi

version="$(date +%Y%m%d)"
mkdir -p ./release
work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT

echo "==> Downloading the latest OpenRA-OW source"
fetch_source "$work"
src="$work/OpenRA-OW"

echo "==> Linux AppImage"
publish_and_copy "$src" "$version" linux-x64 "$work/build-linux"
make_appimage "$work/build-linux" "./release/OpenRA-OW-$version-linux-x86_64.AppImage"

echo "==> Windows portable"
publish_and_copy "$src" "$version" win-x64 "$work/build-win"
zip_dir "$work/build-win" "./release/OpenRA-OW-$version-windows-x64.zip"

echo "==> macOS portable"
publish_and_copy "$src" "$version" osx-arm64 "$work/build-mac"
zip_dir "$work/build-mac" "./release/OpenRA-OW-$version-macos-arm64.zip"

echo
echo "Done. Upload these to a GitHub Release:"
ls -lh ./release/
