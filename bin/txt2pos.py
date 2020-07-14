#!/afs/crc.nd.edu/user/e/emorgan/local/anaconda/bin/python

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

# initialize output, the header
print( "\t".join( [ 'id', 'sid', 'tid', 'token', 'lemma', 'pos' ] ) )

# process each sentence
for sentence in list(doc.sents) :

	# increment
	s += 1 
	t  = 0

	# process each token
	for token in sentence : 
	
		# increment and output
		t += 1
		print( "\t".join( [ key, str( s ), str( t ), token.text, token.lemma_, token.tag_ ] ) )
	
# done
exit()


