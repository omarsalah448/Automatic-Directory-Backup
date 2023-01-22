#!/bin/bash
# take arguments
number=$#
dir=$1
backupdir=$2
intervalsecs=$3
maxbackups=$4

date=$(date +"%Y-%m-%d-%I-%M-%S")

# copy content of dir to dirinfo.old
ls -lR $dir/* > dirinfo/old

# creating the backup dir
mkdir $backupdir/$date
# copy source to destination
cp -r $dir/* $backupdir/$date

# loop forever
while true
do
	# sleep for some time
	sleep $intervalsecs
	# write to new file
	ls -lR $dir/* > dirinfo/new
	# compare old and new files
	if cmp --s dirinfo/old dirinfo/new
		then
		echo directories are identical
	else
  		echo directories differ
  		date=$(date +"%Y-%m-%d-%I-%M-%S")
		# creating the backup dir
		mkdir $backupdir/$date
		# copy source to destination
		cp -r $dir/* $backupdir/$date
		# write to old file
		ls -lR $dir/* > dirinfo/old
	fi
	count=$(ls $backupdir | wc -l) 
	if [[ $count -gt $maxbackups ]] 
	then
		cd $backupdir
		# delete all files except last maxbackups 
		# starting from oldest
		ls | sort | head -n -$maxbackups | xargs rm -r
		cd -
	fi	
	done
done
