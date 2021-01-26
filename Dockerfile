FROM ubuntu:latest

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt -y upgrade && \
    apt -y install \
        bash build-essential ccache clang clang-format clang-tidy cmake cppcheck curl doxygen gdb git gperf iputils-ping \
        libboost-all-dev libfcgi-dev libgl1-mesa-dev libjemalloc-dev libjemalloc2 libmlpack-dev libtbb-dev libyaml-cpp-dev \
        linux-tools-generic nano nasm ninja-build openssh-server pkg-config python3-pip qt5-default spawn-fcgi sudo tini \
        valgrind wget && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    exit 0

RUN \
    pip3 install autoenv autopep8 cmake-format conan conan_package_tools setuptools && \
    exit 0

RUN \
    conan profile new default --detect  && \
    conan profile update settings.compiler.libcxx=libstdc++11 default && \
    conan remote list && \
    conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan && \
    exit 0

RUN \
    mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    echo 'root:root' | chpasswd && \
    exit 0

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
