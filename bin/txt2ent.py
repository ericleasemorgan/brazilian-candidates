#!/usr/bin/env python

# txt2pos.py - given a plain text file, output a tab-delimited file of parts-of-speech

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame and distributed under a GNU Public License

# April 29, 2020 - first cut for something in Portuguese. 


# require
import os
import re
import spacy
import sys

# sanity check
if len( sys.argv ) != 2 :
	sys.stderr.write( 'Usage: ' + sys.argv[ 0 ] + " <file>\n" )
	quit()

# initialize
file = sys.argv[ 1 ]
nlp  = spacy.load( 'pt_core_news_sm' )

# open the given file and unwrap it
text = open( file, 'r' ).read()
text = re.sub( '\r', '\n', text )
text = re.sub( '\n+', ' ', text )
text = re.sub( '^\W+', '', text )
text = re.sub( '\t', ' ',  text )
text = re.sub( ' +', ' ',  text )

# initialize some more
doc = nlp( text )
s   = 0
key = os.path.splitext( os.path.basename( file ) )[0]

# begin output, the header
print( "\t".join( [ 'id', 'sid', 'eid', 'entity', 'type' ] ) )

# process each sentence
for sentence in list(doc.sents) :

	# (re-)initialize and increment
	s += 1
	e = 0

	# process each entity
	for entity in sentence.ents : 
	
		e += 1
		print( "\t".join( [ key, str( s ), str( e ), entity.text, entity.label_ ] ) )
	
# done
exit()


