#!/usr/bin/env perl

# tsv2sql.pl - given a particular TSV file, output a set of SQL UPDATE statements

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# June 29, 2020 - first cut


# configure
use constant TSV      => './etc/additional-2016-platforms.tsv';
use constant TEMPLATE => 'UPDATE candidates SET URL = "##URL##" WHERE cid = "##CID##";';

# require
use strict;

# slurp up the data
my @data = split( '\n', &slurp( TSV ) );

# process each record
foreach my $record ( @data ) {

	# parse
	my ( $cid, $url ) = split( '\t', $record );

	# debug
	#warn "cid: $cid\n";
	#warn "URL: $url\n";
	#warn "\n";
	
	# build sql statement
	my $sql =  TEMPLATE;
	$sql    =~ s/##URL##/$url/e;
	$sql    =~ s/##CID##/$cid/e;
	
	# output
	print "$sql\n";
	
}

# done
exit;


sub slurp {
	my $f = shift;
	open ( F, $f ) or die "Can't open $f: $!\n";
	my $r = do { local $/; <F> };
	close F;
	return $r;
}

