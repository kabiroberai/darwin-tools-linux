ARG dist
FROM ${dist:-ubuntu:22.04}

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        lsb-release software-properties-common wget cmake curl gpg-agent build-essential autoconf automake libtool-bin libssl-dev pkg-config git libstdc++-10-dev \
    && curl -fsSL https://apt.llvm.org/llvm.sh | bash -s -- 18 \
    && apt-get install -y --no-install-recommends \
        clang-18 libc++-18-dev libc++abi-18-dev \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang CXX=clang++

COPY . /work
WORKDIR /work

ENTRYPOINT [ "/bin/bash" ]
