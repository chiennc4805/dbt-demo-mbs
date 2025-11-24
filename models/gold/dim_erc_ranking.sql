with adjusted_erc as (
SELECT DISTINCT
	f.C_ORIGIN_ACCOUNT_CODE,
	CASE 
        WHEN f.C_MONTH = 12 THEN f.C_YEAR + 1
        ELSE f.C_YEAR
    END AS C_YEAR_ADJ,
	CASE 
        WHEN f.C_MONTH = 12 THEN 1
        ELSE f.C_MONTH + 1
    END AS C_MONTH_ADJ,
	f.C_SYNTHETIC_ANNOUCED_RANKING
FROM fact_v_t_erc_monthly_detail f
JOIN (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY C_ACCOUNT_CODE ORDER BY updated_at DESC) AS rn
    FROM {{ref('t_back_account')}}
) b 
  ON f.C_ORIGIN_ACCOUNT_CODE = LEFT(b.C_ACCOUNT_CODE, 6)
)
SELECT *,
	  CONCAT(C_ORIGIN_ACCOUNT_CODE, '_',C_YEAR_ADJ, '_', C_MONTH_ADJ) AS C_RANKING_KEY,
	  CASE
		    WHEN C_MONTH_ADJ BETWEEN 1 AND 6
		        THEN CONCAT(C_YEAR_ADJ, ' Ky 1')
		    ELSE
		        CONCAT(C_YEAR_ADJ, ' Ky 2')
		END AS C_KY_KPI
FROM adjusted_erc		