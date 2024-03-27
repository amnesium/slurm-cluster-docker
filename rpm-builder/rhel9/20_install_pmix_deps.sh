#!/bin/sh
# Minimal dependencies for pmix
set -ex

dnf install -y \
  libevent-devel \
  zlib-devel \
  hwloc-devel \
  flex \
  python3 \
  python3-devel
