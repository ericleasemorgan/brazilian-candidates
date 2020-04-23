#!/usr/bin/env bash

# make-urls-2012.sh - given a few configurations, output a set of SQL update statements

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
DB='./etc/candidates-master.db'
SELECT='.mode tabs\nSELECT cid, state, district_code, office_code, sequence FROM candidates WHERE year = "2012";'
TEMPLATE='http://divulgacandcontas.tse.jus.br/dados/2012/1699/##STATE##/##DISTRICTCODE##/##OFFICECODE##/##SEQUENCE##/proposta.pdf'
UPDATE="UPDATE candidates SET url='##URL##' WHERE cid='##CID##';"

# initialize
IFS=$'\t'

# query the database and process each found record
printf "$SELECT" | sqlite3 $DB | while read CID STATE DISTRICTCODE OFFICECODE SEQUENCE; do

	# do bunches o' substitutions and output
	URL=$( echo $TEMPLATE | sed "s/##STATE##/$STATE/"               | \
	                        sed "s/##DISTRICTCODE##/$DISTRICTCODE/" | \
	                        sed "s/##OFFICECODE##/$OFFICECODE/"     | \
	                        sed "s/##SEQUENCE##/$SEQUENCE/" )
	SQL=$( echo $UPDATE | sed "s|##URL##|$URL|" | sed "s|##CID##|$CID|" )
	echo $SQL
	
# fini
done
exit