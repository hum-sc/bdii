--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: bdd; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA bdd;


ALTER SCHEMA bdd OWNER TO admin;

--
-- Name: hr; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA hr;


ALTER SCHEMA hr OWNER TO admin;

SET default_tablespace = '';

--
-- Name: measurament; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.measurament (
    citi_id integer NOT NULL,
    logdate date NOT NULL,
    peaktemp integer,
    unitsales integer
)
PARTITION BY RANGE (logdate);


ALTER TABLE bdd.measurament OWNER TO admin;

SET default_table_access_method = heap;

--
-- Name: measurament_y2006m02; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.measurament_y2006m02 (
    citi_id integer NOT NULL,
    logdate date NOT NULL,
    peaktemp integer,
    unitsales integer
);


ALTER TABLE bdd.measurament_y2006m02 OWNER TO admin;

--
-- Name: measurament_y2006m03; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.measurament_y2006m03 (
    citi_id integer NOT NULL,
    logdate date NOT NULL,
    peaktemp integer,
    unitsales integer
);


ALTER TABLE bdd.measurament_y2006m03 OWNER TO admin;

--
-- Name: measurament_y2023; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.measurament_y2023 (
    citi_id integer NOT NULL,
    logdate date NOT NULL,
    peaktemp integer,
    unitsales integer
);


ALTER TABLE bdd.measurament_y2023 OWNER TO admin;

--
-- Name: ventas; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.ventas (
    idvta integer NOT NULL,
    producto character varying(50),
    fechavta date
);


ALTER TABLE bdd.ventas OWNER TO admin;

--
-- Name: ventas_idvta_seq; Type: SEQUENCE; Schema: bdd; Owner: admin
--

CREATE SEQUENCE bdd.ventas_idvta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bdd.ventas_idvta_seq OWNER TO admin;

--
-- Name: ventas_idvta_seq; Type: SEQUENCE OWNED BY; Schema: bdd; Owner: admin
--

ALTER SEQUENCE bdd.ventas_idvta_seq OWNED BY bdd.ventas.idvta;


--
-- Name: ventas_v1; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.ventas_v1 (
    idvta integer NOT NULL,
    precio integer
);


ALTER TABLE bdd.ventas_v1 OWNER TO admin;

--
-- Name: ventas_v1_idvta_seq; Type: SEQUENCE; Schema: bdd; Owner: admin
--

CREATE SEQUENCE bdd.ventas_v1_idvta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bdd.ventas_v1_idvta_seq OWNER TO admin;

--
-- Name: ventas_v1_idvta_seq; Type: SEQUENCE OWNED BY; Schema: bdd; Owner: admin
--

ALTER SEQUENCE bdd.ventas_v1_idvta_seq OWNED BY bdd.ventas_v1.idvta;


--
-- Name: ventas_v2; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.ventas_v2 (
    idvta integer NOT NULL,
    precio integer
);


ALTER TABLE bdd.ventas_v2 OWNER TO admin;

--
-- Name: ventas_v2_idvta_seq; Type: SEQUENCE; Schema: bdd; Owner: admin
--

CREATE SEQUENCE bdd.ventas_v2_idvta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bdd.ventas_v2_idvta_seq OWNER TO admin;

--
-- Name: ventas_v2_idvta_seq; Type: SEQUENCE OWNED BY; Schema: bdd; Owner: admin
--

ALTER SEQUENCE bdd.ventas_v2_idvta_seq OWNED BY bdd.ventas_v2.idvta;


--
-- Name: ventas_v3; Type: TABLE; Schema: bdd; Owner: admin
--

CREATE TABLE bdd.ventas_v3 (
    idvta integer NOT NULL,
    fechavta date
);


ALTER TABLE bdd.ventas_v3 OWNER TO admin;

--
-- Name: ventas_v3_idvta_seq; Type: SEQUENCE; Schema: bdd; Owner: admin
--

CREATE SEQUENCE bdd.ventas_v3_idvta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bdd.ventas_v3_idvta_seq OWNER TO admin;

--
-- Name: ventas_v3_idvta_seq; Type: SEQUENCE OWNED BY; Schema: bdd; Owner: admin
--

ALTER SEQUENCE bdd.ventas_v3_idvta_seq OWNED BY bdd.ventas_v3.idvta;


--
-- Name: country; Type: TABLE; Schema: hr; Owner: admin
--

CREATE TABLE hr.country (
    country_id character varying(2) NOT NULL,
    country_name character varying(30),
    region_id integer
);


ALTER TABLE hr.country OWNER TO admin;

--
-- Name: department; Type: TABLE; Schema: hr; Owner: admin
--

CREATE TABLE hr.department (
    department_id integer NOT NULL,
    department_name character varying(40),
    location_id integer
);


ALTER TABLE hr.department OWNER TO admin;

--
-- Name: employee; Type: TABLE; Schema: hr; Owner: admin
--

CREATE TABLE hr.employee (
    employee_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    email character varying(30),
    phone_number character varying(32),
    hire_date date,
    job_id character varying(20),
    salary double precision,
    commission_pct double precision,
    manager_id integer,
    department_id integer
);


ALTER TABLE hr.employee OWNER TO admin;

--
-- Name: job; Type: TABLE; Schema: hr; Owner: admin
--

CREATE TABLE hr.job (
    job_id character varying(20) NOT NULL,
    job_title character varying(50),
    min_salary integer,
    max_salary integer,
    bonus integer
);


ALTER TABLE hr.job OWNER TO admin;

--
-- Name: job_history; Type: TABLE; Schema: hr; Owner: admin
--

CREATE TABLE hr.job_history (
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    job_id character varying(20),
    department_id integer
);


ALTER TABLE hr.job_history OWNER TO admin;

--
-- Name: location; Type: TABLE; Schema: hr; Owner: admin
--

CREATE TABLE hr.location (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(20),
    city character varying(40),
    state_province character varying(40),
    country_id character varying(20)
);


ALTER TABLE hr.location OWNER TO admin;

--
-- Name: region; Type: TABLE; Schema: hr; Owner: admin
--

CREATE TABLE hr.region (
    region_id integer NOT NULL,
    region_name character varying(20)
);


ALTER TABLE hr.region OWNER TO admin;

--
-- Name: region; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.region (
    region_id integer NOT NULL,
    region_name character varying(20)
);


ALTER TABLE public.region OWNER TO admin;

--
-- Name: ventas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ventas (
    idvta integer NOT NULL,
    producto character varying(50),
    fechavta date
);


ALTER TABLE public.ventas OWNER TO admin;

--
-- Name: ventas_idvta_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.ventas_idvta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_idvta_seq OWNER TO admin;

--
-- Name: ventas_idvta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.ventas_idvta_seq OWNED BY public.ventas.idvta;


--
-- Name: measurament_y2006m02; Type: TABLE ATTACH; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.measurament ATTACH PARTITION bdd.measurament_y2006m02 FOR VALUES FROM ('2006-02-01') TO ('2006-03-01');


--
-- Name: measurament_y2006m03; Type: TABLE ATTACH; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.measurament ATTACH PARTITION bdd.measurament_y2006m03 FOR VALUES FROM ('2006-03-01') TO ('2006-04-01');


--
-- Name: measurament_y2023; Type: TABLE ATTACH; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.measurament ATTACH PARTITION bdd.measurament_y2023 FOR VALUES FROM ('2023-01-01') TO ('2023-12-31');


--
-- Name: ventas idvta; Type: DEFAULT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas ALTER COLUMN idvta SET DEFAULT nextval('bdd.ventas_idvta_seq'::regclass);


--
-- Name: ventas_v1 idvta; Type: DEFAULT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas_v1 ALTER COLUMN idvta SET DEFAULT nextval('bdd.ventas_v1_idvta_seq'::regclass);


--
-- Name: ventas_v2 idvta; Type: DEFAULT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas_v2 ALTER COLUMN idvta SET DEFAULT nextval('bdd.ventas_v2_idvta_seq'::regclass);


--
-- Name: ventas_v3 idvta; Type: DEFAULT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas_v3 ALTER COLUMN idvta SET DEFAULT nextval('bdd.ventas_v3_idvta_seq'::regclass);


--
-- Name: ventas idvta; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ventas ALTER COLUMN idvta SET DEFAULT nextval('public.ventas_idvta_seq'::regclass);


--
-- Data for Name: measurament_y2006m02; Type: TABLE DATA; Schema: bdd; Owner: admin
--

COPY bdd.measurament_y2006m02 (citi_id, logdate, peaktemp, unitsales) FROM stdin;
3	2006-02-11	2	11
\.


--
-- Data for Name: measurament_y2006m03; Type: TABLE DATA; Schema: bdd; Owner: admin
--

COPY bdd.measurament_y2006m03 (citi_id, logdate, peaktemp, unitsales) FROM stdin;
3	2006-03-01	5	6
3	2006-03-11	3	11
\.


--
-- Data for Name: measurament_y2023; Type: TABLE DATA; Schema: bdd; Owner: admin
--

COPY bdd.measurament_y2023 (citi_id, logdate, peaktemp, unitsales) FROM stdin;
1	2023-02-25	1	1
2	2023-02-25	1	1
3	2023-02-25	1	1
3	2023-12-11	22	12
\.


--
-- Data for Name: ventas; Type: TABLE DATA; Schema: bdd; Owner: admin
--

COPY bdd.ventas (idvta, producto, fechavta) FROM stdin;
\.


--
-- Data for Name: ventas_v1; Type: TABLE DATA; Schema: bdd; Owner: admin
--

COPY bdd.ventas_v1 (idvta, precio) FROM stdin;
\.


--
-- Data for Name: ventas_v2; Type: TABLE DATA; Schema: bdd; Owner: admin
--

COPY bdd.ventas_v2 (idvta, precio) FROM stdin;
\.


--
-- Data for Name: ventas_v3; Type: TABLE DATA; Schema: bdd; Owner: admin
--

COPY bdd.ventas_v3 (idvta, fechavta) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: hr; Owner: admin
--

COPY hr.country (country_id, country_name, region_id) FROM stdin;
AR	Argentina	4
AU	Australia	5
BE	Belgium	1
BR	Brazil	4
CA	Canada	4
CH	Switzerland	1
CN	China	3
DE	Germany	1
DK	Denmark	1
EG	Egypt	2
FR	France	1
IL	Israel	3
IN	India 	3
IT	Italy	1
JP	Japan	3
KW	Kuwait	2
ML	Malaysia	3
MX	Mexico	4
NG	Nigeria	2
NL	Netherlands	1
SG	Singapore	3
UK	United Kingdom	1
US	United States of America	4
ZM	Zambia	2
ZW	Zimbabwe	2
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: hr; Owner: admin
--

COPY hr.department (department_id, department_name, location_id) FROM stdin;
10	Administration	1700
20	Marketing	1800
30	Purchasing	1700
40	Human Resources	2400
50	Shipping	1500
60	IT	1400
70	Public Relations	2700
80	Sales	2500
90	Executive	1700
100	Finance	1700
110	Accounting	1700
120	Treasury	1700
130	Corporate Tax	1700
140	Control And Credit	1700
150	Shareholder Services	1700
160	Benefits	1700
170	Manufacturing	1700
180	Construction	1700
190	Contracting	1700
200	Operations	1700
210	IT Support	1700
220	NOC	1700
230	IT Helpdesk	1700
240	Government Sales	1700
250	Retail Sales	1700
260	Recruiting	1700
270	Payroll	1700
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: hr; Owner: admin
--

COPY hr.employee (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
198	Donald	OConnell	DOCONNEL	650.507.9833	2007-06-21	SH_CLERK	2600	0	124	50
199	Douglas	Grant	DGRANT	650.507.9844	2008-01-13	SH_CLERK	2600	0	124	50
200	Jennifer	Whalen	JWHALEN	515.123.4444	2003-09-17	AD_ASST	4400	0	101	10
201	Michael	Hartstein	MHARTSTE	515.123.5555	2004-02-17	MK_MAN	13000	0	100	20
202	Pat	Fay	PFAY	603.123.6666	2005-08-17	MK_REP	6000	0	201	20
203	Susan	Mavris	SMAVRIS	515.123.7777	2002-06-07	HR_REP	6500	0	101	40
204	Hermann	Baer	HBAER	515.123.8888	2002-06-07	PR_REP	10000	0	101	70
205	Shelley	Higgins	SHIGGINS	515.123.8080	2002-06-07	AC_MGR	12008	0	101	110
206	William	Gietz	WGIETZ	515.123.8181	2002-06-07	AC_ACCOUNT	8300	0	205	110
0	Juanito	Perez	JPEREZ	7220000000	2017-03-30	ST_MAN	4414	0.2	205	110
100	Steven	King	SKING	515.123.4567	2003-06-17	AD_PRES	2410	0	100	90
101	Neena	Kochhar	NKOCHHAR	515.123.4568	2005-09-21	AD_VP	17200	0	100	90
102	Lex	De Haan	LDEHAAN	515.123.4569	2001-01-13	AD_VP	17000	0	100	90
103	Alexander	Hunold	AHUNOLD	590.423.4567	2006-01-03	IT_PROG	9000	0	102	60
104	Bruce	Ernst	BERNST	590.423.4568	2007-05-21	IT_PROG	6000	0	103	60
105	David	Austin	DAUSTIN	590.423.4569	2005-06-25	IT_PROG	4800	0	103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	4800	0	103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4200	0	103	60
108	Nancy	Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	12008	0	101	100
109	Daniel	Faviet	DFAVIET	515.124.4169	2002-08-16	FI_ACCOUNT	9000	0	108	100
110	John	Chen	JCHEN	515.124.4269	2005-09-28	FI_ACCOUNT	8200	0	108	100
111	Ismael	Sciarra	ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	7700	0	108	100
112	Jose Manuel	Urman	JMURMAN	515.124.4469	2006-03-07	FI_ACCOUNT	7800	0	108	100
113	Luis	Popp	LPOPP	515.124.4567	2007-12-07	FI_ACCOUNT	6900	0	108	100
114	Den 	Raphaely	DRAPHEAL	515.127.4561	2002-12-07	PU_MAN	11000	0	100	30
115	Alexander	Khoo	AKHOO	515.127.4562	2003-05-18	PU_CLERK	3100	0	114	30
116	Shelli	Baida	SBAIDA	515.127.4563	2005-12-24	PU_CLERK	2900	0	114	30
117	Sigal	Tobias	STOBIAS	515.127.4564	2005-07-24	PU_CLERK	2800	0	114	30
118	Guy	Himuro	GHIMURO	515.127.4565	2006-11-15	PU_CLERK	2600	0	114	30
119	Karen	Colmenares	KCOLMENA	515.127.4566	2007-08-10	PU_CLERK	2500	0	114	30
120	Matthew	Weiss	MWEISS	650.123.1234	2004-07-18	ST_MAN	8000	0	100	50
121	Adam	Fripp	AFRIPP	650.123.2234	2005-04-10	ST_MAN	8200	0	100	50
122	Payam	Kaufling	PKAUFLIN	650.123.3234	2003-05-01	ST_MAN	7900	0	100	50
123	Shanta	Vollman	SVOLLMAN	650.123.4234	2005-10-10	ST_MAN	6500	0	100	50
124	Kevin	Mourgos	KMOURGOS	650.123.5234	2007-11-16	ST_MAN	5800	0	100	50
125	Julia	Nayer	JNAYER	650.124.1214	2005-07-16	ST_CLERK	3200	0	120	50
126	Irene	Mikkilineni	IMIKKILI	650.124.1224	2006-09-28	ST_CLERK	2700	0	120	50
127	James	Landry	JLANDRY	650.124.1334	2007-01-14	ST_CLERK	2400	0	120	50
128	Steven	Markle	SMARKLE	650.124.1434	2008-03-08	ST_CLERK	2200	0	120	50
129	Laura	Bissot	LBISSOT	650.124.5234	2005-08-20	ST_CLERK	3300	0	121	50
130	Mozhe	Atkinson	MATKINSO	650.124.6234	2005-10-30	ST_CLERK	2800	0	121	50
131	James	Marlow 	JAMRLOW	650.124.7234	2005-02-16	ST_CLERK	2500	0	121	50
132	TJ	Olson	TJOLSON	650.124.8234	2007-04-10	ST_CLERK	2100	0	121	50
133	Jason	Mallin	JMALLIN	650.127.1934	2004-06-14	ST_CLERK	3300	0	122	50
134	Michael	Rogers	MROGERS	650.127.1834	2006-08-26	ST_CLERK	2900	0	122	50
135	Ki	Gee	KGEE	650.127.1734	2007-12-12	ST_CLERK	2400	0	122	50
136	Hazel	Philtanker	HPHILTAN	650.127.1634	2008-02-06	ST_CLERK	2200	0	122	50
137	Renske	Ladwig	RLADWIG	650.121.1234	2003-07-14	ST_CLERK	3600	0	123	50
138	Stephen	Stiles	SSTILES	650.121.2034	2005-10-26	ST_CLERK	3200	0	123	50
139	John	Seo	JSEO	650.121.2019	2006-02-12	ST_CLERK	2700	0	123	50
140	Joshua	Patel	JPATEL	650.121.1834	2006-04-06	ST_CLERK	2500	0	123	50
141	Trenna	Rajs	TRAJS	650.121.8009	2003-10-17	ST_CLERK	3500	0	124	50
142	Curtis	Davies	CDAVIES	650.121.2994	2005-01-29	ST_CLERK	3100	0	124	50
143	Randall	Matos	RMATOS	650.121.2874	2006-03-15	ST_CLERK	2600	0	124	50
144	Peter	Vargas	PVARGAS	650.121.2004	2006-07-09	ST_CLERK	2500	0	124	50
145	John	Russell	JRUSSEL	011.44.1344.429268	2004-10-01	SA_MAN	14000	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	13500	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	12000	0.3	100	80
148	Gerald	Cambrault	GCAMBRAU	011.44.1344.619268	2007-10-15	SA_MAN	11000	0.3	100	80
149	Eleni	Zlotkey	EZLOTKEY	011.44.1344.429018	2008-01-29	SA_MAN	15135.12	0.2	100	80
150	Peter	Tucker	PTUCKER	011.44.1344.129268	2005-01-30	SA_REP	10000	0.3	145	80
151	David	Bernstein	DBERNSTE	011.44.1344.345268	2005-03-24	SA_REP	9500	0.25	145	80
152	Peter	Hall	PHALL	011.44.1344.478968	2005-08-20	SA_REP	9000	0.25	145	80
153	Christopher	Olsen	COLSEN	011.44.1344.498718	2006-03-30	SA_REP	11531.52	0.2	145	80
154	Nanette	Cambrault	NCAMBRAU	011.44.1344.987668	2006-12-09	SA_REP	10810	0.2	145	80
155	Oliver	Tuvault	OTUVAULT	011.44.1344.486508	2007-11-22	SA_REP	7000	0.15	145	80
156	Janette	King	JKING	011.44.1345.429268	2004-01-30	SA_REP	10000	0.35	146	80
157	Patrick	Sully	PSULLY	011.44.1345.929268	2004-03-04	SA_REP	9500	0.35	146	80
158	Allan	McEwen	AMCEWEN	011.44.1345.829268	2004-08-01	SA_REP	9000	0.35	146	80
159	Lindsey	Smith	LSMITH	011.44.1345.729268	2005-03-10	SA_REP	8000	0.3	146	80
160	Louise	Doran	LDORAN	011.44.1345.629268	2005-12-15	SA_REP	7500	0.3	146	80
161	Sarath	Sewall	SSEWALL	011.44.1345.529268	2006-11-03	SA_REP	7000	0.25	146	80
162	Clara	Vishney	CVISHNEY	011.44.1346.129268	2005-11-11	SA_REP	10500	0.25	147	80
163	Danielle	Greene	DGREENE	011.44.1346.229268	2007-03-19	SA_REP	9500	0.15	147	80
164	Mattea	Marvins	MMARVINS	011.44.1346.329268	2008-01-24	SA_REP	7200	0.1	147	80
165	David	Lee	DLEE	011.44.1346.529268	2008-02-23	SA_REP	6800	0.11	147	80
166	Sundar	Ande	SANDE	011.44.1346.629268	2008-03-24	SA_REP	6400	0.11	147	80
167	Amit	Banda	ABANDA	011.44.1346.729268	2008-04-21	SA_REP	6200	0.11	147	80
168	Lisa	Ozer	LOZER	011.44.1343.929268	2005-03-11	SA_REP	11500	0.25	148	80
169	Harrison	Bloom	HBLOOM	011.44.1343.829268	2006-03-23	SA_REP	14414	0.21	148	80
170	Tayler	Fox	TFOX	011.44.1343.729268	2006-01-24	SA_REP	13837	0.21	148	80
171	William	Smith	WSMITH	011.44.1343.629268	2007-02-23	SA_REP	7400	0.15	148	80
172	Elizabeth	Bates	EBATES	011.44.1343.529268	2007-03-24	SA_REP	7300	0.15	148	80
173	Sundita	Kumar	SKUMAR	011.44.1343.329268	2008-04-21	SA_REP	6100	0.11	148	80
174	Ellen	Abel	EABEL	011.44.1644.429267	2004-05-11	SA_REP	11000	0.31	149	80
175	Alyssa	Hutton	AHUTTON	011.44.1644.429266	2005-03-19	SA_REP	8800	0.25	149	80
176	Jonathon	Taylor	JTAYLOR	011.44.1644.429265	2006-03-24	SA_REP	12396	0.21	149	80
177	Jack	Livingston	JLIVINGS	011.44.1644.429264	2006-04-23	SA_REP	12108	0.2	149	80
178	Kimberely	Grant	KGRANT	011.44.1644.429263	2007-05-24	SA_REP	7000	0.15	149	80
179	Charles	Johnson	CJOHNSON	011.44.1644.429262	2008-01-04	SA_REP	6200	0.11	149	80
180	Winston	Taylor	 WTAYLOR	650.507.9876	2006-01-24	SH_CLERK	3200	0	120	50
181	Jean	Fleaur	JFLEAUR	650.507.9877	2006-02-23	SH_CLERK	3100	0	120	50
182	Martha	Sullivan	MSULLIVA	650.507.9878	2007-06-21	SH_CLERK	2500	0	120	50
183	Girard	Geoni	GGEONI	650.507.9879	2008-02-03	SH_CLERK	2800	0	120	50
184	Nandita	Sarchand	 NSARCHAN	650.509.1876	2004-01-27	SH_CLERK	4200	0	121	50
185	Alexis	Bull	ABULL	650.509.2876	2005-02-20	SH_CLERK	4100	0	121	50
186	Julia	Dellinger	JDELLING	650.509.3876	2006-06-24	SH_CLERK	3400	0	121	50
187	Anthony	Cabrio	ACABRIO	650.509.4876	2007-02-07	SH_CLERK	3000	0	121	50
188	Kelly	Chung	KCHUNG	650.505.1876	2005-06-14	SH_CLERK	3800	0	122	50
189	Jennifer	Dilly	JDILLY	650.505.2876	2005-08-13	SH_CLERK	3600	0	122	50
190	Timothy	Gates	TGATES	650.505.3876	2006-07-11	SH_CLERK	2900	0	122	50
191	Randall	Perkins	RPERKINS	650.505.4876	2007-12-19	SH_CLERK	2500	0	122	50
192	Sarah	Bell	SBELL	650.501.1876	2004-04-02	SH_CLERK	4000	0	123	50
193	Britney	Everett	BEVERETT	650.501.2876	2005-03-03	SH_CLERK	3900	0	123	50
194	Samuel	McCain	SMCCAIN	650.501.3876	2006-07-01	SH_CLERK	3200	0	123	50
195	Vance	Jones	VJONES	650.501.4876	2007-03-17	SH_CLERK	2800	0	123	50
196	Alana	Walsh	AWALSH	650.507.9811	2006-04-24	SH_CLERK	3100	0	124	50
197	Kevin	Feeney	KFEENEY	650.507.9822	2006-05-23	SH_CLERK	3000	0	124	50
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: hr; Owner: admin
--

COPY hr.job (job_id, job_title, min_salary, max_salary, bonus) FROM stdin;
AD_PRES	President	20080	40000	0
AD_VP	Administration Vice President	15000	30000	0
AD_ASST	Administration Assistant	3000	6000	0
FI_MGR	Finance Manager	8200	16000	0
FI_ACCOUNT	Accountant	4200	9000	0
AC_MGR	Accounting Manager	8200	16000	0
AC_ACCOUNT	Public Accountant	4200	9000	0
SA_MAN	Sales Manager	10000	20080	0
SA_REP	Sales Representative	6000	12008	0
PU_MAN	Purchasing Manager	8000	15000	0
PU_CLERK	Purchasing Clerk	2500	5500	0
ST_MAN	Stock Manager	5500	8500	0
ST_CLERK	Stock Clerk	2008	5000	0
SH_CLERK	Shipping Clerk	2500	5500	0
IT_PROG	Programmer	4000	10000	0
MK_MAN	Marketing Manager	9000	15000	0
MK_REP	Marketing Representative	4000	9000	0
HR_REP	Human Resources Representative	4000	9000	0
PR_REP	Public Relations Representative	4500	10500	0
\.


--
-- Data for Name: job_history; Type: TABLE DATA; Schema: hr; Owner: admin
--

COPY hr.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
102	2001-01-13	2006-07-24	IT_PROG	60
101	1997-09-21	2001-10-27	AC_ACCOUNT	110
101	2001-10-10	2005-03-15	AC_MGR	110
201	2004-02-02	2007-12-31	MK_REP	20
114	2006-03-24	2007-12-31	ST_CLERK	50
122	2007-01-01	2007-12-31	ST_CLERK	50
200	1995-09-17	2001-06-17	AD_ASST	90
176	2006-03-24	2006-12-31	SA_REP	80
176	2007-01-01	2007-12-31	SA_MAN	80
200	2002-07-01	2006-12-31	AC_ACCOUNT	90
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: hr; Owner: admin
--

COPY hr.location (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
1000	1297 Via Cola di Rie	00989	Roma	 	IT
1100	93091 Calle della Testa	10934	Venice	 	IT
1200	2017 Shinjuku-ku	1689	Tokyo	Tokyo Prefecture	JP
1300	9450 Kamiya-cho	6823	Hiroshima 	 	JP
1400	2014 Jabberwocky Rd	26192	Southlake	Texas	US
1500	2011 Interiors Blvd	99236	South San Francisco	California	US
1600	2007 Zagora St	50090	South Brunswick	New Jersey	US
1700	2004 Charade Rd	98199	Seattle	Washington	US
1800	147 Spadina Ave	M5V 2L7	Toronto	Ontario	CA
1900	6092 Boxwood St	YSW 9T2	Whitehorse	Yukon	CA
2000	40-5-12 Laogianggen	190518	Beijing	  	CN
2100	1298 Vileparle (E)	490231	Bombay	Maharashtra	IN
2200	12-98 Victoria Street	2901	Sydney	New South Wales	AU
2300	198 Clementi North	540198	Singapore	 	SG
2400	8204 Arthur St	 	London	 	UK
2500	Magdalen Centre. The Oxford Science Park	OX9 9ZB	Oxford	Oxford	UK
2600	9702 Chester Road	09629850293	Stretford	Manchester	UK
2700	Schwanthalerstr. 7031	80925	Munich	Bavaria	DE
2800	Rua Frei Caneca 1360	01307-002	Sao Paulo	Sao Paulo	BR
2900	20 Rue des Corps-Saints	1730	Geneva	Geneve	CH
3000	Murtenstrasse 921	3095	Bern	BE	CH
3100	Pieter Breughelstraat 837	3029SK	Utrecht	Utrecht	NL
3200	Mariano Escobedo 9991	11932	Mexico City	Distrito Federal	MX
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: hr; Owner: admin
--

COPY hr.region (region_id, region_name) FROM stdin;
1	Europe
2	Africa
3	Asia
4	America
5	Australia
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.region (region_id, region_name) FROM stdin;
\.


--
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ventas (idvta, producto, fechavta) FROM stdin;
\.


--
-- Name: ventas_idvta_seq; Type: SEQUENCE SET; Schema: bdd; Owner: admin
--

SELECT pg_catalog.setval('bdd.ventas_idvta_seq', 1, false);


--
-- Name: ventas_v1_idvta_seq; Type: SEQUENCE SET; Schema: bdd; Owner: admin
--

SELECT pg_catalog.setval('bdd.ventas_v1_idvta_seq', 1, false);


--
-- Name: ventas_v2_idvta_seq; Type: SEQUENCE SET; Schema: bdd; Owner: admin
--

SELECT pg_catalog.setval('bdd.ventas_v2_idvta_seq', 1, false);


--
-- Name: ventas_v3_idvta_seq; Type: SEQUENCE SET; Schema: bdd; Owner: admin
--

SELECT pg_catalog.setval('bdd.ventas_v3_idvta_seq', 1, false);


--
-- Name: ventas_idvta_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.ventas_idvta_seq', 1, false);


--
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (idvta);


--
-- Name: ventas_v1 ventas_v1_pkey; Type: CONSTRAINT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas_v1
    ADD CONSTRAINT ventas_v1_pkey PRIMARY KEY (idvta);


--
-- Name: ventas_v2 ventas_v2_pkey; Type: CONSTRAINT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas_v2
    ADD CONSTRAINT ventas_v2_pkey PRIMARY KEY (idvta);


--
-- Name: ventas_v3 ventas_v3_pkey; Type: CONSTRAINT; Schema: bdd; Owner: admin
--

ALTER TABLE ONLY bdd.ventas_v3
    ADD CONSTRAINT ventas_v3_pkey PRIMARY KEY (idvta);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: job_history job_history_pkey; Type: CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.job_history
    ADD CONSTRAINT job_history_pkey PRIMARY KEY (employee_id, start_date);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (job_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);


--
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (idvta);


--
-- Name: country country_region_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.country
    ADD CONSTRAINT country_region_id_fkey FOREIGN KEY (region_id) REFERENCES hr.region(region_id);


--
-- Name: department department_location_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.department
    ADD CONSTRAINT department_location_id_fkey FOREIGN KEY (location_id) REFERENCES hr.location(location_id);


--
-- Name: employee employee_department_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.employee
    ADD CONSTRAINT employee_department_id_fkey FOREIGN KEY (department_id) REFERENCES hr.department(department_id);


--
-- Name: employee employee_job_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.employee
    ADD CONSTRAINT employee_job_id_fkey FOREIGN KEY (job_id) REFERENCES hr.job(job_id);


--
-- Name: job_history job_history_department_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.job_history
    ADD CONSTRAINT job_history_department_id_fkey FOREIGN KEY (department_id) REFERENCES hr.department(department_id);


--
-- Name: job_history job_history_employee_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.job_history
    ADD CONSTRAINT job_history_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id);


--
-- Name: job_history job_history_job_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.job_history
    ADD CONSTRAINT job_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES hr.job(job_id);


--
-- Name: location location_country_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: admin
--

ALTER TABLE ONLY hr.location
    ADD CONSTRAINT location_country_id_fkey FOREIGN KEY (country_id) REFERENCES hr.country(country_id);


--
-- PostgreSQL database dump complete
--

