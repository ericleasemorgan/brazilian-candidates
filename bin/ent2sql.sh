#!/usr/bin/env bash

# ent2sql.sh - given a TSV file of named entities, output a set of SQL INSERT statements
# usage: mkdir ./sql-ent; find ./ent -name "*.tsv" | sort -n | parallel -j 12 ./bin/ent2sql.sh

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame and distributed under a GNU Public License

# June 11, 2020 - first cut; borrowed from CORD


# configure
SQLENT='./sql-ent'
TEMPLATE="INSERT INTO entities ( 'cid', 'sid', 'eid', 'entity', 'type' ) VALUES ( '##CID##', '##SID##', '##EID##', '##ENTITY##', '##TYPE##' );"

if [[ -z $1 ]]; then
	echo "Usage: $0 <ent>" >&2
	exit
fi

# initialize
TSV=$1
BASENAME=$( basename $TSV .tsv )
IFS=$'\t'

# debug
echo "$BASENAME" >&2

# if the desired output already exists, then don't do it again
if [[ -f "$SQLENT/$BASENAME.sql" ]]; then exit; fi

# configure and then process each line in the file, sans the header
cat $TSV | tail -n +2 | ( while read CID SID EID ENTITY TYPE; do
		
		# escape
		ENTITY=$( echo $ENTITY | sed "s/'/''/g" )

		# create an INSERT statement and then update the SQL
		INSERT=$( echo $TEMPLATE | sed "s/##CID##/$CID/" | sed "s/##SID##/$SID/"  | sed "s/##EID##/$EID/"  | sed "s|##ENTITY##|$ENTITY|"  | sed "s/##TYPE##/$TYPE/")
		SQL="$SQL$INSERT\n"

	done

	# output 
	echo -e "$SQL" > "$SQLENT/$BASENAME.sql"

)

# done
exit
