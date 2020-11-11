#!/usr/bin/env perl

# make-urls-2020.pl - given a few configurations, output a set of SQL update statements

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April    23, 2020 - first documentation; during a pandemic
# October  21, 2020 - tweaked for 2020 data but the URLs are different
# November 11, 2020 - working with new metadata (TSV) file; things got simpler


# configure
use constant TSV      => './metadata-2020/sequnces-urls.tsv';
use constant TEMPLATE => 'UPDATE candidates SET url = "##URL##" WHERE sequence IS "##SEQUENCE##";';

# require
use strict;

# initialize
my $urls      = TSV;
my %platforms = ();

# open the data file and process each record
open DATA, "< $urls" or die "Can't open $urls ($!)\n";
while ( <DATA> ) {

	# parse
	chop;
	my ( $sequence, $url ) = split( "\t", $_ );

	# build the SQL command and output
	my $sql =  TEMPLATE;
	$sql    =~ s/##URL##/$url/e;
	$sql    =~ s/##SEQUENCE##/$sequence/e;
	print "$sql\n";
		
}

# done
exit;