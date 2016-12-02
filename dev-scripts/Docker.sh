#install docker/compose/machine (Each separately)
sudo yum update

sudo chown -R $(whoami) /usr/local/bin

#Centos
sudo service docker start
eval $(docker-machine env --no-proxy default)
sudo docker images

#Load from tar to docker image
sudo docker load -i <file.tar>

# Use Docker Quick Start terminal

docker-machine start default
eval $(docker-machine env default)
#Turn off proxy on docker machine
eval $(docker-machine env --no-proxy default)
#Verify docker is running finder
docker run hello-world
sudo docker run -p 8080:8080 fulfillment_assortment:latest

#Copy jar to docker instance
sudo docker cp spark-fair_2.10-1.0-tests.jar  <container id>:/conf/

#connect to running docker machine
eval "$(docker-machine env default)"

#Check docker container file system by ssh in
docker ps
docker ps -a
docker start <container id>
docker exec -t -i <container name or id> /bin/bash
docker exec -it <05e99bd96803> bash

#troubleshooting commands
# List docker machine info
docker-machine ls
docker-machine ip <default>
# List active container
docker ps
# Get docker ip and detailed info
docker inspect 37f6712a07d3

#Build from dockerfile
docker build -t local-spark-image .
docker images

#commit container into another images
docker commit <containerid> confluent/rest-proxy:0513

#Remove images
docker rmi local-spark-image

#Bring multi-nodes up
docker-compose -f docker-compose.yml.multi up -d

#Clean up all docker exit docker container
docker rm -v $(docker ps -a -q -f status=exited)
