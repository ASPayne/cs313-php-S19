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
,multiverseid
,CardName
,CardTypes
,ManaCost
,CMC
,Power
,Toughness
,Text
,created_by
,creation_date
,last_updated_by
,last_update_date
)
VALUES
((DEFAULT,433014,'Azami, Lady of Scrolls','Creature','{2}{U}{U}{U}',5,0,2,'Tap an untapped Wizard you control: Draw a card.', (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp(), (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp()),
(DEFAULT,461156,'Dovin, Hand of Control','Planeswalker','{2}{W/U}',3,'','','Artifact, instant, and sorcery spells your opponents cast cost {1} more to cast.
−1: Until your next turn, prevent all damage that would be dealt to and dealt by target permanent an opponent controls.', (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp(), (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp()),
(DEFAULT,460988,'Narset, Parter of Veils','Planeswalker','{1}{U}{U}',3,'','','Each opponent can\'t draw more than one card each turn.
−2: Look at the top four cards of your library. You may reveal a noncreature, nonland card from among them and put it into your hand. Put the rest on the bottom of your library in a random order.', (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp(), (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp()),
(DEFAULT,461112,'Angrath\'s Rampage','Sorcery','{B}{R}',2,'','','Choose one —
• Target player sacrifices an artifact.
• Target player sacrifices a creature.
• Target player sacrifices a planeswalker.', (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp(), (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp()),
(DEFAULT,452902,'Assassin\'s Trophy','Instant','{B}{G}',2,'','','Destroy target permanent an opponent controls. Its controller may search their library for a basic land card, put it onto the battlefield, then shuffle their library.', (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp(), (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp()),
(DEFAULT,457301,'Bedevil','Instant','{B}{B}{R}',3,'','','Destroy target artifact, creature, or planeswalker.', (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp(), (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp()),
(DEFAULT,457389,'Blood Crypt','Land','','','','','({T}: Add {B} or {R}.)
As Blood Crypt enters the battlefield, you may pay 2 life. If you don\'t, it enters the battlefield tapped.', (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp(), (SELECT id FROM public.user where username = 'SYSADMIN'), statement_timestamp()));


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
, (select id FROM public.CardStorage where multiverseid = 433014)
, (select id from public.USER where username = 'TESTUSER')
, 1
, (SELECT id FROM public.user where username = 'SYSADMIN')
, statement_timestamp()
, (SELECT id FROM public.user where username = 'SYSADMIN')
, statement_timestamp()
);