select
    safe_cast(`ID UF` as int64)       as id_uf,
    upper(trim(UF))                   as uf,
    safe_cast(`ID cidade` as int64)   as id_cidade,
    upper(trim(`nome da cidade`))     as nome_cidade,
    upper(trim(`Região do Brasil`))   as regiao
from {{ source('hytech_raw', 'tabela_regioes') }}