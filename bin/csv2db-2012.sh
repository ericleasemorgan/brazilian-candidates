#!/usr/bin/env bash

# csv2db-2012.sh - given a CSV file, output an SQLite database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-2012.db'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <csv>" >&2
	exit
fi

# get input, do the work, and done
FILE=$1
printf ".mode csv\n.import $FILE candidates" | sqlite3 $DB
exit
