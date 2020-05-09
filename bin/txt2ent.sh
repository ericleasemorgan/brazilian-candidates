#!/usr/bin/env bash

# txt2ent.sh - given a file, output a TSV file of named entities
# usage: mkdir ./ent; find ./txt -name "*.txt" | parallel ./bin/txt2ent.sh


POS='./ent'
TXT2ENT='./bin/txt2ent.py'

if [[ -z $1 ]]; then
	echo "Usage: $0 <file>" >&2
	exit 2
fi

FILE=$1
BASENAME=$( basename $FILE .txt )
OUTPUT="$POS/$BASENAME.tsv"

if [[ ! -f $OUTPUT ]]; then $TXT2ENT $FILE > $OUTPUT; fi
exit
