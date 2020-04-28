#!/usr/bin/env bash

# harvest.sh - a front-end to get-pdf.sh

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-master.db'
SELECT=".mode tabs\nSELECT cid, url FROM candidates ORDER BY cid;"
GETPDF='./bin/get-pdf.sh'
PDF='./pdf'

# make sane
mkdir -p $PDF

# do the work in parallel and done
printf "$SELECT" | sqlite3 $DB | parallel -j 12 --colsep '\t' $GETPDF
exit
