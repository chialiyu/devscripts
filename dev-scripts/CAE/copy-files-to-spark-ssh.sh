#!/bin/bash

SPARK_CLUSTER_IP=10.63.223.98
COMPILE_FIRST=true

#compile
./gradlew clean build -PlocalRepoFirst=true

#Copy application jar
scp -i ~/Key/Spark/SparkDev.pem build/libs/spark-presmin-0.1-SNAPSHOT.jar cloud-user@$SPARK_CLUSTER_IP:~

#Copy Config files
scp -i ~/Key/Spark/SparkDev.pem src/test/resources/presmin/integration_test/PublishKafkaMsgStreamingTest-application-test.conf cloud-user@$SPARK_CLUSTER_IP:~
scp -i ~/Key/Spark/SparkDev.pem src/test/resources/presmin/integration_test/PublishKafkaMsgStreamingTest-reference-test.conf cloud-user@$SPARK_CLUSTER_IP:~
#Copy run scripts
scp -i ~/Key/Spark/SparkDev.pem docker-run-integration-test.sh cloud-user@$SPARK_CLUSTER_IP:~
scp -i ~/Key/Spark/SparkDev.pem vm-to-docker.sh cloud-user@$SPARK_CLUSTER_IP:~

#Copy additional jars - REMOVE after fatjar works.
scp -i ~/Key/Spark/SparkDev.pem ~/git/cae-common/cae_config/build/libs/cae_config-0.1-SNAPSHOT.jar cloud-user@$SPARK_CLUSTER_IP:~
scp -i ~/Key/Spark/SparkDev.pem ~/git/cae-common/cae_postgresql_dao/build/libs/cae_postgresql_dao-0.1-SNAPSHOT.jar cloud-user@$SPARK_CLUSTER_IP:~

echo "Reminder - Run the following command after ssh into VM:"
echo "sh vm-to-docker.sh <container id>"
echo "----------  End of copy-files-to-spark-ssh  Redirecting... ----------"
ssh -i ~/Key/Spark/SparkDev.pem cloud-user@$SPARK_CLUSTER_IP
