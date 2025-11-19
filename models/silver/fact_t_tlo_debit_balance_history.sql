SELECT 
    *
FROM {{source("silver", "fact_t_tlo_debit_balance_history")}}