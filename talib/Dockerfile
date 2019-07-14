FROM python:3.7-slim

RUN mkdir /wheelhouse
WORKDIR /wheelhouse
VOLUME [ "/wheelhouse" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gcc \
    make \
    libc6-dev \
    patchelf \
    unzip

RUN pip install --no-cache-dir \
    auditwheel \
    numpy

RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
    && tar -xf ta-lib-0.4.0-src.tar.gz \
    && cd ta-lib/ \
    && ./configure --prefix=/usr\
    && make \
    && make install \
    && cd .. \
    && rm ta-lib-0.4.0-src.tar.gz  

ENTRYPOINT [ "pip", "wheel" ]
