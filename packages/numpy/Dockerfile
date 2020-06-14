FROM manylinux2014

RUN yum update -y --skip-broken && \
    yum install -y centos-release-scl-rh && \
    yum --enablerepo=centos-sclo-rh-testing install -y \
    devtoolset-9-gcc-c++ \
    openblas-devel && \
    yum clean all