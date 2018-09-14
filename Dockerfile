FROM ubuntu:latest
RUN apt update && apt -y upgrade && apt -y install bash build-essential clang cmake cppcheck gdb git gperf iputils-ping libmlpack-dev linux-tools-generic nano qt5-default valgrind wget && apt -y autoremove && apt -y autoclean && apt -y clean
