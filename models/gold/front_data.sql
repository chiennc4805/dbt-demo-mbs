SELECT C_ACCOUNT_CODE,
		updated_at as C_DATE,
		MONTH(updated_at) as C_MONTH,
		YEAR(updated_at) as C_YEAR,
		0 AS C_MARGIN_DEBT,
		0 AS C_MBLINK_DEBT,
		0 AS C_UTTB,
		SUM(C_MATCHED_PRICE * C_MATCHED_VOLUME) AS C_GTGD,
		CONCAT(LEFT(C_ACCOUNT_CODE,6), '_',YEAR(updated_at), '_', MONTH(updated_at)) AS C_RANKING_KEY
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY PK_FRONT_DEAL ORDER BY updated_at DESC) AS rn
    FROM {{ref('t_front_deal')}}
    WHERE DATE(updated_at) = CURDATE()
) sub
GROUP BY 1, 2;