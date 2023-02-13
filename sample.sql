--
-- PostgreSQL database dump
--


CREATE TABLE countries (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer
);




--
-- Name: departments; Type: TABLE; Schema: public; Owner: lyh
--

CREATE TABLE departments (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);




--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: lyh
--

CREATE SEQUENCE departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lyh
--

ALTER SEQUENCE departments_department_id_seq OWNED BY departments.department_id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: lyh
--

CREATE TABLE employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    hire_date timestamp without time zone NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8,2),
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer,
    CONSTRAINT emp_salary_min CHECK ((salary > (0)::numeric))
);




--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: lyh
--

CREATE SEQUENCE employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lyh
--

ALTER SEQUENCE employees_employee_id_seq OWNED BY employees.employee_id;


--
-- Name: job_history; Type: TABLE; Schema: public; Owner: lyh
--

CREATE TABLE job_history (
    employee_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    job_id character varying(10) NOT NULL,
    department_id integer,
    CONSTRAINT jhist_date_interval CHECK ((end_date > start_date))
);




--
-- Name: jobs; Type: TABLE; Schema: public; Owner: lyh
--

CREATE TABLE jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(6,0),
    max_salary numeric(6,0)
);




--
-- Name: locations; Type: TABLE; Schema: public; Owner: lyh
--

CREATE TABLE locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2)
);




--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: lyh
--

CREATE SEQUENCE locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lyh
--

ALTER SEQUENCE locations_location_id_seq OWNED BY locations.location_id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: lyh
--

CREATE TABLE regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);




--
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: lyh
--

CREATE SEQUENCE regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: regions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lyh
--

ALTER SEQUENCE regions_region_id_seq OWNED BY regions.region_id;


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY departments ALTER COLUMN department_id SET DEFAULT nextval('departments_department_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY employees ALTER COLUMN employee_id SET DEFAULT nextval('employees_employee_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY locations ALTER COLUMN location_id SET DEFAULT nextval('locations_location_id_seq'::regclass);


--
-- Name: regions region_id; Type: DEFAULT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY regions ALTER COLUMN region_id SET DEFAULT nextval('regions_region_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: lyh
--

COPY countries (country_id, country_name, region_id) FROM stdin;
IT	Italy	1
JP	Japan	3
US	United States of America	2
CA	Canada	2
CN	China	3
IN	India	3
AU	Australia	3
ZW	Zimbabwe	4
SG	Singapore	3
UK	United Kingdom	1
FR	France	1
DE	Germany	1
ZM	Zambia	4
EG	Egypt	4
BR	Brazil	2
CH	Switzerland	1
NL	Netherlands	1
MX	Mexico	2
KW	Kuwait	4
IL	Israel	4
DK	Denmark	1
HK	HongKong	3
NG	Nigeria	4
AR	Argentina	2
BE	Belgium	1
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: lyh
--

COPY departments (department_id, department_name, manager_id, location_id) FROM stdin;
10	Administration	200	1700
20	Marketing	201	1800
30	Purchasing	114	1700
40	Human Resources	203	2400
50	Shipping	121	1500
60	IT	103	1400
70	Public Relations	204	2700
80	Sales	145	2500
90	Executive	100	1700
100	Finance	108	1700
110	Accounting	205	1700
120	Treasury	\N	1700
130	Corporate Tax	\N	1700
140	Control And Credit	\N	1700
150	Shareholder Services	\N	1700
160	Benefits	\N	1700
170	Manufacturing	\N	1700
180	Construction	\N	1700
190	Contracting	\N	1700
200	Operations	\N	1700
210	IT Support	\N	1700
220	NOC	\N	1700
230	IT Helpdesk	\N	1700
240	Government Sales	\N	1700
250	Retail Sales	\N	1700
260	Recruiting	\N	1700
270	Payroll	\N	1700
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: lyh
--

COPY employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
100	Steven	King	SKING	515.123.4567	1987-06-17 00:00:00	AD_PRES	24000.00	\N	\N	90
101	Neena	Kochhar	NKOCHHAR	515.123.4568	1989-09-21 00:00:00	AD_VP	17000.00	\N	100	90
102	Lex	De Haan	LDEHAAN	515.123.4569	1993-01-13 00:00:00	AD_VP	17000.00	\N	100	90
103	Alexander	Hunold	AHUNOLD	590.423.4567	1990-01-03 00:00:00	IT_PROG	9000.00	\N	102	60
104	Bruce	Ernst	BERNST	590.423.4568	1991-05-21 00:00:00	IT_PROG	6000.00	\N	103	60
105	David	Austin	DAUSTIN	590.423.4569	1997-06-25 00:00:00	IT_PROG	4800.00	\N	103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	1998-02-05 00:00:00	IT_PROG	4800.00	\N	103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	1999-02-07 00:00:00	IT_PROG	4200.00	\N	103	60
108	Nancy	Greenberg	NGREENBE	515.124.4569	1994-08-17 00:00:00	FI_MGR	12000.00	\N	101	100
109	Daniel	Faviet	DFAVIET	515.124.4169	1994-08-16 00:00:00	FI_ACCOUNT	9000.00	\N	108	100
110	John	Chen	JCHEN	515.124.4269	1997-09-28 00:00:00	FI_ACCOUNT	8200.00	\N	108	100
111	Ismael	Sciarra	ISCIARRA	515.124.4369	1997-09-30 00:00:00	FI_ACCOUNT	7700.00	\N	108	100
112	Jose Manuel	Urman	JMURMAN	515.124.4469	1998-03-07 00:00:00	FI_ACCOUNT	7800.00	\N	108	100
113	Luis	Popp	LPOPP	515.124.4567	1999-12-07 00:00:00	FI_ACCOUNT	6900.00	\N	108	100
114	Den	Raphaely	DRAPHEAL	515.127.4561	1994-12-07 00:00:00	PU_MAN	11000.00	\N	100	30
115	Alexander	Khoo	AKHOO	515.127.4562	1995-05-18 00:00:00	PU_CLERK	3100.00	\N	114	30
116	Shelli	Baida	SBAIDA	515.127.4563	1997-12-24 00:00:00	PU_CLERK	2900.00	\N	114	30
117	Sigal	Tobias	STOBIAS	515.127.4564	1997-07-24 00:00:00	PU_CLERK	2800.00	\N	114	30
118	Guy	Himuro	GHIMURO	515.127.4565	1998-11-15 00:00:00	PU_CLERK	2600.00	\N	114	30
119	Karen	Colmenares	KCOLMENA	515.127.4566	1999-08-10 00:00:00	PU_CLERK	2500.00	\N	114	30
120	Matthew	Weiss	MWEISS	650.123.1234	1996-07-18 00:00:00	ST_MAN	8000.00	\N	100	50
121	Adam	Fripp	AFRIPP	650.123.2234	1997-04-10 00:00:00	ST_MAN	8200.00	\N	100	50
122	Payam	Kaufling	PKAUFLIN	650.123.3234	1995-05-01 00:00:00	ST_MAN	7900.00	\N	100	50
123	Shanta	Vollman	SVOLLMAN	650.123.4234	1997-10-10 00:00:00	ST_MAN	6500.00	\N	100	50
124	Kevin	Mourgos	KMOURGOS	650.123.5234	1999-11-16 00:00:00	ST_MAN	5800.00	\N	100	50
125	Julia	Nayer	JNAYER	650.124.1214	1997-07-16 00:00:00	ST_CLERK	3200.00	\N	120	50
126	Irene	Mikkilineni	IMIKKILI	650.124.1224	1998-09-28 00:00:00	ST_CLERK	2700.00	\N	120	50
127	James	Landry	JLANDRY	650.124.1334	1999-01-14 00:00:00	ST_CLERK	2400.00	\N	120	50
128	Steven	Markle	SMARKLE	650.124.1434	2000-03-08 00:00:00	ST_CLERK	2200.00	\N	120	50
129	Laura	Bissot	LBISSOT	650.124.5234	1997-08-20 00:00:00	ST_CLERK	3300.00	\N	121	50
130	Mozhe	Atkinson	MATKINSO	650.124.6234	1997-10-30 00:00:00	ST_CLERK	2800.00	\N	121	50
131	James	Marlow	JAMRLOW	650.124.7234	1997-02-16 00:00:00	ST_CLERK	2500.00	\N	121	50
132	TJ	Olson	TJOLSON	650.124.8234	1999-04-10 00:00:00	ST_CLERK	2100.00	\N	121	50
133	Jason	Mallin	JMALLIN	650.127.1934	1996-06-14 00:00:00	ST_CLERK	3300.00	\N	122	50
134	Michael	Rogers	MROGERS	650.127.1834	1998-08-26 00:00:00	ST_CLERK	2900.00	\N	122	50
135	Ki	Gee	KGEE	650.127.1734	1999-12-12 00:00:00	ST_CLERK	2400.00	\N	122	50
136	Hazel	Philtanker	HPHILTAN	650.127.1634	2000-02-06 00:00:00	ST_CLERK	2200.00	\N	122	50
137	Renske	Ladwig	RLADWIG	650.121.1234	1995-07-14 00:00:00	ST_CLERK	3600.00	\N	123	50
138	Stephen	Stiles	SSTILES	650.121.2034	1997-10-26 00:00:00	ST_CLERK	3200.00	\N	123	50
139	John	Seo	JSEO	650.121.2019	1998-02-12 00:00:00	ST_CLERK	2700.00	\N	123	50
140	Joshua	Patel	JPATEL	650.121.1834	1998-04-06 00:00:00	ST_CLERK	2500.00	\N	123	50
141	Trenna	Rajs	TRAJS	650.121.8009	1995-10-17 00:00:00	ST_CLERK	3500.00	\N	124	50
142	Curtis	Davies	CDAVIES	650.121.2994	1997-01-29 00:00:00	ST_CLERK	3100.00	\N	124	50
143	Randall	Matos	RMATOS	650.121.2874	1998-03-15 00:00:00	ST_CLERK	2600.00	\N	124	50
144	Peter	Vargas	PVARGAS	650.121.2004	1998-07-09 00:00:00	ST_CLERK	2500.00	\N	124	50
145	John	Russell	JRUSSEL	011.44.1344.429268	1996-10-01 00:00:00	SA_MAN	14000.00	0.40	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	1997-01-05 00:00:00	SA_MAN	13500.00	0.30	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	1997-03-10 00:00:00	SA_MAN	12000.00	0.30	100	80
148	Gerald	Cambrault	GCAMBRAU	011.44.1344.619268	1999-10-15 00:00:00	SA_MAN	11000.00	0.30	100	80
149	Eleni	Zlotkey	EZLOTKEY	011.44.1344.429018	2000-01-29 00:00:00	SA_MAN	10500.00	0.20	100	80
150	Peter	Tucker	PTUCKER	011.44.1344.129268	1997-01-30 00:00:00	SA_REP	10000.00	0.30	145	80
151	David	Bernstein	DBERNSTE	011.44.1344.345268	1997-03-24 00:00:00	SA_REP	9500.00	0.25	145	80
152	Peter	Hall	PHALL	011.44.1344.478968	1997-08-20 00:00:00	SA_REP	9000.00	0.25	145	80
153	Christopher	Olsen	COLSEN	011.44.1344.498718	1998-03-30 00:00:00	SA_REP	8000.00	0.20	145	80
154	Nanette	Cambrault	NCAMBRAU	011.44.1344.987668	1998-12-09 00:00:00	SA_REP	7500.00	0.20	145	80
155	Oliver	Tuvault	OTUVAULT	011.44.1344.486508	1999-11-23 00:00:00	SA_REP	7000.00	0.15	145	80
156	Janette	King	JKING	011.44.1345.429268	1996-01-30 00:00:00	SA_REP	10000.00	0.35	146	80
157	Patrick	Sully	PSULLY	011.44.1345.929268	1996-03-04 00:00:00	SA_REP	9500.00	0.35	146	80
158	Allan	McEwen	AMCEWEN	011.44.1345.829268	1996-08-01 00:00:00	SA_REP	9000.00	0.35	146	80
159	Lindsey	Smith	LSMITH	011.44.1345.729268	1997-03-10 00:00:00	SA_REP	8000.00	0.30	146	80
160	Louise	Doran	LDORAN	011.44.1345.629268	1997-12-15 00:00:00	SA_REP	7500.00	0.30	146	80
161	Sarath	Sewall	SSEWALL	011.44.1345.529268	1998-11-03 00:00:00	SA_REP	7000.00	0.25	146	80
162	Clara	Vishney	CVISHNEY	011.44.1346.129268	1997-11-11 00:00:00	SA_REP	10500.00	0.25	147	80
163	Danielle	Greene	DGREENE	011.44.1346.229268	1999-03-19 00:00:00	SA_REP	9500.00	0.15	147	80
164	Mattea	Marvins	MMARVINS	011.44.1346.329268	2000-01-24 00:00:00	SA_REP	7200.00	0.10	147	80
165	David	Lee	DLEE	011.44.1346.529268	2000-02-23 00:00:00	SA_REP	6800.00	0.10	147	80
166	Sundar	Ande	SANDE	011.44.1346.629268	2000-03-24 00:00:00	SA_REP	6400.00	0.10	147	80
167	Amit	Banda	ABANDA	011.44.1346.729268	2000-04-21 00:00:00	SA_REP	6200.00	0.10	147	80
168	Lisa	Ozer	LOZER	011.44.1343.929268	1997-03-11 00:00:00	SA_REP	11500.00	0.25	148	80
169	Harrison	Bloom	HBLOOM	011.44.1343.829268	1998-03-23 00:00:00	SA_REP	10000.00	0.20	148	80
170	Tayler	Fox	TFOX	011.44.1343.729268	1998-01-24 00:00:00	SA_REP	9600.00	0.20	148	80
171	William	Smith	WSMITH	011.44.1343.629268	1999-02-23 00:00:00	SA_REP	7400.00	0.15	148	80
172	Elizabeth	Bates	EBATES	011.44.1343.529268	1999-03-24 00:00:00	SA_REP	7300.00	0.15	148	80
173	Sundita	Kumar	SKUMAR	011.44.1343.329268	2000-04-21 00:00:00	SA_REP	6100.00	0.10	148	80
174	Ellen	Abel	EABEL	011.44.1644.429267	1996-05-11 00:00:00	SA_REP	11000.00	0.30	149	80
175	Alyssa	Hutton	AHUTTON	011.44.1644.429266	1997-03-19 00:00:00	SA_REP	8800.00	0.25	149	80
176	Jonathon	Taylor	JTAYLOR	011.44.1644.429265	1998-03-24 00:00:00	SA_REP	8600.00	0.20	149	80
177	Jack	Livingston	JLIVINGS	011.44.1644.429264	1998-04-23 00:00:00	SA_REP	8400.00	0.20	149	80
178	Kimberely	Grant	KGRANT	011.44.1644.429263	1999-05-24 00:00:00	SA_REP	7000.00	0.15	149	\N
179	Charles	Johnson	CJOHNSON	011.44.1644.429262	2000-01-04 00:00:00	SA_REP	6200.00	0.10	149	80
180	Winston	Taylor	WTAYLOR	650.507.9876	1998-01-24 00:00:00	SH_CLERK	3200.00	\N	120	50
181	Jean	Fleaur	JFLEAUR	650.507.9877	1998-02-23 00:00:00	SH_CLERK	3100.00	\N	120	50
182	Martha	Sullivan	MSULLIVA	650.507.9878	1999-06-21 00:00:00	SH_CLERK	2500.00	\N	120	50
183	Girard	Geoni	GGEONI	650.507.9879	2000-02-03 00:00:00	SH_CLERK	2800.00	\N	120	50
184	Nandita	Sarchand	NSARCHAN	650.509.1876	1996-01-27 00:00:00	SH_CLERK	4200.00	\N	121	50
185	Alexis	Bull	ABULL	650.509.2876	1997-02-20 00:00:00	SH_CLERK	4100.00	\N	121	50
186	Julia	Dellinger	JDELLING	650.509.3876	1998-06-24 00:00:00	SH_CLERK	3400.00	\N	121	50
187	Anthony	Cabrio	ACABRIO	650.509.4876	1999-02-07 00:00:00	SH_CLERK	3000.00	\N	121	50
188	Kelly	Chung	KCHUNG	650.505.1876	1997-06-14 00:00:00	SH_CLERK	3800.00	\N	122	50
189	Jennifer	Dilly	JDILLY	650.505.2876	1997-08-13 00:00:00	SH_CLERK	3600.00	\N	122	50
190	Timothy	Gates	TGATES	650.505.3876	1998-07-11 00:00:00	SH_CLERK	2900.00	\N	122	50
191	Randall	Perkins	RPERKINS	650.505.4876	1999-12-19 00:00:00	SH_CLERK	2500.00	\N	122	50
192	Sarah	Bell	SBELL	650.501.1876	1996-02-04 00:00:00	SH_CLERK	4000.00	\N	123	50
193	Britney	Everett	BEVERETT	650.501.2876	1997-03-03 00:00:00	SH_CLERK	3900.00	\N	123	50
194	Samuel	McCain	SMCCAIN	650.501.3876	1998-07-01 00:00:00	SH_CLERK	3200.00	\N	123	50
195	Vance	Jones	VJONES	650.501.4876	1999-03-17 00:00:00	SH_CLERK	2800.00	\N	123	50
196	Alana	Walsh	AWALSH	650.507.9811	1998-04-24 00:00:00	SH_CLERK	3100.00	\N	124	50
197	Kevin	Feeney	KFEENEY	650.507.9822	1998-05-23 00:00:00	SH_CLERK	3000.00	\N	124	50
198	Donald	OConnell	DOCONNEL	650.507.9833	1999-06-21 00:00:00	SH_CLERK	2600.00	\N	124	50
199	Douglas	Grant	DGRANT	650.507.9844	2000-01-13 00:00:00	SH_CLERK	2600.00	\N	124	50
200	Jennifer	Whalen	JWHALEN	515.123.4444	1987-09-17 00:00:00	AD_ASST	4400.00	\N	101	10
201	Michael	Hartstein	MHARTSTE	515.123.5555	1996-02-17 00:00:00	MK_MAN	13000.00	\N	100	20
202	Pat	Fay	PFAY	603.123.6666	1997-08-17 00:00:00	MK_REP	6000.00	\N	201	20
203	Susan	Mavris	SMAVRIS	515.123.7777	1994-06-07 00:00:00	HR_REP	6500.00	\N	101	40
204	Hermann	Baer	HBAER	515.123.8888	1994-06-07 00:00:00	PR_REP	10000.00	\N	101	70
205	Shelley	Higgins	SHIGGINS	515.123.8080	1994-06-07 00:00:00	AC_MGR	12000.00	\N	101	110
206	William	Gietz	WGIETZ	515.123.8181	1994-06-07 00:00:00	AC_ACCOUNT	8300.00	\N	205	110
\.


--
-- Data for Name: job_history; Type: TABLE DATA; Schema: public; Owner: lyh
--

COPY job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
102	1993-01-13 00:00:00	1998-07-24 00:00:00	IT_PROG	60
101	1989-09-21 00:00:00	1993-10-27 00:00:00	AC_ACCOUNT	110
101	1993-10-28 00:00:00	1997-03-15 00:00:00	AC_MGR	110
201	1996-02-17 00:00:00	1999-12-19 00:00:00	MK_REP	20
114	1998-03-24 00:00:00	1999-12-31 00:00:00	ST_CLERK	50
122	1999-01-01 00:00:00	1999-12-31 00:00:00	ST_CLERK	50
200	1987-09-17 00:00:00	1993-06-17 00:00:00	AD_ASST	90
176	1998-03-24 00:00:00	1998-12-31 00:00:00	SA_REP	80
176	1999-01-01 00:00:00	1999-12-31 00:00:00	SA_MAN	80
200	1994-07-01 00:00:00	1998-12-31 00:00:00	AC_ACCOUNT	90
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: lyh
--

COPY jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
AD_PRES	President	20000	40000
AD_VP	Administration Vice President	15000	30000
AD_ASST	Administration Assistant	3000	6000
FI_MGR	Finance Manager	8200	16000
FI_ACCOUNT	Accountant	4200	9000
AC_MGR	Accounting Manager	8200	16000
AC_ACCOUNT	Public Accountant	4200	9000
SA_MAN	Sales Manager	10000	20000
SA_REP	Sales Representative	6000	12000
PU_MAN	Purchasing Manager	8000	15000
PU_CLERK	Purchasing Clerk	2500	5500
ST_MAN	Stock Manager	5500	8500
ST_CLERK	Stock Clerk	2000	5000
SH_CLERK	Shipping Clerk	2500	5500
IT_PROG	Programmer	4000	10000
MK_MAN	Marketing Manager	9000	15000
MK_REP	Marketing Representative	4000	9000
HR_REP	Human Resources Representative	4000	9000
PR_REP	Public Relations Representative	4500	10500
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: lyh
--

COPY locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
1000	1297 Via Cola di Rie	00989	Roma	\N	IT
1100	93091 Calle della Testa	10934	Venice	\N	IT
1200	2017 Shinjuku-ku	1689	Tokyo	Tokyo Prefecture	JP
1300	9450 Kamiya-cho	6823	Hiroshima	\N	JP
1400	2014 Jabberwocky Rd	26192	Southlake	Texas	US
1500	2011 Interiors Blvd	99236	South San Francisco	California	US
1600	2007 Zagora St	50090	South Brunswick	New Jersey	US
1700	2004 Charade Rd	98199	Seattle	Washington	US
1800	147 Spadina Ave	M5V 2L7	Toronto	Ontario	CA
1900	6092 Boxwood St	YSW 9T2	Whitehorse	Yukon	CA
2000	40-5-12 Laogianggen	190518	Beijing	\N	CN
2100	1298 Vileparle (E)	490231	Bombay	Maharashtra	IN
2200	12-98 Victoria Street	2901	Sydney	New South Wales	AU
2300	198 Clementi North	540198	Singapore	\N	SG
2400	8204 Arthur St	\N	London	\N	UK
2500	Magdalen Centre, The Oxford Science Park	OX9 9ZB	Oxford	Oxford	UK
2600	9702 Chester Road	09629850293	Stretford	Manchester	UK
2700	Schwanthalerstr. 7031	80925	Munich	Bavaria	DE
2800	Rua Frei Caneca 1360 	01307-002	Sao Paulo	Sao Paulo	BR
2900	20 Rue des Corps-Saints	1730	Geneva	Geneve	CH
3000	Murtenstrasse 921	3095	Bern	BE	CH
3100	Pieter Breughelstraat 837	3029SK	Utrecht	Utrecht	NL
3200	Mariano Escobedo 9991	11932	Mexico City	Distrito Federal,	MX
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: lyh
--

COPY regions (region_id, region_name) FROM stdin;
1	Europe
2	Americas
3	Asia
4	Middle East and Africa
\.


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lyh
--

SELECT pg_catalog.setval('departments_department_id_seq', 1, false);


--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lyh
--

SELECT pg_catalog.setval('employees_employee_id_seq', 1, false);


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lyh
--

SELECT pg_catalog.setval('locations_location_id_seq', 1, false);


--
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lyh
--

SELECT pg_catalog.setval('regions_region_id_seq', 1, false);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: employees emp_email_uk; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT emp_email_uk UNIQUE (email);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: job_history job_history_pkey; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY job_history
    ADD CONSTRAINT job_history_pkey PRIMARY KEY (employee_id, start_date);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- Name: dept_location_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX dept_location_ix ON departments USING btree (location_id);


--
-- Name: emp_department_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX emp_department_ix ON employees USING btree (department_id);


--
-- Name: emp_job_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX emp_job_ix ON employees USING btree (job_id);


--
-- Name: emp_manager_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX emp_manager_ix ON employees USING btree (manager_id);


--
-- Name: emp_name_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX emp_name_ix ON employees USING btree (last_name, first_name);


--
-- Name: jhist_department_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX jhist_department_ix ON job_history USING btree (department_id);


--
-- Name: jhist_employee_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX jhist_employee_ix ON job_history USING btree (employee_id);


--
-- Name: jhist_job_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX jhist_job_ix ON job_history USING btree (job_id);


--
-- Name: loc_city_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX loc_city_ix ON locations USING btree (city);


--
-- Name: loc_country_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX loc_country_ix ON locations USING btree (country_id);


--
-- Name: loc_state_province_ix; Type: INDEX; Schema: public; Owner: lyh
--

CREATE INDEX loc_state_province_ix ON locations USING btree (state_province);


--
-- Name: countries countries_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES regions(region_id);


--
-- Name: departments departments_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_location_id_fkey FOREIGN KEY (location_id) REFERENCES locations(location_id);


--
-- Name: departments dept_mgr_fk; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees(employee_id);


--
-- Name: employees employees_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES departments(department_id);


--
-- Name: employees employees_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_job_id_fkey FOREIGN KEY (job_id) REFERENCES jobs(job_id);


--
-- Name: employees employees_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES employees(employee_id);


--
-- Name: job_history job_history_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY job_history
    ADD CONSTRAINT job_history_department_id_fkey FOREIGN KEY (department_id) REFERENCES departments(department_id);


--
-- Name: job_history job_history_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY job_history
    ADD CONSTRAINT job_history_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employees(employee_id);


--
-- Name: job_history job_history_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY job_history
    ADD CONSTRAINT job_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES jobs(job_id);


--
-- Name: locations locations_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lyh
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(country_id);


--
-- PostgreSQL database dump complete
--
