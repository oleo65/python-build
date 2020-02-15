FROM arm32v7/debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
    # patchelf \
    unzip \
    build-essential \
    perl-base\ 
    zlib1g-dev \
    curl \
    ca-certificates

ENV OPENSSL_VERSION=1.1.1d

RUN mkdir /opt/openssl && cd /opt/openssl && \
    curl -fsSL -o openssl.tar.gz https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz && \
    tar -xzf openssl.tar.gz && \
    cd openssl-${OPENSSL_VERSION} && \
    ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared zlib && \
    make && make install && \
    cd /opt && \
    rm -rf openssl && \
    echo "/usr/local/openssl/lib" >> /etc/ld.so.conf && ldconfig

ENV PYTHON_VERSION=3.8.1
ENV PYTHON_CHECKSUM=f215fa2f55a78de739c1787ec56b2bcd

RUN mkdir /opt/python-build && cd /opt/python-build && \
    curl -fsSL -o Python.tgz https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    echo ${PYTHON_CHECKSUM} ./Python.tgz | md5sum -c - &&\
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
