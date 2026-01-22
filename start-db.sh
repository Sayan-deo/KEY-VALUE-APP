MONGODB_NAME="mongodb/mongodb-community-server"
MONGODB_TAG="8.0-ubuntu2204"
CONTAINER_NAME=mongodb

# Root Credentials
ROOT_USER="root-user"
ROOT_PASSWORD="root-password"

#Key-Value Credentials
KEY_VALUE_DB="Key-value-db"
KEY_VLUE_USER="Key-value-user"
KEY_VALUE_PASSWORD="Key-value-password"

docker run --rm -d --name $CONTAINER_NAME \
    -e MONGODB_INITDB_ROOT_USERNAME=$ROOT_USER \
    -e MONGODB_INITDB_ROOT_PASSWORD=$ROOT_PASSWORD \
    -e KEY_VALUE_DB=$KEY_VALUE_DB \
    -e KEY_VALUE_USER=$KEY_VALUE_USER \
    -e KEY_VALUE_PASSWORD=$KEY_VALUE_PASSWORD \
    -v ./db-config/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js:ro \
    $MONGODB_NAME:$MONGODB_TAG
    
