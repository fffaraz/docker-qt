FROM ubuntu:latest
MAINTAINER Faraz Fallahi <fffaraz@gmail.com>
RUN apt -y update && apt -y upgrade && apt -y install build-essential git qt5-default && apt -y autoremove && apt -y autoclean
