FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        lsb-release software-properties-common wget cmake curl gpg-agent build-essential \
    && bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" \
    && apt-get install -y --no-install-recommends \
        clang-14 libc++-14-dev libc++abi-14-dev \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang-14 CXX=clang++-14

COPY . /work
WORKDIR /work

ENTRYPOINT [ "/bin/bash" ]
