#!/usr/bin/env bash

# insert-urls-2012.sh - given a few configurations, update a database with URLs

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-master.db'
MAKEURLS='./bin/make-urls-2012.sh'
TRANSACTION='./tmp/transaction.sql'

# build a transaction, execute it, and done
echo "BEGIN TRANSACTION;" >  $TRANSACTION
$MAKEURLS                 >> $TRANSACTION
echo "END TRANSACTION;"   >> $TRANSACTION
cat $TRANSACTION | sqlite3 $DB
exit
