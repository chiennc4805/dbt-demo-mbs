SELECT 
    C_ACCOUNT_CODE,
    C_TRADING_DATE,
    C_INTERM_LOAN,
    C_INTERM_LOAN_OUT,
    C_OUTTERM_LOAN,
    C_OUTTERM_LOAN_OUT
FROM {{source("silver", "fact_t_margin_extra_balance_his")}}