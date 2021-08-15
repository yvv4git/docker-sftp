# docker-sftp
The container is designed to share documents, multimedia or other files over the sftp protocol over the network.

## HOW TO
````
make build              # for build image from Dockerfile
make volume             # create volume - host dir for share
make run                # run container
make clear_volume       # delete volume
make push_dockerhub     # push image to docker hub
````


## ACCESS BY SFTP
The password is configured at the image build stage