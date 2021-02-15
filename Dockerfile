FROM ubuntu:latest

RUN \
    set -eux && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt -y upgrade && \
    apt -y install \
        bash build-essential ccache clang clang-format clang-tidy cmake cppcheck curl doxygen gdb git gnupg gperf iputils-ping \
        libboost-all-dev libfcgi-dev libgl1-mesa-dev libjemalloc-dev libjemalloc2 libmlpack-dev libtbb-dev libssl-dev libyaml-cpp-dev \
        linux-tools-generic nano nasm ninja-build openjdk-11-jdk openssh-server openssl pkg-config qt5-default spawn-fcgi \
        sudo tini unzip valgrind wget zip && \
    apt -y install patch perl tar cpio unzip rsync bc libelf-dev libssl-dev && \
    apt -y install --no-install-recommends libx11-xcb-dev libxcb-dri3-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-shape0-dev libxcb-sync-dev libxcb-util-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev xorg-dev && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    exit 0

RUN \
    set -eux && \
    python3 -m pip install -U pip && \
    pip3 --version && \
    pip3 install --upgrade pip setuptools wheel && \
    pip3 --version && \
    exit 0

RUN \
    set -eux && \
    pip3 --version && \
    pip3 install --upgrade pip setuptools wheel && \
    pip3 --version && \
    pip3 install --upgrade autoenv autopep8 cmake-format conan conan_package_tools meson && \
    pip3 install --upgrade cppclean flawfinder lizard pygments pybind11 && \
    pip3 install --upgrade dlib ipython jupyter matplotlib nose numba numpy pandas pymc3 requests scikit-learn scipy seaborn sympy && \
    pip3 install --upgrade PyPortfolioOpt && \
    exit 0

#RUN \
#    set -eux && \
#    cd /root && \
#    git clone https://github.com/Microsoft/vcpkg.git && \
#    cd vcpkg && \
#    ./bootstrap-vcpkg.sh && \
#    ./vcpkg integrate install && \
#    vcpkg install pybind11 && \
#    exit 0

RUN \
    set -eux && \
    conan profile new default --detect  && \
    conan profile update settings.compiler.libcxx=libstdc++11 default && \
    conan remote list && \
    conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan && \
    exit 0

RUN \
    set -eux && \
    mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    echo 'root:root' | chpasswd && \
    exit 0

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
