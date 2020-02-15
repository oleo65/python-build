FROM debian-build-base

RUN mkdir /wheelhouse
WORKDIR /wheelhouse
VOLUME [ "/wheelhouse" ]

ENV PATCHELF_VERSION=0.9

RUN apt-get update && apt-get install -y --no-install-recommends\
    autoconf \
    automake &&\
    rm -rf /var/lib/apt/lists/* && \
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