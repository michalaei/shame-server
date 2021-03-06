toc.dat                                                                                             0000600 0004000 0002000 00000006135 13633742600 0014450 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           x            shame    10.12    12.2     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �
           1262    16384    shame    DATABASE     �   CREATE DATABASE shame WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Hebrew_Israel.1255' LC_CTYPE = 'Hebrew_Israel.1255';
    DROP DATABASE shame;
                postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false         �
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3         �            1259    16396 	   realities    TABLE     �   CREATE TABLE public.realities (
    "warriorReality" integer NOT NULL,
    "attackDemands" integer,
    "operationalPlans" integer,
    ng integer,
    name character varying
);
    DROP TABLE public.realities;
       public            postgres    false    3         �            1259    16393    server_id_seq    SEQUENCE     v   CREATE SEQUENCE public.server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.server_id_seq;
       public          postgres    false    3         �            1259    16385    servers    TABLE       CREATE TABLE public.servers (
    id integer DEFAULT nextval('public.server_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    url character varying,
    team character varying,
    details character varying,
    icon character varying
);
    DROP TABLE public.servers;
       public            postgres    false    197    3         �
          0    16396 	   realities 
   TABLE DATA           d   COPY public.realities ("warriorReality", "attackDemands", "operationalPlans", ng, name) FROM stdin;
    public          postgres    false    198       2802.dat �
          0    16385    servers 
   TABLE DATA           E   COPY public.servers (id, name, url, team, details, icon) FROM stdin;
    public          postgres    false    196       2800.dat �
           0    0    server_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.server_id_seq', 4, true);
          public          postgres    false    197         v
           2606    16392    servers servers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_pkey;
       public            postgres    false    196                                                                                                                                                                                                                                                                                                                                                                                                                                           2802.dat                                                                                            0000600 0004000 0002000 00000000116 13633742600 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        0	0	0	0	מבצעית
1	1	1	1	תרגילית
2	2	2	2	כל דבר נחמד
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                  2800.dat                                                                                            0000600 0004000 0002000 00000000572 13633742600 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Food Demands	http://localhost:8080	FireCamp	Always down for some reason	fas fa-fire
2	Scheming Plan	http://localhost:8080	FireCamp	They are mostly down all the time	fas fa-fire
3	Candies	http://localhost:8080	NgIf - Green Blah	They are mostly down all the time	fas fa-bomb
4	Plannings	http://localhost:8080	NgIf - Green Blah	They are mostly down all the time	fas fa-fire
\.


                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000006421 13633742600 0015373 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 12.2

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

DROP DATABASE shame;
--
-- Name: shame; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shame WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Hebrew_Israel.1255' LC_CTYPE = 'Hebrew_Israel.1255';


ALTER DATABASE shame OWNER TO postgres;

\connect shame

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- Name: realities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realities (
    "warriorReality" integer NOT NULL,
    "attackDemands" integer,
    "operationalPlans" integer,
    ng integer,
    name character varying
);


ALTER TABLE public.realities OWNER TO postgres;

--
-- Name: server_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.server_id_seq OWNER TO postgres;

--
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers (
    id integer DEFAULT nextval('public.server_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    url character varying,
    team character varying,
    details character varying,
    icon character varying
);


ALTER TABLE public.servers OWNER TO postgres;

--
-- Data for Name: realities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realities ("warriorReality", "attackDemands", "operationalPlans", ng, name) FROM stdin;
\.
COPY public.realities ("warriorReality", "attackDemands", "operationalPlans", ng, name) FROM '$$PATH$$/2802.dat';

--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers (id, name, url, team, details, icon) FROM stdin;
\.
COPY public.servers (id, name, url, team, details, icon) FROM '$$PATH$$/2800.dat';

--
-- Name: server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_id_seq', 4, true);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               