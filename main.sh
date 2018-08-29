#!/bin/bash

yum update -y

wget https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/cloudera-manager.repo -P /etc/yum.repos.d

yum update -y

yum install oracle-j2sdk1.7 -y

yum install mysql mysql-server mysql-connector-java -y

service mysqld start
/usr/bin/mysqladmin -u root password 'root'

yum install cloudera-manager-daemons cloudera-manager-server -y

/usr/share/cmf/schema/scm_prepare_database.sh mysql -h localhost -uroot -pClouderaDatabase --scm-host %Database_TIER_IP% scm scm scm

service cloudera-scm-server restart

