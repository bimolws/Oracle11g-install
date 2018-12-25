#!/bin/bash
PATH=/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/sbin:/usr/sbin:/usr/local/sbin
export PATH
source $HOME/.bash_profile
# Author Hocnv
# Shell script to insert data smsadslogpoc for sms-marketing
# Pre-Req: sqlplus client shall be installed already.
###########################################################
# Variables Section (DB Details)
###########################################################

DB_UserName="username"
DB_Password="password"
DB_Port="1521"
DB_SID="smsmkt"

logdir="/home/hocnv"
cnfdir="/home/hocnv"  ## file config.txt //Noi dung file config.txt: 2015-02-09 =>>Ngày cần insert dữ liệu.

###########################################################
# Some other variables here
###########################################################
DateStop=2016-12-01
rateCPU=30

ratetblSpace=90

today=`date +%Y-%m-%d`
currTime=`date +"%Y-%m-%d %H:%M:%S"`
##########################################################
# All Script Functions Goes Here
##########################################################

#-- 1. Kiem tra xem scripts chay truoc do da xong chua:
isRun=`ps -ef | grep insert_data_smsadslogproc| grep -v grep | wc -l`

#if [ $? -eq 0 ]
if (( $isRun > 2  ))
then
		currTime=`date +"%Y-%m-%d %H:%M:%S"`
        echo isRun: $isRun
        echo "$currTime, Lan insert du lieu truoc do chua xong isRun: $isRun!!! Stop!!!" >> $logdir/$today\.log
   exit 0 
fi

#-- 2. Lay Gia tri Ngayy can insert
#-- Lay tu file:
DateInsert=`cat $cnfdir/config.txt` ### format YYYY-MM-DD
echo "$DateInsert"

#--Ghi lai vao file config nextDateInsert:
tomorrow=`date -d "$DateInsert  next day" +%Y-%m-%d`
echo $tomorrow > $cnfdir/config.txt



#-- 3. Kiem tra nextDateInsert  insert phai nho hon DateStop:

todate_stop=`date -d $DateStop +"%Y%m%d"`
todate_insert=`date -d $DateInsert +"%Y%m%d"`

echo DateStop: $todate_stop
echo Date_Insert: $todate_insert

if [[ $todate_insert -ge $todate_stop ]]; #put the loop where you need it
then
 currTime=`date +"%Y-%m-%d %H:%M:%S"`
 echo "$currTime, Da Insert het du lieu den Ngay can Insert!!! Stop!!!" >> $logdir/$today\.log
 exit 0
fi

todate_insert=`date -d $DateInsert +"%F"`

date_Insert=`echo $todate_insert | awk -F- '{print $1""$2""$3}'`

echo Cho phep thuc hien xoa du lieu ngay: $date_Insert!!!!!

#-- 4. Lay thong tin tablespace va kiem tra tablespace xem full hay chua?

outputSpace=`sqlplus -silent ${DB_UserName}/${DB_Password}@${DB_SID} << EOF
SET NEWPAGE 0
SET SPACE 0
SET LINESIZE 80
SET PAGESIZE 0
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
select USED_PERCENT from dba_tablespace_usage_metrics where TABLESPACE_NAME='USERS';
exit;
EOF`

if [[ $outputSpace -ge $ratetblSpace ]]; #put the loop where you need it
then
 currTime=`date +"%Y-%m-%d %H:%M:%S"`
 echo "$currTime, Tablespace chiem la:$outputSpace %, Kiem tra tablespace Ngay!!! Stop!!!" >> $logdir/$today\.log
 exit 0
fi


#-- 5. Insert du lieu theo Ngay
echo --------------------------------- >> $logdir/$today\.log
currTime=`date +"%Y-%m-%d %H:%M:%S"`
echo $currTime, Du lieu DateInsert: $DateInsert, Starting insert! >> $logdir/$today\.log
SECONDS=0

`sqlplus -silent ${DB_UserName}/${DB_Password}@${DB_SID} <<EOF
begin
    smsadslogproc(1000,$date_Insert);

end;
/
EOF`

duration=$SECONDS
currTime=`date +"%Y-%m-%d %H:%M:%S"`
echo $currTime, Du lieu insert Ngay $DateInsert, Thoi gian insert: $(($duration / 60))m$(($duration % 60))s, Done!!! >> $logdir/$today\.log

exit 0
