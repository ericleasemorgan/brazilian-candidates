#!/usr/bin/env bash

# ssv2csv.sh - convert a semi-colon separated file to a comma-separated file

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <file>" >&2
	exit
fi

# get input
FILE=$1

# get paths
BASENAME=$( basename $FILE .txt )
DIRNAME=$( dirname $FILE )

# do the work and done
cat $FILE | sed "s/\";\"/\",\"/g" > "$DIRNAME/$BASENAME.csv"
exit
