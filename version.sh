#!/bin/sh
#
# This script extracts the version from dummy.h, which is the master
# location for this information.
#
if [ ! -f dummy.h ]; then
    echo "version.sh: error: dummy.h does not exist" 1>&2
    exit 1
fi
MAJOR=`egrep '^#define +DUMMY_VERSION_MAJOR +[0-9]+$' dummy.h`
MINOR=`egrep '^#define +DUMMY_VERSION_MINOR +[0-9]+$' dummy.h`
PATCH=`egrep '^#define +DUMMY_VERSION_PATCH +[0-9]+$' dummy.h`
if [ -z "$MAJOR" -o -z "$MINOR" -o -z "$PATCH" ]; then
    echo "version.sh: error: could not extract version from dummy.h" 1>&2
    exit 1
fi
MAJOR=`echo $MAJOR | awk '{ print $3 }'`
MINOR=`echo $MINOR | awk '{ print $3 }'`
PATCH=`echo $PATCH | awk '{ print $3 }'`
echo $MAJOR.$MINOR.$PATCH | tr -d '\n'

