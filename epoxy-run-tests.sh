#!/bin/bash

# Start Xvfb
XVFB_WHD=${XVFB_WHD:-1280x720x16}

Xvfb :99 -ac -screen 0 $XVFB_WHD -nolisten tcp &
xvfb=$!

export DISPLAY=:99

mkdir _build

meson --prefix /usr "$@" _build . || exit $?
ninja -C _build || exit $?
ninja -C _build test || exit $?

rm -rf _build
