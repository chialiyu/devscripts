# Perf
psql -U cae_admin -d stg_cae -h 10.65.165.76 -W

# Stage
psql -U inr_admin -d inr_stage -h 10.66.165.3 -W

# Prod
psql -U prod_admin -d inr_prod -h 10.66.165.28 -W

pgslx1027

#Truncate
truncate itemlocation.item_location_relationship
truncate itemlocation.item_location_date_period

############

telnet pgslx2047 5432

select count(*) FROM pg_stat_activity;
select datname,usename,client_addr,waiting FROM pg_stat_activity;

#alternative
ps auxwww|grep 'inr_prod'|wc -l

#############
# Monitor
top
free -m

=============================================

SELECT rolname, rolconnlimit FROM pg_roles

// Find idle user sessions
select count(*) from pg_stat_activity;


==============================================
select count (*) from itemlocation.item_location_relationship

select count (*) from itemlocation.item_location_date_period
  where data_injection_timestamp > '2016-06-27 21:44:00'

describe table itemlocation.item_location_date_period

SELECT
  department_id,
  class_id,
  item_id,
  location_id
FROM itemlocation.item_location_relationship
GROUP BY department_id, class_id, item_id, location_id
HAVING count(*) = 1


select * from itemlocation.item_location_relationship
  where item_id = 1087
GROUP BY department_id, class_id, item_id, location_id, relationship_category
  order by location_id desc
limit 100000
select count(*) from itemlocation.item_location_date_period

select count (*) from itemlocation.item_location_relationship

select count(*) from itemlocation.item_location_relationship where source_name = 'master'
select count(*) from itemlocation.item_location_relationship
