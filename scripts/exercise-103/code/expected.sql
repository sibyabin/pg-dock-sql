SELECT 
    UNNEST(STRING_TO_ARRAY('Alice;David;John', ';')) as participant_name
