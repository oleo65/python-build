FROM manylinux2014

ENV TALIB_VERSION=0.4.0

RUN curl -fsSL -o ta-lib.tar.gz http://prdownloads.sourceforge.net/ta-lib/ta-lib-${TALIB_VERSION}-src.tar.gz && \
    tar -xf ta-lib.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd .. && \
    rm ta-lib.tar.gz