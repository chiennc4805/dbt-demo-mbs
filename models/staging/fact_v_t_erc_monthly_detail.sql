SELECT 
    C_ORIGIN_ACCOUNT_CODE,
    C_MONTH,
    C_YEAR,
    C_SYNTHETIC_ANNOUCED_RANKING
FROM {{source("silver", "fact_v_t_erc_monthly_detail")}}