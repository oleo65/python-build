FROM centos:centos7

RUN yum update -y --skip-broken && \
    yum install -y gcc gcc-c++ make perl-core bzip2-devel zlib-devel libffi-devel \
    ncurses-devel sqlite-devel xz-devel && \
    yum clean all

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

RUN mkdir /opt/python-build && cd /opt/python-build && \
    curl -fsSL -o Python.tgz https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
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
