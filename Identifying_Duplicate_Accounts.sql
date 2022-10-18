SELECT DISTINCT user_names
FROM (
    SELECT last_name + ' ' + cast(date_of_birth AS VARCHAR(20)) AS equality
        ,string_agg(username,', ') AS user_names FROM Production.CustomerDetails
    GROUP BY last_name
        ,date_of_birth
    HAVING count(*) > 1
    
    UNION ALL
    
    SELECT valid_mobile_no AS equality
        ,string_agg(username,', ') AS user_names FROM Production.CustomerDetails
    GROUP BY valid_mobile_no
    HAVING count(*) > 1
    
    UNION ALL
    
    SELECT last_name + ' ' + postcode_area AS equality
        ,string_agg(username,', ') AS user_names FROM Production.CustomerDetails
    GROUP BY last_name
        ,postcode_area
    HAVING count(*) > 1
    ) A
