#!/usr/bin/env bash

# extract-mayors.sh - search for an extract mayoral candidates

BAZIL='./etc/brazil.utf8'
MAYORS='./etc/candidates.ssv'
QUERY='PREFEITO'

grep $QUERY $BAZIL > $MAYORS