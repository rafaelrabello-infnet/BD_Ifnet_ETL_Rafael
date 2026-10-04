select
    safe_cast(`ID profissao` as int64) as id_profissao,
    upper(trim(Profissao))             as profissao,
    safe_cast(`Remuneração Min` as numeric) as remuneracao_min,
    safe_cast(`Remuneração Max` as numeric) as remuneracao_max
from {{ source('hytech_raw', 'tabela_profissoes') }}