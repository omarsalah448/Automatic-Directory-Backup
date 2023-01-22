#!/bin/bash
# take arguments
lab2dir=/home/omar/Downloads/labs/6809-lab2
dir=$lab2dir/orig_dir
backupdir=$lab2dir/backupdir
dirinfo=$lab2dir/dirinfo
logsfile=$lab2dir/logs.txt
maxbackups=5

# write to new file
ls -lR $dir/* > $dirinfo/new
# compare old and new files
if cmp --s $dirinfo/old $dirinfo/new
	then
	echo directories are identical >> $logsfile
else
  	echo directories differ >> $logsfile
  	date=$(date +"%Y-%m-%d-%I-%M-%S")
	# creating the backup dir
	mkdir $backupdir/$date
	# copy source to destination
	cp -r $dir/* $backupdir/$date
	# write to old file
	ls -lR $dir/* > $dirinfo/old
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
