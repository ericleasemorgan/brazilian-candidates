PRAGMA foreign_keys=off;
BEGIN TRANSACTION;
DELETE FROM candidates WHERE DS_CARGO IS NOT 'PREFEITO';
ALTER TABLE candidates RENAME TO x_candidates;
CREATE TABLE candidates (

	cid                           INTEGER PRIMARY KEY,
	ANO_ELEICAO                   TEXT,
	CD_TIPO_ELEICAO               TEXT,
	NR_TURNO                      TEXT,
	CD_ELEICAO                    TEXT,
	SG_UF                         TEXT,
	SG_UE                         TEXT,
	NM_UE                         TEXT,
	CD_CARGO                      TEXT,
	DS_CARGO                      TEXT,
	SQ_CANDIDATO                  TEXT,
	NR_CANDIDATO                  TEXT,
	NM_CANDIDATO                  TEXT,
	NM_URNA_CANDIDATO             TEXT,
	NR_CPF_CANDIDATO              TEXT,
	NM_EMAIL                      TEXT,
	NR_PARTIDO                    TEXT,
	SG_PARTIDO                    TEXT,
	NM_PARTIDO                    TEXT,
	SQ_COLIGACAO                  TEXT,
	NM_COLIGACAO                  TEXT,
	DS_COMPOSICAO_COLIGACAO       TEXT,
	SG_UF_NASCIMENTO              TEXT,
	NR_IDADE_DATA_POSSE           TEXT,
	NR_TITULO_ELEITORAL_CANDIDATO TEXT,
	CD_GENERO                     TEXT,
	DS_GENERO                     TEXT,
	CD_COR_RACA                   TEXT,
	DS_COR_RACA                   TEXT,
	CD_OCUPACAO                   TEXT,
	DS_OCUPACAO                   TEXT,
	CD_SIT_TOT_TURNO              TEXT,
	DS_SIT_TOT_TURNO              TEXT,
	ST_REELEICAO                  TEXT,
	NR_PROTOCOLO_CANDIDATURA      TEXT,
	NR_PROCESSO                   TEXT,
	url                           TEXT,
	pdf                           TEXT,
	txt                           TEXT

);

INSERT INTO candidates (
	ANO_ELEICAO, CD_TIPO_ELEICAO, NR_TURNO, CD_ELEICAO, SG_UF,
	SG_UE, NM_UE, CD_CARGO, DS_CARGO, SQ_CANDIDATO, NR_CANDIDATO,
	NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, NM_EMAIL,
	NR_PARTIDO, SG_PARTIDO, NM_PARTIDO, SQ_COLIGACAO, NM_COLIGACAO,
	DS_COMPOSICAO_COLIGACAO, SG_UF_NASCIMENTO, NR_IDADE_DATA_POSSE,
	NR_TITULO_ELEITORAL_CANDIDATO, CD_GENERO, DS_GENERO, CD_COR_RACA,
	DS_COR_RACA, CD_OCUPACAO, DS_OCUPACAO, CD_SIT_TOT_TURNO,
	DS_SIT_TOT_TURNO, ST_REELEICAO, NR_PROTOCOLO_CANDIDATURA, NR_PROCESSO )
SELECT
	ANO_ELEICAO, CD_TIPO_ELEICAO, NR_TURNO, CD_ELEICAO, SG_UF,
	SG_UE, NM_UE, CD_CARGO, DS_CARGO, SQ_CANDIDATO, NR_CANDIDATO,
	NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, NM_EMAIL,
	NR_PARTIDO, SG_PARTIDO, NM_PARTIDO, SQ_COLIGACAO, NM_COLIGACAO,
	DS_COMPOSICAO_COLIGACAO, SG_UF_NASCIMENTO, NR_IDADE_DATA_POSSE,
	NR_TITULO_ELEITORAL_CANDIDATO, CD_GENERO, DS_GENERO, CD_COR_RACA,
	DS_COR_RACA, CD_OCUPACAO, DS_OCUPACAO, CD_SIT_TOT_TURNO,
	DS_SIT_TOT_TURNO, ST_REELEICAO, NR_PROTOCOLO_CANDIDATURA, NR_PROCESSO
FROM x_candidates;

DROP TABLE x_candidates;
COMMIT;
PRAGMA foreign_keys=on;


