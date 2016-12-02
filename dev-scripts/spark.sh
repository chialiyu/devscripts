#Spark Job server

curl --data-binary @spark-distribution-0.1-SNAPSHOT.jar http://10.66.202.121:8090/jars/spark-distribution

curl -d "input.string = a b c a b see" 'http://10.66.202.121:8090/jobs?appName=spark-distribution&classPath=com.target.cae.distribution.jobserver.PresminStreamJob'

curl 'http://10.66.202.121:8090/jobs?appName=spark-distribution&classPath=com.target.cae.distribution.jobserver.PresminStreamJob'






#Spark Distribution Run Script
python runSparkJob.python -u connieyu -e stage -m 10G -p B3ntL3af -x 8 -co 64 -a PresminStreamDriver
python runSparkJob.python -u connieyu -e stage -m 10G -p B3ntL3af -x 4 -co 32 -a FairStreamDriver
#Spark enterprise_dev
python runSparkJob.python -u connieyu -e enterprise_dev -m 2G -p RogerThat! -d Polk#23 -c -x 2 -co 8 -a PresminStreamDriver

#log4j.properties
/opt/spark/<spark-1.6-dir>/conf


# Query postgresql
select count (*) from itemlocation.item_location_date_period
  where data_injection_timestamp > '2016-06-27 16:30:00'

  select count (*) from itemlocation.item_location_relationship

select count (*) from itemlocation.item_location_date_period
  where data_injection_timestamp > '2016-06-27 21:44:00'

describe table itemlocation.item_location_date_period

select count (*)
from
  (
    SELECT
      department_id,
      class_id,
      item_id,
      location_id
    FROM itemlocation.item_location_relationship
    GROUP BY department_id, class_id, item_id, location_id
    HAVING count(*) = 1
  )

select * from itemlocation.item_location_relationship
  where item_id = 1087
GROUP BY department_id, class_id, item_id, location_id, relationship_category
  order by location_id desc
limit 100000

#log4j.properties Spark default
spark.log.file=spark.log
spark.root.logger=INFO,console

spark.log.dir=/var/log/spark-standalone

log4j.rootLogger=${spark.root.logger}

log4j.appender.DRFA=org.apache.log4j.DailyRollingFileAppender
log4j.appender.DRFA.File=${spark.log.dir}/${spark.log.file}

# Rollver at midnight
log4j.appender.DRFA.DatePattern=.yyyy-MM-dd

# 30-day backup
log4j.appender.DRFA.layout=org.apache.log4j.PatternLayout

# Pattern format: Date LogLevel LoggerName LogMessage
log4j.appender.DRFA.layout.ConversionPattern=%d{ISO8601} %p %c: %m%n

# Debugging Pattern format (borrowed from log4j-cdh4.properties)
#log4j.appender.DRFA.layout.ConversionPattern=%d{ISO8601} %-5p %c{2} (%F:%M(%L)) - %m%n

log4j.appender.console=org.apache.log4j.ConsoleAppender
log4j.appender.console.target=System.err
log4j.appender.console.layout=org.apache.log4j.PatternLayout
log4j.appender.console.layout.ConversionPattern=%d{yy/MM/dd HH:mm:ss} %p %c{2}: %m%n


truncate itemlocation.item_location_relationship
truncate itemlocation.item_location_date_period


#Local Spark Shell
./bin/spark-shell
#Local Job GUI for spark shell
http://localhost:4040/jobs/

export SPARK_LOCAL_IP=127.0.0.1; sbt clean "test-only com.target.cae.fair.sparktest.SparkDStreamMock"

scp -P 2222 target/scala-2.10/spark-fair_2.10-1.0.jar root@127.0.0.1:~/

ssh -i ~/Key/Spark/SparkDev.pem cloud-user@10.63.223.89

# Sandbox environment
spark-submit --class com.target.cae.fair.spark.SparkParamTest --jars /usr/spark/lib/datanucleus-api-jdo-3.2.6.jar,/usr/spark/lib/datanucleus-api-jdo-3.2.6.jar,/conf/spark-streaming-kafka-assembly_2.10-1.6.0.jar,/conf/kafka-avro-service-1.0-SNAPSHOT.jar,/conf/kafka-clients-0.9.0.1.jar --executor-memory 512M --num-executors 1 ~/spark-fair_2.10-1.0.jar
./bin/spark-class org.apache.spark.deploy.Client kill <master url> <driver ID>
