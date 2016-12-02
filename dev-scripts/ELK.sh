#elastalert
elastalert-test-rule example_rules/int_test.yaml



#logstash - test filter
/opt/logstash/agent/etc/conf.d/
sudo sv restart logstash_agent

sudo chef-client
sudo sv stop chef-client
sudo service chef-client stop
sudo service chef-client restart

# logstash reference filter - drop in conf.d folder
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
