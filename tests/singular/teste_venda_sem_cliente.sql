select *
from {{ ref('fct_vendas') }}
where id_cliente is null