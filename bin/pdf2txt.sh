#!/usr/bin/env bash

# pdf2txt.sh - given a file, output plain text; a front-end to pdf2txt.py

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 28, 2020 - re-written for mayoral candidates


# configure
PDF2TXT='./bin/pdf2txt.py'
TXT='./txt'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <file>" >&2
	exit
fi

# get input
FILE=$1

# initialize
BASENAME=$( basename $FILE .pdf )
OUTPUT=$TXT/$BASENAME.txt

# conditionally do the work and done
if [[ ! -f $OUTPUT ]]; then $PDF2TXT $FILE > $OUTPUT; fi
exit
