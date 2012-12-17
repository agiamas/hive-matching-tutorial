# table definitions
create external table recvevents(uuid BIGINT, rdate STRING, uid INT) row format delimited fields terminated by '\t' location '/user/hive/warehouse/recvevents';
create external table sentevents(uuid BIGINT, sdate STRING, rdate STRING, uid INT) row format delimited fields terminated by '\t' location '/user/hive/warehouse/sentevents';   


## calculations ##

#MR on sent date
select * from sentevents join recvevents on (sentevents.uuid = recvevents.uuid) where unix_timestamp(sentevents.sdate) < unix_timestamp(recvevents.rdate);

#Unique Responses on sentDate
select count(distinct(sentevents.uuid)) from sentevents join recvevents on (sentevents.uuid = recvevents.uuid) where unix_timestamp(sentevents.sdate) < unix_timestamp(recvevents.rdate);

#Unique responses on sentdate grouped by hour.
select concat(year(sentevents.sdate), month(sentevents.sdate), day(sentevents.sdate), hour(sentevents.sdate)), count(distinct(sentevents.uuid)) from sentevents join recvevents on (sentevents.uuid = recvevents.uuid) where unix_timestamp(sentevents.sdate) < unix_timestamp(recvevents.rdate) group by concat(year(sentevents.sdate),month(sentevents.sdate), day(sentevents.sdate), hour(sentevents.sdate));


#MR on receivedDate
select * from sentevents join recvevents on (sentevents.uuid = recvevents.uuid) where unix_timestamp(sentevents.rdate) < unix_timestamp(recvevents.rdate);

#Unique Responses on received date
select count(distinct(sentevents.uuid)) from sentevents join recvevents on (sentevents.uuid = recvevents.uuid) where unix_timestamp(sentevents.rdate) < unix_timestamp(recvevents.rdate);


#multiple responses on sentdate grouped by hour by datediff.
select sentevents.sdate, datediff(recvevents.rdate,sentevents.sdate), count(distinct(sentevents.uuid)) from sentevents join recvevents on (sentevents.uuid = recvevents.uuid) where unix_timestamp(sentevents.sdate)<unix_timestamp(recvevents.rdate) group by datediff(recvevents.rdate, sentevents.sdate), sentevents.sdate;
 
#unique responses on sentdate grouped by hour by datediff.
## TBD ##
