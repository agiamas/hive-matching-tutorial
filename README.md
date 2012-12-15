hive-matching-tutorial
======================

Basic hive tutorial covering datatypes, acting on dates backwards compatible with pre 0.8 versions and calculating basic metrics on event actions and click events.

Tested and working in CDH4.1.1 . Steps to execute:

1. git clone this repo.
2. hive from the bash console in CDH4.1.1 
3. create the table definitions in hive as in hive_schema/hive_schema.ql
4. copy the files from data/ into hdfs as showing in copy_data_hdfs.sh
5. run the calculation commands in hive_schema.ql
6. observe how results change based on field chosen for matching and whether we are counting 1 response for each action or multiple ones.
