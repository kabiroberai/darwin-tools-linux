ARG dist
FROM ${dist:-ubuntu:22.04}

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        lsb-release software-properties-common wget cmake curl gpg-agent build-essential autoconf automake libtool-bin libssl-dev pkg-config git \
    && curl -fsSL https://apt.llvm.org/llvm.sh | bash -s -- 14 \
    && apt-get install -y --no-install-recommends \
        clang-14 libc++-14-dev libc++abi-14-dev \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang-14 CXX=clang++-14

COPY . /work
WORKDIR /work

ENTRYPOINT [ "/bin/bash" ]
