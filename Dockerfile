FROM ubuntu:14.04.3

RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential curl git-core libssl-dev yasm libtool autoconf wget

WORKDIR /root/
RUN git clone git://github.com/kanreisa/Chinachu.git
RUN echo 1 | Chinachu/chinachu installer
RUN mkdir data recorded
COPY config.json /root/Chinachu/
COPY rules.json /root/Chinachu/

EXPOSE 10772
EXPOSE 20772
