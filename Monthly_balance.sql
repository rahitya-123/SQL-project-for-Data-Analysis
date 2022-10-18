DECLARE @firstdate DATE
	,@lastdate DATE

SELECT @firstdate = min([date])
FROM production.funds
WHERE customer_id = 5001404

SELECT @lastdate = max([date])
FROM production.funds
WHERE customer_id = 5001404

SET @firstdate = CAST(CAST(YEAR(@firstdate) AS VARCHAR(4)) + '/' + CAST(MONTH(@firstdate) AS VARCHAR(2)) + '/01' AS DATE)
SET @lastdate = EOmonth(@lastdate);

WITH months (DATE)
AS (
	SELECT @firstdate
	
	UNION ALL
	
	SELECT DATEADD(month, 1, DATE)
	FROM Production.funds
	WHERE DATEADD(month, 1, DATE) <= @lastdate
	)
SELECT DATE AS startdate
	,eomonth(DATE) AS lastdate
INTO #tempdates
FROM months

SELECT customer_id
	,startdate
	,lastdate
	,sum(deposits)
	,sum(withdrawls)
	,sum(debit)
	,sum(debit)
	,sum(adjustment)
FROM production.funds c
JOIN #tempdates tp ON tp.datepart(year, startdate) = c.datepart(year, [date])
	AND tp.datepart(month, startdate) = c.datepart(month, [date])
WHERE customer_id = 5001404
GROUP BY customer_id
	,startdate
	,lastdate;