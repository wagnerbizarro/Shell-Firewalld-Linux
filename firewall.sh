#!/bin/bash
# Autor: Wagner Bizarro
# Project: Firewall Iptables 
# Date: 28 March 2022
# Version.Release: 2.0

FirewallCommand=20

while [ $FirewallCommand -ne 0 ]
do
   echo -e ""
   read -p "1-Status/2-Stop/3-Start/4-Restart/5-Add/6-Remove/7-Show Rules/0-Exit:" FirewallCommand


   case $FirewallCommand in

	0)
		echo "Bye Bye!"
		exit
		;;

	1)
		systemctl status firewalld | grep 'Active:'
		;;
	
	2)
		systemctl stop firewalld
		echo "Status: STOPPED"
		;;
	
	3)
		systemctl start firewalld
		echo "Status: RUNNING"
		;;
	
	4)
		firewall-cmd --reload
		;;
	
	5)
		read -p 'What is service?(ftp/http):' service
		firewall-cmd --add-service=$service --permanent
		echo 'Reboot'
		firewall-cmd --reload
		echo 'Show:'
		firewall-cmd --list-all
		;;	
	
	6)
		read -p 'What is the service?(ftp/http):' service
		firewall-cmd --remove-service=$service --permanent
		echo 'Reboot'
		firewall-cmd --reload
		echo 'Show:'
		firewall-cmd --list-all
		;;

	7)
		firewall-cmd --list-all
		;;
	
   esac
done
