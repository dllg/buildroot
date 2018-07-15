FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y build-essential \
    git gcc wget curl musl-dev file \
    perl python rsync bc patch unzip cpio ca-certificates

COPY certs/*.* /usr/local/share/ca-certificates/

RUN update-ca-certificates

ENV BUILDROOT_VERSION 2018.05
ENV BUILDROOT_HOME /home/.buildroot

# Install buildroot
RUN \
    git clone git://git.buildroot.net/buildroot && \
    cd buildroot && \
    git checkout tags/$BUILDROOT_VERSION

ARG UID=1000

# Create workdir
RUN mkdir -p $BUILDROOT_HOME && \
    adduser --quiet --gecos "" --no-create-home --shell /bin/bash --uid $UID --disabled-password docker && \
    chown -hR docker $BUILDROOT_HOME

# Copy build-script
ADD docker/build /usr/local/bin/build
RUN chmod 755 /usr/local/bin/build

# Set current working directory
WORKDIR $BUILDROOT_HOME

ENTRYPOINT ["/bin/bash"]
