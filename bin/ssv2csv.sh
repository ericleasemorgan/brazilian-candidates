#!/usr/bin/env bash

# ssv2csv.sh - convert a semi-colon separated file to a comma-separated file

INPUT='./etc/candidates.ssv'
OUTPUT='./etc/candidates.csv'

cat $INPUT | sed "s/\";\"/\",\"/g" > $OUTPUT