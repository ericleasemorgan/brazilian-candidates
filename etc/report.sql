-- report.sql - summarize the content of the given database
-- usage: cat ./report.sql | sqlite3 candidates-master.db

-- Eric Lease Morgan <emorgan@nd.edu>
-- (c) University of Notre Dame; distributed under a GNU Public License

-- June 15, 2020 - first cut


-- set output to tab-delimited
.mode tabs


SELECT "";
SELECT "Report";
SELECT "======";
SELECT "This is a simple report outlining the content of a database of";
SELECT "Brazilian mayorial candidates. The purpose of the report is";
SELECT "two-fold. First, the report give one a feel for the database's";
SELECT "content. Second, the report's generator (report.sql) gives one a";
SELECT "flavor of how to query the database.";
SELECT "";
SELECT "                                                              --";
SELECT "                              Eric Lease Morgan <emorgan@nd.edu>";
SELECT "                                                   June 15, 2020";


-- output the database's structure
SELECT "";
SELECT "Database structure";
SELECT "------------------";
.schema


-- number of record
SELECT "";
SELECT "Total number of records";
SELECT "-----------------------";
SELECT COUNT( cid ) FROM candidates;
SELECT "";


-- years
SELECT "";
SELECT "Count & tabulation of year values";
SELECT "---------------------------------";
SELECT year, COUNT( year ) AS c FROM candidates GROUP BY year ORDER BY c DESC;
SELECT "";


-- party
SELECT "";
SELECT "Count & tabulation of ten most frequent party values";
SELECT "----------------------------------------------------";
SELECT COUNT( party ) AS c, party FROM candidates GROUP BY party ORDER BY c DESC LIMIT 10;
SELECT "";


-- party
SELECT "";
SELECT "Count & tabulation of ten most frequent coalition values";
SELECT "--------------------------------------------------------";
SELECT COUNT( coalition ) AS c, coalition FROM candidates GROUP BY coalition ORDER BY c DESC LIMIT 10;
SELECT "";


-- age
SELECT "";
SELECT "Count & tabulation of ten most frequent candidate ages";
SELECT "------------------------------------------------------";
SELECT age, COUNT( age ) AS c FROM candidates GROUP BY age ORDER BY c DESC LIMIT 10;
SELECT "";


-- sex (gender)
SELECT "";
SELECT "Count & tabulation of candidate genders";
SELECT "---------------------------------------";
SELECT COUNT( sex2 ) AS c, sex2 FROM candidates GROUP BY sex2 ORDER BY c DESC;
SELECT "";


-- race
SELECT "";
SELECT "Count & tabulation of candidate race";
SELECT "------------------------------------";
SELECT COUNT( race ) AS c, race FROM candidates GROUP BY race ORDER BY c DESC;
SELECT "";


-- occupation
SELECT "";
SELECT "Count & tabulation of ten most frequent candidate occupation";
SELECT "------------------------------------------------------------";
SELECT COUNT( occupation ) AS c, occupation FROM candidates GROUP BY occupation ORDER BY c DESC LIMIT 10;
SELECT "";


-- state
SELECT "";
SELECT "Count & tabulation of ten most frequent candidate state";
SELECT "-------------------------------------------------------";
SELECT COUNT( state ) AS c, state FROM candidates GROUP BY state ORDER BY c DESC LIMIT 10;
SELECT "";

-- number of words
SELECT "";
SELECT "Total number of words (size of corpus)";
SELECT "--------------------------------------";
SELECT COUNT( cid ) FROM pos;
SELECT "";


-- nouns
SELECT "";
SELECT "Count & tabulation of ten most frequent lemmatized nouns";
SELECT "--------------------------------------------------------";
SELECT COUNT( LOWER( lemma ) ) AS c, LOWER( lemma ) FROM pos WHERE pos LIKE '%|N|%' GROUP BY LOWER( lemma ) ORDER BY c DESC LIMIT 10;
SELECT "";

-- verbs
SELECT "";
SELECT "Count & tabulation of ten most frequent lemmatized verb";
SELECT "--------------------------------------------------------";
SELECT COUNT( LOWER( lemma ) ) AS c, LOWER( lemma ) FROM pos WHERE pos LIKE '%|V|%' GROUP BY LOWER( lemma ) ORDER BY c DESC LIMIT 10;
SELECT "";


-- adjectives
SELECT "";
SELECT "Count & tabulation of ten most frequent lemmatized adjectives";
SELECT "-------------------------------------------------------------";
SELECT COUNT( LOWER( lemma ) ) AS c, LOWER( lemma ) FROM pos WHERE pos LIKE '%|ADJ|%' GROUP BY LOWER( lemma ) ORDER BY c DESC LIMIT 10;
SELECT "";


-- adjectives used by men
SELECT "";
SELECT "Count & tabulation of ten most frequent lemmatized adjectives used by men";
SELECT "-------------------------------------------------------------------------";
SELECT COUNT( LOWER( p.lemma ) ) AS c, LOWER( p.lemma )
FROM pos AS p, candidates AS d
WHERE p.pos LIKE '%|ADJ|%' AND d.sex2 IS 'MASCULINO' AND d.cid = p.cid
GROUP BY LOWER( lemma )
ORDER BY c DESC LIMIT 10;
SELECT "";


-- adjectives used by men
SELECT "";
SELECT "Count & tabulation of ten most frequent lemmatized adjectives used by women";
SELECT "---------------------------------------------------------------------------";
SELECT COUNT( LOWER( p.lemma ) ) AS c, LOWER( p.lemma )
FROM pos AS p, candidates AS d
WHERE p.pos LIKE '%|ADJ|%' AND d.sex2 IS 'FEMININO' AND d.cid = p.cid
GROUP BY LOWER( lemma )
ORDER BY c DESC LIMIT 10;
SELECT "";


-- adjectives used by men
SELECT "";
SELECT "Count & tabulation of ten most frequent lemmatized adjectives used in 2012";
SELECT "--------------------------------------------------------------------------";
SELECT COUNT( LOWER( p.lemma ) ) AS c, LOWER( p.lemma )
FROM pos AS p, candidates AS d
WHERE p.pos LIKE '%|ADJ|%' AND d.year IS '2012' AND d.cid = p.cid
GROUP BY LOWER( lemma )
ORDER BY c DESC LIMIT 10;
SELECT "";


-- adjectives used by women
SELECT "";
SELECT "Count & tabulation of ten most frequent lemmatized adjectives used in 2016";
SELECT "--------------------------------------------------------------------------";
SELECT COUNT( LOWER( p.lemma ) ) AS c, LOWER( p.lemma )
FROM pos AS p, candidates AS d
WHERE p.pos LIKE '%|ADJ|%' AND d.year IS '2016' AND d.cid = p.cid
GROUP BY LOWER( lemma )
ORDER BY c DESC LIMIT 10;
SELECT "";


-- adjectives used by a party
SELECT "";
SELECT "Adjectives used by 'PARTIDO DO MOVIMENTO DEMOCRÁTICO BRASILEIRO' members";
SELECT "------------------------------------------------------------------------";
SELECT COUNT( LOWER( p.lemma ) ) AS c, LOWER( p.lemma )
FROM pos AS p, candidates AS d
WHERE p.pos LIKE '%|ADJ|%' AND d.party IS 'PARTIDO DO MOVIMENTO DEMOCRÁTICO BRASILEIRO' AND d.cid = p.cid
GROUP BY LOWER( lemma )
ORDER BY c DESC LIMIT 10;
SELECT "";


-- adjectives used by another party
SELECT "";
SELECT "Adjectives used by 'PARTIDO DA SOCIAL DEMOCRACIA BRASILEIRA' members";
SELECT "--------------------------------------------------------------------";
SELECT COUNT( LOWER( p.lemma ) ) AS c, LOWER( p.lemma )
FROM pos AS p, candidates AS d
WHERE p.pos LIKE '%|ADJ|%' AND d.party IS 'PARTIDO DA SOCIAL DEMOCRACIA BRASILEIRA' AND d.cid = p.cid
GROUP BY LOWER( lemma )
ORDER BY c DESC LIMIT 10;
SELECT "";


-- people mentioned
SELECT "";
SELECT "Count & tabulation of ten most frequent people mentioned";
SELECT "--------------------------------------------------------";
SELECT COUNT( entity ) AS c, entity from entities WHERE type is 'PER' GROUP BY entity ORDER BY c DESC LIMIT 10;
SELECT "";


-- organizations mentioned
SELECT "";
SELECT "Count & tabulation of ten most frequent organizations mentioned";
SELECT "---------------------------------------------------------------";
SELECT COUNT( entity ) AS c, entity from entities WHERE type is 'ORG' GROUP BY entity ORDER BY c DESC LIMIT 10;
SELECT "";

-- organizations mentioned by another party
SELECT "";
SELECT "Count & tabulation of ten most frequent organizations mentioned a party";
SELECT "-----------------------------------------------------------------------";
SELECT COUNT( e.entity ) AS c, e.entity FROM entities AS e, candidates AS d
WHERE e.type IS 'ORG' AND d.party IS 'PARTIDO DA SOCIAL DEMOCRACIA BRASILEIRA' AND d.cid = e.cid
GROUP BY entity
ORDER BY c DESC LIMIT 10;
SELECT "";

-- organizations mentioned by another party
SELECT "";
SELECT "Count & tabulation of ten most frequent organizations mentioned another party";
SELECT "-----------------------------------------------------------------------------";
SELECT COUNT( e.entity ) AS c, e.entity FROM entities AS e, candidates AS d
WHERE e.type IS 'ORG' AND d.party IS 'PARTIDO DO MOVIMENTO DEMOCRÁTICO BRASILEIRO' AND d.cid = e.cid
GROUP BY entity
ORDER BY c DESC LIMIT 10;
SELECT "";



