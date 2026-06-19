#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/Dashlane/dashlane-cli"
TOOL_NAME="dashlane-cli"
TOOL_TEST="dcli -V"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if dashlane-cli is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	# List all tags from GitHub releases, which correspond to the version numbers.
	list_github_tags
}

get_asset_name() {
	local os arch platform target_arch

	os="$(uname -s | tr '[:upper:]' '[:lower:]')"
	arch="$(uname -m)"

	case "$os" in
		darwin) platform="macos" ;;
		linux) platform="linux" ;;
		*) fail "Platform $os not supported" ;;
	esac

	case "$arch" in
		x86_64|amd64) target_arch="x64" ;;
		arm64|aarch64)
			if [ "$platform" = "linux" ]; then
				fail "Architecture $arch on Linux is not supported by dashlane-cli upstream precompiled releases."
			fi
			target_arch="arm64"
			;;
		*) fail "Architecture $arch not supported" ;;
	esac

	echo "dcli-${platform}-${target_arch}"
}

download_release() {
	local version filename url asset_name
	version="$1"
	filename="$2"

	asset_name="$(get_asset_name)"
	url="$GH_REPO/releases/download/v${version}/${asset_name}"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"
		chmod +x "$install_path/dcli"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
