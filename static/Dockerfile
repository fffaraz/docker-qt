FROM ubuntu:latest
MAINTAINER Faraz Fallahi <fffaraz@gmail.com>
RUN \
apt -y update && \
apt -y upgrade && \
apt -y install build-essential git iputils-ping nano python wget && \
apt -y autoremove && \
apt -y autoclean && \
cd /opt && \
wget -q http://download.qt.io/official_releases/qt/5.9/5.9.0/single/qt-everywhere-opensource-src-5.9.0.tar.xz && \
tar xf qt-everywhere-opensource-src-5.9.0.tar.xz && \
rm qt-everywhere-opensource-src-5.9.0.tar.xz && \
cd qt-everywhere-opensource-src-5.9.0 && \
./configure -opensource -confirm-license -release -static \
-no-opengl -no-webkit -no-feature-accessibility -skip qtconnectivity \
-nomake demos -nomake docs -nomake examples -nomake tests -nomake tools -no-compile-examples  && \
make -j $(($(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)+2)) && \
make install && \
cd /opt && \
rm -rf qt-everywhere-opensource-src-5.9.0 && \
exit 0
ENV PATH="${PATH}:/usr/local/Qt-5.9.0/bin"
