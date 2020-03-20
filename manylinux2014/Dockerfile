FROM quay.io/pypa/manylinux2014_aarch64

RUN mkdir /wheelhouse
WORKDIR /wheelhouse
VOLUME [ "/wheelhouse" ]

COPY pip.conf /etc
COPY ./entrypoint.sh /

RUN [ "chmod", "+x", "/entrypoint.sh" ]

ENTRYPOINT [ "/entrypoint.sh" ]