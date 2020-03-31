#!/usr/bin/env perl

# configure
use constant URLS     => './etc/platforms.txt';
use constant DATABASE => './etc/candidates.db';
use constant DRIVER   => 'SQLite';
use constant QUERY    => 'SELECT SQ_CANDIDATO FROM candidates WHERE DS_CARGO IS "PREFEITO" ORDER BY SQ_CANDIDATO;';
use constant TEMPLATE => 'UPDATE candidates SET url = "##URL##" WHERE SQ_CANDIDATO IS "##KEY##";';

# require
use strict;
use DBI;

# initialize
my $urls      = URLS;
my %platforms = ();

# process each url
open DATA, "< $urls" or die "Can't open $urls ($!)\n";
while ( <DATA> ) {

	# parse and update list
	chop;
	my $url = $_;
	my @segments = split( '\/', $url );
	my $key = $segments[ 8 ];
	$platforms{ $key } = $url;

}
close DATA;

# initialize some more
my $driver    = DRIVER; 
my $database  = DATABASE;
my $dbh       = DBI->connect( "DBI:$driver:dbname=$database", '', '', { RaiseError => 1 } ) or die $DBI::errstr;

# prepare and execute sql query
my $handle = $dbh->prepare( QUERY );
$handle->execute() or die $DBI::errstr;

# process each found item
while( my $mayor = $handle->fetchrow_hashref ) {

	# parse
	my $key = $$mayor{ 'SQ_CANDIDATO' };
	
	# check for key in platforms
	if ( $platforms{ $key } ) {
	
		# get the URL and output an update statement
		my $url =  $platforms{ $key };
		my $sql =  TEMPLATE;
		$sql    =~ s/##URL##/$url/e;
		$sql    =~ s/##KEY##/$key/e;
		print "$sql\n";
		
	}

}

# done
exit;