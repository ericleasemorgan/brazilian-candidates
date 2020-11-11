#!/usr/bin/env bash

# import-2020.sh - given a few configurations, create a database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# October 21, 2020 - based on import-2016.sh


# convert data from Macintosh encoding to UTF-8
INPUT='./metadata-2020/consulta_cand_2020_BRASIL_MAYORS.csv'
OUTPUT='./tmp/brazil.utf8'
iconv -f iso-8859-1 -t UTF-8 $INPUT > $OUTPUT

# do other work and done
./bin/extract-mayors.sh > ./tmp/candidates-2020.txt
./bin/ssv2csv.sh ./tmp/candidates-2020.txt
./bin/csv2db-2020.sh
exit
