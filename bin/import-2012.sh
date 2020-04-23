#!/usr/bin/env bash

# import-2012.sh - given a few configurations, create a database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-2012.db'
MODIFYTABLE='./etc/modify-table-2012.sql'

# do kewl processing
find ./metadata-2012 -name "*.txt" | parallel ./bin/iso2utf8.sh
find ./metadata-2012 -name "*.ssv" | parallel ./bin/ssv2csv.sh
./bin/db-initialize-2012.sh
find ./metadata-2012 -name "*.csv" -exec ./bin/csv2db-2012.sh {} \;
cat $MODIFYTABLE | sqlite3 $DB

# done
exit
