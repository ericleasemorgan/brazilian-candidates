#!/usr/bin/env bash

# import-2016.sh - given a few configurations, create a database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# convert data from Macintosh encoding to UTF-8
INPUT='./metadata-2016/consulta_cand_2016_BRASIL.csv'
OUTPUT='./tmp/brazil.utf8'
iconv -f iso-8859-1 -t UTF-8 $INPUT > $OUTPUT

# do other work and done
./bin/extract-mayors.sh
./bin/ssv2csv.sh ./tmp/candidates-2016.txt
./bin/csv2db-2016.sh
exit
