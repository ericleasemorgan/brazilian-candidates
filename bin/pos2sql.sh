#!/usr/bin/env bash

# pos2sql.sh - given a TSV file of named entities, output a set of SQL INSERT statements
# usage: mkdir ./sql-pos; find ./pos -name "*.tsv" | sort -n | parallel -j 12 ./bin/pos2sql.sh

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame and distributed under a GNU Public License

# June 11, 2020 - first cut; borrowed from CORD


# configure
SQLPOS='./sql-pos'
TEMPLATE="INSERT INTO pos ( 'cid', 'sid', 'tid', 'token', 'lemma', 'pos' ) VALUES ( '##CID##', '##SID##', '##TID##', '##TOKEN##', '##LEMMA##', '##POS##' );"

if [[ -z $1 ]]; then
	echo "Usage: $0 <pos>" >&2
	exit
fi

# initialize
TSV=$1
BASENAME=$( basename $TSV .tsv )
IFS=$'\t'

# debug
echo "$BASENAME" >&2

# if the desired output already exists, then don't do it again
if [[ -f "$SQLPOS/$BASENAME.sql" ]]; then exit; fi

# configure and then process each line in the file, sans the header
cat $TSV | tail -n +2 | ( while read CID SID TID TOKEN LEMMA POS; do
		
		# escape
		TOKEN=$( echo $TOKEN | sed "s/'/''/g" )
		LEMMA=$( echo $LEMMA | sed "s/'/''/g" )
		POS=$(   echo $POS   | sed "s/'/''/g" )

		# create an INSERT statement and then update the SQL
		INSERT=$( echo $TEMPLATE | sed "s/##CID##/$CID/" | sed "s/##SID##/$SID/"  | sed "s/##TID##/$TID/" | sed "s|##TOKEN##|$TOKEN|"  | sed "s|##LEMMA##|$LEMMA|"  | sed "s!##POS##!$POS!")
		SQL="$SQL$INSERT\n"

	done

	# output 
	echo -e "$SQL" > "$SQLPOS/$BASENAME.sql"
	#echo -e "$SQL" 

)

# done
exit
