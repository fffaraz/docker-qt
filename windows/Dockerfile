FROM ubuntu:latest
MAINTAINER Faraz Fallahi <fffaraz@gmail.com>
RUN \
apt -y update && \
apt -y upgrade && \
apt -y install build-essential cmake git iputils-ping nano perl python wget && \
apt -y install mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev && \
apt -y install zlib1g-dev libssl-dev libnss3-dev libmysqlclient-dev libsqlite3-dev libxslt-dev libxml2-dev libjpeg-dev libpng-dev libopus-dev && \
apt -y install libxcursor-dev libxcb1-dev libxcb-xkb-dev libx11-xcb-dev libxrender-dev libxi-dev libxcb-xinerama0-dev && \
apt -y install autoconf automake autopoint bash bison bzip2 flex gettext git g++ gperf intltool libffi-dev libgdk-pixbuf2.0-dev libtool libltdl-dev libssl-dev libxml-parser-perl make openssl p7zip-full patch perl pkg-config python ruby scons sed unzip wget xz-utils && \
apt -y install g++-multilib libc6-dev-i386 libtool-bin && \
apt -y autoremove && \
apt -y autoclean && \
cd /opt && \
git clone https://github.com/mxe/mxe.git && \
cd mxe && \
make -j 16 qt5 MXE_TARGETS=i686-w64-mingw32.static && \
exit 0
ENV PATH="${PATH}:/opt/mxe/usr/bin"
