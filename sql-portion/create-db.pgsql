--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    "Number" integer NOT NULL,
    order_date date,
    cust_id integer,
    salesperson_id integer,
    "Amount" integer
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- Name: Orders_Number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_Number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Orders_Number_seq" OWNER TO postgres;

--
-- Name: Orders_Number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_Number_seq" OWNED BY public."Orders"."Number";


--
-- Name: Salesperson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Salesperson" (
    "ID" integer NOT NULL,
    "Name" character varying,
    "Age" integer,
    "Salary" integer
);


ALTER TABLE public."Salesperson" OWNER TO postgres;

--
-- Name: Salesperson_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Salesperson_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Salesperson_ID_seq" OWNER TO postgres;

--
-- Name: Salesperson_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Salesperson_ID_seq" OWNED BY public."Salesperson"."ID";


--
-- Name: Orders Number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN "Number" SET DEFAULT nextval('public."Orders_Number_seq"'::regclass);


--
-- Name: Salesperson ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Salesperson" ALTER COLUMN "ID" SET DEFAULT nextval('public."Salesperson_ID_seq"'::regclass);


--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" ("Number", order_date, cust_id, salesperson_id, "Amount") FROM stdin;
10	1996-08-02	4	2	540
20	1999-01-30	4	8	1800
30	1995-07-14	9	1	460
40	1998-01-29	7	2	2400
50	1998-02-03	6	7	600
60	1998-03-02	6	7	720
70	1998-05-06	9	7	150
\.


--
-- Name: Orders_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_Number_seq"', 1, true);


--
-- Data for Name: Salesperson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Salesperson" ("ID", "Name", "Age", "Salary") FROM stdin;
1	Abe	61	140000
2	Bob	34	44000
11	Joe	38	38000
8	Ken	57	115000
7	Dan	41	52000
5	Chris	34	40000
\.


--
-- Name: Salesperson_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Salesperson_ID_seq"', 6, true);


--
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("Number");


--
-- Name: Salesperson Salesperson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Salesperson"
    ADD CONSTRAINT "Salesperson_pkey" PRIMARY KEY ("ID");


--
-- Name: Orders Orders_salesperson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_salesperson_id_fkey" FOREIGN KEY (salesperson_id) REFERENCES public."Salesperson"("ID");


--
-- PostgreSQL database dump complete
--

