FROM ubuntu:latest
ENTRYPOINT ["/bin/bash"]

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt -y update && \
    apt -y upgrade && \
    apt -y install build-essential cmake gdb git iputils-ping nano perl python valgrind wget lzip \
        mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev \
        zlib1g-dev libssl-dev libnss3-dev libmysqlclient-dev libsqlite3-dev libxslt-dev libxml2-dev libjpeg-dev libpng-dev libopus-dev \
        libxcursor-dev libxcb1-dev libxcb-xkb-dev libx11-xcb-dev libxrender-dev libxi-dev libxcb-xinerama0-dev && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    exit 0

RUN \
    cd /opt && \
    wget -q http://download.qt.io/official_releases/qt/5.15/5.15.0/single/qt-everywhere-opensource-src-5.15.0.tar.xz && \
    tar xf qt-everywhere-opensource-src-5.15.0.tar.xz && \
    rm qt-everywhere-opensource-src-5.15.0.tar.xz && \
    cd qt-everywhere-opensource-src-5.15.0 && \
    ./configure -opensource -confirm-license -release -static -nomake tests -nomake examples -no-compile-examples && \
    make -j $(($(nproc)+4)) && \
    make install && \
    cd /opt && \
    rm -rf qt-everywhere-opensource-src-5.15.0 && \
    exit 0

ENV PATH="${PATH}:/usr/local/Qt-5.15.0/bin"
