#!/bin/bash

# Local Variables
DEST_FOLDER=/conf/

# End Local Variables

docker ps

if [ "$1" = "" ]; then
  echo ""
  echo ""
  echo "Please provide container id"
  echo "docker ps"
  echo "bye for now."
  echo "----------  End of vm-to-docker  ----------"
  exit 1
fi

#Copy files to docker
sudo docker cp spark-presmin-0.1-SNAPSHOT.jar  $1:$DEST_FOLDER
sudo docker cp docker-run-integration-test.sh  $1:$DEST_FOLDER
sudo docker cp PublishKafkaMsgStreamingTest-application-test.conf $1:$DEST_FOLDER
sudo docker cp PublishKafkaMsgStreamingTest-reference-test.conf $1:$DEST_FOLDER


echo "Logging into docker container $1"
echo "Submit Spark job"
echo "REMINDER - scripts are in $DEST_FOLDER folder"
echo "----------  End of vm-to-docker.  Redirecting... ----------"

#docker exec -it $1 bash -c "cd $DEST_FOLDER;pwd;ls; sh docker-run-integration-test.sh"
docker exec -it $1 bash

