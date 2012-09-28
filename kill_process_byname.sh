#!/bin/bash

[[ $# -ne 1 ]] && echo "No process name. Exiting..." && exit 1

process=$1
psax=`ps ax | grep $process | grep -v grep | grep -v $0`
id=`echo $psax | awk '{ print $1 }'`
name=`echo $psax | awk '{ print $5 }'`

#Kill the process to stop trolling/rick-rolling
if [[ `ps ax | grep $process | grep -v grep | grep -v $0` ]]
then
	read -p "Kill process?" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo "Killing $name..."
		kill -9 $1
	fi
	echo
else
	echo "No process found. Exiting..."
	exit 1
fi
