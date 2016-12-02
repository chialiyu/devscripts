#Logstash filter
/opt/logstash/agent/etc/conf.d/
sudo sv restart logstash_agent

sudo chef-client
sudo sv stop chef-client
sudo service chef-client stop
sudo service chef-client restart


#Scratch space
"/dev/shm/spark-standalone-worker"

#logstash input_spark_connie
input {
  file {
    path => ["/var/log/spark-standalone/*.log", "/var/log/spark-standalone/*.err", "/var/log/spark-standalone/*.out", "/var/log/spark-jobserver/*.log"]
    start_position => "beginning"
    type => "spark"
    tags => ["dev-pfar-cae-ttce"]
  }
  file {
    path => ["/var/log/spark-standalone/spark-apps/*.log"]
    start_position => "beginning"
    codec => "json"
    type => "spark-apps"
    tags => ["dev-pfar-cae-ttce"]
  }
  file {
    path => ["/dev/shm/spark-standalone-worker/**/std*"]
    start_position => "beginning"
    type => "spark-inr-apps"
    tags => ["dev-pfar-cae-ttce"]
  }
}
filter {
  if [type] == "spark" {
    multiline {
      pattern => "(^[a-zA-Z.]+(?:Error|Exception): .+)|(^\s+at .+)|(^\s+... \d+ more)|(^\s*Caused by:.+)"
      what => "previous"
    }
    grok {
      match => [ "message", "%{DATESTAMP:timestamp} %{LOGLEVEL:severity} %{GREEDYDATA:message}" ]
      overwrite => [ "message" ]
    }
    if "_grokparsefailure" in [tags] {
      grok {
        match=>["message", "%{JAVASTACKTRACEPART}"]
      }
      mutate {
        remove_tag => [ "_grokparsefailure" ]
      }
    }
  }
  if [type] == "spark-inr-apps" {
    multiline {
      pattern => "(^[a-zA-Z.]+(?:Error|Exception): .+)|(^\s+at .+)|(^\s+... \d+ more)|(^\s*Caused by:.+)"
      what => "previous"
    }
    grok {
      match => [ "message", "%{DATESTAMP:timestamp} %{LOGLEVEL:severity} %{DATA:source} %{GREEDYDATA:json}" ]
      overwrite => [ "message" ]
    }
    json {
      source => "json"
    }
    if "_jsonparsefailure" in [tags] {
      mutate {
        remove_tag => [ "_jsonparsefailure" ]
      }
    }
  }
}



#logstash input-spark
input {
  file {
    path => ["/var/log/spark-standalone/*.log", "/var/log/spark-standalone/*.err", "/var/log/spark-standalone/*.out", "/var/log/spark-jobserver/*.log", "/var/spark-standalone-worker/**/std", "/dev/shm/spark-standalone-worker/**/std*"]
    start_position => "beginning"
    type => "spark"
    tags => ["dev-pfar-cae-ttce"]
  }
  file {
    path => ["/var/log/spark-standalone/spark-apps/*.log"]
    start_position => "beginning"
    codec => "json"
    type => "spark-apps"
    tags => ["dev-pfar-cae-ttce"]
  }
  file {
    path => ["/dev/shm/spark-standalone-worker/**/std*"]
    start_position => "beginning"
    type => "spark-inr-apps"
    tags => ["dev-pfar-cae-ttce"]
  }
}
filter {
  if [type] == "spark" {
    multiline {
      pattern => "(^[a-zA-Z.]+(?:Error|Exception): .+)|(^\s+at .+)|(^\s+... \d+ more)|(^\s*Caused by:.+)"
      what => "previous"
    }
    grok {
      match => [ "message", "%{DATESTAMP:timestamp} %{LOGLEVEL:severity} %{GREEDYDATA:message}" ]
      overwrite => [ "message" ]
    }
    if "_grokparsefailure" in [tags] {
      grok {
        match=>["message", "%{JAVASTACKTRACEPART}"]
      }
      mutate {
        remove_tag => [ "_grokparsefailure" ]
      }
    }
  }
  if [type] == "spark-inr-apps" {
    multiline {
      pattern => "(^[a-zA-Z.]+(?:Error|Exception): .+)|(^\s+at .+)|(^\s+... \d+ more)|(^\s*Caused by:.+)"
      what => "previous"
    }
    grok {
      match => [ "message", "%{DATESTAMP:timestamp} %{LOGLEVEL:severity} %{DATA:source} %{GREEDYDATA:json}" ]
      overwrite => [ "message" ]
    }
    json {
      source => "json"
    }
    if "_grokparsefailure" in [tags] {
      grok {
        match=>["message", "%{JAVASTACKTRACEPART}"]
      }
      mutate {
        remove_tag => [ "_grokparsefailure" ]
      }
    }
  }
}

#logstash config - master/worker
input {
  file {
    path => ["/var/log/spark-standalone/*.log", "/var/log/spark-standalone/*.err", "/var/log/spark-standalone/*.out", "/var/log/spark-jobserver/*.log", "/var/spark-standalone-worker/**/std", "/dev/shm/spark-standalone-worker/**/std*"]
    start_position => "beginning"
    type => "spark"
    tags => ["dev-pfar-cae-ttce"]
  }
  file {
    path => ["/var/log/spark-standalone/spark-apps/*.log"]
    start_position => "beginning"
    codec => "json"
    type => "spark-apps"
    tags => ["dev-pfar-cae-ttce"]
  }
}

filter {
  if [type] == "spark" {
    multiline {
      pattern => "(^[a-zA-Z.]+(?:Error|Exception): .+)|(^\s+at .+)|(^\s+... \d+ more)|(^\s*Caused by:.+)"
      what => "previous"
    }
    grok {
      match => [ "message", "%{DATESTAMP:timestamp} %{LOGLEVEL:severity} %{GREEDYDATA:message}" ]
      overwrite => [ "message" ]
    }
    if "_grokparsefailure" in [tags] {
      grok {
        match=>["message", "%{JAVASTACKTRACEPART}"]
      }
      mutate {
        remove_tag => [ "_grokparsefailure" ]
      }
    }
  }
}




# Data-Script setups
cp ~/git/kafka-file-server-connector/build/libs/kafka_file_server_connector.jar ~/git/Data-Script/confluent-2.0.1/share/java/kafka/

#INR Daily
#Stage postgresql
ssh z037900@10.65.165.76

top

##
https://en.wikipedia.org/wiki/Nohup
##
./gradlew clean build -PlocalRepoFirst=true


knife cookbook upload cookbook-jar_deployer --cookbook-path /Users/z037900/git/cookbook-jar_deployer

#######################
# Spark tutorial
#######################

sudo su - hdfs
hdfs dfs -mkdir /user/root
hdfs dfs -chown root:hdfs /user/root
exit

# command line tips
echo "Hello World" > index.html

# home brew problem - SSL: certificate verification failed (result: 5)
export SSL_CERT_FILE="" #unset SSL_CERT_FILE
