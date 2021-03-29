FROM ubuntu:16.04


# install git, gcc compiler, x86 libraries
# and ambuild requirements
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    python \
    python-pip \
    libc6-dev-i386 \
    gcc-multilib \
    g++-multilib


# download and install ambuild
# also remove temporary files
RUN cd /tmp \
    && git clone https://github.com/alliedmodders/ambuild \
    && pip install ./ambuild \
    && rm ./ambuild/* -r \
    && rm ./ambuild -r


# download amxmodx headers
RUN cd / && mkdir data && cd /data \
    && git clone https://github.com/alliedmodders/metamod-hl1.git metamod \
    && git clone https://github.com/alliedmodders/hlsdk.git \
    && git clone https://github.com/alliedmodders/amtl
