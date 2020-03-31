#!/usr/bin/env bash

INPUT='./etc/consulta_cand_2016_BRASIL.csv'
OUTPUT='./etc/brazil.utf8'

iconv -f iso-8859-1 -t UTF-8 $INPUT > $OUTPUT
