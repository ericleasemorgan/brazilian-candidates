#!/usr/bin/env bash

# dump-master.sh - given a few configurations, save a database as a CSV file

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-master.db'
CSV='./tmp/candidates-master.csv'
SELECT=".mode csv\n.output $CSV\n.headers on\nSELECT * FROM candidates ORDER BY year;"

# do the work and done
printf "$SELECT" | sqlite3 $DB
exit
