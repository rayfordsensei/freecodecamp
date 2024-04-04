--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    diameter numeric(6,1)
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    diameter numeric(6,1),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    diameter numeric(6,1),
    has_life boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    diameter numeric(6,1),
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    diameter numeric(6,1),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 11000, 1360.0);
INSERT INTO public.black_hole VALUES (2, 'SMC X-1', NULL, NULL);
INSERT INTO public.black_hole VALUES (3, 'SMC X-1', 12, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Large Magellanic C', 1101, 158200, 32469.6, 'A spiral satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13610, 26670, 10570.0, 'The home galaxy for the planet Earth');
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic C', 1100, 210000, 7000.0, 'A dwarf galaxy near the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'SagDEG', 7000, 65230, 5000.0, 'An elliptical loop-shaped satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf', 11700, 25000, 5000.0, 'A disputed dwarf irregular galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (7, 'Ursa Minor dwarf', 14000, 225000, 400.0, 'A dwarf spheroidal galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 45300, 384400, 3474.8, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 201000, 27.0, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 100, 402000, 7.0, false, 2);
INSERT INTO public.moon VALUES (4, 'Amalthea', NULL, 700000, 83.0, false, 14);
INSERT INTO public.moon VALUES (5, 'Io', 4200, 400000, 3643.0, false, 14);
INSERT INTO public.moon VALUES (6, 'Callisto', 4500, 598000, 4820.0, false, 14);
INSERT INTO public.moon VALUES (7, 'Ganymede', 4499, 598000, 5270.0, false, 14);
INSERT INTO public.moon VALUES (8, 'Xenon', 4498, 598000, 80.0, false, 14);
INSERT INTO public.moon VALUES (9, 'Xenon', 4497, 598000, 120.0, false, 14);
INSERT INTO public.moon VALUES (10, 'Europa', 4496, 598000, 4879.0, false, 14);
INSERT INTO public.moon VALUES (11, 'Albiorix', 3999, 11646, 30.0, false, 15);
INSERT INTO public.moon VALUES (12, 'Atlas', 160, 11646, 169.0, false, 15);
INSERT INTO public.moon VALUES (13, 'Tethys', 4860, 11646, 1060.0, false, 15);
INSERT INTO public.moon VALUES (14, 'Epimetheus', 4840, 11646, 114.0, false, 15);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4838, 11646, 270.0, false, 15);
INSERT INTO public.moon VALUES (16, 'Mimas', 4837, 11646, 396.0, false, 15);
INSERT INTO public.moon VALUES (17, 'Dione', 4836, 11646, 1123.0, false, 15);
INSERT INTO public.moon VALUES (18, 'Enceladus', 4834, 11646, 500.0, false, 15);
INSERT INTO public.moon VALUES (19, 'Iapetus', 4832, 11646, 1460.0, false, 15);
INSERT INTO public.moon VALUES (20, 'Janus', 4831, 11646, 177.0, false, 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4543, 0, 12742.0, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4603, 140, 6779.0, false, 1);
INSERT INTO public.planet VALUES (3, 'KIC 10900970b', NULL, 9460730, NULL, false, 2);
INSERT INTO public.planet VALUES (4, 'KIC 10900969b', NULL, 9460730, NULL, false, 2);
INSERT INTO public.planet VALUES (5, 'SMC 047366b', NULL, 250000, NULL, false, 4);
INSERT INTO public.planet VALUES (6, 'HD 107000b', NULL, 9486161, NULL, false, 6);
INSERT INTO public.planet VALUES (7, 'HD 107000c', NULL, 9486161, NULL, false, 6);
INSERT INTO public.planet VALUES (8, 'UZ Scuti b', NULL, 223440, NULL, false, 7);
INSERT INTO public.planet VALUES (9, 'UZ Scuti c', NULL, 223440, NULL, false, 7);
INSERT INTO public.planet VALUES (10, 'UZ Scuti d', NULL, 223440, NULL, false, 7);
INSERT INTO public.planet VALUES (11, 'UZ Scuti e', NULL, 223440, NULL, false, 7);
INSERT INTO public.planet VALUES (12, 'UZ Scuti f', NULL, 223440, NULL, false, 7);
INSERT INTO public.planet VALUES (14, 'Jupiter', 4602, 444, 13982.0, false, 1);
INSERT INTO public.planet VALUES (15, 'Saturn', 4503, 746, 11646.0, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, '51 Eridani', 620, 16, 2400.0, 2);
INSERT INTO public.star VALUES (1, 'Sun', 4603, 150, 1.4, 1);
INSERT INTO public.star VALUES (4, 'SMC 47366', 250, 250000, 2.6, 4);
INSERT INTO public.star VALUES (5, 'Sgr 05686', 11000, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'HD 107000', 8500, 141910, NULL, 6);
INSERT INTO public.star VALUES (7, 'UZ Scuti', 1000, 223440, 4000.0, 7);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: moon age; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT age UNIQUE (age_in_millions_of_years);


--
-- Name: black_hole black_hole_age; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_age UNIQUE (age_in_millions_of_years);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_age; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_age UNIQUE (age_in_millions_of_years);


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
-- Name: planet planet_age; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_age UNIQUE (age_in_millions_of_years);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_age; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_age UNIQUE (age_in_millions_of_years);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

