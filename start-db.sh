MONGODB_NAME="mongodb/mongodb-community-server"
MONGODB_TAG="8.0-ubuntu2204"
CONTAINER_NAME=mongodb
docker run --rm -d --name $CONTAINER_NAME $MONGODB_NAME:$MONGODB_TAG
