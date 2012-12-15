# copy data into hdfs
hadoop fs -copyFromLocal ./data/obm/obm.csv /user/hive/warehouse/sentevents/

hadoop fs -copyFromLocal ./data/ibm/ibm.csv /user/hive/warehouse/recvevents/