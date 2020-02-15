FROM arm32v7/debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    curl \
    perl-base \
    libffi-dev \ 
    libsqlite3-dev \
    uuid-dev \
    unzip \
    zlib1g-dev &&\
    rm -rf /var/lib/apt/lists/*

ENV OPENSSL_VERSION=1.1.1d
ENV OPENSSL_SHA256=1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2

RUN mkdir /opt/openssl && cd /opt/openssl && \
    curl -fsSL -o openssl.tar.gz https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz && \
    echo ${OPENSSL_SHA256} openssl.tar.gz | sha256sum -c - && \
    tar -xzf openssl.tar.gz && \
    cd openssl-${OPENSSL_VERSION} && \
    ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared zlib && \
    make -j 4 && make install && \
    cd /opt && \
    rm -rf openssl && \
    echo "/usr/local/openssl/lib" >> /etc/ld.so.conf && ldconfig

ENV PYTHON_VERSION=3.8.1
ENV PYTHON_MD5=f215fa2f55a78de739c1787ec56b2bcd

RUN mkdir /opt/python-build && cd /opt/python-build && \
    curl -fsSL -o Python.tgz https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    echo ${PYTHON_MD5} ./Python.tgz | md5sum -c - && \
    tar -xf ./Python.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --with-openssl=/usr/local/openssl --enable-optimizations && \
    make -j 4 && \
    make install && \
    cd /opt && \
    rm -rf python-build && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip && \
    pip install --upgrade pip

ENTRYPOINT [ "bin/bash" ]
