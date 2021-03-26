IMG_NAME=drone:v1
CONTAINER_NAME=drone

if [[ -z $(docker ps --filter "name=$CONTAINER_NAME" | grep $CONTAINER_NAME) ]]
then
	        ARGS=(" -ti
			--rm
			--user $UID:$GID
			-v /etc/passwd:/etc/passwd
			-v /etc/sudoers:/etc/sudoers:ro
			-v /etc/group:/etc/group:ro
			-v /etc/shadow:/etc/shadow:ro
			-v /tmp/.X11-unix:/tmp/.X11-unix
			-v /run/user/$UID:/run/user/$UID
			-v /dev:/dev
			--name $CONTAINER_NAME
			-w $(pwd)
			-e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR
			-e TERM=$TERM
			-e DISPLAY=unix$DISPLAY
			-e GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH
			-e GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH
			-e GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH
			--mount type=bind,source=/home,target=/home")

        echo "Starting new docker container"

	docker run --rm --device /dev/gpiomem $ARGS $IMG_NAME /bin/bash
fi	



