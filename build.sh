#!/bin/bash
set -euxo pipefail

docker pull ubuntu:latest

# Ubuntu dynamically linked
docker build --force-rm -f Dockerfile -t fffaraz/qt:latest .

# Ubuntu statically linked
docker build --force-rm -f Dockerfile.static -t fffaraz/qt:static .

# MXE (M cross environment)
docker build --force-rm -f Dockerfile.mxe -t fffaraz/qt:mxe .

# Windows 32bit statically linked
docker build --force-rm -f Dockerfile.win32s -t fffaraz/qt:win32s .

# Windows 64bit statically linked
docker build --force-rm -f Dockerfile.win64s -t fffaraz/qt:win64s .

# Windows 32bit dynamically linked
docker build --force-rm -f Dockerfile.win32d -t fffaraz/qt:win32d .

# Windows 64bit dynamically linked
docker build --force-rm -f Dockerfile.win64d -t fffaraz/qt:win64d .
