#!/bin/sh

#===========================================================================
# shell script for create extentions
# created by zhou at 20190525
# Usage:
# 	./createExt.sh start_ext total_num config_file
#===========================================================================

#comments to write to file
#>>>>>>>>>>>>>>>>>>>>>
#[6001]
#context=default
#host=dynamic
#secret=6001
#disallow=all
#allow=ulaw
#<<<<<<<<<<<<<<<<<<<<<

var_num=$#

printUsage()
{
	echo "Usage: ./createExt.sh start_ext total_num config_file"
}

goHandle()
{
	if [ $var_num -ne 3 ]; then
		echo "Please input valid options:"
		printUsage
		echo "restart this script"
		exit
	fi	
}

goHandle #test
num=$2
user=$1
user_end=$(($user + $num -1))
password=$user
FILE=$3

#write to file
#1) write header
echo "[general]" >> $FILE
echo "context=default" >> $FILE

#2) write comment
while [ $user -le $user_end ]
do
	echo >> $FILE
	echo "[$user]" >> $FILE
	echo "type=friend" >> $FILE
	echo "context=default" >> $FILE
	echo "host=dynamic" >> $FILE
	echo "secret=$user" >> $FILE
	echo "disallow=all" >> $FILE
	echo "allow=ulaw" >> $FILE

	user=$(($user+1))
	password=$user
done
