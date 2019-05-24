/*
This may not seem like much at this time. However, I have left off some tables
from this initial careation of tables. I have done so for the purposes of
having oppertunities for updating the database as the sumester continues. 
*/


CREATE TABLE public.user
(
	id             		SERIAL        NOT NULL PRIMARY KEY,
	username       		VARCHAR(100)  NOT NULL UNIQUE,
	password       		VARCHAR(100)  NOT NULL,
	display_name   		VARCHAR(100)  NOT NULL,
	email          		VARCHAR(100),
	created_by     		int           NOT NULL,
	creation_date  		DATE          NOT NULL,
	last_updated_by 	int           NOT NULL,
	last_update_date  	DATE          NOT NULL 
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
, 'SYSADMIN'
, 'PASSWORD'
, 'SYSADMIN'
, 1
, statement_timestamp()
, 1
, statement_timestamp()
);


ALTER TABLE PUBLIC.USER(
	constraint (created_by) REFERENCES public.user(id)
);
ALTER TABLE PUBLIC.USER(
	constraint (last_updated_by) REFERENCES public.user(id)
);

CREATE TABLE public.CardStorage
(
	id SERIAL PRIMARY KEY,
	multiverseid INT NOT NULL,
	CardName VARCHAR(100) NOT NULL,
	CardTypes VARCHAR(50) NOT NULL
);

CREATE TABLE public.inventory
(
	id              SERIAL 		NOT NULL PRIMARY KEY,
	card_num    INT         NOT NULL REFERENCES public.CardStorage(id),
	card_owner	    INT			NOT NULL REFERENCES PUBLIC.USER(id),
	num_owned   	INT			NOT NULL,
	created_by     int           NOT NULL REFERENCES PUBLIC.USER(id),
	creation_date  DATE          NOT NULL,
	last_updated_by int           NOT NULL REFERENCES PUBLIC.USER(id),
	last_update_date  DATE          NOT NULL 
);

CREATE TABLE public.deck
(
	id              	SERIAL 		NOT NULL PRIMARY KEY,
	card_num    		INT         NOT NULL REFERENCES public.CardStorage(id),
	card_owner	    	INT			NOT NULL REFERENCES PUBLIC.USER(id),
	num_owned   		INT			NOT NULL,
	created_by     		int         NOT NULL REFERENCES PUBLIC.USER(id),
	creation_date  		DATE        NOT NULL,
	last_updated_by 	int         NOT NULL REFERENCES PUBLIC.USER(id),
	last_update_date 	DATE        NOT NULL 
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
,card_owner	    
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