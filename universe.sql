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
-- Name: attribute; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.attribute (
    attribute_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(3)
);


ALTER TABLE public.attribute OWNER TO freecodecamp;

--
-- Name: attribute_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.attribute_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attribute_attribute_id_seq OWNER TO freecodecamp;

--
-- Name: attribute_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.attribute_attribute_id_seq OWNED BY public.attribute.attribute_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(30),
    distance_mly numeric(6,3),
    has_star boolean
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
-- Name: links; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.links (
    links_id integer NOT NULL,
    planet_id integer,
    attribute_id integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.links OWNER TO freecodecamp;

--
-- Name: links_link_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.links_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_link_id_seq OWNER TO freecodecamp;

--
-- Name: links_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.links_link_id_seq OWNED BY public.links.links_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    radius_km integer,
    discovered_by character varying(20)
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
    is_fictional boolean,
    star_id integer,
    moons integer
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
    has_planet boolean,
    galaxy_id integer,
    colour text
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
-- Name: attribute attribute_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.attribute ALTER COLUMN attribute_id SET DEFAULT nextval('public.attribute_attribute_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: links links_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.links ALTER COLUMN links_id SET DEFAULT nextval('public.links_link_id_seq'::regclass);


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
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.attribute VALUES (1, 'water', 'liq');
INSERT INTO public.attribute VALUES (2, 'oxygen', 'gas');
INSERT INTO public.attribute VALUES (3, 'life', 'ccc');
INSERT INTO public.attribute VALUES (4, 'barren', 'ddd');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.500, true);
INSERT INTO public.galaxy VALUES (3, 'Ursa Major III', 'Dwarf', 0.032, true);
INSERT INTO public.galaxy VALUES (4, 'Sculptor', 'Spiral', 12.000, true);
INSERT INTO public.galaxy VALUES (5, 'Bodes', 'Spiral', 12.000, true);
INSERT INTO public.galaxy VALUES (6, 'Star Wars', 'Cigar', 100.000, true);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.links VALUES (4, 3, 1, 'aaa');
INSERT INTO public.links VALUES (5, 3, 2, 'bbb');
INSERT INTO public.links VALUES (6, 9, 1, 'ddd');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1738, 'Apes');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 'Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 'Hall');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 'Galileo');
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 2634, 'Galileo');
INSERT INTO public.moon VALUES (6, 'Europa', 5, 1560, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 'Galileo');
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 198, 'Herschel');
INSERT INTO public.moon VALUES (9, 'Enceladas', 6, 252, 'Herschel');
INSERT INTO public.moon VALUES (10, 'Tethis', 6, 533, 'Cassini');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561, 'Cassini');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 764, 'Cassini');
INSERT INTO public.moon VALUES (13, 'Titan', 6, 2574, 'Huygens');
INSERT INTO public.moon VALUES (14, 'Ariel', 8, 579, 'Lassell');
INSERT INTO public.moon VALUES (15, 'Umbriel', 8, 585, 'Lassel');
INSERT INTO public.moon VALUES (16, 'Titania', 8, 789, 'Herschel');
INSERT INTO public.moon VALUES (17, 'Oberon', 8, 761, 'Herschel');
INSERT INTO public.moon VALUES (18, 'Miranda', 8, 236, 'Kuiper');
INSERT INTO public.moon VALUES (19, 'Triton', 7, 1534, 'Lassell');
INSERT INTO public.moon VALUES (20, 'Charon', 9, 606, 'Christy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', false, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 1, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 1, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1, 98);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 1, 64);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 1, 32);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 1, 3);
INSERT INTO public.planet VALUES (10, 'Dagobar', true, 6, 4);
INSERT INTO public.planet VALUES (11, 'Hoth', true, 6, 2);
INSERT INTO public.planet VALUES (12, 'Yavin IV', true, 6, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 1, 'yellow');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', true, 1, 'white');
INSERT INTO public.star VALUES (3, 'Dogstar', true, 1, 'red');
INSERT INTO public.star VALUES (4, 'Betelgeuse', true, 1, 'yellow');
INSERT INTO public.star VALUES (5, 'Figment', false, 2, 'white');
INSERT INTO public.star VALUES (6, 'Centre', true, 6, 'red');


--
-- Name: attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.attribute_attribute_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: links_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.links_link_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: attribute attribute_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_description_key UNIQUE (description);


--
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (attribute_id);


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
-- Name: links links_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_name_key UNIQUE (name);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (links_id);


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
-- Name: links links_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.attribute(attribute_id);


--
-- Name: links links_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

