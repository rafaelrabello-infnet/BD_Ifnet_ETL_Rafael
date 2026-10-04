with vendas_cliente as (
    select
        fv.id_cliente,
        max(fv.data_venda) as ultima_compra,
        count(distinct fv.data_venda) as frequencia,
        sum(fv.valor_total) as valor_total
    from {{ ref('fct_vendas') }} fv
    group by fv.id_cliente
),
rfm as (
    select
        id_cliente,
        date_diff(current_date(), ultima_compra, day) as recencia_dias,
        frequencia,
        valor_total,
        case
            when valor_total >= 5000 and frequencia >= 5 then 'Campeão'
            when valor_total >= 2000 then 'Fiel'
            when frequencia <= 1 then 'Novo/Esporádico'
            else 'Em risco'
        end as segmento_rfm
    from vendas_cliente
)
select c.id_cliente, c.nome_cliente, c.idade, c.id_cidade,
       r.recencia_dias, r.frequencia, r.valor_total, r.segmento_rfm
from {{ ref('stg_clientes') }} c
left join rfm r using (id_cliente)