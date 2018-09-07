#!/bin/bash

yum update -y

yum install wget -y

wget https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/cloudera-manager.repo -P /etc/yum.repos.d

yum update -y

yum install oracle-j2sdk1.7 -y

yum install mysql mysql-connector-java -y

yum install cloudera-manager-daemons cloudera-manager-server -y

/usr/share/cmf/schema/scm_prepare_database.sh mysql -h %Database_TIER_IP% -uroot -pClouderaDatabase --scm-host %Manager_TIER_IP% scm scm scm

service cloudera-scm-server restart


