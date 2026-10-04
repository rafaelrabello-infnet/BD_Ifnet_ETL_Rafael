select
    v.data_venda,
    v.id_cliente,
    v.id_produto,
    v.quantidade,
    p.preco,
    v.pct_desconto,
    v.quantidade * p.preco * (1 - v.pct_desconto) as valor_total,
    v.quantidade * p.preco * (1 - v.pct_desconto) * {{ var('margem_padrao') }} as margem_estimada
from {{ ref('stg_vendas') }} v
inner join {{ ref('stg_produtos') }} p on v.id_produto = p.id_produto