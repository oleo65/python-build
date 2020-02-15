#! /bin/bash

if [ $1 != "" ]; then

    wheel_definition=$1

    if [ $2 != "" ]; then
        wheel_definition="$1==$2"
    fi

    echo $wheel_definition
    pip wheel -v $wheel_definition

    created_wheel=$(find . -maxdepth 1 -name "$1*.whl" -print0 | xargs -r -0 ls -1 -t | head -1)
    echo ${created_wheel}

    auditwheel repair --wheel-dir audited ${created_wheel}
else
    echo "No package parameter provided."
fi
