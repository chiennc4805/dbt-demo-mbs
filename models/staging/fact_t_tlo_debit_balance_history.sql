SELECT 
    C_ACCOUNT_CODE,
    C_TRANSACTION_DATE,
    C_INTERM_BALANCE,
    C_INTERM_CASH_OUT,
    C_OUTTERM_BALANCE,
    C_OUTTERM_CASH_OUT,
    C_MBS_EXPIRE_DEBIT,
    C_TLO_COL_1
FROM {{source("silver", "fact_t_tlo_debit_balance_history")}}