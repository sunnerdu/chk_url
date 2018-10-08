#!/bin/bash
#auth:sunner_du
#date:2018-10-08
#function：url health check
url=http://wwww.baidu.com
check_http(){
status_code=$(curl -m 5 -s -o /dev/null -w %{http_code} $url)
}
while :
do
       check_http
       date=$(date +%Y%m%d-%H:%M:%S)
       if [ $status_code -ne 200 ];then
              echo "$date: Usync is error!!!" |mail -s "Usync Info"  dyh1243208731@163.com
       else
              echo "$date: 连接正常" >> /dev/null
       fi
       sleep 5
done

