CREATE TABLE entities (

	cid      INTEGER,
	sid      INTEGER,
	eid      INTEGER, 
	entity   TEXT,
	type     TEXT
	
);

CREATE TABLE pos (

	cid      INTEGER,
	sid      INTEGER,
	tid      INTEGER, 
	token    TEXT,
	lemma    TEXT,
	pos      TEXT
	
);

CREATE TABLE candidates (

	cid               INTEGER PRIMARY KEY,
	year              TEXT,
	round             TEXT,
	state             TEXT,
	district_code     TEXT,
	district          TEXT,
	office_code       TEXT,
	office            TEXT,
	name              TEXT,
	sequence          TEXT,
	number            TEXT,
	cpf               TEXT, 
	ballot_name       TEXT,
	party_id          TEXT,
	party_short       TEXT,
	party             TEXT,
	coalition_code    TEXT,
	coalition_short   TEXT,
	coalition_comp    TEXT,
	coalition         TEXT,
	occupation_code   TEXT,
	occupation        TEXT,
	electoral_title   TEXT,
	age               TEXT,
	sex               TEXT,
	expenses          TEXT,
	result_code       TEXT,
	result            TEXT,
	email             TEXT,
	election_type     TEXT,
	election_code     TEXT,
	incumbent         TEXT,
	protocol_number   TEXT,
	process_number    TEXT,
	sex2              TEXT,
	race_code         TEXT,
	race              TEXT,
	birth_state       TEXT,
	url               TEXT,
	pds               TEXT,
	txt               TEXT

);