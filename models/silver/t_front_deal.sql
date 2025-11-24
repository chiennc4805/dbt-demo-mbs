SELECT 
    C_ACCOUNT_CODE,
    C_MATCHED_PRICE,
    C_MATCHED_VOLUME,
    updated_at
FROM {{source("streaming", "t_front_deal")}}