select
    safe_cast(`ID cliente` as int64)  as id_cliente,
    upper(trim(`nome de cliente`))    as nome_cliente,
    safe_cast(idade as int64)         as idade,
    safe_cast(filhos as int64)        as qtd_filhos,
    safe_cast(profissao as int64)     as id_profissao,
    safe_cast(`ID cidade` as int64)   as id_cidade
from {{ source('hytech_raw', 'tabela_clientes') }}