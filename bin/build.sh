#!/usr/bin/env bash

# build.sh - one script to rule them all

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic
# May    9, 2020 - added harvesting, extracting, ent, and pos


echo "Step #1 of 10: Creating database with data from 2012" >&2
./bin/import-2012.sh

echo "Step #2 of 10: Creating database with data from 2016" >&2
./bin/import-2016.sh

echo "Step #3 of 10: Amalgamating databases into a master database" >&2
./bin/db-initialize-master.sh

echo "Step #4 of 10: Creating URLs for 2012 data" >&2
./bin/insert-urls-2012.sh

echo "Step #5 of 10: Creating URLs for 2016 data" >&2
./bin/insert-urls-2016.sh

echo "Step #6 of 10: Dumping database as CSV file" >&2
./bin/dump-master.sh

echo "Step #7 of 10: Harvesting PDF" >&2
./bin/harvest.sh

echo "Step #8 of 10: Extracting plain text from PDF" >&2
./bin/extract-text.sh

echo "Step #9 of 10: Extracting named-entities" >&2
mkdir -p ./ent; find ./txt -name "*.txt" | parallel ./bin/txt2ent.sh

echo "Step #10 of 10: Extracting parts-of-speech" >&2
mkdir -p ./pos; find ./txt -name "*.txt" | parallel ./bin/txt2pos.sh

echo "Done" >&2
exit
