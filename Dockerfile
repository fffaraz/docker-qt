FROM ubuntu:latest
RUN \
apt update && \
apt -y upgrade && \
apt -y install bash build-essential clang cmake cppcheck curl gdb git gperf \
iputils-ping libboost-all-dev libgl1-mesa-dev libjemalloc1 libjemalloc-dev libmlpack-dev \
linux-tools-generic nano valgrind wget spawn-fcgi libfcgi-dev \
qt5-default && \
apt -y autoremove && \
apt -y autoclean && \
apt -y clean && \
rm -rf /var/lib/apt/lists/* && \
exit 0
