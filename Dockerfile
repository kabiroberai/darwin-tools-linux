ARG DARWIN_BUILD_BASE=ubuntu:24.04
FROM ${DARWIN_BUILD_BASE}

ARG DARWIN_BUILD_BASE

COPY install-deps /work/install-deps
RUN /work/install-deps ${DARWIN_BUILD_BASE}

COPY prepare-toolchain /work/prepare-toolchain
COPY vendor /work/vendor

WORKDIR /work

ENTRYPOINT [ "/bin/bash", "-l" ]
