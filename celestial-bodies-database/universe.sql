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
-- Name: earth_mass; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth_mass (
    earth_mass_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(20) NOT NULL
);


ALTER TABLE public.earth_mass OWNER TO freecodecamp;

--
-- Name: earth_mass_earth_mass_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_mass_earth_mass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_mass_earth_mass_id_seq OWNER TO freecodecamp;

--
-- Name: earth_mass_earth_mass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_mass_earth_mass_id_seq OWNED BY public.earth_mass.earth_mass_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_myr integer,
    distance_from_earth_ly numeric(5,1)
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
    description text,
    has_life boolean,
    age_in_myr integer,
    radius_in_km numeric(5,1),
    planet_id integer,
    earth_mass_id integer
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
    description text,
    has_life boolean,
    age_in_myr integer,
    star_id integer,
    earth_mass_id integer
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
    description text,
    galaxy_id integer NOT NULL,
    age_in_myr integer
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
-- Name: earth_mass earth_mass_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_mass ALTER COLUMN earth_mass_id SET DEFAULT nextval('public.earth_mass_earth_mass_id_seq'::regclass);


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
-- Data for Name: earth_mass; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth_mass VALUES (1, 'subterran', '0.1-0.5 Earth masses');
INSERT INTO public.earth_mass VALUES (2, 'terran', '0.5-2 Earth masses');
INSERT INTO public.earth_mass VALUES (3, 'superterran', '2-10 Earth masses');
INSERT INTO public.earth_mass VALUES (4, 'Neptunian', '10-50 Earth masses');
INSERT INTO public.earth_mass VALUES (5, 'Jovian', '50-5000 Earth masses');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Peekaboo', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Eye of Sauron', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Io', NULL, NULL, NULL, NULL, 5, 1);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, NULL, NULL, NULL, 5, 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, NULL, NULL, NULL, 5, 1);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, NULL, NULL, 5, 1);
INSERT INTO public.moon VALUES (6, 'Mimas', NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO public.moon VALUES (1, 'Moon', NULL, false, 4530, 1737.4, 1, 1);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO public.moon VALUES (10, 'Tethys', NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO public.moon VALUES (14, 'Iapetus', NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO public.moon VALUES (15, 'Miranda', NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO public.moon VALUES (16, 'Ariel', NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO public.moon VALUES (17, 'Umbriel', NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO public.moon VALUES (18, 'Titania', NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO public.moon VALUES (19, 'Oberon', NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO public.moon VALUES (20, 'Triton', NULL, NULL, NULL, NULL, 8, 1);
INSERT INTO public.moon VALUES (21, 'Charon', NULL, NULL, NULL, NULL, 10, 1);
INSERT INTO public.moon VALUES (22, 'Dysnomia', NULL, NULL, NULL, NULL, 13, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, true, 4543, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, false, NULL, 1, 1);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, false, NULL, 1, 2);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, 1, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, 1, 5);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, 1, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, 1, 4);
INSERT INTO public.planet VALUES (9, 'Ceres', NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (13, 'Eris', NULL, NULL, NULL, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'Hadar', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', NULL, 2, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', NULL, 1, NULL);
INSERT INTO public.star VALUES (5, 'Deneb', NULL, 1, NULL);
INSERT INTO public.star VALUES (6, 'Betelgeuse', NULL, 1, NULL);
INSERT INTO public.star VALUES (7, 'Vega', NULL, 1, NULL);


--
-- Name: earth_mass_earth_mass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_mass_earth_mass_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: earth_mass earth_mass_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_mass
    ADD CONSTRAINT earth_mass_pkey PRIMARY KEY (earth_mass_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: earth_mass unique_earth_mass_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_mass
    ADD CONSTRAINT unique_earth_mass_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_earth_mass_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_earth_mass_id_fkey FOREIGN KEY (earth_mass_id) REFERENCES public.earth_mass(earth_mass_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_earth_mass_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_earth_mass_id_fkey FOREIGN KEY (earth_mass_id) REFERENCES public.earth_mass(earth_mass_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

