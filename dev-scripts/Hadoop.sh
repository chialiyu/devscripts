## Log in
ssh <username>@bigred.target.com

##BigRed Oozie
http://bigredoozie.target.com:11000/oozie/
export OOZIE_URL=http://bigredoozie.target.com:11000/oozie/


#
#Hive
#

# Enter Hive Mode
Hive
##Describe table
##Show databases
##  -- sample schemas: cae, esv_etl, ace_prod

Use <schemaname>
Show tables
Describe <tablename>

#Show DDL
Show create table <table name>

#Run Hive command
Select * from retailproduct_combined limit 1
Bash> hive -e "select * from retailproduct_combined limit 1"

Set hive.cli.print.header = true


##Hive Query

hive -e "set hive.execution.engine=tez;
select productdepartment, productclass, productitem, promoid, offertype, startdate, storeidentifiers from cae.promotiondetail
where startdate like '%2016%' AND offertype='SPI OFFER' limit 10000

hive -e "set hive.execution.engine=tez;
select productdepartment, productclass, productitem, promoid, offertype, startdate, storeidentifiers
from cae.promotiondetail
where startdate like '%2016%' AND offertype='SPI OFFER' limit 10000

##
## Oozie
##
## Find oozie job running status
export OOZIE_URL=http://d-3zkzk02.target.com:11000/oozie; oozie jobs -jobtype coordinator -filter user=SVCAEP1
