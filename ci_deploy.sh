#!/usr/bin/env bash

set -x
set -e

mkdir dist
# Move archives to dist
mv *.tar.gz dist
mv *.zip dist

# Create binary release
mv tmp osx-`version.sh`
zip -r osx-`version.sh`.zip osx-`version.sh`
mv osx-`version.sh`.zip dist

# Generate hash sums
cd dist
md5sum *.zip *.tar.gz > MD5SUMS
sha1sum *.zip *.tar.gz > SHA1SUMS
cd -

