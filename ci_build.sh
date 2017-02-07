#!/usr/bin/env bash

set -x
set -e

mkdir tmp
BUILD_PREFIX=$PWD/tmp

CONFIG_OPTS=()
CONFIG_OPTS+=("--prefix=${BUILD_PREFIX}")

# Build and check this project
(
    ./configure "${CONFIG_OPTS[@]}" &&
    make &&
    make check &&
    make install &&
    make dist-gzip &&
    make dist-zip
) || exit 1

