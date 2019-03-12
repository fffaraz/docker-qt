FROM ubuntu:16.04
ENTRYPOINT ["/bin/bash"]
RUN \
apt -y update && \
apt -y upgrade && \
apt -y install build-essential iputils-ping nano \
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
cd /opt/mxe && \
NPROC=$(($(nproc)+4)) && \
make --jobs=$NPROC JOBS=$NPROC MXE_TARGETS='i686-w64-mingw32.static' qtbase qtmultimedia && \
ln -s /opt/mxe/usr/bin/i686-w64-mingw32.static-qmake-qt5 /usr/bin/qmake && \
qmake --version && \
exit 0
ENV PATH="${PATH}:/opt/mxe/usr/bin"
