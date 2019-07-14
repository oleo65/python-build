FROM python:3.7-slim

RUN mkdir /wheelhouse
WORKDIR /wheelhouse
VOLUME [ "/wheelhouse" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    gcc \
    libc6-dev \
#    python3.7-dev \
    patchelf \
    unzip

#RUN apk update && apk add \
#    postgresql-dev \
#    gcc \
#    python3-dev \
#    musl-dev \
#    patchelf \
#    unzip

RUN pip install --no-cache-dir \
    auditwheel

ENTRYPOINT [ "pip", "wheel" ]
