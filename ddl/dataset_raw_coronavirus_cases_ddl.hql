-----------------------------------------------------------------------------------------------------------------
--   File Name:           coronavirus_cases.hql
--   Author:              http://www.datapedia.ca - Ravichandran Mathivanan
--   Date Created:        21-Mar-2020
--   Purpose:             This hive script creates coronavirus_cases table
--   Usage:               hive -f coronavirus_cases.hql
--   Last updated:        21-Mar-2020
--   Change notes:        NA
-----------------------------------------------------------------------------------------------------------------

set spark.executor.extraJavaOptions = -Xss16m;
set hive.execution.engine = spark;

DROP TABLE IF EXISTS `dataset_raw.coronavirus_cases` PURGE;
CREATE EXTERNAL TABLE IF NOT EXISTS `dataset_raw.coronavirus_cases`
(
`country` string
,`total_cases` string
,`new_cases` string
,`total_deaths` string
,`new_deaths` string
,`total_recovered` string
,`active_cases` string
,`critical_cases` string
,`total_cases_per_one_million` string
)
PARTITIONED BY (`report_date` string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/dataset_raw.db/coronavirus_cases/';

--------------------------------------------------------------------------------------------------------------------
