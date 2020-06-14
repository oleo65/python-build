FROM manylinux2014

RUN yum update -y --skip-broken && \
    yum install -y \
    libxml2-devel \ 
    libxslt-devel && \
    yum clean all