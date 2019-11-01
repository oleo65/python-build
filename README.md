# Dockerfiles to facilitate the creation of python wheels.

The Docker images should generalize and facitlitate the often complicated creation of python wheels especially
if they have complicated dependecies or binary dependencies e.g numpy.

# Usage

First the image needs to be build. The target python version is provided at the top of the Dockerfile.

```
docker build . -t python-build-py3.8
```

Second run the image and provide the name of the package to be build as a parameter.

```
docker run python-build-py3.8 numpy
```

Alternative: Work with a volume is probably more elegant but requires more typing at the run command.

```
docker run --rm -v ./output:/workdir/wheelhouse python-build-py3.8 numpy
```

Last copy the created wheel from the volume out of the container and optionally remove the container.

```
docker cp CONTAINER-NAME:/workdir/wheelhouse ./output
```
