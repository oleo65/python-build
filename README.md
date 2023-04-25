# Dockerfiles to facilitate the creation of python wheels.

The Docker images should generalize and facitlitate the often complicated creation of python wheels especially
if they have complicated dependecies or binary dependencies e.g numpy.

# Usage

First the base image needs to be build. The target python version is provided at the top of the Dockerfile.

```
cd debian-build-base/
docker build -t debian-build-base .
```

Second build the `manylinux2014` base image.

```
cd manylinux2014
docker build -t manylinux2014 .
```

Third run the image and provide the name of the package to be build as a parameter. This only works if no further binary dependencies are needed. (Alternative see at the end)

```
docker run --rm -v /opt/wheel_build/output:/wheelhouse manylinux2014 numpy
```

Alternative: Work with the specific images tailored for the desired python package, e.g. lxml. Can be used without any parameters if nothing special is required. Will build a wheel of the python package and audit it to manylinux2014 definition.

```
cd packages/lxml/
docker build -t build/lxml .
docker run --rm -v /opt/wheel_build/output:/wheelhouse build/lxml
```

Options to run specialized containers are:

`-t linux_armv7l` specify the target platform other than the default of auditwheel.
`-p 311` specify the desired python version, e.g. `310`, `311`
`lxml` provide the package name to be build.
`4.4.5` (optional): provide a specific version to be build.

```
docker run --rm -v /opt/wheel_build/output:wheelhouse build/lxml -t linux_armv7l lxml 4.4.5
```

# Troubleshooting

If a build fails try to change the target platform via `-t` to the less compatible `linux_armv7l`. This usually works but makes the wheel less portable.

For debugging purposes omit the `--rm` flag during build and open the container afterwards in interactive mode.
