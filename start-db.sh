MONGODB_NAME="mongodb/mongodb-community-server"
MONGODB_TAG="8.0-ubuntu2204"
CONTAINER_NAME=mongodb

# Root Credentials
ROOT_USER="root-user"
ROOT_PASSWORD="root-password"

# Key-Value Credentials
KEY_VALUE_DB="Key-value-db"
KEY_VALUE_USER="Key-value-user"
KEY_VALUE_PASSWORD="Key-value-password"

# Connectivity
source .env.network
LOCALHOST_PORT=27017
CONTAINER_PORT=27017


# Storage
source .env.volume
VOLUME_CONTAINER_PATH=/data/db

source setup.sh

docker run --rm -d --name $CONTAINER_NAME \
    -e MONGODB_INITDB_ROOT_USERNAME=$ROOT_USER \
    -e MONGODB_INITDB_ROOT_PASSWORD=$ROOT_PASSWORD \
    -e KEY_VALUE_DB=$KEY_VALUE_DB \
    -e KEY_VALUE_USER=$KEY_VALUE_USER \
    -e KEY_VALUE_PASSWORD=$KEY_VALUE_PASSWORD \
    -p $LOCALHOST_PORT:$CONTAINER_PORT \
    -v $VOLUME_NAME:$VOLUME_CONTAINER_PATH \
    -v ./db-config/mongodb-init.js:/docker-entrypoint-initdb.d/mongodb-init.js:ro \
    --network $NETWORK_NAME \
    $MONGODB_NAME:$MONGODB_TAG
    
