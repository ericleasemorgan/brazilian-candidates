#!/usr/bin/env bash

./bin/iso2utf8.sh
./bin/extract-mayors.sh
./bin/ssv2csv.sh
./bin/csv2db.sh
./bin/row2platform.sh
./bin/dump.sh
