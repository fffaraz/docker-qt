FROM ubuntu:latest
ENTRYPOINT ["/bin/bash"]

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt -y upgrade && \
    apt -y install \
        bash build-essential clang cmake cppcheck curl gdb git gperf iputils-ping \
        libboost-all-dev libfcgi-dev libgl1-mesa-dev libjemalloc-dev libjemalloc2 \
        libmlpack-dev linux-tools-generic nano spawn-fcgi valgrind wget \
        qt5-default && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    exit 0
