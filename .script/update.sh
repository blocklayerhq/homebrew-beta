#!/bin/bash

set -exu

FORMULA="blocklayerhq/beta/bl"

cd "$(dirname "$0")/.."

git pull

binary="$(mktemp /tmp/bl-cli-XXXXXX)"
curl -o "$binary" "https://blocklayer-dev.s3.amazonaws.com/beta/cli/latest/bl-Darwin-x86_64"
chmod +x "$binary"

old_digest="$(brew fetch $FORMULA | grep 'SHA256: ' | awk '{ print $2 }')"
old_brew_version="$(brew info --json $FORMULA | jq '.[0].versions.stable')"

new_bin_version="$("$binary" version)"
new_digest="$(shasum -a 256 "$binary" | cut -d' ' -f1)"
build_number="1"
today="$(date '+%Y%m%d')"

if [ "$new_digest" = "$old_digest" ]; then
	echo "binary unchanged, nothing to do"
	exit 1
fi

# Check if another release happened earlier today (same version)
if [ "$($old_brew_version | cut -d. -f1)" = "$today" ]; then
	build_number="$($old_brew_version | cut -d. -f1)"
	((build_number=build_number+1))
fi

new_brew_version="${today}.${build_number}"

cp bl.rb.tpl bl.rb

sed -i '' "s/__BIN_VERSION__/${new_bin_version}/g" bl.rb
sed -i '' "s/__BIN_DIGEST__/${new_digest}/g" bl.rb
sed -i '' "s/__BREW_VERSION__/${new_brew_version}/g" bl.rb

rm -f "$binary"

if [ -n "$(git status -s . | grep -e '^ M bl.rb')" ] ; then
	git commit bl.rb -m "bump bl formula version to ${new_brew_version} (cli version ${new_bin_version})"
	git push origin master
fi
