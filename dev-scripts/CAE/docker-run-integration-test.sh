#!/bin/bash
echo Reminder - Submitting job to Spark
echo ""
echo Troubleshooting tips:
echo Pinging - pgslx0024
echo If no response, add
echo 10.63.167.200 pgslx0024.hq.target.com pgslx0024
echo to the /etc/hosts
echo ""
echo install text editor
echo apt-get update
echo apt-get install vim
echo ""

echo "----------  Submitting spark job ----------"


#/usr/spark/bin/spark-submit --class com.target.cae.presmin.spark.PublishKafkaMsgStreamingTest --jars "/usr/spark/lib/datanucleus-api-jdo-3.2.6.jar,/usr/spark/lib/datanucleus-api-jdo-3.2.6.jar,/conf/spark-streaming-kafka-assembly_2.10-1.6.0.jar,/conf/kafka-clients-0.9.0.1.jar,/conf/kafka-avro-serializer-1.0.jar,/conf/kafka-schema-registry-client-1.0.jar,/conf/postgresql-9.4-1200-jdbc41.jar,/conf/spark-presmin_2.10-0.1-DEV.jar,/conf/cae_avro_2.10-0.1-DEV.jar,/conf/cae_config_2.10-0.1-DEV.jar,/conf/cae_config_2.10-0.1-DEV.jar,/conf/cae_kafka_2.10-0.1-DEV.jar,/conf/config-1.3.0.jar" --conf "spark.driver.userClassPathFirst=true" --driver-java-options "-Denvironment.config.override.application=application-test.conf" "-Denvironment.config.override.common=reference-test.conf" --executor-memory 512M --num-executors 1 /conf/spark-presmin-0.1-SNAPSHOT.jar > output.txt
#/usr/spark/bin/spark-submit --class com.target.cae.presmin.integration_test.spark.PublishKafkaMsgStreamingTest --jars "/usr/spark/lib/datanucleus-api-jdo-3.2.6.jar,/usr/spark/lib/datanucleus-api-jdo-3.2.6.jar,/conf/spark-streaming-kafka-assembly_2.10-1.6.0.jar,/conf/kafka-clients-0.9.0.1.jar,/conf/kafka-avro-serializer-1.0.jar,/conf/kafka-schema-registry-client-1.0.jar,/conf/postgresql-9.4-1200-jdbc41.jar,/conf/spark-presmin_2.10-0.1-DEV.jar,/conf/cae_avro_2.10-0.1-DEV.jar,/conf/cae_config_2.10-0.1-DEV.jar,/conf/cae_config_2.10-0.1-DEV.jar,/conf/cae_kafka_2.10-0.1-DEV.jar,/conf/config-1.3.0.jar" --conf "spark.driver.userClassPathFirst=true" --driver-java-options "-Denvironment.config.override.application=application-test.conf" --executor-memory 512M --num-executors 1 /conf/spark-presmin-0.1-SNAPSHOT.jar > output.txt
#/usr/spark/bin/spark-submit --class com.target.cae.presmin.integration_test.spark.PublishKafkaMsgStreamingTest --conf "spark.driver.userClassPathFirst=true" --driver-java-options "-Denvironment.config.override.application=application-test.conf" --executor-memory 512M --num-executors 1 /conf/spark-presmin-0.1-SNAPSHOT.jar > output.txt
/usr/spark/bin/spark-submit --class com.target.cae.presmin.integration_test.spark.PublishKafkaMsgStreamingTest --conf "spark.driver.userClassPathFirst=true" --driver-java-options "-Denvironment.config.override.application=PublishKafkaMsgStreamingTest-application-test.conf -Denvironment.config.override.common=PublishKafkaMsgStreamingTest-reference-test.conf -Dlog4j.ignoreTCL=true" --executor-memory 512M --num-executors 1 /conf/spark-presmin-0.1-SNAPSHOT.jar
#/usr/spark/bin/spark-submit --class com.target.cae.presmin.integration_test.spark.SparkStreamingGenericRecordTest --conf "spark.driver.userClassPathFirst=true" --driver-java-options "-Denvironment.config.override.application=PublishKafkaMsgStreamingTest-application-test.conf -Denvironment.config.override.common=PublishKafkaMsgStreamingTest-reference-test.conf" --executor-memory 512M --num-executors 1 /conf/spark-presmin-0.1-SNAPSHOT.jar
