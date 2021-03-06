-- twelve2master.sql - merge candidates-2012.db into candidates-master.db

ATTACH './etc/candidates-2012.db' AS twelve;
BEGIN;
INSERT INTO candidates (
	'year',
	'round',
	'state',
	'district_code',
	'district',
	'office_code',
	'office',
	'name',
	'sequence',
	'number',
	'cpf',
	'ballot_name',
	'party_id',
	'party_short',
	'party',
	'coalition_code',
	'coalition_short',
	'coalition_comp',
	'coalition',
	'occupation_code',
	'occupation',
	'electoral_title',
	'age',
	'sex',
	'expenses',
	'result_code',
	'result',
	'email'
)
SELECT
	ANO_ELEICAO,
	NUM_TURNO,
	SIGLA_UF,
	SIGLA_UE,
	DESCRICAO_UE,
	CODIGO_CARGO,
	DESCRICAO_CARGO,
	NOME_CANDIDATO,
	SEQUENCIAL_CANDIDATO,
	NUMERO_CANDIDATO,
	CPF_CANDIDATO,
	NOME_URNA_CANDIDATO,
	NUMERO_PARTIDO,
	SIGLA_PARTIDO,
	NOME_PARTIDO,
	CODIGO_LEGENDA,
	SIGLA_LEGENDA,
	COMPOSICAO_LEGENDA,
	NOME_LEGENDA,
	CODIGO_OCUPACAO,
	DESCRICAO_OCUPACAO,
	NUM_TITULO_ELEITORAL_CANDIDATO,
	IDADE_DATA_ELEICAO,
	CODIGO_SEXO,
	DESPESA_MAX_CAMPANHA,
	COD_SIT_TOT_TURNO,
	DESC_SIT_TOT_TURNO,
	NM_EMAIL
FROM twelve.candidates;
COMMIT; 
DETACH twelve;