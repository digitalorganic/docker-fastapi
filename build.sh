
NAME=fastapi

for PYTHON_VERSION in 3.7 3.8 3.9 3.10

do
docker build -f Dockerfile . --build-arg PYTHON_VERSION=$PYTHON_VERSION -t digitalorganic/$NAME:$PYTHON_VERSION
docker push digitalorganic/$NAME:$PYTHON_VERSION

done
