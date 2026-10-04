with base as (
    select
        safe_cast(`Data venda` as date)    as data_venda,
        safe_cast(`ID cliente` as int64)   as id_cliente,
        safe_cast(`Id produto` as int64)   as id_produto,
        safe_cast(Qtd as int64)            as quantidade,
        safe_cast(`% Desconto` as numeric) as pct_desconto
    from {{ source('hytech_raw', 'tabela_vendas') }}
),
dedup as (
    select *,
        row_number() over (
            partition by data_venda, id_cliente, id_produto
            order by data_venda
        ) as rn
    from base
)
select data_venda, id_cliente, id_produto, quantidade, pct_desconto
from dedup
where rn = 1