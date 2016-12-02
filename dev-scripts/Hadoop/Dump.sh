hadoop fs -ls
hadoop fs -ls /
hadoop fs -mkdir /user/common

su hdfs
hdfs dfs -mkdir /apps/common
hdfs dfs -mkdir /apps/common/data/promotiondetail

hdfs dfs -chmod 777 /apps/common/data/promotiondetail
hdfs dfs -chmod 777 /apps/common/data/
hdfs dfs -chmod 777 /apps/common/

// File size
hdfs dfs -du -h /common/cae


# upload promo file to sandbox.

# 10. Add the entire local directory called “retail” to the
# /user/training directory in HDFS.
hadoop fs -put data/retail /user/training/hadoop

##
## Oozie
## https://oozie.apache.org/docs/3.1.3-incubating/DG_CommandLineTool.html#Oozie_URL
## Find oozie job running status

## RUN THIS FIRST !!!!!
export OOZIE_URL=http://d-3zkzk02.target.com:11000/oozie;
# Find jobs by NUID
oozie jobs -jobtype coordinator -filter user=SVCAEP1
oozie jobs -len 5 -filter user=SVCAEP1
# Check status
oozie job -oozie <Oozie_URL> -info 14-20090525161321-oozie-joe
oozie job -info <job id>
#print job log - last 30 lines
oozie job -oozie <oozie_URL> -log job_ID | tail -n 30


## Daily Error files
hadoop fs -ls /common/cae/data/egress/audit/error
## Output daily error file
hadoop fs -cat /common/cae/data/egress/audit/error/errorFile-2016-01-24.txt
