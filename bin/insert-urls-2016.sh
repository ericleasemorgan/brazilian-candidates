#!/usr/bin/env bash

# insert-urls-2016.sh - given a few configurations, update a database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
MAKEURLS='./bin/make-urls-2016.pl'
TRANSACTION='./tmp/transaction.sql'
DB='./etc/candidates-master.db'

# build a transaction, do the work, and done
echo "BEGIN TRANSACTION;" >  $TRANSACTION
$MAKEURLS                 >> $TRANSACTION
echo "END TRANSACTION;"   >> $TRANSACTION
cat $TRANSACTION | sqlite3 $DB
exit
