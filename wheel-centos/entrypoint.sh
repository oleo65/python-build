#! /bin/bash

if [ $1 != "" ]; then

    pip wheel $1

    created_wheel=$(find . -name "*.whl" -print0 | xargs -r -0 ls -1 -t | head -1)
    echo ${created_wheel}

    auditwheel repair ${created_wheel}
else
    echo "No package parameter provided."
fi
