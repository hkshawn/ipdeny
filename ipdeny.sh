#!/bin/bash
while true
do
iplist=`netstat -ntu | awk '{print $5}'| cut -d':' -f1| sort |uniq -c |grep -v 'LISTEN|127.0.0.1'| sed 'N;$d;P;D' | awk '{if($1>10)print $2}'`
for ip in $iplist
do 
  echo $ip
  iptables -I INPUT -s $ip -j DROP
  echo "$ip is drop!" && echo "$ip is drop!" >> /tmp/droplog
  date && sleep 2

done
done
