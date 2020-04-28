#!/usr/bin/env bash

# extract-text.sh - convert PDF to plain text


# configure
TIKA='./etc/tika-server.jar'
PDF2TXT='./bin/pdf2txt.sh'
TXT='./txt'

# start tika and let things warm up
java -jar $TIKA &
PID=$!
sleep 10

# make sane
mkdir -p $TXT

# find all the PDF files and do the work in parallel
find pdf -name "*.pdf" | parallel $PDF2TXT

# end (kill sounds so violent) TIKA and done
kill $PID
exit

