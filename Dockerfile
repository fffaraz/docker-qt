FROM ubuntu:latest
MAINTAINER Faraz Fallahi <fffaraz@gmail.com>
RUN apt -y update && apt -y upgrade && apt -y install build-essential cmake gdb git iputils-ping nano qt5-default valgrind wget && apt -y autoremove && apt -y autoclean
