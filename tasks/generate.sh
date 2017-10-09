#!/bin/bash
## Purpose: Generate Nagios Configuration
mkdir /home/temp-cfg
cat  /etc/ansible/roles/cfg/tasks/clients.csv | while read LINE
do
    HostIP=`echo $LINE | cut -d, -f1`
    HostName=`echo $LINE | cut -d, -f2`
    sed -e "s/XXXX/$HostName/g; s/ZZZZ/$HostIP/g" /etc/ansible/roles/cfg/tasks/template.cfg > /home/temp-cfg/$HostIP.cfg
done
