#!/usr/bin/env bash

# get-pdf.sh - given an identifier and a URL, cache a PDF file

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
PDF='./pdf'

# make sane
if [[ -z $1 || -z $2  ]]; then
	echo "Usage: $0 <cid> <url>" >&2
	exit
fi

# initialize
CID=$1
URL=$2

# debug
echo -e "$CID\t$URL" >&2

# initialize some more
PDF="$PDF/$CID.pdf"

# do the work (conditionally) and done
if [[ ! -f $PDF ]]; then wget -nv --header='From: emorgan@nd.edu' -O "$PDF" $URL; echo ; fi
exit
