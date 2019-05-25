INSERT INTO public.USER (
id             	
,username       	
,password       	
,display_name	
,created_by     	
,creation_date  	
,last_updated_by 
,last_update_date
)
VALUES(
DEFAULT
, 'SYSADMIN'
, 'PASSWORD'
, 'SYSADMIN'
, 1
, statement_timestamp()
, 1
, statement_timestamp()
);


INSERT INTO public.USER (
id             	
,username       	
,password       	
,display_name	
,created_by     	
,creation_date  	
,last_updated_by 
,last_update_date
)
VALUES(
DEFAULT
, 'TESTUSER'
, 'PASSWORD'
, 'PAYNEWALKER'
, (SELECT id FROM public.user where username = 'SYSADMIN')
, statement_timestamp()
, (SELECT id FROM public.user where username = 'SYSADMIN')
, statement_timestamp()
);

INSERT INTO PUBLIC.CardStorage
(
id
, multiverseid
, CardName
, CardTypes
)
VALUES(
DEFAULT
, 386616
, 'Narset, Enlightened Master'
, 'Creature'
);

INSERT INTO public.deck(
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
, (select id FROM public.CardStorage where multiverseid = 386616)
, (select id from public.USER where username = 'TESTUSER')
, 1
, (SELECT id FROM public.user where username = 'SYSADMIN')
, statement_timestamp()
, (SELECT id FROM public.user where username = 'SYSADMIN')
, statement_timestamp()
);