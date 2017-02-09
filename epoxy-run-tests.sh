#!/bin/bash

# Start Xvfb
XVFB_WHD=${XVFB_WHD:-1280x720x16}

Xvfb :99 -ac -screen 0 $XVFB_WHD -nolisten tcp &
xvfb=$!

export DISPLAY=:99

if [[ -n "$TRAVIS" ]]; then
  git clone https://github.com/anholt/libepoxy /root/libepoxy
  cd /root/libepoxy
fi

mkdir _build && cd _build

meson --prefix /usr "$@" .. || exit $?
ninja || exit $?
ninja test || exit $?

cd ..

rm -rf _build
