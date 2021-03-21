FROM ubuntu:latest

RUN \
    set -eux && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
        aptitude apt-rdepends bash build-essential ccache clang cmake cppcheck curl doxygen diffstat gawk gdb git gnupg gperf iputils-ping \
        libboost-all-dev libfcgi-dev libgfortran5 libgl1-mesa-dev libjemalloc-dev libjemalloc2 libmlpack-dev libtbb-dev libssl-dev libyaml-cpp-dev \
        linux-tools-generic nano nasm ninja-build openjdk-11-jdk openssh-server openssl pkg-config python3 qt5-default spawn-fcgi \
        sudo tini unzip valgrind wget zip texinfo gcc-multilib chrpath socat cpio xz-utils debianutils libegl1-mesa \
        patch perl tar rsync bc libelf-dev libssl-dev libsdl1.2-dev xterm mesa-common-dev \
        libx11-xcb-dev libxcb-dri3-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-render-util0-dev \
        libxcb-render0-dev libxcb-shape0-dev libxcb-sync-dev libxcb-util-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev xorg-dev && \
    apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    exit 0

# clang-tidy

RUN \
    set -eux && \
    python3 --version && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
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
    pip3 install --upgrade autoenv autopep8 cmake-format clang-format conan conan_package_tools meson && \
    pip3 install --upgrade cppclean flawfinder lizard pygments pybind11 GitPython pexpect subunit Jinja2 pylint CLinters && \
    pip3 install --upgrade ipython && \
    pip3 install --upgrade jupyter && \
    pip3 install --upgrade matplotlib && \
    pip3 install --upgrade nose && \
    pip3 install --upgrade numba && \
    pip3 install --upgrade numpy && \
    pip3 install --upgrade pandas && \
    pip3 install --upgrade pymc3 && \
    pip3 install --upgrade requests && \
    pip3 install --upgrade scikit-learn && \
    pip3 install --upgrade scipy && \
    pip3 install --upgrade seaborn && \
    pip3 install --upgrade sympy && \
    pip3 install --upgrade quandl && \
    pip3 install --upgrade textblob && \
    pip3 install --upgrade nltk && \
    pip3 install --upgrade yfinance && \
    pip3 install --upgrade PyPortfolioOpt && \
    exit 0

# --ignore-installed cltk

RUN pip3 install --upgrade dlib

RUN \
    pip3 install --upgrade pystan holidays lunarcalendar convertdate && \
    pip3 install --upgrade fbprophet && \
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
