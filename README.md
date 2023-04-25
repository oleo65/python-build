# Dockerfiles to facilitate the creation of python wheels.

The Docker images should generalize and facitlitate the often complicated creation of python wheels especially
if they have complicated dependecies or binary dependencies e.g numpy.

# Usage

First the build base image needs to be created with the `manylinux-base` base image.

```
cd manylinux_base/
docker build -t manylinux-base .
```

Second run the image and provide the name of the package to be build as a parameter. This only works if no further binary dependencies are needed. (Alternative see at the end)

```
docker run --rm -v /opt/wheel_build/output:/wheelhouse manylinux-base numpy
```

Alternative: Work with the specific images tailored for the desired python package, e.g. ta-lib. Can be used without any parameters if nothing special is required. Will build a wheel of the python package and audit it to the most recent manylinux definition.

```
cd packages/ta-lib/
docker build -t build/ta-lib .
docker run --rm -v /opt/wheel_build/output:/wheelhouse build/ta-lib
```

Options to run specialized containers are:

`-t linux_armv7l` specify the target platform other than the default of auditwheel.
`-p 311` specify the desired python version, e.g. `310`, `311`
`ta-lib` provide the package name to be build.
`0.4.25` (optional): provide a specific version to be build.

```
docker run --rm -v /opt/wheel_build/output:wheelhouse build/ta-lib -t linux_armv7l ta-lib 0.4.25
```

# Troubleshooting

If a build fails try to change the target platform via `-t` to the less compatible `linux_armv7l`. This usually works but makes the wheel less portable.

For debugging purposes omit the `--rm` flag during build and open the container afterwards in interactive mode.
