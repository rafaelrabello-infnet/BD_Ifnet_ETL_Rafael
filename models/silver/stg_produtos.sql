select
    safe_cast(`ID produto` as int64)        as id_produto,
    upper(trim(`nome produto eletronico`))  as nome_produto,
    upper(trim(Sku))                        as sku,
    safe_cast(`Preço` as numeric)           as preco
from {{ source('hytech_raw', 'tabela_produtos') }}