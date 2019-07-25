FROM python:3.7-slim

RUN mkdir /wheelhouse
WORKDIR /wheelhouse
VOLUME [ "/wheelhouse" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    gcc \
    libc6-dev \
    patchelf \
    unzip

RUN pip install --no-cache-dir \
    auditwheel

COPY ./entrypoint.sh /wheelhouse/

ENTRYPOINT [ "entrypoint.sh" ]
