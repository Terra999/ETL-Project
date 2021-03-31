-- Table: public.country

-- DROP TABLE public.country;
-- This code creates a country table with native_country as the primary key.

CREATE TABLE public.country
(
    native_country text COLLATE pg_catalog."default" NOT NULL,
    region text COLLATE pg_catalog."default",
    population integer,
    gdp double precision,
    phones_per_1000 double precision,
    CONSTRAINT country_pkey PRIMARY KEY (native_country)
)

TABLESPACE pg_default;

ALTER TABLE public.country
    OWNER to postgres;

-- Table: public.adult

-- DROP TABLE public.adult;

-- This code creates an adult census table with id as the primary key and native_country as a foreign key from the country table.

CREATE TABLE public.adult
(
    id SERIAL NOT NULL,
    age integer,
    education text COLLATE pg_catalog."default",
    sex text COLLATE pg_catalog."default",
    hours_per_week integer,
    native_country text COLLATE pg_catalog."default",
    CONSTRAINT adult_pkey PRIMARY KEY (id),
    CONSTRAINT country_fk FOREIGN KEY (native_country)
        REFERENCES public.country (native_country) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.adult
    OWNER to postgres;


-- Join tables on county_id
SELECT premise.id, premise.premise_name, county.county_name
FROM premise
INNER JOIN county
ON premise.county_id = county.county_id;

-- As proof of concet we can create a view to show that everything works.

CREATE OR REPLACE VIEW hours_per_week_sex_region AS
SELECT
	country.region
	, adult.sex
	, SUM(adult.hours_per_week) AS sub_tot_hours_per_week
FROM public.adult
JOIN country USING(native_country)
GROUP BY
	country.region
	, adult.sex
ORDER BY
	country.region
	, adult.sex
;

-- Query the view from above
SELECT * FROM hours_per_week_sex_region;