#!/usr/bin/env bash

# extract-mayors.sh - search for and extract mayoral candidates from a text file; awkward

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 23, 2020 - first documentation; during a pandemic


# configure
BAZIL='./tmp/brazil.utf8'
MAYORS='./tmp/candidates-2016.txt'
QUERY='PREFEITO'

# do the work and done
grep $QUERY $BAZIL > $MAYORS
exit
