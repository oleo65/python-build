FROM manylinux-base

RUN yum update -y --skip-broken && \
    yum install -y \
    readline-devel \
    zlib-devel && \
    yum clean all

ENV PG_VERSION 11.10

RUN curl -o output.tar.bz2 https://ftp.postgresql.org/pub/source/v${PG_VERSION}/postgresql-${PG_VERSION}.tar.bz2 && \
    tar -xf output.tar.bz2 && \
    cd postgresql-${PG_VERSION} && \
    ./configure --prefix=/usr/local && \
    make -C src/interfaces/libpq && \
    make -C src/bin/pg_config && \
    make -C src/include && \
    make -C src/interfaces/libpq install && \
    make -C src/bin/pg_config install && \
    make -C src/include install || true && \
    cd .. && \
    rm -rf output && \
    rm -f output.tar.bz2

# ENV PATH=/usr/local/pgsql/bin:$PATH

COPY ./entrypoint.sh /
RUN [ "chmod", "+x", "/entrypoint.sh" ]

ENTRYPOINT [ "/entrypoint.sh" ]
