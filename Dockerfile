FROM alpine:latest

ENV BUILDROOT_VERSION 2018.05

RUN apk add --no-cache \
    bash \
    which \
    sed \
    make \
    binutils \
    gcc \
    g++ \
    git \
    bash \
    patch \
    gzip \
    bzip2 \
    perl \
    tar \
    cpio \
    python \
    unzip \
    rsync \
    file \
    bc \
    wget \
    curl \
    ca-certificates \
    ncurses-dev \
    linux-headers \
    icu-dev \
    libc-dev \
    gettext-dev

COPY certs/*.* /usr/local/share/ca-certificates/

RUN update-ca-certificates

# Install buildroot
RUN \
    git clone git://git.buildroot.net/buildroot && \
    cd buildroot && \
    git checkout tags/$BUILDROOT_VERSION

# Set current working directory
WORKDIR /home

# Run the start-script
ADD docker_entry.sh /usr/local/bin/docker_entry.sh
RUN chmod 755 /usr/local/bin/docker_entry.sh

ENTRYPOINT ["docker_entry.sh"]
