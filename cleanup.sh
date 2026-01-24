source .env.volume
source .env.network

if [ "$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
    docker volume rm $VOLUME_NAME
else
    echo A volume of name $VOLUME_NAME does not exist. Skipping volume deletion
fi

if [ "$(docker network ls -q -f name=$NETWORK_NAME)" ]; then
    docker network rm $NETWORK_NAME
else
    echo A network of name $NETWORK_NAME does not exist. Skipping network deletion
fi
