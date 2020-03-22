-----------------------------------------------------------------------------------------------------------------
--   File Name:           load_dataset_raw_coronavirus_cases.hql
--   Author:              http://www.datapedia.ca - Ravichandran Mathivanan
--   Date Created:        21-Mar-2020
--   Purpose:             This hive script loads data into coronavirus_cases raw table
--   Usage:               hive -f load_dataset_raw_coronavirus_cases.hql
--   Last updated:        21-Mar-2020
--   Change notes:        NA
-----------------------------------------------------------------------------------------------------------------

set spark.executor.extraJavaOptions = -Xss16m;
set hive.execution.engine = spark;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

LOAD DATA LOCAL INPATH '/home/cloudera/project_covid19/data/coronavirus_cases_20200321.csv' INTO TABLE dataset_raw.coronavirus_cases PARTITION(report_date='2020-03-21');

------------------------------------------------------------------------------------------------------------------
