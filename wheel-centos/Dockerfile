FROM centos7-python3.8

RUN mkdir /wheelhouse
WORKDIR /wheelhouse
VOLUME [ "/wheelhouse" ]

ENV PATCHELF_VERSION=0.9

RUN yum -y update && yum install -y \
    postgresql-devel \
    glibc-devel \
    autoconf \
    automake \
    unzip && \
    yum clean all && \
    curl -fsSL -o patchelf.tar.gz https://github.com/NixOS/patchelf/archive/$PATCHELF_VERSION.tar.gz && \
    tar -xzf patchelf.tar.gz && \
    (cd patchelf-$PATCHELF_VERSION && ./bootstrap.sh && ./configure && make && make install) && \
    rm -rf patchelf.tar.gz patchelf-$PATCHELF_VERSION

ENV AUDITWHEEL_VERSION=3.0.0

RUN pip install --no-cache-dir \
    auditwheel==${AUDITWHEEL_VERSION}

COPY pip.conf /etc
COPY ./entrypoint.sh /

RUN [ "chmod", "+x", "/entrypoint.sh" ]

ENTRYPOINT [ "/entrypoint.sh" ]
