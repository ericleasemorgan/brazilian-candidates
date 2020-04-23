#!/usr/bin/env bash

# iso2utf8.sh - given a .txt file, output the same file but encoded as UTF-8

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <file>" >&2
	exit
fi

# initialize
INPUT=$1
DIRECTORY=$( dirname $INPUT)
BASENAME=$( basename $INPUT .txt )
OUTPUT=$DIRECTORY/$BASENAME.ssv

# do the work and done
iconv -f iso-8859-1 -t UTF-8 $INPUT > $OUTPUT
exit
