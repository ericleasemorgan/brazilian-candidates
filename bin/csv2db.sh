#!/usr/bin/env bash

# csv2db.sh - given a CSV file, output an SQLite database

DB='./etc/candidates.db'
CSV='./etc/candidates.csv'
SCHEMA='./etc/schema.sql'
IMPORT=".mode csv\n.import $CSV candidates"
MODIFYTABLE='./etc/modify-table.sql'

rm -rf $DB

cat $SCHEMA      | sqlite3 $DB
printf "$IMPORT" | sqlite3 $DB
cat $MODIFYTABLE | sqlite3 $DB
