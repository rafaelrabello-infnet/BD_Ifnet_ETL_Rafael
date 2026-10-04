select
    safe_cast(`ID Data` as int64)  as id_data,
    safe_cast(Data as date)        as data,
    safe_cast(Ano as int64)        as ano,
    safe_cast(`Mês` as int64)      as mes,
    upper(trim(`Nome Mês`))        as nome_mes,
    upper(trim(Trimestre))         as trimestre
from {{ source('hytech_raw', 'd_calendario') }}