#!/usr/bin/env bash

ROW2PLATFORM='./bin/row2platform.pl'
UPDATES='./tmp/updates.sql'
DB='./etc/candidates.db'

echo "BEGIN TRANSACTION;" >  $UPDATES
$ROW2PLATFORM             >> $UPDATES
echo "END TRANSACTION;"   >> $UPDATES
cat $UPDATES | sqlite3 $DB
