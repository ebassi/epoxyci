FROM debian:stretch
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

RUN apt-get update -qq && apt-get install -qq -y \
        gcc \
        git-core \
        libc6-dev \
        libgl1-mesa-dev \
        libegl1-mesa-dev \
        libgles1-mesa-dev \
        libgles2-mesa-dev \
        libgl1-mesa-dri \
        locales \
        make \
        ninja-build \
        pkg-config \
        python \
        python3 \
        python3-pip \
        xvfb

RUN locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN pip3 install meson

COPY epoxy-run-tests.sh /root
RUN chmod +x /root/epoxy-run-tests.sh
