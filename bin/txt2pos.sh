#!/usr/bin/env bash

# txt2pos.sh - given a file, output a TSV file of part-of-speech
# usage: mkdir -p ./pos; find ./txt -name "*.txt" | parallel ./bin/txt2pos.sh


POS='./pos'
TXT2POS='./bin/txt2pos.py'

if [[ -z $1 ]]; then
	echo "Usage: $0 <file>" >&2
	exit 2
fi

FILE=$1
BASENAME=$( basename $FILE .txt )
OUTPUT="$POS/$BASENAME.tsv"

if [[ ! -f $OUTPUT ]]; then $TXT2POS $FILE > $OUTPUT; fi
exit
