FROM ubuntu:latest
RUN \
apt update && \
apt -y upgrade && \
apt -y install bash build-essential clang cmake cppcheck curl gdb git gperf iputils-ping libjemalloc1 libjemalloc-dev libmlpack-dev linux-tools-generic nano qt5-default valgrind wget spawn-fcgi libfcgi-dev && \
apt -y autoremove && \
apt -y autoclean && \
apt -y clean && \
rm -rf /var/lib/apt/lists/* && \
exit 0
