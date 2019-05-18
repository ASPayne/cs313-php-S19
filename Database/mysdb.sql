--# First Create the database
--CREATE DATABASE MTG_template;

--# Connect to the database, so that our tables, etc., will be there
-- \c  MTG_template
 
/*
# When you run these commands at Heroku, you wont need (or be able to) create
# your own separate database first. It will already be created and you will
# be connected to it.


# A few helpful commands you might want during the process:
# \dt - Lists the tables
# \d+ public.user - Shows the details of the user table
# DROP TABLE public.user - Removes the user table completely so we can re-create it
# \q - Quit the application and go back to the regular command prompt
*/

--IF TABLE public."user" EXISTS (DROP TABLE public."user");
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


