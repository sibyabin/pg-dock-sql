-- SET search_path to exercise_104;

SELECT 
ROUND(SUM (CASE WHEN calls.caller_country != calls.receiver_country THEN 1 else 0 END ) * 100 / count(*),1) as international_call_percentage
FROM
(
    SELECT 
        calls.* , 
        caller.country_id as caller_country,
        receiver.country_id as receiver_country  
    FROM 
    phone_call calls 
    INNER JOIN phone_info caller ON calls.caller_id = caller.caller_id
    INNER JOIN phone_info receiver ON calls.receiver_id = receiver.caller_id

) calls
