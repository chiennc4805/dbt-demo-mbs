SELECT 
    C_ACCOUNT_CODE,
    C_OPEN_DATE,
    C_ACCOUNT_BRANCH_CODE,
    C_CHANNEL,
    updated_at
FROM {{source("streaming", "t_back_account")}}