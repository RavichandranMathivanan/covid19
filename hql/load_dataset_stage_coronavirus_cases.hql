-----------------------------------------------------------------------------------------------------------------
--   File Name:           load_dataset_raw_coronavirus_cases.hql
--   Author:              http://www.datapedia.ca - Ravichandran Mathivanan
--   Date Created:        21-Mar-2020
--   Purpose:             This hive script loads data into coronavirus_cases stage table
--   Usage:               hive -f load_dataset_stage_coronavirus_cases.hql
--   Last updated:        21-Mar-2020
--   Change notes:        NA
-----------------------------------------------------------------------------------------------------------------

set spark.executor.extraJavaOptions = -Xss16m;
set hive.execution.engine = spark;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE dataset_stage.coronavirus_cases PARTITION(report_date)
SELECT
*
FROM
dataset_raw.coronavirus_cases
WHERE
report_date='2020-03-21';

------------------------------------------------------------------------------------------------------------------
