SELECT 
    C_ACCOUNT_CODE,
    C_TRANSACTION_DATE,
    C_MATCHED_PRICE,
    C_MATCHED_VOLUME
FROM {{source("silver", "fact_t_back_deal_history")}}