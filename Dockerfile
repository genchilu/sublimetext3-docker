FROM ubuntu:14.04

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get install gdebi-core -y && \
    apt-get install libglib2.0-dev -y &&\
    apt-get install libx11-dev -y && \
    apt-get install libgtk2.0-0 -y && \
    apt-get autoremove -y && \
    apt-get clean

COPY sublime-text_build-3083_amd64.deb /root/sublime-text_build-3083_amd64.deb

RUN gdebi /root/sublime-text_build-3083_amd64.deb --n

RUN locale-gen --no-purge en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN dpkg-reconfigure locales
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

#Chinese font
apt-get install fonts-wqy-zenhei -y

USER root

VOLUME ["/workspace"]
