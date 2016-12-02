##
# Path to RP table
##
# http://littlered.target.com/filebrowser/#/common/cae/data/ingest/rp

hive -e "create database cae_spark_pot"
hive -e "drop database cae_spark_pot"
# Run hive from a script file
hive -f hivepre.hql

##
## Populate table in ORC format
##

CREATE TABLE cae_spark_pot.retail_product_orc
   STORED AS ORC
   AS
SELECT *
from cae.retailproduct

##
## Show table details
##
hive -e "show create table cae_spark_pot.retail_product_orc"

hive -e "SET hive.execution.engine=tez;
select * from cae_spark_pot.retail_product_orc
where departmentid=208 and classid > 5 and classid < 8 and itemid is not null limit 10"

###
# nohup - Run in the background
###
$nohup hive -f sample.hql > output1.out 2>&1 &
$nohup hive --database "default" -e "select * from tablename;" > output1.out 2>&1 &
