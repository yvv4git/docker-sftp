VOLUME := 'music'
MOUNT_FROM := ${HOME}/Music
MOUNT_TO := '/media/music'

CONTAINER_NAME := 'srv-sftp'
HOST_PORT := 2222


build:
	docker build --no-cache --rm -m 2G --add-host=privoxy:192.168.1.12 -t yvv4docker/srv-sftp -f Dockerfile .

volume:
	docker volume create --driver local \
       --opt type=none \
       --opt device=${MOUNT_FROM} \
       --opt o=bind ${VOLUME}

run:
	docker run --rm -p ${HOST_PORT}:22 -v ${VOLUME}:${MOUNT_TO} --name ${CONTAINER_NAME} yvv4docker/srv-sftp

stop:
	docker stop ${CONTAINER_NAME}

clear_volume:
	docker volume rm ${VOLUME}

push_dockerhub:
	docker push yvv4docker/srv-sftp