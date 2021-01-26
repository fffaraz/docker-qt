FROM ubuntu:latest
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt -y upgrade && \
    apt -y install \
        bash build-essential ccache clang clang-format clang-tidy cmake cppcheck curl doxygen gdb git gperf iputils-ping \
        libboost-all-dev libfcgi-dev libgl1-mesa-dev libjemalloc-dev libjemalloc2 libmlpack-dev libtbb-dev libyaml-cpp-dev \
        linux-tools-generic nano nasm ninja-build openssh-server python3-pip qt5-default spawn-fcgi valgrind wget && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    exit 0

RUN pip3 install autoenv autopep8 conan conan_package_tools cmake-format setuptools

RUN \
    mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    echo 'root:root' | chpasswd && \
    exit 0
