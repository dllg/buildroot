FROM alpine:3.7
RUN apk add --no-cache \
    bash \
    which \
    sed \
    make \
    binutils \
    gcc \
    g++ \
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
    ca-certificates

COPY certs/*.* /usr/local/share/ca-certificates/

RUN update-ca-certificates

# Set current working directory
WORKDIR /home

# Run the start-script
ADD docker_entry.sh /usr/local/bin/docker_entry.sh
RUN chmod 755 /usr/local/bin/docker_entry.sh

ENTRYPOINT ["docker_entry.sh"]
