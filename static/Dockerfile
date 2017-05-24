FROM ubuntu:latest
MAINTAINER Faraz Fallahi <fffaraz@gmail.com>
RUN \
apt -y update && \
apt -y upgrade && \
apt -y install build-essential git iputils-ping python wget && \
apt -y autoremove && \
apt -y autoclean && \
cd /opt && \
wget -q http://download.qt.io/official_releases/qt/5.8/5.8.0/single/qt-everywhere-opensource-src-5.8.0.tar.gz && \
tar xf qt-everywhere-opensource-src-5.8.0.tar.gz && \
rm qt-everywhere-opensource-src-5.8.0.tar.gz && \
cd qt-everywhere-opensource-src-5.8.0 && \
./configure -opensource -confirm-license -release -strip -static -c++std c++14 -ltcg -nomake examples -no-compile-examples -no-opengl && \
make -j $(($(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)+2)) && \
make install && \
cd /opt && \
rm -rf qt-everywhere-opensource-src-5.8.0 && \
exit 0
ENV PATH="${PATH}:/usr/local/Qt-5.8.0/bin"
