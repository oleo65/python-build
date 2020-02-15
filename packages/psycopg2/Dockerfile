FROM manylinux2014

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/* 

CMD [ "psycopg2" ]
