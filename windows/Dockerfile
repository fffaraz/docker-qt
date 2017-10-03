FROM ubuntu:latest
MAINTAINER Faraz Fallahi <fffaraz@gmail.com>
RUN \
apt -y update && \
apt -y upgrade && \
apt -y install iputils-ping nano \
    autoconf automake autopoint bash bison bzip2 flex gettext \
    git g++ gperf intltool libffi-dev libgdk-pixbuf2.0-dev \
    libtool-bin libltdl-dev libssl-dev libxml-parser-perl make \
    openssl p7zip-full patch perl pkg-config python ruby scons \
    sed unzip wget xz-utils \
    g++-multilib libc6-dev-i386 && \
apt -y autoremove && \
apt -y autoclean && \
apt -y clean && \
cd /opt && \
git clone https://github.com/mxe/mxe.git && \
cd mxe && \
make -j $(($(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)+2)) MXE_TARGETS='i686-w64-mingw32.static' qtbase && \
/opt/mxe/usr/bin/i686-w64-mingw32.static-qmake-qt5 --version && \
exit 0
ENV PATH="${PATH}:/opt/mxe/usr/bin"
