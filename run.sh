NAME="buildroot"

docker run -itd --name $NAME --mount type=bind,source="$HOME",target=/home $NAME
docker attach $NAME
