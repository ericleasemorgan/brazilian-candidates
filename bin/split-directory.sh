#!/usr/bin/env bash

# split-directory.sh - move files in a directory to some subdirectory


# configure
DB='./etc/candidates-master.db'
DESTINATION='./pdf/2016'
EXTENSION='.pdf'
SELECT='SELECT cid FROM candidates WHERE year IS "2016" ORDER BY cid;'
SOURCE='./pdf'

# make sane
mkdir -p $DESTINATION

# process each record
echo $SELECT | sqlite3 $DB | while read CID; do

	
	# sanity check
	if [[ ! -f $SOURCE/$CID$EXTENSION ]]; then continue; fi
	
	# reconfigure, debug, and do the work
	MV="mv $SOURCE/$CID$EXTENSION $DESTINATION/$CID$EXTENSION"
	echo $MV
	$MV

# fini
done
exit

