#!/bin/bash
#Script by Rick Talbot, 2024. Public domain. Use at own risk.
#This script makes rotating 7 days worth of .tar.gz backups of the /var/lib/mysql/ folder.
#I've used this script on MySQL and MariaDB for the past 10 years on various versions of Ubuntu Server without issues.
#Someone might want to extend this script and add in weekly or monthly backups.
#This script also does not copy the backups off the server.

# cd to the backup location. Change this to whichever backup folder/mount is your destination
cd /backups/mysql

#rotate past 7 days of backups
rm 7 -rf
mv 6 7
mv 5 6
mv 4 5
mv 3 4
mv 2 3
mv 1 2
mv 0 1
#make sure both 0 and 1 exist since we don't create them via rename
mkdir 1
mkdir 0

#stop mysql service
echo Stopping mysql >>mysqlbackup2.log
date >>mysqlbackup2.log
/etc/init.d/mysql stop

#tar contents of the mysql folder
tar -zcvf /backups/mysql/0/mysql.tar.gz /var/lib/mysql/

#start mysql service
echo Starting mysql >>mysqlbackup2.log
date >>mysqlbackup2.log
/etc/init.d/mysql start
echo Done. >>mysqlbackup2.log
