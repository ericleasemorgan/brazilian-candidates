#!/usr/bin/env bash

# csv2db-2016.sh - given a few configurations, create a database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-2016.db'
CSV='./tmp/candidates-2016.csv'
SCHEMA='./etc/schema-2016.sql'
IMPORT=".mode csv\n.import $CSV candidates"
MODIFYTABLE='./etc/modify-table-2016.sql'

# initialize
rm -rf $DB

# do the work and done
cat $SCHEMA      | sqlite3 $DB
printf "$IMPORT" | sqlite3 $DB
cat $MODIFYTABLE | sqlite3 $DB
exit
