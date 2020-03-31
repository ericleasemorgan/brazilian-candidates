#!/usr/bin/env bash

DB='./etc/candidates.db'
CSV='./tmp/candidates.csv'
SQL=".mode csv\n.headers on\n.output $CSV\nSELECT * FROM candidates ORDER BY NM_URNA_CANDIDATO;"

printf "$SQL" | sqlite3 $DB
