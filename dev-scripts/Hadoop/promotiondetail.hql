SET hive.execution.engine=tez;
SET tez.queue.name=etl;

CREATE DATABASE IF NOT EXISTS ${hiveconf:cae_database};
USE ${hiveconf:cae_database};

DROP TABLE IF EXISTS promotiondetail;
CREATE TABLE IF NOT EXISTS promotiondetail (
    productdepartment string,
    productclass string,
    productitem string,
    promoid string,
    promotheme string,
    mediatype int,
    startdate string,
    enddate string,
    cushiontime string,
    enddatepluscushiontime string,
    isclipless boolean,
    offertext string,
    offertype string,
    barcode string,
    totalqualset int,
    totalqualbonus int,
    thresholdamount decimal(10,0),
    schemeid int,
    expirationtypecode int,
    transactionlimit int,
    offertypecode string,
    maxdiscount decimal(10,0),
    includeclearance boolean,
    storecount int,
    storeidentifiers array<int>,
    updated_on string)
    ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
COLLECTION ITEMS TERMINATED BY ','
STORED AS ${hiveconf:promotiondetail_stored_format}
LOCATION ${hiveconf:promotiondetail_location};
