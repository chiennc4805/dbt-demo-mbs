SELECT 
    C_ACCOUNT_CODE,
    C_WITHDRAW_DATE,
    C_CASH_VOLUME
FROM {{source("silver", "fact_t_back_advance_withdraw")}}