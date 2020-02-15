#! /bin/bash

while getopts ":t:" opt; do
    case ${opt} in
        t )
            auditwheelPlatform="--plat $OPTARG"
        \? )
            echo "Invalid option provided."
        : )
            echo "No argument provided for $OPTARG"
            echo "Provide valid auditwheel platform tag."
            echo "E.g. linux_armv7l or manylinux2014_armv7l" 1>&2
            ;;
    esac
done
shift $((OPTIND -1))

if [ "$1" != "" ]; then

    wheel_definition=$1

    if [ "$2" != "" ]; then
        wheel_definition="$1==$2"
    fi

    echo $wheel_definition
    pip wheel $wheel_definition

    created_wheel=$(find . -maxdepth 1 -name "$1*.whl" -print0 | xargs -r -0 ls -1 -t | head -1)
    echo ${created_wheel}

    auditwheel repair --wheel-dir audited "$auditwheelPlatform" ${created_wheel}
else
    echo "No package parameter provided."
fi
