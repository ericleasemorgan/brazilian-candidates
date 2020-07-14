#!/usr/bin/env bash

# reduce-ent.sh - build a transaction from previously created SQL statements and fill a database table

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame and distributed under a GNU Public License

# May 26, 2020 - first cut


# configure
DB='./etc/candidates-master.db'
SQLENT='./sql-ent'
TMP='./tmp'
DELETE='DELETE FROM entities;'
INSERTS='inserts-ent.sql'

# make sane
mkdir -p $TMP

# create a transaction
echo "Creating transaction" >&2
echo "BEGIN TRANSACTION;"                            >  "$TMP/$INSERTS"
echo $DELETE                                         >> "$TMP/$INSERTS"
find "$SQLENT" -type f -name "*.sql" -exec cat {} \+ >> "$TMP/$INSERTS"
echo "END TRANSACTION;"                              >> "$TMP/$INSERTS"

# do the work and done
echo "Updating ent table" >&2
cat "$TMP/$INSERTS" | sqlite3 $DB
exit
