#!/usr/bin/env bash

set -x
set -e

mkdir tmp
BUILD_PREFIX=$PWD/tmp

CONFIG_OPTS=()
CONFIG_OPTS+=("--prefix=${BUILD_PREFIX}")

if [ $TRAVIS_OS_NAME == "osx" ]
then
    CONFIG_OPTS+=("CFLAGS=\"-O3 -arch x86_64 -arch i386\"")
    CONFIG_OPTS+=("CXXFLAGS=\"-O3 -arch x86_64 -arch i386\"")
else
    CONFIG_OPTS+=("CFLAGS=\"-O3\"")
    CONFIG_OPTS+=("CXXFLAGS=\"-O3\"")
fi

# Build and check this project
(
    ./configure "${CONFIG_OPTS[@]}" &&
    make &&
    make check &&
    make install &&
    make dist-gzip &&
    make dist-zip
) || exit 1

