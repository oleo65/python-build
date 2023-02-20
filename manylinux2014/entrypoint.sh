#! /bin/bash

while getopts ":t:p:" opt; do
    case ${opt} in
        t )
            auditwheelPlatform="--plat $OPTARG"
            ;;
        p )
            python="$OPTARG"
            ;;
        \? )
            echo "Invalid option provided."
            echo "Usage cmd [-t platform_tag] [-p python version] package_name [version_string]"
            ;;
        : )
            echo "No argument provided for $OPTARG"
            echo "Provide valid auditwheel platform tag."
            echo "E.g. linux_armv7l or manylinux2014_armv7l"
            echo "Python Version 310, 311, etc." 1>&2
            ;;
    esac
done
shift $((OPTIND -1))

if [ "$python" != "" ]; then
    PYTHONPATH=/opt/python/cp$python-cp$python/bin
    ln -sf $PYTHONPATH/python /usr/bin/python3 && \
    ln -sf $PYTHONPATH/pip /usr/bin/pip
fi

if [ "$1" != "" ]; then

    wheel_definition=$1

    if [ "$2" != "" ]; then
        wheel_definition="$1==$2"
    fi

    pip wheel --no-deps $wheel_definition

    created_wheel=$(find . -maxdepth 1 -iname "$1*.whl" -print0 | xargs -r -0 ls -1 -t | head -1)

    # Trying to find wheel based on first two letters if exact match was not successful.
    if [ "$created_wheel" == "" ]; then
        created_wheel=$(find . -maxdepth 1 -iname "${1:0:2}*.whl" -print0 | xargs -r -0 ls -1 -t | head -1)
    fi

    echo ${created_wheel}

    if [ "$auditwheelPlatform" != "" ]; then
        auditwheelArguments="$auditwheelPlatform --wheel-dir audited ${created_wheel}"
    else
        auditwheelArguments="--wheel-dir audited ${created_wheel}"
    fi
echo $auditwheelArguments
    auditwheel repair $auditwheelArguments
else
    echo "No package parameter provided."
fi
