FROM ubuntu:latest

ENV BUILDROOT_VERSION 2018.05

RUN apt-get update && \
    apt-get install -y build-essential \
    git gcc wget curl musl-dev file \
    perl python rsync bc patch unzip cpio ca-certificates

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
