#! /bin/bash
set -e

export PATH=/usr/local/pgsql/bin:$PATH

pip wheel --no-deps --global-option=build_ext --global-option="--static-libpq" psycopg2

auditwheel repair --wheel-dir audited psycopg*.whl
