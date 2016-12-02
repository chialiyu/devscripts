# ssh
ssh z037900@edge.bigred.target.com



# Hive Query - troubleshooting
hive -e "set hive.execution.engine=tez; select departmentid, classid, itemid, relationships from cae.retailproduct where departmentid = 33 and classid = 5 and itemid = 3245 limit 1"

hive -e "set hive.execution.engine=tez; select departmentid, classid, itemid, imnid from cae.retailproduct where imnid IN (...)"

hive -e "set hive.execution.engine=tez; select departmentid, classid, itemid, imnid from cae.retailproduct rp inner join
cae.retailproductlocation rpm on rp.departmentid = rpl.departmentid AND rp.classid = rpl.classid AND rp.itemid = rpl.itemid where imnid IN (...) and locationid IN (3200, 3201, 3202, 3203, 3204, 3205)"

hive -e "show create table cae.retailproductlocation"

hive -e "set hive.execution.engine=tez; select departmentid, classid, itemid, imnid from cae.retailproduct rp inner join
cae.retailproductlocation rpl on rp.departmentid = rpl.departmentid AND rp.classid = rpl.classid AND rp.itemid = rpl.itemid where imnid IN (...) and locationid IN (3200, 3201, 3202, 3203, 3204, 3205)"


hive -e "show create table cae.item_tgtexpress_loc_rel"

hive -e "set hive.execution.engine=tez; select * from cae.item_tgtexpress_loc_rel where departmentid = 63 and classid=2 and itemid=1496 and store_id=3203 sort by last_update_ts desc"

cae.item_tgtexpress_loc_rel

https://git.target.com/SCData/cae_dil_hadoop/blob/master/workflows/cae_dil_hadoop/workflow.xml

#Access HDFS file system

hdfs dfs

# get Hadoop file system report
hadoop fs -df hdfs:/

## Daily Error files
hadoop fs -ls /common/cae/data/egress/audit/error
## Output daily error file
hadoop fs -cat /common/cae/data/egress/audit/error/errorFile-2016-01-24.txt


##
## Oozie
##

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

# Kill oozie job_ID
oozie job -kill <job id>
