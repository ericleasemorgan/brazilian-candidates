#!/usr/bin/env bash

# build.sh - one script to rule them all

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


echo "Step #1 of 6: Creating database with data from 2012" >&2
./bin/import-2012.sh

echo "Step #2 of 6: Creating database with data from 2016" >&2
./bin/import-2016.sh

echo "Step #3 of 6: Amalgamating databases into a master database" >&2
./bin/db-initialize-master.sh

echo "Step #4 of 6: Creating URLs for 2012 data" >&2
./bin/insert-urls-2012.sh

echo "Step #5 of 6: Creating URLs for 2016 data" >&2
./bin/insert-urls-2016.sh

echo "Step #6 of 6: Dumping database as CSV file" >&2
./bin/dump-master.sh

echo "Done" >&2
exit
