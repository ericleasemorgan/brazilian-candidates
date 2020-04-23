#!/usr/bin/env bash

# db-initialize-2012.sh - given a few configurations, create a database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-2012.db'
SCHEMA='./etc/schema-2012.sql'

# make sane, do the work, and done
rm -rf $DB
cat $SCHEMA | sqlite3 $DB
exit