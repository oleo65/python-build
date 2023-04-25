FROM manylinux-base

RUN yum update -y --skip-broken && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y centos-release-scl-rh && \
    yum --enablerepo=centos-sclo-rh-testing install -y \
    devtoolset-9-gcc-c++ \
    openblas-devel && \
    yum clean all

CMD ["numpy"]
