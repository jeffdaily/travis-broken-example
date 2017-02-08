#!/usr/bin/env bash

set -x
set -e

mkdir dist
# Move archives to dist
mv *.tar.gz dist
mv *.zip dist

PLATFORM=`python -c "import distutils.util as u; print(u.get_platform())"`
PACKAGE=dummy
VERSION=`./version.sh`
BINNAME=$PACKAGE-$VERSION-$PLATFORM
SRCNAME=$PACKAGE-$VERSION

# Create binary release
mv tmp $BINNAME
zip -r $BINNAME.zip $BINNAME
mv $BINNAME.zip dist

# Generate hash sums
cd dist
md5 -r $BINNAME.zip     > $BINNAME.zip.md5
md5 -r $SRCNAME.zip     > $SRCNAME.zip.md5
md5 -r $SRCNAME.tar.gz  > $SRCNAME.tar.gz.md5
shasum -a 1 $BINNAME.zip    > $BINNAME.zip.sha1
shasum -a 1 $SRCNAME.zip    > $SRCNAME.zip.sha1
shasum -a 1 $SRCNAME.tar.gz > $SRCNAME.tar.gz.sha1
cd -

