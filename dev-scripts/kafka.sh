#Environment
Dev:
Kafka10 brokers: "10.63.170.191:9092,10.63.170.46:9092,10.63.170.102:9092"
ZK: "10.63.170.46:2181"

Stage:
Kafka10 brokers: "10.66.203.1:9092,10.66.203.101:9092,10.66.203.102:9092"
ZK: "10.66.203.1:2181,10.66.203.101:2181,10.66.203.102:2181"

#Local confluent Platform
sudo nohup ./bin/zookeeper-server-start ./etc/kafka/zookeeper.properties &
sudo nohup ./bin/kafka-server-start ./etc/kafka/server.properties &
sudo nohup ./bin/schema-registry-start ./etc/schema-registry/schema-registry.properties &

#Flush Dev/Stage topics
./topic-flush.sh

#Check Kafka messages - stage
./bin/kafka-run-class kafka.tools.GetOffsetShell --broker-list 10.66.203.1:9092,10.66.203.101:9092,10.66.203.102:9092 --topic inr-prsmn-calc-val --time -1
#Check Kafka messages - Dev
./bin/kafka-run-class kafka.tools.GetOffsetShell --broker-list 10.63.170.191:9092,10.63.170.46:9092,10.63.170.102:9092 --topic inr-prsmn-calc-val --time -1

#Create/describe kafka topic
bin/kafka-topics <--describe> --zookeeper $brokers --create --topic $topic --replication-factor 3 --partitions $partitions

#Get number of messages
kafka-consumer-offset-checker --group flume --topic t1 --zookeeper zk01.example.com:2181

#Get all topics
./bin/kafka-topics --list --zookeeper 10.63.170.46:2181

#Get schema registry subjects
curl --noproxy '*' -X GET -i http://localhost:8081/subjects
curl --noproxy '*' -X GET -i http://10.63.221.150:8081/subjects


#Validate things are working
./bin/kafka-console-producer --broker-list localhost:9092 --topic healthcheck
<enter some messages>
#Get all messages
./bin/kafka-console-consumer --zookeeper "10.66.203.1:2181,10.66.203.101:2181,10.66.203.102:2181" --topic inr-error-presmin --from-beginning
./bin/kafka-console-consumer --zookeeper "10.66.203.1:2181,10.66.203.101:2181,10.66.203.102:2181" --topic inr-error-fair-item --from-beginning
./bin/kafka-console-consumer --zookeeper "10.66.203.1:2181,10.66.203.101:2181,10.66.203.102:2181" --topic inr-error-fair-loc --from-beginning
<Get your messages>

kafka-avro-console-consumer
./bin/kafka-avro-console-consumer --zookeeper 10.63.170.46:2181 --topic inr-prsmn-calc-val --from-beginning

#Get schema id 2
curl --noproxy '*' -X GET -i http://localhost:8081/schemas/ids/2


#Run local kafka docker container
docker run -d --name zookeeper -p 2181:2181 confluent/zookeeper
docker run -d --name kafka -p 9092:9092 --link zookeeper:zookeeper confluent/kafka
docker run -d --name schema-registry -p 8081:8081 --link zookeeper:zookeeper \
    --link kafka:kafka confluent/schema-registry
docker run -d --name rest-proxy -p 8082:8082 --link zookeeper:zookeeper \
        --link kafka:kafka --link schema-registry:schema-registry confluent/rest-proxy
#Command
kafka-topics --create --zookeeper 192.168.99.100:2181 --replication-factor 1 \
                    --partitions 1 --topic page_visits
kafka-topics --create --zookeeper 192.168.99.100:2181 --replication-factor 1 \
                    --partitions 1 --topic clicks
kafka-topics --create --zookeeper 192.168.99.100:2181 --replication-factor 1 \
                    --partitions 1 --topic sessions

kafka-topics --list --zookeeper 192.168.99.100:2181


#Proxy
#List all subjects
curl --noproxy '*' -X GET -i http://10.65.166.47:8081/subjects

#List all subject versions
curl --noproxy '*' -X GET -i http://10.63.221.150:8081/subjects/cae-prsmin-cal-val-value/versions
#Retrieve schema
curl --noproxy '*' -X GET -i http://10.65.166.47:8081/subjects/cae-prsmn-cal-val-value/versions/2

#Kafka REST proxy
#Get all topics
curl --noproxy '*' -X GET -i "http://10.63.221.150:9092/topics"
cae-prsmn-cal-val

#Create client to get binary data
curl --noproxy '*' -X POST -H "Content-Type: application/vnd.kafka.v1+json" \
      --data '{"format": "avro", "auto.offset.reset": "smallest"}' \
      http://10.65.166.47:8082/consumers/cae_binary_consumer

{"instance_id":"rest-consumer-aec1f65a-e2f1-41cc-866f-3f0f984dff97","base_uri":"http://10.65.166.47:8082/consumers/cae_binary_consumer/instances/rest-consumer-aec1f65a-e2f1-41cc-866f-3f0f984dff97"}

#Get Avro messages
curl --noproxy '*' -i -X GET -H "Accept: application/vnd.kafka.avro.v1+json" \
http://10.65.166.47:8082/consumers/cae_binary_consumer/instances/rest-consumer-08bd43b6-3553-421c-94f1-8bd0b62ca951/topics/cae-prsmn-cal-val

#Clean up consumer
curl --noproxy '*' -i -X DELETE http://10.65.166.47:8082/consumers/my_binary_consumer/instances/rest-consumer-aec1f65a-e2f1-41cc-866f-3f0f984dff97

#INR Kafka 10 brokers
sudo bin/zookeeper-server-start etc/kafka/zookeeper.properties &
sudo JMX_PORT=9999 bin/kafka-server-start etc/kafka/server.properties &
