/*
This may not seem like much at this time. However, I have left off some tables
from this initial careation of tables. I have done so for the purposes of
having oppertunities for updating the database as the sumester continues. 
*/



CREATE TABLE public.user
(
	id             SERIAL        NOT NULL PRIMARY KEY,
	username       VARCHAR(100)  NOT NULL UNIQUE,
	password       VARCHAR(100)  NOT NULL,
	display_name   VARCHAR(100)  NOT NULL,
	email          VARCHAR(100),
	created_by     int           NOT NULL REFERENCES PUBLIC.USER(id),
	creation_date  DATE          NOT NULL,
	last_updated_by int           NOT NULL REFERENCES PUBLIC.USER(id),
	last_update_date  DATE          NOT NULL 
);


CREATE TABLE public.API
(
	id INT PRIMARY KEY
);

CREATE TABLE public.inventory
(
	id              SERIAL 		NOT NULL PRIMARY KEY,
	API_card_num    INT         NOT NULL REFERENCES public.API(id),
	card_owner	    INT			NOT NULL REFERENCES PUBLIC.USER(id),
	num_owned   	INT			NOT NULL,
	created_by     int           NOT NULL REFERENCES PUBLIC.USER(id),
	creation_date  DATE          NOT NULL,
	last_updated_by int           NOT NULL REFERENCES PUBLIC.USER(id),
	last_update_date  DATE          NOT NULL 
);

CREATE TABLE public.deck
(
	id              SERIAL 		NOT NULL PRIMARY KEY,
	API_card_num    INT         NOT NULL REFERENCES public.API(id),
	card_owner	    INT			NOT NULL REFERENCES PUBLIC.USER(id),
	num_owned   	INT			NOT NULL,
	created_by     int           NOT NULL REFERENCES PUBLIC.USER(id),
	creation_date  DATE          NOT NULL,
	last_updated_by int           NOT NULL REFERENCES PUBLIC.USER(id),
	last_update_date  DATE          NOT NULL 
);


