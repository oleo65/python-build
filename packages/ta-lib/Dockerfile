FROM manylinux-base

ENV TALIB_VERSION=0.4.0

RUN curl -fsSL -o ta-lib.tar.gz http://prdownloads.sourceforge.net/ta-lib/ta-lib-${TALIB_VERSION}-src.tar.gz && \
    tar -xf ta-lib.tar.gz && \
    cd ta-lib/ && \
    curl -o config.guess "https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" && \
    curl -o config.sub "https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd .. && \
    rm ta-lib.tar.gz

RUN pip install --no-cache-dir --only-binary :all: numpy
