<?PHP
include 'databaseconnect';

$query1 = 'INSERT INTO CardStorage(multiverseid, CardName, CardTypes) VALUES ("'. $card['multiverseid'] .'", "' . $card['name'] . '", "' . $card['types'] . '")';

$db->query($query1);

$query2 =
'INSERT INTO public.deck(
id              
,card_num    	
,deck_owner	    
,num_owned   	
,created_by     	
,creation_date  	
,last_updated_by 
,last_update_date)
VALUES
(
	DEFAULT
, (select id FROM public.CardStorage where multiverseid = ' . $card['multiverseid'] . ')
, (select id from public.USER where username = ' . "'TESTUSER'" .')
, 1
, (SELECT id FROM public.user where username = ' . "'SYSADMIN'" .')
, statement_timestamp()
, (SELECT id FROM public.user where username = ' . "'SYSADMIN'" .')
, statement_timestamp()
)';

$db->query($query1);

?>
