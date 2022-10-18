DECLARE @firstdate DATE
    ,@lastdate DATE

SELECT @firstdate = min([date])
FROM production.funds
WHERE customer_id = 5009848

SELECT @lastdate = max([date])
FROM production.funds
WHERE customer_id = 5009848

SET @firstdate = CAST(CAST(YEAR(@firstdate) AS VARCHAR(4)) + '/' + CAST(MONTH(@firstdate) AS VARCHAR(2)) + '/01' AS DATE)
SET @lastdate = EOmonth(@lastdate);

WITH months (DATE)
AS (
    SELECT @firstdate
    
    UNION ALL
    
    SELECT DATEADD(month, 1, DATE)
    FROM months
    WHERE DATEADD(month, 1, DATE) <= @lastdate
    )
SELECT DATE AS startdate
    ,eomonth(DATE) AS lastdate
    ,datepart(year, date) as yy
    ,datepart(month, date) as mm
INTO #tempdates 
FROM months

select customer_id,deposits,withdrawals,debits,credits,manual_adjustments,datepart(year, [date]) as yy,datepart(month, [date]) as mm
into #tempfunds from production.funds

SELECT customer_id
    ,startdate
    ,lastdate
    ,sum(deposits) as deposits
    ,sum(withdrawals) as withdrawals
    ,sum(debits) as debits
    ,sum(credits) as credits
    ,sum(manual_adjustments) as manual_adjustments
FROM #tempfunds c
JOIN #tempdates tp ON tp.yy = c.yy
    AND tp.mm = c.mm
WHERE customer_id =5009848
GROUP BY customer_id
    ,startdate
    ,lastdate



	