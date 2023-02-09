--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    width_in_ly integer,
    age integer,
    type character varying(30),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    diameter integer,
    metallic_core boolean,
    surface_color character varying(20),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    diameter_in_km integer,
    is_gas_giant boolean,
    has_moon boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_m_years numeric,
    class character(1),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: whatever; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.whatever (
    whatever_id integer NOT NULL,
    name character varying(30) NOT NULL,
    rock integer,
    paper boolean,
    scissors numeric
);


ALTER TABLE public.whatever OWNER TO freecodecamp;

--
-- Name: whatever_whatever_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.whatever_whatever_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whatever_whatever_id_seq OWNER TO freecodecamp;

--
-- Name: whatever_whatever_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.whatever_whatever_id_seq OWNED BY public.whatever.whatever_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: whatever whatever_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.whatever ALTER COLUMN whatever_id SET DEFAULT nextval('public.whatever_whatever_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 105000, 13610000, 'Spiral', 'The Milky way is the best way');
INSERT INTO public.galaxy VALUES (4, 'MK-09', 89023, 95000000, 'cubic', NULL);
INSERT INTO public.galaxy VALUES (5, 'MK-10', 89043, 95000000, 'cubic', NULL);
INSERT INTO public.galaxy VALUES (6, 'MK-02', 8902, 9500000, 'cubic', NULL);
INSERT INTO public.galaxy VALUES (7, 'MK-5461651', 89023, 95000000, 'cubic', NULL);
INSERT INTO public.galaxy VALUES (8, 'MK-asdf', 89023, 95000000, 'cubic', NULL);
INSERT INTO public.galaxy VALUES (9, 'MK-54', 89023, 95000000, 'cubic', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (12, 'Luna', 3500, true, 'White', 3);
INSERT INTO public.moon VALUES (13, 'Phobos', 1200, true, 'Red', 4);
INSERT INTO public.moon VALUES (14, 'Caronte', 1300, false, 'Red', 4);
INSERT INTO public.moon VALUES (15, 'XOR_30', 300, false, 'Blue', 5);
INSERT INTO public.moon VALUES (16, 'Pesci20', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (17, 'Pesci1', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (18, 'Pesci5814', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (19, 'Pesci53', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (20, 'Pesci825', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (21, 'Pesci51', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (22, 'Pesci18', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (23, 'Pesci10', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (24, 'Pesci92', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (25, 'Pesci74', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (26, 'Pesci83', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (27, 'Pesci25', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (28, 'Pesci61', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (29, 'Pesci55', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (30, 'Pesci', 1400, true, 'Yellow', 5);
INSERT INTO public.moon VALUES (31, 'ExternallisPesci', 1325, false, 'Yellow', 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, true, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 120536, true, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 51108, true, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49538, true, true, 1);
INSERT INTO public.planet VALUES (9, 'AlphaCentauriBb', 10781, false, false, 2);
INSERT INTO public.planet VALUES (10, 'Externalis', 1536, false, false, 4);
INSERT INTO public.planet VALUES (11, 'Externalis3', 1536, false, false, 4);
INSERT INTO public.planet VALUES (12, 'Externalis8', 1536, false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4603, 'G', 3);
INSERT INTO public.star VALUES (2, 'AlphaCentauri', 4623, 'G', 3);
INSERT INTO public.star VALUES (3, 'AlphaCentauri2', 4623, 'G', 3);
INSERT INTO public.star VALUES (4, 'AlphaCentauri3', 4623, 'G', 3);
INSERT INTO public.star VALUES (5, 'AlphaCentauri4', 4623, 'G', 3);
INSERT INTO public.star VALUES (6, 'AlphaCentauri5', 4623, 'G', 3);
INSERT INTO public.star VALUES (7, 'AlphaCentauri6', 4623, 'G', 3);
INSERT INTO public.star VALUES (8, 'AlphaCentauri7', 4623, 'G', 3);
INSERT INTO public.star VALUES (9, 'AlphaCentauri8', 4623, 'G', 3);
INSERT INTO public.star VALUES (10, 'AlphaCentauri9', 4623, 'G', 3);
INSERT INTO public.star VALUES (11, 'AlphaCentauri10', 4623, 'G', 3);
INSERT INTO public.star VALUES (12, 'AlphaCentauri11', 4623, 'G', 3);
INSERT INTO public.star VALUES (13, 'AlphaCentauri12', 4623, 'G', 3);
INSERT INTO public.star VALUES (14, 'AlphaCentauri13', 4623, 'G', 3);
INSERT INTO public.star VALUES (15, 'AlphaCentauri14', 4623, 'G', 3);
INSERT INTO public.star VALUES (16, 'AlphaCentauri15', 4623, 'G', 3);
INSERT INTO public.star VALUES (17, 'AlphaCentauri16', 4623, 'G', 3);
INSERT INTO public.star VALUES (18, 'AlphaCentauri17', 4623, 'G', 3);
INSERT INTO public.star VALUES (19, 'AlphaCentauri18', 4623, 'G', 3);
INSERT INTO public.star VALUES (20, 'AlphaCentauri19', 4623, 'G', 3);
INSERT INTO public.star VALUES (21, 'AlphaCentauri20', 4623, 'G', 3);


--
-- Data for Name: whatever; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.whatever VALUES (1, 'rock', NULL, NULL, NULL);
INSERT INTO public.whatever VALUES (2, 'paper', NULL, NULL, NULL);
INSERT INTO public.whatever VALUES (3, 'scissors', NULL, NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 9, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 31, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 21, true);


--
-- Name: whatever_whatever_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.whatever_whatever_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: galaxy uniqueness; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniqueness UNIQUE (name);


--
-- Name: whatever whatever_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.whatever
    ADD CONSTRAINT whatever_name_key UNIQUE (name);


--
-- Name: whatever whatever_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.whatever
    ADD CONSTRAINT whatever_pkey PRIMARY KEY (whatever_id);


--
-- Name: moon associated_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT associated_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_in_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_in_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

