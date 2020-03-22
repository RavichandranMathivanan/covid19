-----------------------------------------------------------------------------------------------------------------
--   File Name:           dataset_stage_coronavirus_cases_ddl.hql
--   Author:              http://www.datapedia.ca - Ravichandran Mathivanan
--   Date Created:        21-Mar-2020
--   Purpose:             This hive script creates coronavirus_cases table
--   Usage:               hive -f dataset_stage_coronavirus_cases_ddl.hql
--   Last updated:        21-Mar-2020
--   Change notes:        NA
-----------------------------------------------------------------------------------------------------------------

set spark.executor.extraJavaOptions = -Xss16m;
set hive.execution.engine = spark;

DROP TABLE IF EXISTS `dataset_stage.coronavirus_cases` PURGE;
CREATE EXTERNAL TABLE IF NOT EXISTS `dataset_stage.coronavirus_cases`
(
`country` string
,`total_cases` bigint
,`new_cases` bigint
,`total_deaths` bigint
,`new_deaths` bigint
,`total_recovered` bigint
,`active_cases` bigint
,`critical_cases` bigint
,`total_cases_per_one_million` bigint
)
PARTITIONED BY (`report_date` string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/dataset_raw.db/coronavirus_cases/'
TBLPROPERTIES ("skip.header.line.count"="1");
--------------------------------------------------------------------------------------------------------------------
