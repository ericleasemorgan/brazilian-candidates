#!/usr/bin/env bash

# db-initialize-master.sh - given a few configurations, create a master database; tricky

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-master.db'
SCHEMA='./etc/schema-master.sql'
TWELVE2MASTER='./etc/merge2master-2012.sql'
SIXTEEN2MASTER='./etc/merge2master-2016.sql'

# initialize
rm -rf $DB

# do the work and done
cat $SCHEMA         | sqlite3 $DB
cat $TWELVE2MASTER  | sqlite3 $DB
cat $SIXTEEN2MASTER | sqlite3 $DB
exit
