FROM quay.io/pypa/manylinux_2_28_aarch64

ENV PYTHONPATH=/opt/python/cp312-cp312/bin

RUN ln -sf $PYTHONPATH/python /usr/bin/python3 && \
    ln -sf $PYTHONPATH/pip /usr/bin/pip

RUN mkdir /wheelhouse
WORKDIR /wheelhouse
VOLUME [ "/wheelhouse" ]

COPY pip.conf /etc
COPY ./entrypoint.sh /

RUN [ "chmod", "+x", "/entrypoint.sh" ]

ENTRYPOINT [ "/entrypoint.sh" ]
