--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = auth, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: organizations; Type: TABLE; Schema: auth; Owner: postgres; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name text
);


ALTER TABLE organizations OWNER TO postgres;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organizations_id_seq OWNER TO postgres;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: roles; Type: TABLE; Schema: auth; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name text
);


ALTER TABLE roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: users; Type: TABLE; Schema: auth; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email text,
    password text,
    enabled boolean DEFAULT true,
    session text,
    token text,
    organization_id integer
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: auth; Owner: postgres; Tablespace: 
--

CREATE TABLE users_roles (
    role_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE users_roles OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name text NOT NULL,
    seo_title text,
    seo_desc text,
    seo_keys text,
    seo_translit text,
    parent_id integer
);


ALTER TABLE categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name text,
    lat numeric,
    lon numeric,
    seo_title text,
    seo_desc text,
    seo_keys text,
    seo_translit text
);


ALTER TABLE cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: days_week; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE days_week (
    id integer NOT NULL,
    name text
);


ALTER TABLE days_week OWNER TO postgres;

--
-- Name: days_week_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE days_week_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE days_week_id_seq OWNER TO postgres;

--
-- Name: days_week_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE days_week_id_seq OWNED BY days_week.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE files (
    id integer NOT NULL,
    name text,
    size integer,
    active boolean,
    seo_alt text,
    seo_title text,
    organization_id integer NOT NULL,
    old_id numeric
);


ALTER TABLE files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE files_id_seq OWNED BY files.id;


--
-- Name: shedule; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shedule (
    shop_id integer NOT NULL,
    day_id integer NOT NULL,
    work_begin numeric,
    work_end numeric,
    type_work numeric
);


ALTER TABLE shedule OWNER TO postgres;

--
-- Name: shops; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shops (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL,
    site text,
    inst text,
    vk text,
    city_id integer NOT NULL,
    organization_id integer NOT NULL,
    user_id integer NOT NULL,
    short_desc text,
    description text,
    parking boolean DEFAULT false,
    alcohol boolean DEFAULT false,
    food boolean DEFAULT false,
    veranda boolean DEFAULT false,
    console boolean DEFAULT false,
    board boolean DEFAULT false,
    lat numeric,
    lon numeric,
    enabled boolean DEFAULT true,
    active boolean DEFAULT false,
    seo_title text,
    seo_desc text,
    seo_keys text,
    seo_translit text,
    file_id integer,
    rating numeric,
    old_id numeric,
    two_gis boolean DEFAULT false
);


ALTER TABLE shops OWNER TO postgres;

--
-- Name: shops_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shops_categories (
    shop_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE shops_categories OWNER TO postgres;

--
-- Name: shops_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shops_files (
    shop_id integer NOT NULL,
    file_id integer NOT NULL
);


ALTER TABLE shops_files OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shops_id_seq OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shops_id_seq OWNED BY shops.id;


SET search_path = auth, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY days_week ALTER COLUMN id SET DEFAULT nextval('days_week_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


SET search_path = auth, pg_catalog;

--
-- Data for Name: organizations; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY organizations (id, name) FROM stdin;
1	admin
\.


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('organizations_id_seq', 1, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY roles (id, name) FROM stdin;
1	admin
2	users
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY users (id, email, password, enabled, session, token, organization_id) FROM stdin;
1	admin@admin.com	Njk2ZDI5ZTA5NDBhNDk1Nzc0OGZlM2ZjOWVmZDIyYTM=	t	\N	ODdiZTMyZjUxODAyZjVmYjA5M2Q3ZWU5ZjYwMmU5ZGE	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY users_roles (role_id, user_id) FROM stdin;
1	1
\.


SET search_path = public, pg_catalog;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, name, seo_title, seo_desc, seo_keys, seo_translit, parent_id) FROM stdin;
1	Заведения	\N	\N	\N	\N	0
2	Товары/Услуги	\N	\N	\N	\N	0
3	Кальянная	\N	\N	\N	\N	1
4	Магазин	\N	\N	\N	\N	1
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 4, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cities (id, name, lat, lon, seo_title, seo_desc, seo_keys, seo_translit) FROM stdin;
551487	Казань	55.7887	49.1221	Каталог кальянных города Казань	\N	\N	Kazan
499099	Самара	53.2001	50.15	Каталог кальянных города  Самара	\N	\N	Samara
498817	Санкт-Петербург	59.9386	30.3141	Каталог кальянных города Санкт-Петербург	\N	\N	Saint-Petersburg
479561	Уфа	54.7431	55.9678	Каталог кальянных города Уфа	\N	\N	Ufa
479123	Ульяновск	54.3282	48.3866	Каталого кальянных города Ульяновск	\N	\N	Ulyanovsk
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 5, true);


--
-- Data for Name: days_week; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY days_week (id, name) FROM stdin;
1	Понедельник
2	Вторник
3	Среда
4	Четверг
5	Пятница
6	Суббота
7	Воскресенье
\.


--
-- Name: days_week_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('days_week_id_seq', 7, true);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY files (id, name, size, active, seo_alt, seo_title, organization_id, old_id) FROM stdin;
1	1442749859_TMYk7cId3x8Z3MG.png	164208	t	\N	\N	1	410
2	1442749859_OM8sdiE0Kin4xCO.jpg	14935	t	\N	\N	1	411
3	1442749859_mpfz1agoCeVW750.jpg	12786	t	\N	\N	1	412
4	1442749859_Hl2ZP0fhvK5OpDv.jpg	9911	t	\N	\N	1	413
5	1442749859_mxVwrK6wM8cTYeI.jpg	13425	t	\N	\N	1	414
6	1442749859_0Pyl8QWMQanHseG.jpg	15253	t	\N	\N	1	415
7	1442749859_d6Z8YoCtYc3DboE.jpg	10041	t	\N	\N	1	416
8	1442749859_nyNpuBPeePULb6q.jpg	14639	t	\N	\N	1	417
9	1442749859_Hj5xrySybwFvLBO.jpg	10791	t	\N	\N	1	418
10	1442749859_NSN5H6TNWMNoxMV.jpg	13450	t	\N	\N	1	419
11	1442749859_hylyKfaIQrqKcE4.jpg	20236	t	\N	\N	1	420
12	1442751338_pQBoK2OxEP9sdLc.jpg	97732	t	\N	\N	1	421
13	1442751338_5eS9gjM8YKpwzW2.jpg	235629	t	\N	\N	1	422
14	1442751338_mPM1DM62MS40uA0.jpg	158396	t	\N	\N	1	423
15	1442751338_x76ZeETZWvP8gHT.jpg	155764	t	\N	\N	1	424
16	1442751338_W0XbcP7hGYIaBgF.jpg	60038	t	\N	\N	1	425
17	1442751338_KtZAIj5zW4V5yxL.jpg	134870	t	\N	\N	1	426
18	1442751338_BnoGBUT34i7kBu3.jpg	148930	t	\N	\N	1	427
19	1442751338_kcrFu8ePdKmBYjh.jpg	113939	t	\N	\N	1	428
20	1442751338_YjZaggyuQBIHbcM.jpg	101846	t	\N	\N	1	429
21	1442751338_fqL6PE8heDPizwM.jpg	118777	t	\N	\N	1	430
22	1442751338_4sBVCHSoD5I6VOQ.jpg	135047	t	\N	\N	1	431
23	1442773903_exZ262Dy9MHNdfG.jpg	72508	t	\N	\N	1	432
24	1442773903_p8TfjIW93N6Q0Dx.jpg	48555	t	\N	\N	1	433
25	1442773903_T717eqDkywvWpBG.jpg	28918	t	\N	\N	1	434
26	1442773903_LePZFglf8d22ltU.jpg	38954	t	\N	\N	1	435
27	1442773903_IXDqZHkQ9EMbub3.jpg	37623	t	\N	\N	1	436
28	1442773903_7SeNzdvJsCrTX2Q.jpg	50834	t	\N	\N	1	437
29	1442773903_ts4WfpnPmkj0RaX.jpg	57912	t	\N	\N	1	438
30	1442773903_mf9LAFkOoD0Jtj0.jpg	34479	t	\N	\N	1	439
31	1442773903_oFKD4aVWDVfB892.jpg	49040	t	\N	\N	1	440
32	1442773903_e3IVIEDLb9lt9nJ.jpg	11568	t	\N	\N	1	441
33	1442773903_AOL4ZYgIw6EH3ex.jpg	38050	t	\N	\N	1	442
34	1442821382_Dkt3ojJNwAVekSQ.jpg	94905	t	\N	\N	1	443
35	1442821382_hRBfySc3boZXYCH.jpg	277306	t	\N	\N	1	444
36	1442821382_dwbkNDiFKqY4RkB.jpg	238761	t	\N	\N	1	445
37	1442821382_HGSLbtJ3qixpztA.jpg	182161	t	\N	\N	1	446
38	1442821382_6PgcDncbJ7zalWK.jpg	364890	t	\N	\N	1	447
39	1442821382_5p3NFWsvXoTMrww.jpg	333673	t	\N	\N	1	448
40	1442821382_m04JExgivYpMuKK.jpg	302957	t	\N	\N	1	449
41	1442821382_uj96KOsgX03rZ8K.jpg	283433	t	\N	\N	1	450
42	1442821382_inNVTO93xgBlh44.jpg	245092	t	\N	\N	1	451
43	1442821382_JSkbO3IUFrrjxSo.jpg	61322	t	\N	\N	1	452
44	1442821382_NJ89XzXclBm3v2g.jpg	59857	t	\N	\N	1	453
45	1442824215_jIPgdkF4DRr7N91.jpg	67585	t	\N	\N	1	454
46	1442824215_wrKvhClSrUEkxz1.jpg	52985	t	\N	\N	1	455
47	1442824215_xpP9uevId8IOgVK.jpg	69747	t	\N	\N	1	456
48	1442824215_UXnxT2DtPL9xJq4.jpg	94624	t	\N	\N	1	457
49	1442824215_70b7u3t2TLDUdhh.jpg	60583	t	\N	\N	1	458
50	1442824215_OQIUTqk15AP86V2.jpg	66193	t	\N	\N	1	459
51	1442824215_aiqUwUxZRtHNequ.jpg	180026	t	\N	\N	1	460
52	1442824215_Ce9qblyFMyyARBG.jpg	41724	t	\N	\N	1	461
53	1442824215_uYX7J2k1g7FS3tH.jpg	273881	t	\N	\N	1	462
54	1442824215_jgdk0MjmIc3LR4O.jpg	144915	t	\N	\N	1	463
55	1442824215_zGF2Jo4iStuAAXg.jpg	90907	t	\N	\N	1	464
56	1442906974_AuI1Jpl8KD4IQrw.jpg	42086	t	\N	\N	1	465
57	1442906974_cdydgkc8Ah8iDCW.jpg	126422	t	\N	\N	1	466
58	1442906974_krOSQYDLCSgOBUT.jpg	150286	t	\N	\N	1	467
59	1442906974_8HSBLb0xPd51r6w.jpg	221896	t	\N	\N	1	468
60	1442906974_uaOqoQF4imLN0p6.jpg	149935	t	\N	\N	1	469
61	1442906974_5h5zvvBOwProsI4.jpg	237432	t	\N	\N	1	470
62	1442906974_dKo1tDTvcEwneQB.jpg	111668	t	\N	\N	1	471
63	1442906974_GhWlqpbabZ36RKe.jpg	142532	t	\N	\N	1	472
64	1442906974_V2FTlocLekYsJwd.jpg	217146	t	\N	\N	1	473
65	1442906974_IboRoLB0RSL1SiC.jpg	35671	t	\N	\N	1	474
66	1442906974_EMlFz4wNpx6dgIn.jpg	130507	t	\N	\N	1	475
67	1442940327_frGQjwhXudNmtsd.jpg	79083	t	\N	\N	1	476
68	1442940328_MHDdeTUXwT3QTnW.jpg	100533	t	\N	\N	1	477
69	1442940328_tggBXu43VLiuyBZ.jpg	129937	t	\N	\N	1	478
70	1442940328_cDJjLZ0byWlpvqE.jpg	116014	t	\N	\N	1	479
71	1442940328_jitffsmJHpb7NFk.jpg	105630	t	\N	\N	1	480
72	1442940328_kauCZwXz9mh75Pl.jpg	131009	t	\N	\N	1	481
73	1442940328_5rwSkxRFDV7tkvZ.jpg	132050	t	\N	\N	1	482
74	1442940328_eaphWomb3P2ofr3.jpg	194674	t	\N	\N	1	483
75	1442940328_Wg9rfjrfQuq8jFS.jpg	182366	t	\N	\N	1	484
76	1442940328_V6wEyEd4toXrEal.jpg	196515	t	\N	\N	1	485
77	1442940328_WIPWeYa9ZmJvJHD.jpg	174046	t	\N	\N	1	486
78	1442993942_Q14zd9q52ZEDkq1.jpg	129471	t	\N	\N	1	487
79	1442993942_nRNtz7sov5tBS2y.jpg	114037	t	\N	\N	1	488
80	1442993942_wnJUephixbcWkGc.jpg	109910	t	\N	\N	1	489
81	1442993942_gs1Zc3mAx3Md335.jpg	147144	t	\N	\N	1	490
82	1442993942_TJYq0Kewb2KKtlZ.jpg	145520	t	\N	\N	1	491
83	1442993942_GtOSnQtlAl6un2W.jpg	215438	t	\N	\N	1	492
84	1442993942_d4fbufFsmc563r0.jpg	195613	t	\N	\N	1	493
85	1442993942_34JH1pjdg9XLSRh.jpg	163219	t	\N	\N	1	494
86	1442996050_6NT3iA40jCsntbP.jpg	8900	t	\N	\N	1	495
87	1442996050_mkJTGv0Z5CMkiyI.jpg	125562	t	\N	\N	1	496
88	1442996050_ONKnfiHoAz1bA5U.jpg	163281	t	\N	\N	1	497
89	1442996050_SNkbvEAcCP3Pq3X.jpg	101833	t	\N	\N	1	498
90	1442996050_aEpsKlLL7uEINZ9.jpg	62183	t	\N	\N	1	499
91	1442996050_3A6yLSUuH6nODM4.jpg	125796	t	\N	\N	1	500
92	1442996050_x3qoyOaGQN1SZYz.jpg	55430	t	\N	\N	1	501
93	1442996050_sVNFHOtI55s7MR0.jpg	66041	t	\N	\N	1	502
94	1442996050_IUC4lqP1BtQ0TED.jpg	112518	t	\N	\N	1	503
95	1442996050_R32CaPfJ01w7cDo.jpg	107764	t	\N	\N	1	504
96	1443003563_vqiDfGKmBiwExWL.jpg	48208	t	\N	\N	1	505
97	1443003563_AWMfNZNujxHibBO.jpg	99136	t	\N	\N	1	506
98	1443003563_IpJGKv358ZX4ib0.jpg	120603	t	\N	\N	1	507
99	1443003563_xAEOxjCMvAxKAnB.jpg	116360	t	\N	\N	1	508
100	1443003563_6AZFyc3tdE5OVVi.jpg	102220	t	\N	\N	1	509
101	1443003563_SiJzRBExARBJ8SZ.jpg	149958	t	\N	\N	1	510
102	1443003563_ZweX3gQ7iIS9HI6.jpg	139811	t	\N	\N	1	511
103	1443003563_UksXs0PldkAhRQc.jpg	155055	t	\N	\N	1	512
104	1443003563_hKxpLaGRSzNVvtY.jpg	132647	t	\N	\N	1	513
105	1443003563_eScarjc7vpb0FBe.jpg	98609	t	\N	\N	1	514
106	1443003563_iYmGlNncEo4VMaP.jpg	97345	t	\N	\N	1	515
107	1443003632_QixsL5q8icv47JY.jpg	48208	t	\N	\N	1	516
108	1443003632_XGlBAhm2isGLlpO.jpg	99136	t	\N	\N	1	517
109	1443003632_6ldVd1b4GLObf92.jpg	120603	t	\N	\N	1	518
110	1443003632_7DpBhRM0TFsTxcb.jpg	116360	t	\N	\N	1	519
111	1443003632_1Kv0aFIBTIs5l5g.jpg	102220	t	\N	\N	1	520
112	1443003632_ujmBiEMKtHtWzlh.jpg	149958	t	\N	\N	1	521
113	1443003632_zsIfoYEL5qBU6I8.jpg	139811	t	\N	\N	1	522
114	1443003632_XPmiYdzxrYTc4Km.jpg	155055	t	\N	\N	1	523
115	1443003632_mOfPQXPaRE2iHEq.jpg	132647	t	\N	\N	1	524
116	1443003632_ynbYoJ4tUld1hc5.jpg	98609	t	\N	\N	1	525
117	1443003632_LZnQPtSPGWJN2Z9.jpg	97345	t	\N	\N	1	526
118	1443091462_55m8SNSZlWZfURh.jpg	45861	t	\N	\N	1	527
119	1443091462_4nBCuXVzQqbcDxn.jpg	62466	t	\N	\N	1	528
120	1443091462_irY3akbr0Oyc8mH.jpg	117031	t	\N	\N	1	529
121	1443091462_GDLatCQPHDx3z34.jpg	65556	t	\N	\N	1	530
122	1443091462_A6u5dwCLsxBev5l.jpg	102078	t	\N	\N	1	531
123	1443091462_M7VwzQABba4LOuZ.jpg	113572	t	\N	\N	1	532
124	1443091462_3iUOtUUCCYdbH9P.jpg	126372	t	\N	\N	1	533
125	1443091462_IAihUtzLUsAnO5D.jpg	148394	t	\N	\N	1	534
126	1443091462_mwlCZgqXmR4VszN.jpg	134826	t	\N	\N	1	535
127	1443091462_Ye4GMldmCPq8l1k.jpg	79984	t	\N	\N	1	536
128	1443091462_XKyUQOxl9RlkDO5.jpg	113470	t	\N	\N	1	537
129	1443092160_7eka8mRxgHzFK7i.jpg	95549	t	\N	\N	1	538
130	1443092160_2jQ5Ky5dqD7lF6o.jpg	50250	t	\N	\N	1	539
131	1443092160_RzapdJ16g5YCkj3.jpg	69396	t	\N	\N	1	540
132	1443092160_Dx267a4SO8U7snw.jpg	58106	t	\N	\N	1	541
133	1443092160_aPd8X8jNDGdq6D8.jpg	151528	t	\N	\N	1	542
134	1443092160_nrTHh2NbugdFLVC.jpg	273721	t	\N	\N	1	543
135	1443092160_j5FbeaNv2IB4zPv.jpg	133041	t	\N	\N	1	544
136	1443092160_NQH2eooT19lL77l.jpg	134941	t	\N	\N	1	545
137	1443092160_7l9RxXPwslh2p3T.jpg	102730	t	\N	\N	1	546
138	1443092160_iUZxpgnZOVLwMVK.jpg	344537	t	\N	\N	1	547
139	1443092160_wdzDSWP03Q8eMmc.jpg	168574	t	\N	\N	1	548
140	1443119554_3eaAX381zSduQQI.jpg	55402	t	\N	\N	1	549
141	1443119554_XHrUtxT9gOJK8oL.jpg	131847	t	\N	\N	1	550
142	1443119554_81wQMpDpgKymQ9E.jpg	105660	t	\N	\N	1	551
143	1443119554_zIUC6jiZEdMw9Io.jpg	88548	t	\N	\N	1	552
144	1443119554_pohNtMyWoujNjHa.jpg	144803	t	\N	\N	1	553
145	1443119554_josMzSJZLi59ITH.jpg	154006	t	\N	\N	1	554
146	1443119554_hzWxnPdvf1e6z7N.jpg	221190	t	\N	\N	1	555
147	1443119554_yVliYCFRD7Ypezr.jpg	272071	t	\N	\N	1	556
148	1443119554_KYN2ozy3osMd5CA.jpg	146875	t	\N	\N	1	557
149	1443119554_LalKyz0BzDo73cJ.jpg	159239	t	\N	\N	1	558
150	1443119554_xoSxQdRsYS4sHCm.jpg	63451	t	\N	\N	1	559
151	1443120300_e6ujdjvSIb5MfOf.jpg	55402	t	\N	\N	1	560
152	1443120300_pDhZNJgeMCneaVQ.jpg	191423	t	\N	\N	1	561
153	1443120300_NfNnBALu1BQnqFd.jpg	125062	t	\N	\N	1	562
154	1443120300_Y9xPd59eH6AZvdR.jpg	124393	t	\N	\N	1	563
155	1443120300_aYyw4UNQUX2EuGo.jpg	213880	t	\N	\N	1	564
156	1443120300_5sJbbb5blNLH5uK.jpg	141056	t	\N	\N	1	565
157	1443120300_T9rOjVlrtPZ29W7.jpg	205034	t	\N	\N	1	566
158	1443120300_ssKLC8xW0weLJeu.jpg	182967	t	\N	\N	1	567
159	1443120300_AJ889yPaPSpoN7y.jpg	178084	t	\N	\N	1	568
160	1443120300_QdNiHu2TBrSQ5Ox.jpg	150335	t	\N	\N	1	569
161	1443120300_deRbjkC4lCi1Kb8.jpg	255028	t	\N	\N	1	570
162	smoke-bar-ugli.jpg	14894	t	\N	\N	1	578
163	smoke-bar-ugli-1.jpg	138545	t	\N	\N	1	579
164	smoke-bar-ugli-2.jpg	118060	t	\N	\N	1	580
165	smoke-bar-ugli-3.jpg	120674	t	\N	\N	1	581
166	smoke-bar-ugli-4.jpg	257553	t	\N	\N	1	582
167	smoke-bar-ugli-5.jpg	95942	t	\N	\N	1	583
168	smoke-bar-ugli-6.jpg	103141	t	\N	\N	1	584
169	smoke-bar-ugli-7.jpg	86053	t	\N	\N	1	585
170	smoke-bar-ugli-8.jpg	55379	t	\N	\N	1	586
171	smoke-bar-ugli-9.jpg	121891	t	\N	\N	1	587
172	smoke-bar-ugli-10.jpg	94748	t	\N	\N	1	588
173	myatalounge.jpg	51863	t	\N	\N	1	589
174	myatalounge-1.jpg	149109	t	\N	\N	1	590
175	myatalounge-2.jpg	203199	t	\N	\N	1	591
176	myatalounge-3.jpg	164027	t	\N	\N	1	592
177	myatalounge-4.jpg	266002	t	\N	\N	1	593
178	myatalounge-5.jpg	183444	t	\N	\N	1	594
179	myatalounge-6.jpg	132187	t	\N	\N	1	595
180	myatalounge-7.jpg	191628	t	\N	\N	1	596
181	myatalounge-8.jpg	182262	t	\N	\N	1	597
182	myatalounge-9.jpg	199386	t	\N	\N	1	598
183	myatalounge-10.jpg	186001	t	\N	\N	1	599
184	meduza.jpg	296999	t	\N	\N	1	600
185	meduza-1.jpg	193038	t	\N	\N	1	601
186	meduza-2.jpg	197074	t	\N	\N	1	602
187	meduza-3.jpg	146179	t	\N	\N	1	603
188	meduza-4.jpg	265273	t	\N	\N	1	604
189	meduza-5.jpg	141123	t	\N	\N	1	605
190	meduza-6.jpg	157658	t	\N	\N	1	606
191	meduza-7.jpg	227405	t	\N	\N	1	607
192	meduza-8.jpg	121980	t	\N	\N	1	608
193	meduza-9.jpg	137202	t	\N	\N	1	609
194	meduza-10.jpg	105860	t	\N	\N	1	610
195	nashe-mesto.jpg	66319	t	\N	\N	1	611
196	nashe-mesto-1.jpg	168081	t	\N	\N	1	612
197	nashe-mesto-2.jpg	196483	t	\N	\N	1	613
198	nashe-mesto-3.jpg	201948	t	\N	\N	1	614
199	nashe-mesto-4.jpg	167940	t	\N	\N	1	615
200	nashe-mesto-5.jpg	191572	t	\N	\N	1	616
201	nashe-mesto-6.jpg	226264	t	\N	\N	1	617
202	nashe-mesto-7.jpg	150716	t	\N	\N	1	618
203	dymroom.jpg	103938	t	\N	\N	1	619
204	11371120_440449186148876_777033333_n.jpg	42668	t	\N	\N	1	620
205	11906305_1228189953880015_496413032_n.jpg	56021	t	\N	\N	1	621
206	11930955_524273281075436_322041197_n.jpg	44781	t	\N	\N	1	622
207	11939614_1670821713162166_194633684_n.jpg	25068	t	\N	\N	1	623
208	11939614_1670821713162166_194633684_n(1).jpg	11542	t	\N	\N	1	624
209	11950571_161501507536271_1975171281_n.jpg	18974	t	\N	\N	1	625
210	11950684_980309975345285_32747781_n.jpg	82212	t	\N	\N	1	626
211	12106281_857916307663073_1149503466_n.jpg	33462	t	\N	\N	1	627
212	12107658_1522016858108619_927448678_n.jpg	75149	t	\N	\N	1	628
213	12135194_578371662310552_1338050299_n.jpg	44184	t	\N	\N	1	629
214	12224275_774921949298013_1152659750_n.jpg	75551	t	\N	\N	1	630
215	amsterdam.jpg	29263	t	\N	\N	1	631
216	amsterdam-1.jpg	118916	t	\N	\N	1	632
217	amsterdam-2.jpg	119251	t	\N	\N	1	633
218	amsterdam-3.jpg	115532	t	\N	\N	1	634
219	amsterdam-4.jpg	90216	t	\N	\N	1	635
220	amsterdam-5.jpg	133353	t	\N	\N	1	636
221	amsterdam-6.jpg	86468	t	\N	\N	1	637
222	amsterdam-7.jpg	92773	t	\N	\N	1	638
223	amsterdam-8.jpg	67395	t	\N	\N	1	639
224	amsterdam-9.jpg	94127	t	\N	\N	1	640
225	amsterdam-10.jpg	101579	t	\N	\N	1	641
226	kislorod-o2.jpg	124371	t	\N	\N	1	642
227	kislorod-o2-1.jpg	263265	t	\N	\N	1	643
228	kislorod-o2-2.jpg	230904	t	\N	\N	1	644
229	kislorod-o2-3.jpg	209460	t	\N	\N	1	645
230	kislorod-o2-4.jpg	316202	t	\N	\N	1	646
231	kislorod-o2-5.jpg	379713	t	\N	\N	1	647
232	kislorod-o2-6.jpg	392428	t	\N	\N	1	648
233	kislorod-o2-7.jpg	224918	t	\N	\N	1	649
234	kislorod-o2-8.jpg	261553	t	\N	\N	1	650
235	malina-klub.jpg	12660	t	\N	\N	1	651
236	malina-klub-1.jpg	215655	t	\N	\N	1	652
237	malina-klub-2.jpg	169508	t	\N	\N	1	653
238	malina-klub-3.jpg	229048	t	\N	\N	1	654
239	malina-klub-4.jpg	90598	t	\N	\N	1	655
240	malina-klub-5.jpg	108903	t	\N	\N	1	656
241	malina-klub-6.jpg	308228	t	\N	\N	1	657
242	continent.jpg	40255	t	\N	\N	1	658
243	continent-1.jpg	145467	t	\N	\N	1	659
244	continent-2.jpg	220196	t	\N	\N	1	660
245	continent-3.jpg	110768	t	\N	\N	1	661
246	continent-4.jpg	159620	t	\N	\N	1	662
247	continent-5.jpg	117726	t	\N	\N	1	663
248	continent-6.jpg	144607	t	\N	\N	1	664
249	continent-7.jpg	170115	t	\N	\N	1	665
250	continent-8.jpg	86832	t	\N	\N	1	666
251	continent-9.jpg	166411	t	\N	\N	1	667
252	unity-hall.jpg	61350	t	\N	\N	1	668
253	unity-hall-1.jpg	193955	t	\N	\N	1	669
254	unity-hall-2.jpg	114462	t	\N	\N	1	670
255	unity-hall-3.jpg	102724	t	\N	\N	1	671
256	unity-hall-4.jpg	187526	t	\N	\N	1	672
257	unity-hall-5.jpg	148995	t	\N	\N	1	673
258	unity-hall-6.jpg	185658	t	\N	\N	1	674
259	unity-hall-7.jpg	169628	t	\N	\N	1	675
260	unity-hall-8.jpg	180701	t	\N	\N	1	676
261	gr8peoplekazan.jpg	41881	t	\N	\N	1	677
262	gr8peoplekazan-1.jpg	165605	t	\N	\N	1	678
263	gr8peoplekazan-2.jpg	164381	t	\N	\N	1	679
264	gr8peoplekazan-3.jpg	145803	t	\N	\N	1	680
265	gr8peoplekazan-4.jpg	132145	t	\N	\N	1	681
266	gr8peoplekazan-5.jpg	157614	t	\N	\N	1	682
267	gr8peoplekazan-6.jpg	158275	t	\N	\N	1	683
268	gr8peoplekazan-7.jpg	165258	t	\N	\N	1	684
269	gr8peoplekazan-8.jpg	58007	t	\N	\N	1	685
270	gr8peoplekazan-9.jpg	99102	t	\N	\N	1	686
271	mint.jpg	4316	t	\N	\N	1	687
272	10706750_1627916860781685_1691979024_n.jpg	101886	t	\N	\N	1	688
273	11176103_691182180993772_218851533_n.jpg	175647	t	\N	\N	1	689
274	11195705_875541145818466_1754225196_n.jpg	148047	t	\N	\N	1	690
275	11208208_918658258166300_1044655281_n.jpg	141021	t	\N	\N	1	691
276	11235938_1138107009549344_1510127000_n.jpg	125836	t	\N	\N	1	692
277	11235979_368717889986191_1969179452_n.jpg	167505	t	\N	\N	1	693
278	11240455_980047722019151_756769479_n.jpg	150848	t	\N	\N	1	694
279	11244510_1601625753446003_709964516_n.jpg	71045	t	\N	\N	1	695
280	11282836_484561011701015_1977365445_n.jpg	80554	t	\N	\N	1	696
281	11325985_991499334196536_370836873_n.jpg	146851	t	\N	\N	1	697
282	11821237_700778603398973_100576612_n.jpg	30452	t	\N	\N	1	698
283	11875285_397740030435023_1559892340_n.jpg	15907	t	\N	\N	1	699
284	11909985_1649325475323724_1530105460_n.jpg	111858	t	\N	\N	1	700
285	oz.jpg	6705	t	\N	\N	1	701
286	11348224_924282837642720_308533196_n.jpg	47668	t	\N	\N	1	702
287	11363781_849914821730357_603196108_n.jpg	28080	t	\N	\N	1	703
288	11372427_1124890807538875_465664284_a.jpg	6705	t	\N	\N	1	704
289	11422002_1005583846152909_233035175_n.jpg	62699	t	\N	\N	1	705
290	11809943_1611530755776896_2059842933_n.jpg	78049	t	\N	\N	1	706
291	11820597_476252945880125_1408084659_n.jpg	44342	t	\N	\N	1	707
292	11821784_1609098279357548_1158222442_n.jpg	41406	t	\N	\N	1	708
293	11849058_868480346563710_1343090145_n.jpg	84106	t	\N	\N	1	709
294	11849459_889901187723772_1016855085_n.jpg	34063	t	\N	\N	1	710
295	11856747_1472732913053353_1610438194_n.jpg	62250	t	\N	\N	1	711
296	11856820_123238148021013_1781527931_n.jpg	45054	t	\N	\N	1	712
297	11881810_175304239471449_1228369767_n.jpg	62296	t	\N	\N	1	713
406	pallet-4.jpg	214340	t	\N	\N	1	822
298	11887007_625698164238325_1520621520_n.jpg	66104	t	\N	\N	1	714
299	11887297_1610576985860831_1165099576_n.jpg	66787	t	\N	\N	1	715
300	11899511_1631145170458091_1129751637_n.jpg	73505	t	\N	\N	1	716
301	smoke-station.jpg	3879	t	\N	\N	1	717
302	smoke-station-1.jpg	147049	t	\N	\N	1	718
303	smoke-station-2.jpg	108528	t	\N	\N	1	719
304	smoke-station-3.jpg	136934	t	\N	\N	1	720
305	smoke-station-4.jpg	119372	t	\N	\N	1	721
306	smoke-station-5.jpg	131694	t	\N	\N	1	722
307	smoke-station1.jpg	3879	t	\N	\N	1	723
308	komilfo.jpg	67427	t	\N	\N	1	724
309	komilfo-1.jpg	50966	t	\N	\N	1	725
310	komilfo-2.jpg	81347	t	\N	\N	1	726
311	komilfo-3.jpg	57507	t	\N	\N	1	727
312	komilfo-4.jpg	64369	t	\N	\N	1	728
313	komilfo-5.jpg	44238	t	\N	\N	1	729
314	komilfo-6.jpg	43354	t	\N	\N	1	730
315	aurelia.jpg	14521	t	\N	\N	1	731
316	aurelia-1.jpg	271731	t	\N	\N	1	732
317	aurelia-2.jpg	63289	t	\N	\N	1	733
318	aurelia-3.jpg	63502	t	\N	\N	1	734
319	aurelia-4.jpg	60269	t	\N	\N	1	735
320	aurelia-5.jpg	69724	t	\N	\N	1	736
321	aurelia-6.jpg	93426	t	\N	\N	1	737
322	aurelia-7.jpg	205286	t	\N	\N	1	738
323	aurelia-8.jpg	182297	t	\N	\N	1	739
324	liberty.jpg	6059	t	\N	\N	1	740
325	liberty-1.jpg	151426	t	\N	\N	1	741
326	liberty-2.jpg	149434	t	\N	\N	1	742
327	liberty-3.jpg	132655	t	\N	\N	1	743
328	liberty-4.jpg	103242	t	\N	\N	1	744
329	liberty-5.jpg	97463	t	\N	\N	1	745
330	liberty-6.jpg	101707	t	\N	\N	1	746
331	liberty-7.jpg	244601	t	\N	\N	1	747
332	liberty-8.jpg	43942	t	\N	\N	1	748
333	haze.jpg	69057	t	\N	\N	1	749
334	haze-1.jpg	91681	t	\N	\N	1	750
335	haze-2.jpg	53335	t	\N	\N	1	751
336	haze-3.jpg	73537	t	\N	\N	1	752
337	haze-4.jpg	106548	t	\N	\N	1	753
338	haze-5.jpg	106923	t	\N	\N	1	754
339	haze-6.jpg	94701	t	\N	\N	1	755
340	haze-7.jpg	108814	t	\N	\N	1	756
341	haze-8.jpg	95239	t	\N	\N	1	757
342	haze-9.jpg	106058	t	\N	\N	1	758
343	haze-10.jpg	154587	t	\N	\N	1	759
344	black-shark.jpg	103959	t	\N	\N	1	760
345	black-shark-1.jpg	123873	t	\N	\N	1	761
346	black-shark-2.jpg	141363	t	\N	\N	1	762
347	black-shark-3.jpg	179780	t	\N	\N	1	763
348	black-shark-4.jpg	101744	t	\N	\N	1	764
349	black-shark-5.jpg	39690	t	\N	\N	1	765
350	black-shark-6.jpg	62867	t	\N	\N	1	766
351	greenwich-pub.jpg	162699	t	\N	\N	1	767
352	greenwich-pub-1.jpg	74911	t	\N	\N	1	768
353	greenwich-pub-2.jpg	91209	t	\N	\N	1	769
354	greenwich-pub-3.jpg	96657	t	\N	\N	1	770
355	greenwich-pub-4.jpg	129864	t	\N	\N	1	771
356	greenwich-pub-5.jpg	176338	t	\N	\N	1	772
357	greenwich-pub-6.jpg	216745	t	\N	\N	1	773
358	greenwich-pub-7.jpg	146519	t	\N	\N	1	774
359	greenwich-pub-8.jpg	161832	t	\N	\N	1	775
360	greenwich-pub-9.jpg	319584	t	\N	\N	1	776
361	hottabych.jpg	144651	t	\N	\N	1	777
362	hottabych-1.jpg	166415	t	\N	\N	1	778
363	hottabych-2.jpg	138919	t	\N	\N	1	779
364	hottabych-3.jpg	101580	t	\N	\N	1	780
365	hottabych-4.jpg	90888	t	\N	\N	1	781
366	hottabych-5.jpg	110972	t	\N	\N	1	782
367	hottabych-6.jpg	94407	t	\N	\N	1	783
368	hottabych-7.jpg	292348	t	\N	\N	1	784
369	hottabych-8.jpg	134099	t	\N	\N	1	785
370	rahat.jpg	4375	t	\N	\N	1	786
371	924671_1710047562560544_2127046381_n.jpg	41150	t	\N	\N	1	787
372	1389034_715961518536218_294331313_n.jpg	73863	t	\N	\N	1	788
373	10471830_159633827725038_114568594_n.jpg	61645	t	\N	\N	1	789
374	11337182_527105770798182_1835973953_n.jpg	89499	t	\N	\N	1	790
375	12063191_712760232157479_1634156962_n.jpg	55419	t	\N	\N	1	791
376	12070946_888359164566980_1375382346_n.jpg	33208	t	\N	\N	1	792
377	12081301_782321328560065_1549013156_n.jpg	50072	t	\N	\N	1	793
378	12106040_424741111062591_550101343_n.jpg	33565	t	\N	\N	1	794
379	12132891_403129289885976_948078571_n.jpg	35448	t	\N	\N	1	795
380	12135248_856057844489586_1856638180_n.jpg	54626	t	\N	\N	1	796
381	marrakech-time.jpg	7396	t	\N	\N	1	797
382	marrakech-time-1.jpg	135813	t	\N	\N	1	798
383	marrakech-time-2.jpg	50901	t	\N	\N	1	799
384	marrakech-time-3.jpg	147720	t	\N	\N	1	800
385	marrakech-time-4.jpg	139802	t	\N	\N	1	801
386	marrakech-time-5.jpg	102125	t	\N	\N	1	802
387	marrakech-time-6.jpg	151083	t	\N	\N	1	803
388	marrakech-time-7.jpg	146548	t	\N	\N	1	804
389	marrakech-time-8.jpg	130740	t	\N	\N	1	805
390	marrakech-time-9.jpg	92987	t	\N	\N	1	806
391	hookah-smoke.jpg	11517	t	\N	\N	1	807
392	hookah-smoke-1.jpg	199279	t	\N	\N	1	808
393	hookah-smoke-2.jpg	253621	t	\N	\N	1	809
394	hookah-smoke-3.jpg	300958	t	\N	\N	1	810
395	hookah-smoke-4.jpg	126085	t	\N	\N	1	811
396	hookah-smoke-5.jpg	162228	t	\N	\N	1	812
397	hookah-smoke-6.jpg	144326	t	\N	\N	1	813
398	hookah-smoke-7.jpg	111556	t	\N	\N	1	814
399	hookah-smoke-8.jpg	183551	t	\N	\N	1	815
400	hookah-smoke-9.jpg	201550	t	\N	\N	1	816
401	hookah-smoke-10.jpg	194761	t	\N	\N	1	817
402	pallet.jpg	10255	t	\N	\N	1	818
403	pallet-1.jpg	115767	t	\N	\N	1	819
404	pallet-2.jpg	148089	t	\N	\N	1	820
405	pallet-3.jpg	191175	t	\N	\N	1	821
407	pallet-5.jpg	289325	t	\N	\N	1	823
408	pallet-6.jpg	232850	t	\N	\N	1	824
409	pallet-7.jpg	207414	t	\N	\N	1	825
410	pallet-8.jpg	146989	t	\N	\N	1	826
411	pallet-9.jpg	252169	t	\N	\N	1	827
412	pallet-10.jpg	236846	t	\N	\N	1	828
413	undeground.jpg	20988	t	\N	\N	1	829
414	underground-1.jpg	23966	t	\N	\N	1	830
415	underground-2.jpg	26634	t	\N	\N	1	831
416	underground-3.jpg	176244	t	\N	\N	1	832
417	underground-4.jpg	156720	t	\N	\N	1	833
418	underground-5.jpg	158246	t	\N	\N	1	834
419	underground-6.jpg	90733	t	\N	\N	1	835
420	underground-7.jpg	128488	t	\N	\N	1	836
421	chih-pyh.jpg	54497	t	\N	\N	1	837
422	chih-pyh-1.jpg	78313	t	\N	\N	1	838
423	chih-pyh-2.jpg	58324	t	\N	\N	1	839
424	chih-pyh-3.jpg	77213	t	\N	\N	1	840
425	chih-pyh-4.jpg	73547	t	\N	\N	1	841
426	chih-pyh-5.jpg	230769	t	\N	\N	1	842
427	chih-pyh-6.jpg	291858	t	\N	\N	1	843
428	chih-pyh-7.jpg	247003	t	\N	\N	1	844
429	chih-pyh-8.jpg	113232	t	\N	\N	1	845
430	chih-pyh-9.jpg	149413	t	\N	\N	1	846
431	chih-pyh-10.jpg	180484	t	\N	\N	1	847
432	loft.jpg	214576	t	\N	\N	1	848
433	loft-1.jpg	154574	t	\N	\N	1	849
434	loft-2.jpg	151300	t	\N	\N	1	850
435	loft-3.jpg	190468	t	\N	\N	1	851
436	loft-4.jpg	166475	t	\N	\N	1	852
437	loft-5.jpg	171813	t	\N	\N	1	853
438	loft-6.jpg	167243	t	\N	\N	1	854
439	loft-7.jpg	203133	t	\N	\N	1	855
440	loft-8.jpg	252394	t	\N	\N	1	856
441	loft-9.jpg	248865	t	\N	\N	1	857
442	mint-ufa.jpg	23129	t	\N	\N	1	858
443	mint-ufa-1.jpg	148275	t	\N	\N	1	859
444	mint-ufa-2.jpg	143932	t	\N	\N	1	860
445	mint-ufa-3.jpg	77941	t	\N	\N	1	861
446	mint-ufa-4.jpg	179360	t	\N	\N	1	862
447	mint-ufa-5.jpg	177374	t	\N	\N	1	863
448	mint-ufa-6.jpg	152234	t	\N	\N	1	864
449	mint-ufa-7.jpg	158078	t	\N	\N	1	865
450	mint-ufa-8.jpg	149691	t	\N	\N	1	866
451	ehtazhi.jpg	89656	t	\N	\N	1	869
452	ehtazhi-1.jpg	136523	t	\N	\N	1	870
453	ehtazhi-2.jpg	164106	t	\N	\N	1	871
454	ehtazhi-3.jpg	64296	t	\N	\N	1	872
455	ehtazhi-4.jpg	178617	t	\N	\N	1	873
456	ehtazhi-5.jpg	161719	t	\N	\N	1	874
457	ehtazhi-6.jpg	68707	t	\N	\N	1	875
458	ehtazhi-7.jpg	88569	t	\N	\N	1	876
459	ehtazhi-8.jpg	244613	t	\N	\N	1	877
460	ehtazhi-9.jpg	153722	t	\N	\N	1	878
461	ehtazhi-10.jpg	129677	t	\N	\N	1	879
462	art-shiha.jpg	5018	t	\N	\N	1	880
463	art-shiha-1.jpg	137552	t	\N	\N	1	881
464	art-shiha-2.jpg	133247	t	\N	\N	1	882
465	art-shiha-3.jpg	135961	t	\N	\N	1	883
466	art-shiha-4.jpg	157743	t	\N	\N	1	884
467	art-shiha-5.jpg	117080	t	\N	\N	1	885
468	art-shiha-6.jpg	132136	t	\N	\N	1	886
469	art-shiha-7.jpg	103747	t	\N	\N	1	887
470	art-shiha-8.jpg	218866	t	\N	\N	1	888
471	art-shiha-9.jpg	147525	t	\N	\N	1	889
472	art-shiha-10.jpg	222923	t	\N	\N	1	890
473	divan-lounge.jpg	7428	t	\N	\N	1	891
474	11356750_865065346895133_1026511386_n.jpg	53433	t	\N	\N	1	892
475	11821692_1480242455603901_93564599_n.jpg	49301	t	\N	\N	1	893
476	11848917_420327108167650_534527284_n.jpg	65071	t	\N	\N	1	894
477	11875352_1386264201672888_357712430_n.jpg	46368	t	\N	\N	1	895
478	11881908_581806968627090_1123357378_n.jpg	35998	t	\N	\N	1	896
479	11930786_898551196906063_745885966_n.jpg	58152	t	\N	\N	1	897
480	11939269_525052600984245_375726099_n.jpg	86072	t	\N	\N	1	898
481	11939434_721319594641185_1797076791_n.jpg	56328	t	\N	\N	1	899
482	12063056_1639641186312147_1803263776_n.jpg	64574	t	\N	\N	1	900
483	12071179_1094883173862653_1480855401_n.jpg	81898	t	\N	\N	1	901
484	12080644_189610504706715_698998907_n.jpg	88336	t	\N	\N	1	902
485	12105098_441571412702222_1646579697_n.jpg	130189	t	\N	\N	1	903
486	12141936_918195704895883_353598823_n.jpg	48421	t	\N	\N	1	904
487	zona-69.jpg	118072	t	\N	\N	1	905
488	zona-69-1.jpg	174114	t	\N	\N	1	906
489	zona-69-2.jpg	211040	t	\N	\N	1	907
490	zona-69-3.jpg	111603	t	\N	\N	1	908
491	zona-69-4.jpg	111033	t	\N	\N	1	909
492	zona-69-5.jpg	194732	t	\N	\N	1	910
493	zona-69-6.jpg	219236	t	\N	\N	1	911
494	zona-69-7.jpg	104659	t	\N	\N	1	912
495	zona-69-8.jpg	120670	t	\N	\N	1	913
496	zona-69-9.jpg	200031	t	\N	\N	1	914
497	zona-69-10.jpg	208083	t	\N	\N	1	915
498	zona-69-11.jpg	66295	t	\N	\N	1	916
499	zona-69-12.jpg	176131	t	\N	\N	1	917
500	timeout.jpg	193589	t	\N	\N	1	918
501	timeout-1.jpg	139536	t	\N	\N	1	919
502	timeout-2.jpg	160203	t	\N	\N	1	920
503	timeout-3.jpg	146614	t	\N	\N	1	921
504	timeout-4.jpg	207459	t	\N	\N	1	922
505	timeout-5.jpg	198600	t	\N	\N	1	923
506	timeout-6.jpg	83634	t	\N	\N	1	924
507	timeout-7.jpg	230715	t	\N	\N	1	925
508	timeout-8.jpg	74670	t	\N	\N	1	926
509	bedouin-house.jpg	55649	t	\N	\N	1	927
510	10413260_822916331163989_881546527_n.jpg	72635	t	\N	\N	1	928
511	10467814_1653583621571239_823304209_n.jpg	79878	t	\N	\N	1	929
512	11324229_1733790426854391_1871460756_n.jpg	79752	t	\N	\N	1	930
513	12276730_443269829214328_1249801769_n.jpg	60803	t	\N	\N	1	931
514	12276849_779552528840733_1123923194_n.jpg	76687	t	\N	\N	1	932
515	12301336_729566923840089_347694622_n.jpg	75968	t	\N	\N	1	933
623	roof-3.jpg	88268	t	\N	\N	1	1041
516	12317528_1524015701257935_476121483_n.jpg	73437	t	\N	\N	1	934
517	12327941_531504713671747_1941417542_n.jpg	76015	t	\N	\N	1	935
518	12331416_933966296640500_1519380759_n.jpg	74401	t	\N	\N	1	936
519	12331682_544276912415889_715798395_n.jpg	54132	t	\N	\N	1	937
520	12338646_791120591034224_1878037647_n.jpg	93913	t	\N	\N	1	938
521	12338954_530143187155181_394309688_n.jpg	60787	t	\N	\N	1	939
522	12345914_890125907749565_957519831_n.jpg	74977	t	\N	\N	1	940
523	12345918_1700144130220484_915452137_n.jpg	66122	t	\N	\N	1	941
524	12345941_1511490849147010_326674538_n.jpg	76597	t	\N	\N	1	942
525	example-lounge-logo.jpg	7708	t	\N	\N	1	943
526	example-lounge-1.jpg	175169	t	\N	\N	1	944
527	example-lounge-2.jpg	198253	t	\N	\N	1	945
528	example-lounge-3.jpg	194649	t	\N	\N	1	946
529	example-lounge-4.jpg	133933	t	\N	\N	1	947
530	example-lounge-5.jpg	206759	t	\N	\N	1	948
531	example-lounge-6.jpg	239858	t	\N	\N	1	949
532	example-lounge-7.jpg	183372	t	\N	\N	1	950
533	example-lounge-8.jpg	189254	t	\N	\N	1	951
534	example-lounge-9.jpg	213431	t	\N	\N	1	952
535	example-lounge-10.jpg	221187	t	\N	\N	1	953
536	example-lounge-11.jpg	269660	t	\N	\N	1	954
537	example-lounge-12.jpg	231157	t	\N	\N	1	955
538	example-lounge-13.jpg	208394	t	\N	\N	1	956
539	example-lounge-14.jpg	210076	t	\N	\N	1	957
540	example-lounge-15.jpg	233279	t	\N	\N	1	958
541	example-lounge-16.jpg	132619	t	\N	\N	1	959
542	relaxinema-logo.jpg	17912	t	\N	\N	1	960
543	relaxinema-1.jpg	86710	t	\N	\N	1	961
544	relaxinema-2.jpg	149979	t	\N	\N	1	962
545	relaxinema-3.jpg	107654	t	\N	\N	1	963
546	relaxinema-4.jpg	85953	t	\N	\N	1	964
547	relaxinema-5.jpg	111955	t	\N	\N	1	965
548	relaxinema-6.jpg	185843	t	\N	\N	1	966
549	enjoy-logo.png	32009	t	\N	\N	1	967
550	enjoy-1.jpg	143778	t	\N	\N	1	968
551	enjoy-2.jpg	162790	t	\N	\N	1	969
552	enjoy-3.jpg	137817	t	\N	\N	1	970
553	enjoy-4.jpg	124517	t	\N	\N	1	971
554	enjoy-5.jpg	200236	t	\N	\N	1	972
555	enjoy-6.jpg	163998	t	\N	\N	1	973
556	enjoy-7.jpg	115579	t	\N	\N	1	974
557	enjoy-8.jpg	171040	t	\N	\N	1	975
558	inkognito-logo.jpg	151475	t	\N	\N	1	976
559	inkognito-1.jpg	168608	t	\N	\N	1	977
560	inkognito-2.jpg	141551	t	\N	\N	1	978
561	inkognito-3.jpg	144738	t	\N	\N	1	979
562	inkognito-4.jpg	78824	t	\N	\N	1	980
563	inkognito-5.jpg	86478	t	\N	\N	1	981
564	inkognito-6.jpg	99697	t	\N	\N	1	982
565	inkognito-7.jpg	101742	t	\N	\N	1	983
566	inkognito-8.jpg	166249	t	\N	\N	1	984
567	inkognito-9.jpg	82831	t	\N	\N	1	985
568	fantasy-of-smoke-logo.jpg	72641	t	\N	\N	1	986
569	fantasy-of-smoke-1.jpg	237883	t	\N	\N	1	987
570	fantasy-of-smoke-2.jpg	236111	t	\N	\N	1	988
571	fantasy-of-smoke-3.jpg	221665	t	\N	\N	1	989
572	fantasy-of-smoke-4.jpg	148249	t	\N	\N	1	990
573	fantasy-of-smoke-5.jpg	179210	t	\N	\N	1	991
574	fantasy-of-smoke-6.jpg	170078	t	\N	\N	1	992
575	fantasy-of-smoke-7.jpg	190271	t	\N	\N	1	993
576	fantasy-of-smoke-8.jpg	132557	t	\N	\N	1	994
577	fantasy-of-smoke-9.jpg	163460	t	\N	\N	1	995
578	fantasy-of-smoke-10.jpg	133229	t	\N	\N	1	996
579	hookah-loundge-logo.jpg	15030	t	\N	\N	1	997
580	hookah-loundge-1.jpg	410574	t	\N	\N	1	998
581	hookah-loundge-2.jpg	195074	t	\N	\N	1	999
582	hookah-loundge-3.jpg	106904	t	\N	\N	1	1000
583	hookah-loundge-4.jpg	121570	t	\N	\N	1	1001
584	hookah-loundge-5.jpg	323757	t	\N	\N	1	1002
585	hookah-loundge-7.jpg	212660	t	\N	\N	1	1003
586	hookah-loundge-8.jpg	207944	t	\N	\N	1	1004
587	milk-longe.jpg	28075	t	\N	\N	1	1005
588	milk-longe-1.jpg	90482	t	\N	\N	1	1006
589	milk-longe-2.jpg	206687	t	\N	\N	1	1007
590	milk-longe-3.jpg	184711	t	\N	\N	1	1008
591	milk-longe-4.jpg	116693	t	\N	\N	1	1009
592	milk-longe-5.jpg	182026	t	\N	\N	1	1010
593	milk-longe-6.jpg	194127	t	\N	\N	1	1011
594	u-ehdgara-po-logo.jpg	11401	t	\N	\N	1	1012
595	u-ehdgara-po-1.jpg	19380	t	\N	\N	1	1013
596	u-ehdgara-po-2.jpg	101541	t	\N	\N	1	1014
597	u-ehdgara-po-3.jpg	93790	t	\N	\N	1	1015
598	u-ehdgara-po-4.jpg	125425	t	\N	\N	1	1016
599	u-ehdgara-po-5.jpg	120970	t	\N	\N	1	1017
600	u-ehdgara-po-6.jpg	17638	t	\N	\N	1	1018
601	u-ehdgara-po-7.jpg	72821	t	\N	\N	1	1019
602	noname-kzn-logo.jpg	17907	t	\N	\N	1	1020
603	noname-kzn-1.jpg	85064	t	\N	\N	1	1021
604	noname-kzn-2.jpg	134803	t	\N	\N	1	1022
605	noname-kzn-3.jpg	260699	t	\N	\N	1	1023
606	noname-kzn-4.jpg	168936	t	\N	\N	1	1024
607	noname-kzn-5.jpg	47619	t	\N	\N	1	1025
608	noname-kzn-6.jpg	202871	t	\N	\N	1	1026
609	noname-kzn-7.jpg	33700	t	\N	\N	1	1027
610	noname-kzn-8.jpg	147784	t	\N	\N	1	1028
611	feel-free-logo.jpg	12439	t	\N	\N	1	1029
612	feel-free-1.jpg	40029	t	\N	\N	1	1030
613	feel-free-2.jpg	33148	t	\N	\N	1	1031
614	feel-free-3.jpg	136673	t	\N	\N	1	1032
615	feel-free-4.jpg	101447	t	\N	\N	1	1033
616	feel-free-5.jpg	178940	t	\N	\N	1	1034
617	feel-free-6.jpg	153072	t	\N	\N	1	1035
618	feel-free-7.jpg	147428	t	\N	\N	1	1036
619	feel-free-8.jpg	194461	t	\N	\N	1	1037
620	roof-logo.jpg	9665	t	\N	\N	1	1038
621	roof-1.jpg	114585	t	\N	\N	1	1039
622	roof-2.jpg	75598	t	\N	\N	1	1040
624	roof-4.jpg	133632	t	\N	\N	1	1042
625	roof-5.jpg	160570	t	\N	\N	1	1043
626	roof-6.jpg	107154	t	\N	\N	1	1044
627	roof-7.jpg	130225	t	\N	\N	1	1045
628	roof-8.jpg	124365	t	\N	\N	1	1046
629	hubble-bubble-logo.jpg	6923	t	\N	\N	1	1047
630	hubble-bubble-1.jpg	158173	t	\N	\N	1	1048
631	hubble-bubble-2.jpg	107765	t	\N	\N	1	1049
632	hubble-bubble-3.jpg	230995	t	\N	\N	1	1050
633	hubble-bubble-4.jpg	228821	t	\N	\N	1	1051
634	hubble-bubble-5.jpg	202669	t	\N	\N	1	1052
635	hubble-bubble-6.jpg	107932	t	\N	\N	1	1053
636	hubble-bubble-7.jpg	91517	t	\N	\N	1	1054
637	green-house-logo.jpg	19649	t	\N	\N	1	1055
638	green-house-1.jpg	248546	t	\N	\N	1	1056
639	green-house-2.jpg	121570	t	\N	\N	1	1057
640	green-house-3.jpg	244337	t	\N	\N	1	1058
641	green-house-4.jpg	91438	t	\N	\N	1	1059
642	green-house-5.jpg	136752	t	\N	\N	1	1060
643	green-house-6.jpg	87469	t	\N	\N	1	1061
644	green-house-7.jpg	58413	t	\N	\N	1	1062
645	green-house-8.jpg	149030	t	\N	\N	1	1063
646	green-house-9.jpg	143214	t	\N	\N	1	1064
647	green-house-10.jpg	122351	t	\N	\N	1	1065
648	2man-logo.jpg	36304	t	\N	\N	1	1066
649	2man-1.jpg	122930	t	\N	\N	1	1067
650	2man-2.jpg	76346	t	\N	\N	1	1068
651	2man-3.jpg	133153	t	\N	\N	1	1069
652	2man-4.jpg	156684	t	\N	\N	1	1070
653	2man-5.jpg	178225	t	\N	\N	1	1071
654	2man-6.jpg	88423	t	\N	\N	1	1072
655	2man-7.jpg	161571	t	\N	\N	1	1073
656	2man-8.jpg	102725	t	\N	\N	1	1074
657	smoke-house-logo.jpg	38555	t	\N	\N	1	1075
658	smoke-house-1.jpg	268758	t	\N	\N	1	1076
659	smoke-house-2.jpg	180371	t	\N	\N	1	1077
660	smoke-house-3.jpg	179283	t	\N	\N	1	1078
661	smoke-house-4.jpg	193509	t	\N	\N	1	1079
662	smoke-house-5.jpg	245614	t	\N	\N	1	1080
663	smoke-house-6.jpg	210755	t	\N	\N	1	1081
664	smoke-house-7.jpg	214608	t	\N	\N	1	1082
665	smoke-house-8.jpg	184119	t	\N	\N	1	1083
666	smoke-house-9.jpg	224086	t	\N	\N	1	1084
667	smoke-house-10.jpg	218025	t	\N	\N	1	1085
668	smoke-house-11.jpg	194040	t	\N	\N	1	1086
669	vdoh-vydoh-logo.jpg	20821	t	\N	\N	1	1087
670	vdoh-vydoh-1.jpg	106392	t	\N	\N	1	1088
671	vdoh-vydoh-2.jpg	76576	t	\N	\N	1	1089
672	vdoh-vydoh-3.jpg	64376	t	\N	\N	1	1090
673	vdoh-vydoh-4.jpg	41466	t	\N	\N	1	1091
674	vdoh-vydoh-5.jpg	50426	t	\N	\N	1	1092
675	vdoh-vydoh-6.jpg	190077	t	\N	\N	1	1093
676	vdoh-vydoh-7.jpg	159938	t	\N	\N	1	1094
677	vdoh-vydoh-8.jpg	92140	t	\N	\N	1	1095
678	vdoh-vydoh-9.jpg	130913	t	\N	\N	1	1096
679	vdoh-vydoh-10.jpg	125662	t	\N	\N	1	1097
680	kalyannaya-magicbar-ufa-logo.jpg	3936	t	\N	\N	1	1098
681	kalyannaya-magicbar-ufa-1.jpg	103041	t	\N	\N	1	1099
682	kalyannaya-magicbar-ufa-2.jpg	55815	t	\N	\N	1	1100
683	kalyannaya-magicbar-ufa-3.jpg	66869	t	\N	\N	1	1101
684	kalyannaya-magicbar-ufa-4.jpg	63675	t	\N	\N	1	1102
685	kalyannaya-magicbar-ufa-5.jpg	83812	t	\N	\N	1	1103
686	kalyannaya-magicbar-ufa-6.jpg	35599	t	\N	\N	1	1104
687	kalyannaya-magicbar-ufa-7.jpg	51915	t	\N	\N	1	1105
688	kalyannaya-magicbar-ufa-8.jpg	64110	t	\N	\N	1	1106
689	kalyannaya-magicbar-ufa-9.jpg	93737	t	\N	\N	1	1107
\.


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('files_id_seq', 689, true);


--
-- Data for Name: shedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shedule (shop_id, day_id, work_begin, work_end, type_work) FROM stdin;
723	1	12	1	3
723	2	12	1	3
723	3	12	1	3
723	4	12	1	3
723	5	12	2	3
723	6	12	2	3
723	7	12	1	3
724	1	18	2	3
724	2	18	2	3
724	3	18	2	3
724	4	18	2	3
724	5	18	4	3
724	6	18	4	3
724	7	18	2	3
290	1	15	3	3
290	2	15	3	3
290	3	15	3	3
290	4	15	3	3
290	5	15	3	3
290	6	15	3	3
290	7	15	3	3
726	1	17	3	3
726	2	17	3	3
726	3	17	3	3
726	4	17	3	3
726	5	17	6	3
726	6	17	6	3
726	7	17	3	3
727	1	14	24	3
727	2	14	24	3
727	3	14	24	3
727	4	14	24	3
727	5	14	3	3
727	6	14	3	3
727	7	14	24	3
260	1	15	2	3
260	2	15	2	3
260	3	15	2	3
260	4	15	2	3
260	5	15	2	3
260	6	15	4	3
260	7	15	1	3
261	1	-1	-1	3
261	2	20	2	3
261	3	20	2	3
261	4	20	2	3
261	5	20	3	3
261	6	20	3	3
261	7	20	2	3
264	1	12	1	3
264	2	12	1	3
264	3	12	1	3
264	4	12	1	3
264	5	12	2	3
264	6	12	2	3
264	7	1	1	3
263	1	12	1	3
263	2	12	1	3
263	3	12	1	3
263	4	12	1	3
263	5	12	2	3
263	6	12	2	3
263	7	12	1	3
265	1	15	3	3
265	2	15	3	3
265	3	15	3	3
265	4	15	3	3
265	5	15	3	3
265	6	15	3	3
265	7	15	3	3
266	1	12	6	3
266	2	12	6	3
266	3	12	6	3
266	4	12	6	3
266	5	12	6	3
266	6	12	6	3
266	7	12	6	3
267	1	11	2	3
267	2	11	2	3
267	3	11	2	3
267	4	11	2	3
267	5	11	3	3
267	6	11	3	3
267	7	11	3	3
268	1	15	2	3
268	2	15	2	3
268	3	15	2	3
268	4	15	2	3
268	5	15	2	3
268	6	15	2	3
268	7	15	2	3
269	1	12	1	3
269	2	12	1	3
269	3	12	1	3
269	4	12	1	3
269	5	12	4	3
269	6	12	4	3
269	7	13	1	3
271	1	12	3	3
271	2	12	3	3
271	3	12	3	3
271	4	12	3	3
271	5	12	3	3
271	6	12	3	3
271	7	12	3	3
300	1	13	23	3
300	2	13	23	3
300	3	13	23	3
300	4	13	23	3
300	5	13	23	3
300	6	13	23	3
300	7	13	23	3
274	1	24	1	3
274	2	14	1	3
274	3	14	1	3
274	4	14	1	3
274	5	14	1	3
274	6	14	1	3
274	7	14	1	3
275	1	13	1	3
275	2	13	1	3
275	3	13	1	3
275	4	13	1	3
275	5	13	2	3
275	6	13	2	3
275	7	13	1	3
276	1	12	2	3
276	2	12	2	3
276	3	12	2	3
728	1	12	3	3
728	2	12	3	3
728	3	12	3	3
728	4	12	3	3
728	5	12	3	3
728	6	12	3	3
728	7	12	3	3
729	1	14	2	3
729	2	14	2	3
729	3	14	2	3
729	4	14	2	3
729	5	14	3	3
276	4	12	2	3
276	5	12	2	3
276	6	12	2	3
276	7	12	2	3
729	6	14	3	3
729	7	14	2	3
730	1	18	2	3
730	2	18	2	3
730	3	18	2	3
730	4	18	2	3
730	5	18	6	3
730	6	18	6	3
730	7	18	6	3
731	1	15	2	3
731	2	15	2	3
731	3	15	2	3
731	4	15	2	3
731	5	15	4	3
731	6	17	4	3
731	7	17	2	3
732	1	16	2	3
732	2	16	2	3
732	3	16	2	3
732	4	16	2	3
732	5	16	4	3
732	6	16	4	3
732	7	16	2	3
291	1	18	2	3
1014	1	9	21	3
1014	2	9	21	3
1014	3	9	21	3
1014	4	9	21	3
1014	5	9	21	3
1014	6	9	21	3
1014	7	9	21	3
1017	1	12	20	3
1017	2	12	20	3
1017	3	12	20	3
1017	4	12	20	3
1017	5	12	20	3
1017	6	13	20	3
285	1	17	3	3
285	2	17	3	3
285	3	17	3	3
285	4	17	3	3
285	5	17	3	3
285	6	17	3	3
285	7	17	3	3
287	1	13	24	3
287	2	13	24	3
287	3	13	24	3
287	4	13	24	3
287	5	13	2	3
287	6	13	2	3
287	7	1	24	3
906	1	10	21	3
906	2	10	21	3
906	3	10	21	3
906	4	10	21	3
906	5	10	21	3
906	6	10	21	3
906	7	10	21	3
292	1	18	6	3
292	2	18	6	3
292	3	18	6	3
292	4	18	6	3
292	5	18	6	3
292	6	18	6	3
292	7	18	6	3
294	1	18	5	3
294	2	18	5	3
294	3	18	5	3
294	4	18	5	3
294	5	18	5	3
294	6	18	5	3
294	7	18	5	3
295	1	14	4	3
295	2	14	4	3
295	3	14	4	3
295	4	14	4	3
295	5	14	4	3
295	6	14	6	3
295	7	14	6	3
831	2	13	1	3
831	3	13	1	3
831	4	13	1	3
831	5	13	1	3
831	6	13	1	3
831	7	13	1	3
832	1	12	24	3
832	2	12	24	3
832	3	12	24	3
832	4	12	24	3
832	5	12	2	3
832	6	12	2	3
832	7	12	24	3
833	1	14	2	3
833	2	14	2	3
833	3	14	2	3
833	4	14	2	3
833	5	14	2	3
833	6	14	2	3
833	7	14	2	3
834	1	11	24	3
834	2	11	24	3
834	3	11	24	3
834	4	11	24	3
834	5	11	2	3
834	6	11	2	3
834	7	11	24	3
835	1	14	4	3
835	2	14	4	3
835	3	14	4	3
835	4	14	4	3
835	5	14	4	3
835	6	14	4	3
1015	1	9	20	3
1015	2	9	20	3
1015	3	9	20	3
1015	4	9	20	3
1015	5	9	20	3
1015	6	10	20	3
1015	7	10	20	3
1016	1	10	21	3
1016	2	10	21	3
1016	3	10	21	3
1016	4	10	21	3
1016	5	10	21	3
1016	6	10	21	3
1016	7	10	21	3
299	1	16	23	3
299	2	16	23	3
299	3	16	23	3
299	4	16	23	3
299	5	16	23	3
299	6	16	23	3
299	7	16	23	3
302	1	17	1	3
302	2	17	1	3
302	3	17	1	3
302	4	17	1	3
302	5	15	1	3
302	6	15	1	3
302	7	15	1	3
636	1	9	21	3
636	2	9	21	3
636	3	9	21	3
636	4	9	21	3
636	5	9	21	3
636	6	9	21	3
636	7	9	21	3
257	1	14	2	3
305	1	11	4	3
305	2	11	4	3
305	3	11	4	3
305	4	11	4	3
305	5	11	4	3
305	6	11	4	3
305	7	11	4	3
306	1	12	2	3
306	2	12	2	3
306	3	12	2	3
306	4	12	2	3
306	5	12	2	3
306	6	12	4	3
306	7	12	4	3
307	1	13	5	3
307	2	13	5	3
307	3	13	5	3
307	4	13	5	3
307	5	13	5	3
307	6	13	5	3
307	7	13	5	3
308	1	12	1	3
308	2	12	1	3
308	3	12	1	3
308	4	12	1	3
308	5	12	1	3
308	6	12	1	3
308	7	1	1	3
309	1	15	3	3
309	2	15	3	3
309	3	15	3	3
309	4	15	3	3
309	5	15	3	3
309	6	15	3	3
309	7	15	3	3
310	1	18	2	3
310	2	18	2	3
310	3	18	2	3
310	4	18	2	3
310	5	18	2	3
310	6	18	2	3
310	7	18	2	3
311	1	15	1	3
311	2	15	1	3
311	3	15	1	3
311	4	15	1	3
311	5	15	1	3
311	6	15	1	3
311	7	15	1	3
312	1	15	3	3
312	2	15	3	3
312	3	15	3	3
312	4	15	3	3
312	5	15	3	3
312	6	15	3	3
312	7	15	3	3
313	1	17	1	3
313	2	17	1	3
313	3	17	1	3
313	4	17	1	3
313	5	17	3	3
313	6	17	3	3
313	7	17	1	3
314	1	16	5	3
314	2	16	5	3
314	3	16	5	3
314	4	16	5	3
314	5	16	5	3
314	6	16	5	3
314	7	16	5	3
315	1	14	2	3
315	2	14	2	3
315	3	14	2	3
315	4	14	2	3
315	5	14	2	3
315	6	14	2	3
315	7	14	2	3
316	1	18	2	3
316	2	18	2	3
316	3	18	2	3
316	4	18	2	3
316	5	18	2	3
316	6	18	2	3
316	7	18	2	3
317	1	15	2	3
317	2	15	2	3
317	3	15	2	3
317	4	15	2	3
317	5	15	2	3
317	6	15	2	3
317	7	15	2	3
318	1	13	2	3
318	2	13	2	3
318	3	13	2	3
318	4	13	2	3
318	5	13	4	3
318	6	13	4	3
318	7	13	2	3
319	1	18	6	3
319	2	18	6	3
319	3	18	6	3
319	4	18	6	3
319	5	18	6	3
319	6	18	6	3
319	7	18	6	3
320	1	12	2	3
320	2	12	2	3
320	3	12	2	3
320	4	12	2	3
320	5	14	4	3
320	6	14	4	3
320	7	12	2	3
257	2	14	2	3
257	3	14	2	3
257	4	14	2	3
257	5	14	6	3
257	6	14	6	3
257	7	14	2	3
637	1	15	3	3
637	2	15	3	3
637	3	15	3	3
637	4	15	3	3
637	5	15	3	3
637	6	15	3	3
637	7	15	3	3
288	1	17	24	3
288	2	17	24	3
288	3	17	24	3
288	4	17	24	3
288	5	17	3	3
288	6	17	3	3
288	7	17	1	3
281	1	13	2	3
281	2	13	2	3
281	3	13	2	3
281	4	13	2	3
281	5	13	2	3
281	6	13	5	3
281	7	13	5	3
638	1	11	24	3
638	2	11	24	3
638	3	11	24	3
638	4	11	24	3
638	5	11	2	3
638	6	11	2	3
638	7	11	24	3
280	1	11	24	3
280	2	11	24	3
280	3	11	24	3
280	4	11	24	3
280	5	11	2	3
280	6	11	2	3
280	7	11	24	3
639	1	17	2	3
639	2	17	2	3
639	3	17	2	3
639	4	17	2	3
639	5	17	2	3
639	6	17	2	3
639	7	17	2	3
258	1	0	24	3
258	2	14	2	3
258	3	14	2	3
258	4	13	2	3
258	5	0	24	3
258	6	0	24	3
889	1	9	12	3
889	2	9	12	3
889	3	9	12	3
889	4	9	12	3
889	5	9	12	3
952	1	12	24	3
952	2	12	24	3
952	3	12	24	3
952	4	12	24	3
952	5	12	1	3
952	6	12	1	3
952	7	12	24	3
899	1	16	1	3
899	2	16	1	3
258	7	0	24	3
640	1	13	2	3
640	2	13	2	3
640	3	13	2	3
640	4	13	2	3
640	5	13	2	3
640	6	13	2	3
640	7	13	2	3
262	1	12	3	3
262	2	12	3	3
262	3	12	3	3
262	4	12	3	3
899	3	16	1	3
899	4	16	1	3
899	5	16	4	3
899	6	16	4	3
899	7	16	1	3
897	1	10	22	3
897	2	10	22	3
303	1	17	2	3
303	2	17	2	3
303	3	17	2	3
303	4	17	2	3
303	5	17	4	3
303	6	17	4	3
303	7	17	2	3
642	1	9	20	3
642	2	9	20	3
642	3	9	20	3
642	4	9	20	3
642	5	9	20	3
642	6	9	20	3
642	7	9	20	3
282	1	12	24	3
282	2	12	24	3
282	3	12	24	3
282	4	12	24	3
282	5	12	6	3
282	6	12	6	3
282	7	12	24	3
284	1	18	24	3
284	2	18	24	3
284	3	18	24	3
284	4	18	24	3
284	5	18	6	3
284	6	18	6	3
284	7	18	24	3
283	1	10	23	3
283	2	10	23	3
283	3	10	23	3
283	4	10	23	3
283	5	10	23	3
283	6	10	23	3
283	7	10	23	3
643	1	16	24	3
643	2	16	24	3
643	3	16	24	3
643	4	16	24	3
643	5	16	24	3
643	6	16	24	3
643	7	16	24	3
644	1	12	24	3
644	2	12	24	3
644	3	12	24	3
644	4	12	24	3
644	5	12	24	3
644	6	12	24	3
644	7	12	24	3
641	1	10	21	3
641	2	10	21	3
641	3	10	21	3
641	4	10	21	3
641	5	10	21	3
641	6	10	21	3
641	7	10	21	3
645	1	15	24	3
645	2	15	24	3
645	3	15	24	3
645	4	15	24	3
645	5	15	3	3
645	6	15	3	3
645	7	15	24	3
649	1	9	12	3
649	2	9	12	3
649	3	9	12	3
649	4	9	12	3
649	5	9	12	3
650	1	15	24	3
650	2	15	24	3
650	3	15	24	3
650	4	15	24	3
650	5	15	1	3
650	6	15	1	3
650	7	15	24	3
286	1	17	24	3
286	2	17	24	3
286	3	17	24	3
286	4	17	24	3
286	5	17	2	3
286	6	17	2	3
286	7	17	24	3
652	1	8	12	3
652	2	8	12	3
652	3	8	12	3
652	4	8	12	3
652	5	8	12	3
656	1	16	2	3
656	2	16	2	3
656	3	16	2	3
656	4	16	2	3
656	5	16	2	3
656	6	16	2	3
656	7	16	2	3
666	1	16	24	3
666	2	16	24	3
666	3	16	24	3
666	4	16	24	3
666	5	16	2	3
666	6	16	2	3
666	7	16	24	3
897	3	10	22	3
897	4	10	22	3
897	5	10	22	3
897	6	10	22	3
897	7	10	22	3
259	1	15	24	3
259	2	15	24	3
259	3	15	24	3
259	4	15	24	3
259	5	15	2	3
259	6	15	2	3
259	7	15	24	3
905	1	14	24	3
905	2	14	24	3
905	3	14	24	3
905	4	14	24	3
905	5	14	2	3
905	6	14	2	3
905	7	14	24	3
1019	1	11	21	3
1019	2	11	21	3
668	1	16	3	3
668	2	16	3	3
668	3	16	3	3
668	4	16	3	3
668	5	16	3	3
668	6	16	3	3
668	7	16	3	3
669	1	18	2	3
669	2	18	2	3
669	3	18	2	3
669	4	18	2	3
669	5	18	6	3
669	6	18	6	3
669	7	18	2	3
670	1	17	3	3
670	2	17	3	3
670	3	17	3	3
670	4	17	3	3
670	5	17	3	3
670	6	17	3	3
670	7	17	3	3
1019	3	11	21	3
1019	4	11	21	3
1019	5	11	21	3
1019	6	11	21	3
1019	7	11	21	3
912	1	18	1	3
912	2	18	1	3
671	1	10	2	3
671	2	10	2	3
671	3	10	2	3
671	4	10	2	3
671	5	15	6	3
671	6	15	6	3
671	7	15	6	3
647	1	7	19	3
647	2	7	20	3
647	3	7	20	3
647	4	7	20	3
647	5	7	20	3
647	6	7	20	3
647	7	7	20	3
912	3	18	1	3
912	4	18	1	3
912	5	18	2	3
912	6	18	2	3
912	7	18	2	3
920	1	11	23	3
920	2	11	23	3
673	1	18	3	3
673	2	18	3	3
673	3	18	3	3
673	4	18	3	3
673	5	18	3	3
673	6	18	3	3
673	7	18	3	3
920	3	11	23	3
920	4	11	23	3
920	5	11	23	3
920	6	11	23	3
920	7	11	23	3
921	1	15	3	3
921	2	15	3	3
674	1	0	24	3
674	2	0	24	3
674	3	0	24	3
674	4	0	24	3
674	5	0	24	3
674	6	0	24	3
674	7	0	24	3
679	1	10	18	3
679	2	10	18	3
679	3	10	18	3
679	4	10	18	3
679	5	10	18	3
679	6	10	17	3
679	7	10	17	3
681	1	9	18	3
681	2	9	18	3
681	3	9	18	3
681	4	9	18	3
681	5	9	18	3
681	6	10	16	3
680	1	10	21	3
680	2	10	21	3
680	3	10	21	3
680	4	10	21	3
680	5	10	21	3
680	6	10	21	3
680	7	10	21	3
682	1	10	18	3
682	2	10	18	3
682	3	10	18	3
682	4	10	18	3
682	5	10	18	3
682	6	10	18	3
683	1	9	20	3
683	2	9	20	3
683	3	9	20	3
683	4	9	20	3
683	5	9	20	3
683	6	9	17	3
683	7	9	16	3
684	1	9	19	3
684	2	9	19	3
684	3	9	19	3
684	4	9	19	3
684	5	9	19	3
684	6	9	19	3
684	7	9	19	3
685	1	10	20	3
685	2	10	20	3
685	3	10	20	3
685	4	10	20	3
685	5	10	20	3
685	6	10	20	3
685	7	10	20	3
686	1	10	21	3
686	2	10	21	3
686	3	10	21	3
686	4	10	21	3
686	5	10	21	3
686	6	10	21	3
686	7	10	21	3
687	1	10	20	3
687	2	10	20	3
687	3	10	20	3
687	4	10	20	3
687	5	10	20	3
687	6	10	19	3
687	7	10	19	3
262	5	12	6	3
262	6	12	6	3
262	7	12	3	3
713	1	18	2	3
713	2	18	2	3
713	3	18	2	3
713	4	18	2	3
713	5	18	4	3
713	6	18	4	3
713	7	18	2	3
291	2	18	2	3
291	3	18	2	3
291	4	18	2	3
291	5	18	4	3
291	6	18	4	3
291	7	18	2	3
733	1	15	2	3
733	2	15	2	3
733	3	15	2	3
733	4	15	2	3
733	5	15	5	3
733	6	15	5	3
733	7	17	2	3
734	1	18	4	3
714	1	12	6	3
714	2	12	6	3
714	3	12	6	3
714	4	12	6	3
714	5	12	6	3
714	6	12	6	3
714	7	12	6	3
719	1	12	2	3
719	2	12	2	3
719	3	12	2	3
719	4	12	2	3
719	5	12	4	3
719	6	12	4	3
719	7	12	2	3
296	1	14	2	3
296	2	14	2	3
296	3	14	2	3
296	4	14	2	3
296	5	14	6	3
296	6	14	6	3
296	7	14	2	3
718	1	12	24	3
718	2	12	24	3
718	3	12	24	3
718	4	12	24	3
718	5	12	1	3
718	6	12	1	3
718	7	12	24	3
720	1	12	2	3
720	2	12	2	3
720	3	12	2	3
720	4	12	2	3
720	5	12	4	3
720	6	12	4	3
720	7	12	2	3
289	1	12	4	3
289	2	12	4	3
289	3	12	4	3
289	4	12	4	3
289	5	12	4	3
289	6	12	4	3
289	7	12	4	3
721	1	12	2	3
721	2	12	2	3
721	3	12	2	3
721	4	12	2	3
721	5	12	2	3
721	6	12	2	3
721	7	12	2	3
734	2	18	4	3
734	3	18	4	3
734	4	18	4	3
734	5	18	5	3
734	6	18	5	3
734	7	18	4	3
735	1	13	2	3
735	2	13	2	3
735	3	13	2	3
735	4	13	2	3
735	5	13	2	3
735	6	13	2	3
735	7	13	2	3
736	1	13	2	3
736	2	13	2	3
736	3	13	2	3
736	4	13	2	3
736	5	13	4	3
736	6	13	4	3
736	7	13	2	3
738	1	0	24	3
738	2	0	24	3
738	3	0	24	3
738	4	0	24	3
738	5	0	24	3
738	6	0	24	3
738	7	0	24	3
254	1	11	2	3
254	2	11	2	3
254	3	11	2	3
254	4	11	2	3
254	5	11	5	3
254	6	11	5	3
740	1	9	13	3
740	2	9	13	3
740	3	9	13	3
740	4	9	13	3
740	5	9	13	3
741	1	16	2	3
741	2	16	2	3
741	3	16	2	3
741	4	16	2	3
741	5	16	5	3
741	6	16	5	3
741	7	16	2	3
742	1	16	4	3
742	2	16	4	3
742	3	16	4	3
742	4	16	4	3
742	5	16	4	3
742	6	16	4	3
742	7	16	4	3
254	7	11	2	3
304	1	12	2	3
304	2	12	2	3
304	3	12	2	3
304	4	12	2	3
304	5	12	2	3
304	6	12	2	3
304	7	12	2	3
270	1	11	24	3
270	2	11	24	3
270	3	11	24	3
270	4	11	24	3
270	5	11	24	3
745	1	14	2	3
745	2	14	2	3
745	3	14	2	3
745	4	14	2	3
745	5	14	4	3
745	6	14	4	3
745	7	14	2	3
747	1	16	2	3
747	2	16	2	3
747	3	16	2	3
747	4	16	2	3
747	5	16	6	3
747	6	16	6	3
747	7	16	2	3
748	1	8	13	3
748	2	8	13	3
748	3	8	13	3
748	4	8	13	3
748	5	8	13	3
749	1	16	3	3
749	2	16	3	3
749	3	16	3	3
749	4	16	3	3
749	5	16	5	3
749	6	16	5	3
749	7	16	3	3
750	1	13	19	3
750	2	13	19	3
750	3	13	19	3
750	4	13	19	3
750	5	13	19	3
750	6	13	18	3
746	1	10	22	3
746	2	10	22	3
746	3	10	22	3
746	4	10	22	3
746	5	10	22	3
746	6	10	22	3
746	7	10	22	3
739	1	8	18	3
739	2	8	18	3
739	3	8	18	3
739	4	8	18	3
739	5	8	18	3
744	1	10	20	3
744	2	10	20	3
744	3	10	20	3
744	4	10	20	3
744	5	10	20	3
744	6	10	20	3
744	7	10	20	3
753	1	14	2	3
753	2	14	2	3
753	3	14	2	3
753	4	14	2	3
753	5	14	4	3
753	6	14	4	3
753	7	14	2	3
754	1	12	2	3
754	2	12	2	3
754	3	12	2	3
754	4	12	2	3
754	5	12	4	3
754	6	12	4	3
754	7	12	2	3
755	1	13	1	3
755	2	13	1	3
755	3	13	1	3
755	4	13	1	3
755	5	13	1	3
755	6	13	1	3
755	7	13	1	3
756	1	11	2	3
756	2	11	2	3
756	3	11	2	3
756	4	11	2	3
756	5	11	5	3
756	6	11	5	3
756	7	11	2	3
297	1	12	2	3
297	2	12	2	3
297	3	12	2	3
297	4	12	2	3
297	5	12	2	3
297	6	14	2	3
297	7	14	2	3
757	1	13	2	3
757	2	13	2	3
757	3	13	2	3
757	4	13	2	3
757	5	1	4	3
757	6	1	4	3
757	7	1	2	3
743	1	10	21	3
743	2	10	21	3
743	3	10	21	3
743	4	10	21	3
743	5	10	21	3
743	6	10	21	3
743	7	10	21	3
293	1	18	4	3
293	2	18	4	3
293	3	18	4	3
293	4	18	4	3
293	5	18	6	3
293	6	18	6	3
293	7	18	6	3
758	1	9	18	3
758	2	9	18	3
758	3	9	18	3
758	4	9	18	3
758	5	9	18	3
759	1	12	2	3
759	2	12	2	3
759	3	12	2	3
759	4	12	2	3
759	5	12	2	3
759	6	12	2	3
759	7	12	2	3
760	1	14	24	3
760	2	14	24	3
760	3	14	24	3
760	4	14	24	3
760	5	14	24	3
760	6	14	24	3
760	7	14	24	3
751	1	10	22	3
751	2	10	22	3
751	3	10	22	3
751	4	10	22	3
751	5	10	22	3
751	6	10	22	3
751	7	10	22	3
761	1	9	18	3
761	2	9	18	3
761	3	9	18	3
761	4	9	18	3
761	5	9	18	3
761	6	9	14	3
762	1	14	2	3
762	2	14	2	3
762	3	14	2	3
762	4	14	2	3
762	5	14	2	3
762	6	12	2	3
762	7	12	2	3
763	1	10	22	3
763	2	10	22	3
763	3	10	22	3
763	4	10	22	3
763	5	10	22	3
763	6	10	22	3
763	7	10	22	3
764	1	16	2	3
764	2	16	2	3
764	3	16	2	3
764	4	16	2	3
764	5	16	2	3
764	6	16	2	3
764	7	16	2	3
765	1	19	2	3
765	2	19	2	3
765	3	19	2	3
765	4	19	2	3
765	5	19	5	3
765	6	19	5	3
765	7	19	2	3
766	1	16	2	3
766	2	16	2	3
766	3	16	2	3
766	4	16	2	3
766	5	16	4	3
766	6	16	4	3
766	7	16	4	3
298	1	18	2	3
298	2	18	2	3
298	3	18	2	3
298	4	18	2	3
298	5	18	5	3
298	6	18	5	3
298	7	18	2	3
767	1	10	22	3
767	2	10	22	3
767	3	10	22	3
767	4	10	22	3
767	5	10	22	3
767	6	10	22	3
767	7	10	22	3
768	1	17	2	3
768	2	17	2	3
768	3	17	2	3
768	4	17	2	3
768	5	17	2	3
768	6	17	2	3
768	7	17	2	3
769	1	16	24	3
769	2	16	24	3
769	3	16	24	3
769	4	16	24	3
769	5	16	24	3
769	6	16	24	3
769	7	16	24	3
771	1	18	1	3
771	2	18	1	3
771	3	18	1	3
771	4	18	1	3
771	5	18	3	3
771	6	18	3	3
771	7	18	1	3
772	1	16	2	3
772	2	16	2	3
772	3	16	2	3
772	4	16	2	3
772	5	16	4	3
772	6	16	4	3
772	7	16	2	3
774	1	9	13	3
774	2	9	13	3
774	3	9	13	3
774	4	9	13	3
774	5	9	13	3
770	1	10	21	3
770	2	10	21	3
770	3	10	21	3
770	4	10	21	3
770	5	10	21	3
770	6	10	21	3
770	7	10	21	3
775	1	10	22	3
775	2	10	22	3
775	3	10	22	3
775	4	10	22	3
775	5	10	22	3
775	6	10	22	3
775	7	10	22	3
777	1	18	2	3
777	2	18	2	3
777	3	18	2	3
777	4	18	2	3
777	5	18	2	3
777	6	18	2	3
777	7	18	2	3
773	1	10	13	3
773	2	10	13	3
773	3	10	13	3
773	4	10	13	3
773	5	10	13	3
773	6	10	13	3
773	7	10	13	3
776	1	8	20	3
776	2	8	20	3
776	3	8	20	3
776	4	8	20	3
776	5	8	20	3
776	6	8	20	3
776	7	8	20	3
779	1	11	23	3
779	2	11	23	3
779	3	11	23	3
779	4	11	23	3
779	5	11	23	3
779	6	11	23	3
779	7	11	23	3
780	1	8	1	3
780	2	8	1	3
780	3	8	1	3
780	4	8	1	3
780	5	8	1	3
780	6	8	1	3
780	7	8	1	3
781	1	16	2	3
781	2	16	2	3
781	3	16	2	3
781	4	16	2	3
781	5	16	2	3
781	6	16	2	3
781	7	16	2	3
782	1	18	2	3
782	2	18	2	3
782	3	18	2	3
782	4	18	2	3
782	5	18	5	3
782	6	18	5	3
782	7	18	2	3
784	1	12	2	3
784	2	12	2	3
784	3	12	2	3
784	4	12	2	3
784	5	12	4	3
784	6	12	4	3
784	7	12	2	3
778	1	10	21	3
778	2	10	21	3
778	3	10	21	3
778	4	10	21	3
778	5	10	21	3
778	6	10	21	3
778	7	10	21	3
792	1	12	23	3
792	2	12	23	3
792	3	12	23	3
792	4	12	23	3
792	5	12	23	3
792	6	12	23	3
792	7	12	23	3
793	1	12	22	3
793	2	12	22	3
793	3	12	22	3
793	4	12	22	3
793	5	12	22	3
793	6	12	22	3
793	7	12	22	3
794	1	10	20	3
794	2	10	20	3
794	3	10	20	3
794	4	10	20	3
794	5	10	20	3
794	6	10	20	3
794	7	10	20	3
795	1	10	23	3
795	2	10	23	3
795	3	10	23	3
795	4	10	23	3
795	5	10	23	3
795	6	10	23	3
795	7	10	23	3
796	1	10	21	3
796	2	10	21	3
796	3	10	21	3
796	4	10	21	3
796	5	10	21	3
796	6	10	21	3
796	7	10	21	3
270	6	11	24	3
270	7	11	24	3
827	1	12	3	3
827	2	12	3	3
827	3	12	3	3
827	4	12	3	3
827	5	12	3	3
827	6	12	3	3
827	7	12	3	3
828	1	11	2	3
828	2	11	2	3
828	3	11	2	3
828	4	11	2	3
828	5	11	3	3
828	6	11	3	3
828	7	11	2	3
278	1	12	2	3
278	2	12	2	3
278	3	12	2	3
278	4	12	2	3
278	5	12	4	3
278	6	12	4	3
278	7	12	2	3
829	1	12	1	3
829	2	12	1	3
829	3	12	1	3
829	4	12	1	3
829	5	12	3	3
829	6	12	3	3
829	7	12	1	3
830	1	15	3	3
830	2	15	3	3
830	3	15	3	3
830	4	15	3	3
830	5	15	3	3
830	6	15	3	3
830	7	15	3	3
831	1	13	1	3
799	1	11	22	3
799	2	11	22	3
799	3	11	22	3
799	4	11	22	3
799	5	11	22	3
799	6	11	22	3
799	7	11	22	3
800	1	12	22	3
800	2	12	22	3
800	3	12	22	3
800	4	12	22	3
800	5	12	24	3
800	6	12	24	3
800	7	12	22	3
798	1	10	20	3
798	2	10	20	3
798	3	10	20	3
798	4	10	20	3
798	5	10	20	3
798	6	10	20	3
798	7	10	20	3
801	1	11	20	3
801	2	11	20	3
801	3	11	20	3
801	4	11	20	3
801	5	11	20	3
801	6	11	20	3
801	7	11	20	3
802	1	12	22	3
802	2	12	22	3
802	3	12	22	3
802	4	12	22	3
802	5	12	22	3
802	6	15	22	3
802	7	15	22	3
803	1	10	22	3
803	2	10	22	3
803	3	10	22	3
803	4	10	22	3
803	5	10	22	3
803	6	10	22	3
803	7	10	22	3
804	1	10	20	3
804	2	10	20	3
804	3	10	20	3
804	4	10	20	3
804	5	10	20	3
804	6	10	20	3
804	7	10	20	3
805	1	12	2	3
805	2	12	2	3
805	3	12	2	3
805	4	12	2	3
805	5	12	2	3
805	6	12	2	3
805	7	12	2	3
806	1	10	22	3
806	2	10	22	3
806	3	10	22	3
806	4	10	22	3
806	5	10	22	3
806	6	10	22	3
806	7	10	22	3
807	1	10	22	3
807	2	10	22	3
807	3	10	22	3
807	4	10	22	3
807	5	10	22	3
807	6	10	22	3
807	7	10	22	3
808	1	10	19	3
808	2	10	19	3
808	3	10	19	3
808	4	10	19	3
808	5	10	19	3
808	6	11	19	3
808	7	11	19	3
809	1	12	24	3
809	2	12	24	3
809	3	12	24	3
809	4	12	24	3
809	5	12	24	3
809	6	12	24	3
809	7	12	24	3
810	1	11	20	3
810	2	11	20	3
810	3	11	20	3
810	4	11	20	3
810	5	11	20	3
810	6	11	18	3
835	7	14	4	3
836	1	14	24	3
836	2	14	24	3
836	3	14	24	3
836	4	14	24	3
836	5	14	2	3
836	6	14	2	3
836	7	14	24	3
837	1	11	2	3
837	2	11	2	3
837	3	11	2	3
837	4	11	2	3
837	5	11	2	3
837	6	11	2	3
837	7	11	2	3
838	1	17	24	3
838	2	17	24	3
838	3	17	24	3
838	4	17	24	3
838	5	17	24	3
838	6	17	24	3
838	7	17	24	3
839	1	14	2	3
839	2	14	2	3
839	3	14	2	3
839	4	14	2	3
839	5	14	2	3
839	6	14	2	3
839	7	14	2	3
840	1	12	3	3
840	2	12	3	3
840	3	12	3	3
840	4	12	3	3
840	5	12	3	3
840	6	12	3	3
840	7	12	3	3
841	1	13	1	3
841	2	13	1	3
841	3	13	1	3
841	4	13	1	3
841	5	13	1	3
841	6	13	3	3
841	7	14	1	3
921	3	15	3	3
921	4	15	3	3
921	5	15	3	3
921	6	15	3	3
921	7	15	3	3
922	1	15	3	3
922	2	15	3	3
842	1	10	2	3
842	2	10	2	3
842	3	10	2	3
842	4	10	2	3
842	5	10	2	3
842	6	10	2	3
842	7	10	2	3
843	1	12	1	3
843	2	12	1	3
843	3	12	1	3
843	4	12	1	3
843	5	12	1	3
843	6	12	1	3
843	7	12	1	3
272	1	12	2	3
272	2	12	2	3
272	3	12	2	3
272	4	12	2	3
272	5	12	3	3
272	6	12	3	3
272	7	12	2	3
301	1	12	3	3
301	2	12	3	3
301	3	12	3	3
301	4	12	3	3
301	5	12	6	3
301	6	12	6	3
301	7	12	3	3
256	1	14	3	3
256	2	14	3	3
256	3	14	3	3
256	4	14	3	3
256	5	14	3	3
256	6	14	3	3
256	7	14	3	3
846	1	14	2	3
846	2	14	2	3
846	3	14	2	3
846	4	14	2	3
846	5	14	4	3
846	6	14	4	3
846	7	14	2	3
848	1	11	24	3
848	2	11	24	3
848	3	11	24	3
848	4	11	24	3
848	5	11	1	3
848	6	11	1	3
848	7	11	24	3
255	1	12	6	3
255	2	12	6	3
255	3	12	6	3
255	4	12	6	3
255	5	12	6	3
255	6	12	6	3
255	7	12	6	3
849	1	12	5	3
849	2	12	5	3
849	3	12	5	3
849	4	12	5	3
849	5	12	6	3
849	6	15	6	3
849	7	15	5	3
850	1	11	4	3
850	2	11	4	3
850	3	11	4	3
850	4	11	4	3
850	5	11	4	3
850	6	11	4	3
850	7	11	4	3
851	1	12	1	3
851	2	12	1	3
851	3	12	1	3
851	4	12	1	3
851	5	12	3	3
851	6	12	3	3
851	7	12	1	3
279	1	14	3	3
279	2	14	3	3
279	3	14	3	3
279	4	14	3	3
279	5	14	3	3
279	6	14	3	3
279	7	14	3	3
852	1	14	24	3
852	2	14	24	3
852	3	14	24	3
852	4	14	24	3
852	5	14	24	3
852	6	14	24	3
852	7	14	24	3
853	1	11	2	3
853	2	11	2	3
853	3	11	2	3
853	4	11	2	3
853	5	11	2	3
853	6	11	2	3
853	7	11	2	3
854	1	11	22	3
854	2	11	22	3
854	3	11	22	3
854	4	11	22	3
854	5	11	24	3
854	6	12	24	3
854	7	12	22	3
273	1	15	1	3
273	2	15	1	3
273	3	15	1	3
273	4	15	1	3
273	5	15	1	3
273	6	15	1	3
273	7	15	1	3
855	1	13	24	3
855	2	13	24	3
855	3	13	24	3
855	4	13	24	3
855	5	13	24	3
855	6	13	24	3
855	7	15	24	3
856	1	13	1	3
856	2	13	1	3
856	3	13	1	3
856	4	13	1	3
856	5	13	1	3
856	6	13	1	3
856	7	13	1	3
857	1	12	23	3
857	2	12	23	3
857	3	12	23	3
857	4	12	23	3
857	5	12	2	3
857	6	12	2	3
857	7	12	23	3
858	1	12	2	3
858	2	12	2	3
858	3	12	2	3
858	4	12	2	3
858	5	0	24	3
858	6	0	24	3
858	7	12	2	3
859	1	10	5	3
859	2	10	5	3
859	3	10	5	3
859	4	10	5	3
859	5	10	5	3
859	6	10	5	3
859	7	10	5	3
860	1	14	2	3
860	2	14	2	3
860	3	14	2	3
860	4	14	2	3
860	5	14	2	3
860	6	14	2	3
860	7	14	2	3
861	1	14	24	3
861	2	14	24	3
861	3	14	24	3
861	4	14	24	3
861	5	14	24	3
861	6	14	24	3
861	7	14	24	3
862	1	12	2	3
862	2	12	2	3
862	3	12	2	3
862	4	12	2	3
862	5	12	2	3
862	6	12	2	3
862	7	12	2	3
863	1	12	2	3
863	2	12	2	3
863	3	12	2	3
863	4	12	2	3
863	5	12	2	3
863	6	12	2	3
863	7	12	2	3
864	1	15	24	3
864	2	15	24	3
864	3	15	24	3
864	4	15	24	3
864	5	15	24	3
864	6	15	24	3
864	7	15	24	3
865	1	11	24	3
865	2	11	24	3
865	3	11	24	3
865	4	11	24	3
865	5	11	2	3
865	6	11	2	3
865	7	11	24	3
866	1	16	3	3
866	2	16	3	3
866	3	16	3	3
866	4	16	3	3
866	5	16	3	3
866	6	16	3	3
866	7	16	3	3
867	1	13	2	3
867	2	13	2	3
867	3	13	2	3
867	4	13	2	3
867	5	13	2	3
867	6	13	2	3
867	7	13	2	3
868	1	12	3	3
868	2	12	3	3
868	3	12	3	3
868	4	12	3	3
868	5	12	3	3
868	6	12	3	3
868	7	12	3	3
869	1	16	2	3
869	2	16	2	3
869	3	16	2	3
869	4	16	2	3
869	5	16	2	3
869	6	16	4	3
869	7	16	4	3
870	1	12	24	3
870	2	12	24	3
870	3	12	24	3
870	4	12	24	3
870	5	12	3	3
870	6	12	3	3
870	7	12	24	3
871	1	11	5	3
871	2	11	5	3
871	3	11	5	3
871	4	11	5	3
871	5	11	5	3
871	6	11	5	3
871	7	11	5	3
277	1	18	1	3
277	2	18	1	3
277	3	18	1	3
277	4	18	1	3
277	5	18	2	3
277	6	18	2	3
277	7	18	1	3
872	1	12	2	3
872	2	12	2	3
872	3	12	2	3
872	4	12	2	3
872	5	12	2	3
872	6	12	2	3
872	7	12	2	3
873	1	16	24	3
873	2	16	24	3
873	3	16	24	3
873	4	16	24	3
873	5	16	24	3
873	6	16	24	3
873	7	16	24	3
874	1	0	24	3
874	2	0	24	3
874	3	0	24	3
874	4	0	24	3
874	5	0	24	3
874	6	0	24	3
874	7	0	24	3
875	1	12	1	3
875	2	12	1	3
875	3	12	1	3
875	4	12	1	3
875	5	12	3	3
875	6	12	3	3
875	7	12	1	3
922	3	15	3	3
922	4	15	3	3
922	5	15	3	3
922	6	15	3	3
922	7	15	3	3
923	1	17	3	3
923	2	17	3	3
876	1	12	2	3
876	2	12	2	3
876	3	12	2	3
876	4	12	2	3
876	5	12	4	3
876	6	12	4	3
876	7	12	2	3
877	1	12	2	3
877	2	12	2	3
877	3	12	2	3
877	4	12	2	3
877	5	12	3	3
877	6	14	3	3
877	7	14	2	3
878	1	12	2	3
878	2	12	2	3
878	3	12	2	3
878	4	12	2	3
878	5	12	2	3
878	6	12	2	3
878	7	12	2	3
879	1	11	22	3
879	2	11	22	3
879	3	11	22	3
879	4	11	22	3
879	5	11	22	3
879	6	11	22	3
879	7	11	22	3
880	1	21	2	3
880	2	21	2	3
880	3	21	2	3
880	4	21	2	3
880	5	20	3	3
880	6	20	3	3
880	7	20	3	3
881	1	14	2	3
881	2	14	2	3
881	3	14	2	3
881	4	14	2	3
881	5	14	4	3
881	6	14	4	3
881	7	14	2	3
847	1	13	24	3
847	2	13	24	3
847	3	13	24	3
847	4	13	24	3
847	5	13	24	3
847	6	13	1	3
847	7	13	1	3
882	1	10	24	3
882	2	10	24	3
882	3	10	24	3
882	4	10	24	3
882	5	10	24	3
882	6	10	24	3
882	7	10	24	3
883	1	16	1	3
883	2	16	1	3
883	3	16	1	3
883	4	16	1	3
883	5	16	3	3
883	6	16	3	3
883	7	16	1	3
923	3	17	3	3
923	4	17	3	3
923	5	17	3	3
923	6	17	3	3
923	7	17	3	3
1020	1	10	21	3
1020	2	10	21	3
1020	3	10	21	3
1020	4	10	21	3
1020	5	10	21	3
1020	6	10	21	3
1020	7	10	21	3
1021	1	11	22	3
1021	2	11	22	3
1021	3	11	22	3
1021	4	11	22	3
1021	5	11	22	3
1021	6	11	22	3
1021	7	11	22	3
1025	1	10	20	3
1025	2	10	20	3
1025	3	10	20	3
1025	4	10	20	3
1025	5	10	20	3
1025	6	11	18	3
929	1	17	2	3
929	2	17	2	3
929	3	17	2	3
929	4	17	2	3
929	5	17	3	3
929	6	17	3	3
929	7	17	2	3
932	1	17	1	3
932	2	17	1	3
932	3	17	1	3
932	4	17	1	3
932	5	17	3	3
932	6	17	3	3
932	7	17	1	3
1018	1	11	23	3
1018	2	11	23	3
1018	3	11	23	3
1018	4	11	23	3
1018	5	11	23	3
1018	6	11	23	3
1018	7	11	23	3
940	1	15	1	3
940	2	15	1	3
940	3	15	1	3
940	4	15	1	3
940	5	15	4	3
940	6	15	4	3
940	7	15	1	3
941	1	15	3	3
941	2	15	3	3
941	3	15	3	3
941	4	15	3	3
941	5	15	3	3
941	6	15	6	3
941	7	15	6	3
949	1	8	13	3
949	2	8	13	3
949	3	8	13	3
949	4	8	13	3
949	5	8	13	3
1027	1	12	24	3
1027	2	12	24	3
1027	3	12	24	3
1027	4	12	24	3
1027	5	12	1	3
1027	6	12	1	3
1027	7	12	24	3
1028	1	10	22	3
933	1	10	21	3
933	2	10	21	3
933	3	10	21	3
933	4	10	21	3
933	5	10	21	3
933	6	10	21	3
933	7	10	21	3
1028	2	10	22	3
1028	3	10	22	3
1028	4	10	22	3
1028	5	10	22	3
1028	6	10	22	3
1028	7	10	22	3
1030	1	10	22	3
951	1	12	1	3
951	2	12	1	3
951	3	12	1	3
951	4	12	1	3
951	5	12	2	3
951	6	12	2	3
951	7	12	1	3
1030	2	10	22	3
1030	3	10	22	3
1030	4	10	22	3
1030	5	10	22	3
1030	6	10	22	3
1030	7	10	22	3
1031	1	11	23	3
1031	2	11	23	3
1031	3	11	23	3
1031	4	11	23	3
1031	5	11	23	3
1031	6	11	23	3
1031	7	11	23	3
960	1	15	2	3
960	2	15	2	3
960	3	15	2	3
960	4	15	2	3
960	5	15	2	3
960	6	14	2	3
960	7	14	2	3
962	1	15	2	3
962	2	15	2	3
962	3	15	2	3
962	4	15	2	3
962	5	15	2	3
962	6	15	4	3
962	7	15	4	3
967	1	16	24	3
967	2	16	24	3
967	3	16	24	3
967	4	16	24	3
967	5	16	2	3
967	6	16	2	3
967	7	16	24	3
968	1	8	17	3
968	2	8	17	3
968	3	8	17	3
968	4	8	17	3
968	5	8	17	3
970	1	15	3	3
970	2	15	3	3
970	3	15	3	3
970	4	15	3	3
970	5	15	5	3
970	6	15	5	3
970	7	15	5	3
971	1	8	12	3
971	2	8	12	3
971	3	8	12	3
971	4	8	12	3
971	5	8	12	3
973	1	12	24	3
973	2	12	24	3
973	3	12	24	3
973	4	12	24	3
973	5	12	2	3
973	6	12	2	3
973	7	14	22	3
974	1	18	2	3
974	2	18	2	3
974	3	18	2	3
974	4	18	2	3
974	5	18	6	3
974	6	18	6	3
974	7	18	6	3
975	1	15	2	3
975	2	15	2	3
975	3	15	2	3
975	4	15	2	3
975	5	15	6	3
975	6	15	6	3
975	7	15	2	3
976	1	18	24	3
976	2	18	24	3
976	3	18	24	3
976	4	18	24	3
976	5	18	2	3
976	6	18	2	3
976	7	18	24	3
977	1	17	1	3
977	2	17	1	3
977	3	17	1	3
977	4	17	1	3
977	5	17	5	3
977	6	17	5	3
977	7	17	1	3
979	1	16	24	3
979	2	16	24	3
979	3	16	24	3
979	4	16	24	3
979	5	16	2	3
979	6	16	2	3
979	7	16	2	3
980	1	14	24	3
980	2	14	24	3
980	3	14	24	3
980	4	14	24	3
980	5	14	24	3
980	6	14	24	3
980	7	14	24	3
1032	1	11	22	3
1032	2	11	22	3
1032	3	11	22	3
1032	4	11	22	3
1032	5	11	22	3
1032	6	11	22	3
1032	7	11	22	3
982	1	17	24	3
982	2	17	24	3
982	3	17	24	3
982	4	17	24	3
982	5	17	24	3
982	6	17	24	3
982	7	17	24	3
1029	1	10	21	3
1029	2	10	21	3
1029	3	10	21	3
1029	4	10	21	3
1029	5	10	21	3
985	1	17	2	3
985	2	17	2	3
985	3	17	2	3
985	4	17	2	3
985	5	17	2	3
985	6	17	2	3
985	7	17	2	3
986	1	13	23	3
986	2	13	23	3
986	3	13	23	3
986	4	13	23	3
986	5	13	23	3
986	6	13	23	3
986	7	13	23	3
988	1	9	18	3
988	2	9	18	3
988	3	9	18	3
988	4	9	18	3
988	5	9	18	3
989	1	9	13	3
989	2	9	13	3
989	3	9	13	3
989	4	9	13	3
989	5	9	13	3
989	6	9	12	3
991	1	18	24	3
991	2	18	24	3
991	3	18	24	3
991	4	18	24	3
991	5	18	1	3
991	6	18	1	3
991	7	18	1	3
990	1	10	22	3
990	2	10	22	3
990	3	10	22	3
990	4	10	22	3
990	5	10	22	3
990	6	10	22	3
990	7	10	22	3
992	1	9	20	3
992	2	9	20	3
992	3	9	20	3
992	4	9	20	3
992	5	9	20	3
992	6	10	18	3
992	7	11	17	3
987	1	8	20	3
987	2	8	20	3
987	3	8	20	3
987	4	8	20	3
987	5	8	20	3
987	6	8	20	3
987	7	8	20	3
993	1	12	24	3
993	2	12	24	3
993	3	12	24	3
993	4	12	24	3
993	5	12	24	3
993	6	12	1	3
993	7	12	1	3
984	1	9	21	3
984	2	9	21	3
984	3	9	21	3
984	4	9	21	3
984	5	9	21	3
984	6	9	21	3
984	7	9	21	3
994	1	9	18	3
994	2	9	18	3
994	3	9	18	3
994	4	9	18	3
994	5	9	18	3
995	1	10	20	3
995	2	10	20	3
995	3	10	20	3
995	4	10	20	3
995	5	10	20	3
995	6	10	20	3
995	7	10	20	3
996	1	8	22	3
996	2	8	22	3
996	3	8	22	3
996	4	8	22	3
996	5	8	22	3
996	6	8	22	3
996	7	8	22	3
997	1	8	17	3
997	2	8	17	3
997	3	8	17	3
997	4	8	17	3
997	5	8	17	3
997	6	8	13	3
924	1	10	22	3
924	2	10	22	3
924	3	10	22	3
924	4	10	22	3
924	5	10	22	3
924	6	10	22	3
924	7	10	22	3
998	1	15	2	3
998	2	15	2	3
998	3	15	2	3
998	4	15	2	3
998	5	15	3	3
998	6	15	3	3
998	7	15	2	3
1004	1	9	18	3
1004	2	9	18	3
1004	3	9	18	3
1004	4	9	18	3
1004	5	9	18	3
1004	6	9	18	3
1004	7	9	18	3
1005	1	11	1	3
1005	2	11	1	3
1005	3	11	1	3
1005	4	11	1	3
1005	5	11	1	3
1005	6	12	3	3
1005	7	12	3	3
1029	6	10	21	3
1029	7	10	21	3
1034	1	14	24	3
1034	2	14	24	3
1034	3	14	24	3
1034	4	14	24	3
1034	5	14	24	3
1034	6	14	24	3
1034	7	14	24	3
1026	1	10	22	3
1026	2	10	22	3
1026	3	10	22	3
1026	4	10	22	3
1026	5	10	22	3
1026	6	10	22	3
1026	7	10	22	3
1035	1	9	21	3
1035	2	9	21	3
1035	3	9	21	3
1035	4	9	21	3
1035	5	9	21	3
1035	6	9	21	3
1035	7	9	21	3
1036	1	10	21	3
1036	2	10	21	3
1036	3	10	21	3
1036	4	10	21	3
1036	5	10	21	3
1036	6	10	21	3
1036	7	10	21	3
1037	1	10	18	3
1037	2	10	18	3
1037	3	10	18	3
1037	4	10	18	3
1037	5	10	18	3
\.


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shops (id, name, address, phone, site, inst, vk, city_id, organization_id, user_id, short_desc, description, parking, alcohol, food, veranda, console, board, lat, lon, enabled, active, seo_title, seo_desc, seo_keys, seo_translit, file_id, rating, old_id, two_gis) FROM stdin;
256	Habibi	Улица Тельмана, 15	+7(843)253-06-67	\N	https://instagram.com/habibikzn/	https://vk.com/habibi_kzn	551487	1	1	Habibi - это именно то место, где тебе всегда рады, у нас ты можешь насладиться дымным кальяном и великолепными чаями, найти новых друзей, привезти к нам своих друзей, познакомиться с интересными людьми и вместе хорошо провести время.	"Habibi" - это именно то место, где тебе всегда рады, у нас ты можешь насладиться дымным кальяном и великолепными чаями, найти новых друзей, привезти к нам своих друзей, познакомиться с интересными людьми и вместе хорошо провести время, расслабиться от повседневной суеты, поиграть в настольные и видео игры,насладиться просмотром фильмов или просто почитать книги.\n\nКаждый кто приходит к нам – наш гость, для которого мы готовы предложить: \n● Ароматные Кальяны\n● Волшебные Чаи\n● Вкусный Кофе\n● Уютная Атмосфера\n● Развлечения на любой вкус\n● Free WI-FI\n● VIP зал \n● Кинозал	t	t	f	f	f	f	55.7989	49.1223	t	f	Кальянная Habibi | Kazan	Кальянная Habibi в городе Казань находится по адресу улица Тельмана, 15. Habibi - это именно то место, где тебе всегда рады, у нас ты можешь насладиться дымным кальяном и великолепными чаями, найти новых друзей, привезти к нам своих друзей, познакомиться с интересными людьми и вместе хорошо провести время.	\N	kalyannaya-habibi-kazan	23	\N	313	f
257	Hubble Bubble	Энгельса, 21	+7(842)275-76-46	\N	https://instagram.com/hubble_bubble_ulyanovsk	https://vk.com/kalyan_ulsk	479123	1	1	У нас не только вкусные и дымные кальяны, но и замечательный коллектив,который порадует вас живым общением и дельными советами.	<p>Кальянная в замечательном городе Ульяновск "Hubble Bubble" Shop &amp; Lounge. В нашей кальянной вы можете найти больший выбор табака.Мы заботимся о своей репутации и о Вашем комфорте. Заказывая у нас Вы можете быть уверены в качестве и вкусе кальяна.</p><p>Будем рады приветствовать Вас в нашем заведении. Располагаемся мы по ул. Энгельса, 21.</p>	f	f	f	f	f	f	54.3165	48.3928	t	f	Кальянная Hubble Bubble | Ульяновск	Кальянная Hubble Bubble в городе Ульяновск располагается по адресу Энегельса,21	\N	hubble-bubble	34	\N	314	f
292	Hookah Smoke	Обская, 2	+7(937)353‒63‒33	\N	https://www.instagram.com/hookah_smoke_ufa/	https://vk.com/hookah_smoke_ufa	479561	1	1	Кальян, чай, wifi zone, настольные игры	<p>Кальян, чай, wifi zone, настольные игры.</p>	f	f	f	f	f	f	54.7159	56.0011	t	f	Кальянная Hookah Smoke | Уфа	Кальянная Hookah Smoke в Уфе по улице Обская, 2	\N	kalyannaya-hookah-smoke-ufa	391	\N	358	f
259	ДЫМ	проспект Карла Маркса, 364в	+7 927 016-75-54	\N	https://instagram.com/dblmagan63	https://vk.com/dblmagan	499099	1	1	У нас в заведении есть бесплатный Wi-fi, а так же наша кальнная самая уютная, где можно хорошо расслабиться после дневной суеты !Приемлемые цены , а главное - отменные кальяны и шикарное обслуживание !	В Кировском районе Самары, недалеко от станции метро &quot;Безымянка&quot; находится уютная кальянная &quot;ДЫМ&quot;. Помимо ароматных кальянов, гостей здесь ждет огромный выбор чая из разных уголков планеты, а также непринужденная дружеская атмосфера. Интерьер кальянной выполнен в светлых тонах, стены до половины отделаны кирпичом, как и колонны с барной стойкой. В зале для гостей размещены лаконичные столики и темные стулья, есть и мягкие зоны с комфортными белыми диванчиками. Кальянная &quot;ДЫМ&quot; - это место, в котором каждый может окунуться в атмосферу непринужденного отдыха, насладиться изысканным сочетанием ароматов и вкусов кальяна, раскрыть всю глубину благородного чая, забыв о суете окружающего мира.\n\nКальянная &amp; Гриль бар «ДЫМ» приглашает вас на:\n-Ароматный и дымный кальян\n-Огромные роллы и суши\n-Вкуснейшее и сочное мясо на гриле\n-Большой выбор настольных игр\n-Кинопоказы лучших фильмов каждый ВТ, ЧТ и ВС\nУ нас проходят регулярные акции и шикарные скидки\nНепревзойдённая атмосфера «ДЫМа» порадует каждого!	t	t	t	f	f	f	53.2411	50.2379	t	f	\N	\N	\N	dum	56	\N	316	f
260	Smoke light	Самарская, 167	+7 987 916-02-70	\N	https://instagram.com/smoke_light63	https://vk.com/smoke_light	499099	1	1	Самое яркое место в центре Самары для всех любителей настоящего кальяна. Smoke Light является первым закрытым кальянным клубом, который активно набирает свою популярность в городе.	Самое яркое место в центре Самары для всех любителей настоящего кальяна. Smoke Light является первым закрытым кальянным клубом, который активно набирает свою популярность в городе.\r\n\r\nВсегда для вас:\r\n— Все виды элитных табаков\r\n— Большой выбор элитных чаев и сладостей\r\n— Одна из лучших тусовок в городе собралась здесь, чтобы открыть для вас эту атмосферу!\r\n\r\nМы - стараемся для вас, в любимом месте, где теплая атмосфера заложена в принципы нашей работы 	f	f	f	f	f	f	53.1957	50.106	t	f	Кальянная Smoke Light | Самара	Кальянная Smoke Light в Самаре находится по адресу Самарская, 167	\N	smoke-light	67	\N	317	f
261	CHILL AIR	Молодогвардейская, 166	+7 987 908‒05‒11	\N	\N	https://vk.com/chillair	499099	1	1	Уют, x-box, вкусные дымные кальяны, чай и вкусняшки. Кальян у нас высочайшего уровня:)   Идем дальше: отличное разливное пиво по самой возможной низкой цене. Дешевле ты сможешь купить только воду в магазине	Прежде всего, мы хотим рассказать о формате нашего нового места. \r\nAll In Room (AIR) - в переводе с английского означает &quot;все в комнате&quot;, эта фраза отражает основную идею нашего заведения, поясним: зайдя в Chill AIR, ты получишь практически все, что ты хочешь. \r\n\r\nПобывав во многих барах, клубах и кальянных Самары, мы пришли к выводу, что нет для нас такого места, куда, без лишних размышлений, мы отправились бы в свободный вечер. Работая над проектом Chill AIR, мы постоянно задавали себе вопрос: «А что бы МЫ хотели получить от заведения?». Спустя некоторое время, ответ был найден! Теперь наша команда смело может заявить, что Chill AIR гарантирует тебе лучшее качество во всем, по доступным ценам!\r\n\r\nТеперь, хотим еще раз вернуться к &quot;все в комнате&quot;. Что же это &quot;все&quot;?\r\nНачнем рассказ, наверное, с кальяна, который, лежит, наряду с еще несколькими пунктами, в основе Chill AIR, если ты внимательно прочитал предыдущий абзац, то объяснять, что кальян высочайшего уровня, не нужно. Но мы все-таки поясним - кальян у нас высочайшего уровня:) \r\n\r\nИдем дальше: отличное разливное пиво по самой возможной низкой цене. Дешевле ты сможешь купить только воду в магазине;) \r\nКонечно, если ты предпочитаешь: чай, кофе, лимонады различных марок(dr.pepper, pepsi, mountain dew и т.п.), сладости, солености, сэндвичи, закуски, печеньки и многое другое, то непременно получишь все это в Chill AIR!\r\nСледом еще один базовый пункт, это - всевозможные средства развлечений, такие как: xbox, sega, kicker(настольный футбол), настольные игры и т.д.\r\nПомимо всего выше перечисленного, Chill AIR будет радовать своих гостей регулярными трансляциями лучших футбольных матчей, а также просмотрами интереснейших фильмов и сериалов. \r\nПожалуй, это вся вводная информация. Если все же остались какие-то вопросы, ты можешь найти ответ в группе, либо в любое время написать или позвонить нам, мы с удовольствием ответим!\r\nПриходи, мы ждем именно тебя:)	f	t	t	f	f	f	53.1984	50.1037	t	f	Кальянная Chill Air | Самара	Кальянная Chill Air города Самара находится по адресу Молодогвардейская, 166	\N	chill-air	78	\N	318	f
264	Tche Tche, лаунж-клуб	Промышленности, 296	+7 (846) 991‒61‒11	\N	\N	https://vk.com/loungetchetche	499099	1	1	lounge Tche Tche – одна из лучших кальянных в Самаре, где можно расслабиться, устроившись в мягких зонах на подушках, покурить ароматный кальян, насладиться вкусом настоящего китайского чая, покушать вкусные роллы. Обслуживающий персонал в кафе приветлив 	lounge Tche Tche – одна из лучших кальянных в Самаре, где можно расслабиться, устроившись в мягких зонах на подушках, покурить ароматный кальян, насладиться вкусом настоящего китайского чая, покушать вкусные роллы. Обслуживающий персонал в кафе приветлив и внимателен, а сервис не вызывает никаких нареканий.\r\n\r\nВ нашем кафе вы можете воспользоваться бесплатно WI-FI интернетом!	f	f	f	f	f	f	53.2005	50.2252	t	f	Кальянная Tche Tche | Самара	Кальянная Tche Tche находится в Самаре по адресу улица Промышленности, 296	\N	tche-tche-loundge-club	107	\N	321	f
265	meGusto	Владимирский проспект 5	+7 (812) 922‒05‒31	http://megusto.club/#!/news	https://instagram.com/megustospb/	https://vk.com/megustospb	498817	1	1	Мы находимся в самом сердце нашего прекрасного города! Наши мастера делают просто «уносящие» кальяны! У нас есть игровая комната с XBOX и не только! В нашей кальянной постоянно проходят какие-нибудь розыгрыши или скидки! Не упусти свой шанс поучаствовать!	Цена за вход 300р/час\r\nЦена при репосте 250р/час\r\n\r\nПодробности по тлф или у кальянщика \r\n\r\nЖдем в гости по адресу: Владимирский проспект, дом 5\r\nТелефон для брони: 922-05-31	f	f	f	f	f	f	59.9313	30.3473	t	f	Кальянная meGusto | Санкт-Петербург	Кальянная meGusto находится в Санкт-Петербурге по адресу Владимирский проспект 5	\N	megusto-sankt-peterburg	118	\N	322	f
266	Marinari	Невский проспект, 72	+7 (812) 983‒49‒70	http://www.marinari.spb.ru/	\N	https://vk.com/marinarispb	498817	1	1	Если вы пришли с друзьями или решили провести вечер в компании близкого человека, дружелюбные официанты проводят вас в отдельные комнатки, где вы почувствуете себя совершенно оторванными от мира, сможете наслаждаться общением с близкими людьми не боясь, ч	Клуб MARINARI расположенная в самом сердце Петербурга, по адресу: Санкт-Петербург, Невский пр., д. 72, справа от кинотеатра Кристалл палас открыта для Вас с 12 часов и до последнего клиента. \r\nНомер телефона 9834970 \r\n\r\n&quot;МАРИНАРИ&quot; - оазис, где можно в любую минуту укрыться от городского шума, окунуться в невероятную атмосферу восточных сказок, почувствовать себя настоящим человеком в окружении преданных служителей. \r\n\r\nПопадая сюда с улицы, забываешь все вопросы бытия, оставляешь все проблемы и окунаешься в мир грез и всевозможных желаний. \r\n\r\nЕсли вы пришли с друзьями или решили провести вечер в компании близкого человека, дружелюбные официанты проводят вас в отдельные комнатки, где вы почувствуете себя совершенно оторванными от мира, сможете наслаждаться общением с близкими людьми не боясь, что вас могут прервать или побеспокоить другие посетители нашего бара. Всегда баре играет приятная фоновая музыка.\r\nТелефон для резерва столов и VIP кабинок\r\n983-49-70	f	t	t	f	f	f	59.9334	30.3463	t	f	Кальянная Marinari | Санк-Петербург	Кальянная Marinari находится в г.Санк-Петербург по адресу Невский проспект, 72	\N	marinari-sankt-peterburg	129	\N	323	f
271	Meduza, lounge-bar	Парижской Коммуны, 14	+7(843) 253‒44‒96	\N	\N	https://vk.com/meduzalounge	551487	1	1	Закрытый клуб "Meduza lounge" открыта и очень ждет Вас в гости. Интересные фильмы на большом экране, различные настольные и видео игры. Так же ароматные кальяны и вкуснейшие чаи. Алкоголь можете принести с собой. 	<p>Закрытый клуб <strong>"Meduza lounge"</strong> открыта и очень ждет Вас в гости. Интересные фильмы на большом экране, различные настольные и видео игры. Так же ароматные кальяны и вкуснейшие чаи. Алкоголь можете принести с собой. </p>\r\n<p>Ждем вас наши дорогие гости!</p>	t	f	t	f	t	t	55.7826	49.113	t	f	Meduza	Meduza lounge в городе Казань - это зона свободного общения, развлечений и отдыха. Приходи и убедись в этом сам, а мы уже готовим кальян именно для тебя.	\N	meduza-lounge-bar-kazan	184	\N	337	f
268	Золотой гранат, lounge-бар	Старо-Петергофский проспект, 15	+7 (812) 922‒26‒77	\N	https://instagram.com/zolotoy_granat/	https://vk.com/zolotoygranat	498817	1	1	В историческом центре Петербурга, недалеко от станции метро "Технологический институт" открылся небольшой, светлый и приятный уголок, где время практически останавливается – Lounge-bar ЗОЛОТОЙ ГРАНАТ. По Предварительной записи!	В Санкт-Петербурге появилось новое место, спрятанное от чужих и открытое только для своих. Заведение работает в формате частного клуба.\r\n\r\nЭто мир без суеты, с уютной атмосферой гостиной и изысканным интерьером. Все это дополняется множеством вкусных авторских коктейлей и сладостей.\r\n\r\nНаша философия против рамок и шаблонов, каждый кальян создаётся с учётом ваших личных вкусовых предпочтений и неограниченных фантазий.\r\n\r\nДрузья, предварительный резерв столиков ОБЯЗАТЕЛЕН!	f	f	f	f	f	f	59.9128	30.277	t	f	Кальянная Золотой гранат | Санкт-Петербург	Кальянная Золотой гранат г. Санкт-Петербург адрес Старо-Петергофский проспект, 15	\N	zolotoi-granat-loundge-bar-sankt-peterburg	151	\N	325	f
636	DUTY FREE	Рябикова, 20а	8‒800‒100‒18‒48	df-ru.ru	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.28563	48.301736	t	f	\N	\N	\N	\N	\N	\N	\N	t
269	Smoke bar Ugl	Сибгата Хакима,40а	+7(962)552‒28‒12	\N	https://instagram.com/_smoke_bar_ugli	https://vk.com/club79374575	551487	1	1	Smoke bar Ugli-прекрасное уютное место, которое Вы можете посетить с любимым человеком или с друзьями и душевно провести время. Главная особенность Smoke bar Ugli-это разнообразное кальянное меню со всевозможными видами табаков и табачных миксов. 	Smoke bar Ugli-прекрасное уютное место, которое Вы можете посетить с любимым человеком или с друзьями и душевно провести время.\r\nГлавная особенность Smoke bar Ugli-это разнообразное кальянное меню со всевозможными видами табаков и табачных миксов. \r\nМы первое заведение с выделенной зоной для курения кальяна на табачной основе.\r\n\r\nНаши профессиональные кальянщики приготовят для Вас настоящий ароматный кальян, который поможет Вам расслабиться и провести чудесно время в компании близких. \r\nВыбирая место для проведения своего досуга с целью покурить кальян в Казани и приятно провести время, свой выбор безусловно стоит остановить на Smoke bar Ugli, ведь это кальянная, куда обязательно захочется вернуться!	f	f	t	f	f	f	55.8146	49.1345	t	f	Smoke bar Ugli Кальянная Казань	Классная кальянная, очень душевная и уютная. И самое главное кальян на пять с плюсом, много разнообразных вкусных вкусов. Приятное дополнение это настольные игры, весело с компанией подымить и поиграть. 	\N	smoke-bar-ugli	162	\N	335	f
270	Мята лаунж	Пушкина, 54/1	+7(843)225‒03‒87	\N	\N	https://vk.com/myatalounge	551487	1	1	Мята Lounge является первым закрытым кальянным клубом, которое активно развивает свою сеть по всей России. 	<p>Самое яркое место в центре Казани, для всех любителей настоящего кальяна. Мята Lounge является первым закрытым кальянным клубом, которое активно развивает свою сеть по всей России. </p>\r\n\r\n<p>Мята Lounge сегодня это:</p>\r\n<ul>\r\n<li>Самые топовые вкусы кальяна и не только;</li>\r\n<li>Большой выбор элитных чаев;</li>\r\n<li>Самые лучшие кальянщики города перебрались к нам, для того что бы собрать все лучшее в одном месте;</li>\r\n<li>Европейская и азиатская кухня;</li>\r\n<li>Мята Longe это место уюта и комфортна, где теплая атмосфера заложена в принципы работы мятного семейства.</li>\r\n</ul>	f	f	t	f	f	f	55.7945	49.1257	t	f	Мята лаунж Кальянная Казань	Любимое многим заведение теперь можно найти и в Казани. Здесь можно не только покурить, но и приятно пообедать и выпить вкусный чай.	\N	myata-launzh-kalyannaya-kazan	173	\N	336	f
293	Pallet Warehouse	Юрия Гагарина, 80	+7(989)955‒50‒50	\N	https://www.instagram.com/pallet_ufa/	https://vk.com/pallet_ufa	479561	1	1	Потрясающий интерьер, каждый квадратный сантиметр сделан своими руками. Шикарные кальяны и большой выбор табака.	<p>Потрясающий интерьер, каждый квадратный сантиметр сделан своими руками. Шикарные кальяны и большой выбор табака.</p>	f	f	f	f	f	f	54.7792	56.0735	t	f	Кальянная Pallet Warehouse | Уфа	Кальянная Pallet Warehouse в Уфе находимся мы на улице Юрия Гагарина 80 (третий этаж)	\N	kalyannaya-pallet-warehouse-ufa	402	\N	359	f
274	Amsterdam	Большая Красная, 34	+7(906)110‒11‒82	\N	https://www.instagram.com/iamsterdam_kzn/	https://vk.com/iamsterdam_kzn	551487	1	1	Если тебе не хватает позитивного настроения, тебе срочно нужно посетить нас.  Здесь тебя всегда ждут искренний смех, дружеские объятия и естественно невероятные кальяны от прирожденных кальянщиков! 	<p>Об акциях и мероприятиях вы можете узнать из группы в Вконтакте</p>	f	f	f	f	f	f	55.7974	49.1228	t	f	Amsterdam, центр паровых коктейлей	Любишь азартные игры? Тогда тебе к нам: Дженга, Иманджинариум, Свинтус, Уно, нарды, карты и многое другое ждёт тебя в #iamsterdam_kzn И при этом тебя всегда будут радовать улыбчивые кальянщики, вкусный чай и ароматные кальяны.	\N	kalyannaya-amsterdam-kazan	215	\N	340	f
275	Кислород [О2]	Сафиуллина, 8а	+7(987)297‒06‒26	\N	https://www.instagram.com/kislorodkzn/	https://vk.com/kislorodkzn	551487	1	1	Мы ищем подход к каждому посетителю, и делаем все с любовью, и все для Вас.Множество разных, потрясающих и освежающих табаков, которые вы сможете попробовать. 	<p>Изысканная кальянная для истинных ценителей ароматного дыма.</p><p>Здесь вы почувствуете себя в своей атмосфере. Мы ищем подход к каждому посетителю, и делаем все с любовью, и все для Вас.</p><p>Множество разных, потрясающих и освежающих табаков, которые вы сможете попробовать. Также для любителей кальяна на дому, открыта табачная лавка, где вы сможете приобрести самые редкие и брендовые наполнители.</p><p>Наше меню включает в себя не только ароматный пар и множество вкусных чаев, но и большой ассортимент молочных коктейлей, фруктовых и ягодных смузи, лимонадов и прохладительных напитков,приготовленных с любовью и от которых Вы придете в восторг!</p><p>Мы открыты каждый день с 12:00, и ждем Вас на кальян!!</p><p>У нас действует акция <strong>каждый второй кальян 250 рублей.</strong></p>	t	f	t	f	f	t	55.7535	49.2176	t	f	Кальянный клуб Кислород [О2] в городе Казань	Кальянный клуб "Кислород [О2] " О2 «Мы объединяем людей». Бронь столов: 297-06-26 г. Казань ул.Сафиуллина 8а, вход через Августину	\N	kalyannyj-klub-kislorod-o2	226	\N	341	f
276	MALINA, клуб	Космонавтов, 1	+7(906)322‒23‒21	\N	\N	https://vk.com/malina_kzn	551487	1	1	Танцпол, алкоголь, кальяны что еще нужно, чтобы весело провести время?	<p>Проведите приятный вечер!</p><p>Отдохните от городской суеты!</p><p>Расслабьтесь за чашечкой вкусного чая!</p><p>Насладитесь ароматным кальяном!</p><p>Согрейтесь в атмосфере позитива!</p><p>Мы сделаем все для вас!</p><p>Ждем в гости дорогие гости!!!</p>	f	t	f	f	f	f	55.8023	49.1872	t	f	MALINA, клуб	MALINA, клуб г. Казань, Ул. Космонавтов, д. 1, справа от Burger Club	\N	malina-klub-kazan	235	\N	342	f
284	Aurelia	Гончарова, 44	+7(8422)70‒89‒12	\N	https://www.instagram.com/aurelia_ulyanovsk/	https://vk.com/aurelia73	479123	1	1	Будние дни с 15.00 и до последнего гостя, в выходные с 18.00 и до последнего гостя	<p>Молодое заведение Aurelia в Ульяновске уже завоевывает популярность. Хорошие и дымные кальяны гарантированы! Вас ожидают прославленные кальянные мастера, киловаты музыки и неповторимая атмосфера безбашенных вечеринок</p>	f	f	f	f	f	f	54.3195	48.3991	t	f	Aurelia кальянная Ульяновск	Кальянная Aurelia располагается в городе Ульяновск на улице Гончарова, 44	\N	aurelia-kalyannaya-ulyanovsk	315	\N	350	f
279	GR8PEOPLEKAZAN	Достоевского, 44/6	+7(903)388‒89‒77	\N	https://www.instagram.com/gr8peoplekazan/	https://vk.com/gr8peoplekazan	551487	1	1	Огромный выбор табака, 2 зала различной тематик, Xbox, пиво, низкие цены, отзывчивый персонал.	Кальян, заправленный душой,\r\nВ нём вперемежку с мишурой\r\nИ тлен, и пепел рифм сгоревших\r\nСтихов моих осиротевших.\r\n\r\nПуста постель в анклаве ночи.\r\nОгня и холода война.\r\nБокал сливового вина\r\nМой сон мечтами оторочил.\r\n\r\nВ нём вместо смысла ритмы танго.\r\nСреди сияния свечей\r\nЯ - связка брошеных ключей\r\nЗабытых дней, и мякоть манго.\r\n\r\nИ ты, обидчик нежный мой,\r\nОт моей плоти снова пьян,\r\nТы куришь пристрастно кальян\r\nМоей заправленный душой	f	t	f	f	f	f	55.7873	49.1507	t	f	GR8PEOPLEKAZAN, центр паровых коктейлей Казань	GR8PEOPLEKAZAN располагается в замечательном городе Казань по улице Достоевского, 44/6	\N	gr8peoplekazan	261	\N	345	f
280	Club Mint	Федерации, 6	+7(917)613‒05‒43	\N	https://www.instagram.com/club_miint/	https://vk.com/clubmiint	479123	1	1	Уютная обстановка, можно поиграть в нарды, и в шахматы или просто поболтать с друзьями на удобных диванчиках.	У нас замечательная еда, делаем отличные кальяны. Заведение порадует вас уютной обстановкой, где вы сможете поиграть в нарды и шахматы, и просто общаясь с друзьями на удобных диванах. Рекомендуем посетить наше заведение и зарядиться приятной атмосферой и отличным настроение.	f	f	t	f	f	f	54.3208	48.3948	t	f	Club Mint, клуб любителей кальяна Ульяновск	Club Mint, клуб любителей кальяна в городе Ульяновск по улице Федерации, 6	\N	klub-mint-ulyanovsk	271	\N	346	f
281	Oz	Гончарова 30, ст1	+7 (8422) 95‒26‒26	\N	https://www.instagram.com/oz__73/	\N	479123	1	1	Хорошие люди, приятный интерьер и знатные кальяны во всем Ульяновске.	<p>Хорошие люди, приятный интерьер и знатные кальяны во всем Ульяновске.</p>	f	f	f	f	f	f	54.3164	48.3964	t	f	Oz, кальянная в Ульяновске	Oz, кальянная в городе Ульяновск по адресу Гончарова 30 ст1 офисный центр "Сенатор"	\N	oz-kalyannaya-v-ulyanovske	285	\N	347	f
282	Smoke Station	Мира 2-й переулок, 24	+7 8422)763‒523	\N	https://www.instagram.com/smoke_station/	https://vk.com/smokestation73	479123	1	1	Закрытый клуб, формата анти-кафе.Хоть и не первая, но определено лучшая кальянная города.	<p>Закрытый клуб, формата анти-кафе.</p><p>Хоть и не первая, но определено лучшая кальянная города. Лучший табак и редкое сочетание вкусов приведет в восторг главных ценителей вкусного дыма, а непринужденная и домашняя атмосфера расслабит тружеников в конце рабочего дня. Приходи, посмотри, попробуй и уверяю, ты вернешься к нам снова.</p>	f	f	f	f	f	f	54.321	48.3975	t	f	Smoke Station кальянная в городе Ульяновск	Smoke Station кальянная в городе Ульяновск находимся по улице Мира 2-й переулок, 24	\N	smoke-station-ulyanovsk	301	\N	348	f
283	Комильфо	Федерации, 6	+7(909)360‒68‒14	\N	\N	https://vk.com/club63202208	479123	1	1	Постоянный персонал, обстановка оформлена в восточном стиле, с цокольным этажом. В зале есть отдельные кабинки ограниченные торами.	<p>Постоянный персонал, обстановка оформлена в восточном стиле, с цокольным этажом. В зале есть отдельные кабинки ограниченные торами.</p>	f	t	t	f	f	f	54.3208	48.3948	t	f	Кальянная Комильфо в Ульяновске	Кальянная Комильфо в Ульяновске располагается по улице Федерации, 6	\N	komilfo-ulyanovsk	308	\N	349	f
286	Haze	Ленинского Комсомола проспект, 19	+7(8422)76‒03‒50	\N	https://www.instagram.com/hazebar73/	https://vk.com/hazebar73	479123	1	1	Наша барная dream team примет вас в свои алкогольно-дымные объятия и вы не захотите уходить.	<p>Отличная атмосфера и сочные миксы! Мы ждём Вас в том же месте и в те же часы! Пятницы и субботы в Haze обещают быть дымными, приятными на слух и крепкими на вкус. Надеемся, все готовы встретить викенд под отличную музыку. А наша барная dream team примет вас в свои алкогольно-дымные объятия и вы не захотите уходить.</p>	f	t	f	f	f	f	54.382	48.5985	t	f	Кальянная Haze в городе Ульяновск	Кальянная Haze в городе Ульяновск находится на Ленинского Комсомола проспект, 19 вход сзади здания	\N	haze-ulyanovsk	333	\N	352	f
287	Black Shark	Рябикова, 22Б	+7(8422)74‒66‒97	\N	https://www.instagram.com/black_shark_73/	https://vk.com/blacksharkhookahbar	479123	1	1	Люди отдыхают, дымят а как ты проводишь свой вечер? Наши кальянщики готовы радовать вас дымными и вкусными кальянами по самым низким ценам!	<p>Люди отдыхают, дымят а как ты проводишь свой вечер? У нас вы можете насладиться вкусными и дымными кальянами по самым низким ценам в городе с любимым наполнителем для колбы, а так же на вашем любимом фрукте! </p><p>Работаем до последнего клиента! </p>	f	f	f	f	f	f	54.2843	48.2999	t	f	Кальянная Black Shark в городе Ульяновск	Кальянная Black Shark в городе Ульяновск находится на улице Рябикова, 22Б	\N	black-shark-ulyanovsk	344	\N	353	f
288	Greenwich pub	Водопроводная, 4	+7(906)140‒00‒44	\N	https://www.instagram.com/greenwich_bar/	https://vk.com/greenwich_pub_ul	479123	1	1	Любители кальяна найдут здесь огромный выбор вкусов. Укройтесь от городского шума и повседневной суеты, подарите себе незабываемые вечера у нас в кальянной.	<p>Для всех любителей кальяна, расслабляющей музыки, вкуснейших чаёв и горячительных напитков открылись мы Greenwich pub - кальянная-бар в Ульяновске.</p><p>У нас Вы почувствуете себя другом, долгожданным гостем!</p><p>Любители кальяна найдут здесь огромный выбор вкусов.</p><p>Укройтесь от городского шума и повседневной суеты, подарите себе незабываемые вечера у нас в кальянной./p>	f	t	f	f	f	f	54.3008	48.3674	t	f	Кальянная Greenwich pub | Ульяновск	Кальянная Greenwich pub в городе Ульяновск находится на улице Водопроводная, 4	\N	greenwich-pub-ulyanovsk	351	\N	354	f
289	Хоттабыч	Загира Исмагилова, 10	+7(927)342‒00‒20	\N	https://www.instagram.com/kalyannaya_hottab/	https://vk.com/hottab020	479561	1	1	Приглашаем вас в кальянную "Хоттабыч". Для посетителей имеется две VIP комнаты, два больших общих зала вместимостью более 60 человек. 	<p>Приглашаем вас в кальянную "Хоттабыч".</p><p>Для посетителей имеется две VIP комнаты, два больших общих зала вместимостью более 60 человек. К вашим услугам большой ассортимент табака: Argelini, Afzal, Nakhla, Adalya, Doobacco, Dark Side, Fumari, Tangiers и тд(более 50 вкусовых сортов). </p>\r\n<p>Также имеются прохладительные напитки, чай( более 10 сортов), кофе. Очень уютная атмосфера(wifi,телевидение, музыка).</p><p>С уважением, Хоттабыч</p>	f	f	f	f	f	f	54.6967	55.9839	t	f	Кальянная "Хоттабыч" | Уфа	Кальянная "Хоттабыч" в Уфе располагается по улице Загира Исмагилова, 10	\N	hottabych-ufa	361	\N	355	f
290	Rahat	Мингажева, 127	+7(917)372‒28‒28	\N	https://www.instagram.com/rahatufa/	https://vk.com/rahatufa	479561	1	1	У нас отличные кальян, очень уютно и обслуживание на самом высоком уровне.	<p>У нас отличные кальян, очень уютно и обслуживание на самом высоком уровне. Приходите к нам и вы не пожалеете о проведенном у нас времени.</p>	f	f	f	f	f	f	54.7357	55.971	t	f	Кальянная Rahat | Уфа	Кальянная Rahat в Уфе по улице Мингажева, 127	\N	rahat-ufa	370	\N	356	f
291	Marrakech Time	Бабушкина, 52	+7(937)338‒66‒01	\N	https://www.instagram.com/marrakech_time/	http://vk.com/marrakechtime	479561	1	1	Проведите выходной в уютной обстановке востока!	Проведите выходной в уютной обстановке востока!	f	f	f	f	f	f	54.7428	55.9864	t	f	Кальянная Marrakech Time | Уфа	Кальянная Marrakech Time в Уфе на улице Бабушкина, 52	\N	kalyannaya-marrakech-time-ufa	381	\N	357	f
295	Чих - Пых	Максима Рыльского, 14	+7(917)798‒44‒44	\N	\N	https://vk.com/4uxpux	479561	1	1	Дорогие друзья, приглашаем вас покурить вкусные, дымные, а главное качественные кальяны в "Чих-Пых"! Вас ждет уютная и приятная атмосфера! Прохладительные напитки, европейская и японская кухня!	<p>Весь день мечтаю о тебе, \r\nИ это не обман...\r\nСкорей к тебе, \r\nСкорей к тебе...\r\nЛюбимый мой кальян!\r\nЕсли вы соскучились по дымному и фруктовому кальяну, то спешите к нам!</p>	f	t	t	f	f	f	54.7685	56.0697	t	f	Кальянная "Чих - Пых" | Уфа	Кальянная "Чих - Пых" в Уфе на улице Максима Рыльского, 14	\N	kalyannaya-chih-pyh-v-ufe	421	\N	361	f
297	Mint	ул. Космонавтов д. 7	+7(347)299‒59‒94	\N	https://www.instagram.com/mint_hookah_ufa/	https://vk.com/hookahmint	479561	1	1	В нашем ассортименте огромный выбор элитного чая. Так что мы радуем не только густым дымом кальяна, но и создаем для вас уют.	<p>Мы представляем Вашему вниманию Авторскую Чайную Кальянную "Мята". </p><p>В нашем ассортименте огромный выбор элитного чая. Так что мы радуем не только густым дымом кальяна, но и создаем для вас уют.</p><p>Каждый день вы можете приходить к нам, чтобы познакомиться с чем-то новым и поиграть в любимые игры на консолях.</p>	t	f	f	f	t	t	54.8189	56.0629	t	f	Кальянная Mint | Уфа	Кальянная Mint в Уфе по адресу улица Космонавтов д. 7 	\N	kalyannaya-mint-v-ufe	442	\N	363	f
298	Этажи	Октября проспект, 39	+7(347)266‒61‒71	\N	\N	https://vk.com/kalyan_ufa_etagy	479561	1	1	Помимо ароматного кальянна, у нас есть X-BOX, Sony Playstation, 3D Oculus.	<p>Помимо ароматного кальянна, у нас есть X-BOX, Sony Playstation, 3D Oculus.</p>	f	t	f	f	f	f	54.7525	55.9995	t	f	Кальянная  "Этажи" | Уфа	Кальянная  "Этажи" в Уфе по адресу Октября проспект, 39	\N	kalyannaya-ehtazhi-v-ufe	451	\N	364	f
299	Art Shiha	Комсомольская, 153/2	+7(962)528‒07‒67	\N	https://www.instagram.com/artshishaufa/	https://vk.com/club94070736	479561	1	1	У нас имеется большое количество вкусного табака, который ждёт вашего прихода!	У нас имеется большое количество вкусного табака, который ждёт вашего прихода!	f	f	f	f	f	f	54.7629	56.0203	t	f	Кальянная Art Shiha | Уфа	Кальянная Art Shiha в городе Уфе находится по адресу Комсомольская, 153/2	\N	kalyannaya-art-shiha-ufa	462	\N	365	f
300	Диван	Космонавтов, 14	+7(347)266‒51‒46	\N	https://www.instagram.com/divan_lounge/	\N	479561	1	1	Dиван-лучшее место! 2зала, VIPзона, Wi-Fi, Xbox, настольные игры, кофе на вынос,пончики.	<p>Dиван-лучшее место! 2зала, VIPзона, Wi-Fi, Xbox, настольные игры, кофе на вынос,пончики.</p>	f	f	t	f	t	t	54.8178	56.0642	t	f	Кальянная Диван | Уфа	Кальянная Диван в Уфе находится по адресу улица Космонавтов, 14. Dиван-лучшее место! 2зала, VIPзона, Wi-Fi, Xbox, настольные игры, кофе на вынос,пончики.	\N	kalyannaya-divan-ufa	473	\N	366	f
302	Time Out	Героев Свири, 4а	+7(951)098-20‒10	\N	\N	https://vk.com/timeout73	479123	1	1	Дорогие друзья! Рады Ваc видеть в нашем заведении для отдыха в Ульяновске Lounge club “TimeOut” Уникальный островок тепла и уюта.	<p>Не знаете что и где покурить? Ждем Вас в кальянной Time Out у нас вы найдете большой выбор табаков: tangiers, Starbuzz, Fumari, Darkside.</p><p>Для особых ценителей мы сделаем вам чашу на фрукте.</p>	t	f	f	f	f	f	54.2624	48.3271	t	f	Кальянная Time Out Ульяновск	Кальянная Time Out Ульяновск находимся по адресу Героев Свири, 4а	\N	kalyannaya-time-out-ulyanovsk	500	\N	368	f
304	Example Lounge	Галиаскара Камала 4А 	+7 (843) 290‒09‒07	\N	https://www.instagram.com/examplekzn/	https://vk.com/example_lounge	551487	1	1	Не знаете где покурить кальян, тогда вам нужно к нам. Приятная атмосфера, самые крутые кальянщики Казани порадуют вас дымными и ароматными кальянами.	<p>Важно: стоимость часа курение кальяна с12:00-19:00 500 руб, в эту стоимость входит кальян+чай, после 19:00 час курения кальяна + напиток (чай или лимонад). Час курения-условное время, 15 минут время от заказа до подача кальяна и час-час пятнадцать минут- время курения кальяна.</p>	t	f	t	t	f	t	55.7867	49.1121	t	f	Кальянная Example Lounge | Казань	Кальянная Example Lounge находиися в городе Казань по адресу ул. Галиаскара Камала 4а, работаем до последнего гостя.	\N	kalyannaya-example-lounge-kazan	525	\N	370	f
305	Relaxinema	Спартаковская 2, корпус 1	+7(843) 247 54-47	\N	\N	https://vk.com/relaxinema	551487	1	1	Кинотеатр кальянная с собственной кухней и видеоиграми.	<p>Кинотеатр-кальянная.Имеется 3 зала%</p><ul>\n<li>Малый зал для 2-х человек (для романтических свиданий)</li><li>Средний зал 6-8 человек(для посиделок с друзьями или мини-вечеринок)/li><li>Большой зал10-12(для шумных вечеринок)</li></ul>	f	f	t	f	t	f	55.7809	49.1273	t	f	Кальянная-кинотеатр Realaxinema | Казань	Кальянная-кинотеатр Realaxinema г. Казань улица Спартаковская 2, корпус 1 	\N	kalyannaya-kinoteatr-realaxinema-kazan	542	\N	371	f
308	Fantasy of Smoke	Чистопольская, 19а	+7 (843) 265 66-67	\N	\N	https://vk.com/uk_fs	551487	1	1	Свободный счет, гости оставляют столько, сколько посчитают нужным.	<p>Что у нас есть:</p><ul><li>Бронирование: Да</li><li>Кальяны: Khalil Mamoon, Дизайнерские стеклянные кальяны</li><li>Табак: Nakhla, Tangiers, Haze, Hookafina, Inhale</li><li>Меню: Китайский чай, Напитки</li><li>Алкоголь: Нет</li><li>Кредитные карты: Не принимаем</li><li>Wi-Fi: Есть. Бесплатный</li><li>Количество посадочных мест: 70</li><li>Места на улице: Нет</li><li>Парковка: Есть</li></ul><p>Остались вопросы звоните по телефону <strong>+7 (843) 265 66-67</strong>администратор ответит на них</p>\r\n	t	t	f	f	t	t	55.82	49.1148	t	f	Кальянная Дом Культуры "Fantasy of Smoke" | Казань	Кальянная Дом Культуры "Fantasy of Smoke" г. Казань улица Чистопольская, 19а	\N	kalyannaya-fantasy-of-smoke-kazan	568	\N	374	f
309	Hookah Lounge	Ямашева, 69	+7(937) 576 49-08	\N	\N	https://vk.com/hookah_lounge_kzn	551487	1	1	Hookah Lounge - место, где ты найдешь паровой коктейль на любой вкус. Так же мы предлагаем: большой зал с уникальным дизайном, проектор, настольные игры,  большой выбор чая, слабоалкогольных и безалкогольных коктелей, игровую зону с PS3.	<p>Добро пожаловать в <strong>Hookah Lounge!</strong></p><p>Будем рады видеть вас на нашей территории дыма и отдыха. <strong>Hookah Lounge</strong> - место, где ты можешь приятно провести время в кругу друзей или насладиться лучшим кальяном в обществе наших мастеров. У нас ты найдешь табак на любой вкус: soft, medium, in space. Также мы можем предложить:</p><ul><li>Большой зал: 80 кв. м. с уникальным дизайном;</li><li>Проектор, настольные игры;</li><li>Большой выбор чая, слабоалкогольных и безалкогольных коктейлей;</li><li>Игровую зону на 6 человек, оснащенную PS3.</li></ul><p>Кальянная карта:</p><ul><li>Кальяны: Amy delux, Kaya, Khalil Mamoon;</li><li>Табак: AL FAKHER, AL FAHAMAH, ADALYA, SERBETLI, BAHRAIN, STARBUZZ, DOOBACCO, FUMARI, AFZAL, NAKHLA, NIRVANA, HOOKAFINA, TANGIERS, DARK SIDE, KRASS</li></ul><p>Адрес: ул. Ямашева, 69 (вход за Старым Амбаром)</p>	f	f	f	f	t	t	55.8252	49.1352	t	f	Кальянная Hookah Lounge | Казань	Кальянная Hookah Lounge г. Казань улица Ямашева, 69 (вход за Старым Амбаром)	\N	kalyannaya-hookah-lounge-kazan	579	\N	375	f
310	Moloko Lounge	Чистопольская, 81	+7 (900) 327 55-51	\N	https://www.instagram.com/milk_kazan/	https://vk.com/milklounge	551487	1	1	Большой экран, настольные игры, книжки, тапочки, и прочие атрибуты домашней и уютной атмосферы.	<p>Большой экран, настольные игры, книжки, тапочки, и прочие атрибуты домашней и уютной атмосферы.</p>	f	f	f	f	t	t	55.8227	49.1516	t	f	Кальянная Milk Lounge | Казань	Кальянная Milk Lounge г. Казань улица Чистопольская, 81	\N	kalyannaya-milk-lounge-kazan	587	\N	376	f
311	У Эдгара По	Восстания, 49	+7(906) 323 54-07	\N	\N	https://vk.com/uedgarapo	551487	1	1	Уютная атмосфера, две игровые комнаты с PS3 и Xbox 360, и комната для вашего праздника на 15 человек.	<p>Кальянная Казань У Эдгара По - закрытый клуб для истинных ценителей хорошего кальяна и живого общения.Мы не продаем табак,не занимаемся пропагандой курения,мы собираемся, курим кальяны, общаемся, играем в игры, наслаждаемся вкусным чаем и густым кальяном, ждем всех в гости Восстания 49.В гостях у Эдгара По.</p>	f	f	f	f	f	t	55.8327	49.0774	t	f	Кальянная "У Эдгара По" | Казань	Кальянная "У Эдгара По" г. Казань улица Восстания, 49	\N	kalyannaya-u-ehdgara-po-kazan	594	\N	377	f
312	NoName club	Зорге, 33а	+7(917) 292 33-37	\N	\N	https://vk.com/nnckzn	551487	1	1	NoName - место с отличными кальянами и чаем. С настольными и видеоиграми, футбольными трансляциями и совместными кинопросмотрами. 	<p>NoName - место с отличными кальянами и чаем. С настольными и видеоиграми, футбольными трансляциями и совместными кинопросмотрами. И конечно же с интересными людьми, которые здесь работают и отдыхают. NoName Club это место с общими интересами.</p><p>это:</p><ul><li>густые кальяны и вкусный чай</li><li>настольные и видеоигры</li><li>футбольные трансляции</li><li>совместные кинопросмотры</li></ul><p>Все вырученные средства идут для улучшения заведения и продвижения.</p>	f	f	f	f	t	t	55.7556	49.2007	t	f	Кальянная NoName club | Казань	Кальянная NoName club г. Казань улица Зорге, 33а	\N	kalyannaya-noname-club-kazan	602	\N	378	f
314	Roof	Сахарова, 24а	+7(927) 422 06-01	\N	https://www.instagram.com/roof_kzn/	https://vk.com/roof_kzn	551487	1	1	Ждем всех в гости, на самый дымный и вкусный кальян города.  Если дымить, то только у нас в Roof'е!	<p>Ждем всех в гости, на самый дымный и вкусный кальян города.  Если дымить, то только у нас в Roof'е!</p>	f	f	f	f	f	f	55.7829	49.2226	t	f	Кальянная  Roof | Казань	Кальянная  Roof г. Казань улица Сахарова, 24а	\N	kalyannaya-roof-kazan	620	\N	380	f
315	Hubble Bubble	Фучика, 55	+7(843) 258 51-22	\N	\N	https://vk.com/hbkazan	551487	1	1	Попадая к нам, забываешь обо всех проблемах и заботах, переживаниях и неудачах. С нами у вас все будет Окей!	<p>Попадая к нам, забываешь обо всех проблемах и заботах, переживаниях и неудачах. С нами у вас все будет Окей=) Приглушенный свет, приятная музыка, тонкий аромат кальяна помогут вам расслабиться, дадут почувствовать себя отвлеченным от всего, позволят окунуться в свой мир грез и желаний, а огромный выбор табака, развлечений и море дыма понравятся даже самым искушенным. К каждому кальяну мы предложим вам большой выбор чая и сладостей.</p><p>Курение кальяна - это особый стиль общения, который сближает людей. На Востоке считается, что курение кальяна возможно только в кругу друзей... Побывав у нас хоть раз вы поймете это, Вы захотите вернуться к нам еще!</p><p>Друзья, мы такие же, как вы - мы любим кальян, любим этот сладкий дым, любим эксперименты и интересные миксы. Мы живем этим местом, этой маленькой сказкой, в которой все имеет значение...</p>\r\n	f	f	f	f	f	f	55.7436	49.2045	t	f	Кальянная Hubble Bubble | Казань	Кальянная Hubble Bubble г. Казань улица Фучика, 55	\N	kalyannaya-hubble-bubble-kazan	629	\N	381	f
316	Green House	Академика Сахарова 6	+7 (937) 622 67-31	\N	https://www.instagram.com/green_house_hookah/	https://vk.com/green_house_hookah	551487	1	1	 Встречаем вас своим домашнем уютом. Ароматным запахом пуэра, морем дыма и вкуса, что царят у нас каждый день.	<p>Среди городской суеты, среди пробок и каменных лесов столицы, расположилось столь волшебное место, в котором каждая частичка поможет Вам расслабиться и отвлечься от суеты: приглушенный свет, приятная музыка, тонкий аромат кальяна, к которому мы с радостью предложим Вам множество разновидностей китайского чая и вкусняшек.</p>	f	f	f	f	t	t	55.7782	49.2323	t	f	Кальянная Green House | Казань	Кальянная Green House г. Казань улица Академика Сахарова 6	\N	kalyannaya-green-house-kazan	637	\N	382	f
318	Smoke House	Проспект октября, 91	(299) 35-79	\N	https://www.instagram.com/Smokehouse_ufa/	https://vk.com/shufa	479561	1	1	Мягкие диваны, lounge-атмосфера, дизайнерские кальяны и конечно густой дым. Ничего лишнего, кальян only.	<p>Представляем заведение нового формата – правильная кальянная Smoke House (18+). Мягкие диваны, lounge-атмосфера, дизайнерские кальяны и конечно густой дым. Ничего лишнего, кальян only.</p><p>Выбирай любой кальянный микс и наслаждайся насыщенным вкусом в кругу друзей. </p>	f	f	f	f	t	t	54.7772	56.0291	t	f	Кальянная Smoke House | Уфа	Кальянная Smoke House г. Уфа Проспект октября 91.Торговый центр "Юрюзань" 	\N	kalyannaya-smoke-house-ufa	657	\N	384	f
254	Алладин	Профсоюзная, 25	+7(843) 296-73-34	http://alladine.ru/	\N	https://vk.com/alladine_kazan	551487	1	1	Кальянная-чайхана. Добро пожаловать в "Алладин". В нашем ресторане Мы предлагаем Вам уютную и дружескую атмосферу, приятную музыку, красивые и удобные кабинки, коктейли, безалкогольные напитки, закуски, и, конечно же, вкуснейшие ароматы.	<p>ДОРОГИЕ ГОСТИ!</p><p>В нашем ресторане Вы можете приятно провести время со своей второй половинкой, с любимой семьей, а также с большой компанией друзей. У нас есть все, что нужно для комфортного отдыха и наслаждения. Мы предлагаем Вам уютную и дружескую атмосферу, приятную музыку, красивые и удобные кабинки. В нашем меню Вы найдете блюда восточной, европейской, японской и татарской кухни,а также чай, кофе, коктейли, безалкогольные напитки, закуски, и, конечно же, вкуснейшие ароматы.В будние дни с 11:00 до 18:00 проходит бизнес- ланч.Забронировать столик для Вашего мероприятия Вы можете по телефону (843) 296-73-34.</p>	f	t	t	f	f	f	55.7884	49.1233	t	f	Кальянная "Алладин" |  Казань kalyan.space	Кальянная "Алладин" находится в замечательном городе Казань на улице Профсоюзная, 25	\N	alladin	1	\N	311	f
319	Вдох Выдох	Николая Дмитриева 9	+7(986) 708 78-88	\N	https://www.instagram.com/vdox_vidox_ufa/	https://vk.com/vdox_vidox02	479561	1	1	Спокойное дешевое местечко с приятной и уютной атмосферой и вкусным чаем.	<p>Вход в заведение разрешен лицам от +18; </p><p>Наши правила:</p><ul><li>Если Вы опаздываете, звоните предупреждайте, иначе бронь снимается после 30 минут ожидания;</li><li>Вошедший в кальянную - автоматически соглашается с правилами заведения!;</li><li>В наше заведение не проносят ядовитые и токсичные вещества, воспламеняющиеся вещества, наркотики, все виды оружия и средства личной защиты;</li><li>При посещении кальянной заказ кальяна - ОБЯЗАТЕЛЕН!</li><li>Если Вы пришли компанией 4-ре человека,то заказываете 2 кальяна, 6-ть человек- 3 кальяна и тд.;</li><li>Вы можете приносить с собой еду,закуски,а также заказать доставку;</li><li>В нашем заведении разрешено приносить алкогольные напитки, но на них распространяется пробковый сбор:<ul><li>с пива( с бутылки ) - 50 р, </li><li>c вина,шампанского (с бутылки)-100р,</li><li>абсента,текилы,виски,водки и т.д.(с бутылки)-200 р.</li></ul></li><li>Сигареты ,сигары ,сигарилы и др. виды сигарет - разрешено курить только при входной группе;</li><li>Запрещено находиться в заведении в "верхней" одежде; </li><li>Запрещено не цензурно выражаться или оскорблять какими либо другими способами, других гостей кальянной;</li><li>Любая порча имущества - облагается денежным штрафом. </li></ul><p>Размеры штрафов Вам расскажет администратор зала в случае возникновения такой ситуации.</p><p>Администрация закрытого клуба имеет право потребовать от любого посетителя, нарушающего настоящие Правила, немедленно покинуть заведение без объяснения причин.</p>	f	f	f	f	t	f	54.7339	55.9976	t	f	Кальянная "Вдох Выдох" | Уфа 	Кальянная "Вдох Выдох" в Уфе по адресу 	\N	kalyannaya-vdoh-vydoh-ufa	669	\N	385	f
320	MagicBar	ул. Пушкина 45/1	+7 (347) 299-99-77	http://magicbarufa.ru/	https://www.instagram.com/magicbar_ufa/ 	https://vk.com/magicbar_ufa 	479561	1	1	Если вы ищете уютное заведение в центре Уфы, где можно не только покурить хороший кальян, но и покушать, то MAGIC BAR & CHILLOUT - идеальный выбор для вас и ваших друзей.	<p>Представляем Вашему вниманию новое интересное заведение в историческом центре Уфы на улице Пушкина, открывшее свои двери в мае 2016 года и сочетающее в себе все качества топового заведения - стильный интерьер, удобные диваны, разнообразная кухня, полноценный бар, а так же, само собой, качественные кальяны. </p><p>Для любителей пива здесь есть более 10 сортов крафтового пива, а так же различные пивные закуски. Здесь можно посмотреть спортивные трансляции на большом экране, что не может нет радовать фанатов футбола и других видов спорта. </p><p>Кальян-Бар MAGIC BAR & CHILLOUT вобрал в себя лучшие традиции европейской кухни. Стейк филе-миньон, Стейк рибай, лучший вид мяса для приготовления стейков - особый сорт говядины – «мраморная». Крафтовое пиво от лучших производителей мира, уникальный кальян-бар который может предложить огромный выбор вкусов ароматного пара. MAGIC BAR & CHILLOUT по приемлемой цене удовлетворит любой, самый утонченный вкус. </p><p>В дневное время вам предложат сытные бизнес-ланчи по приятным ценам, так же в дневное время действует специальная цена на кальян. </p><p>Если вы ищете уютное заведение в центре Уфы, где можно не только покурить хороший кальян, но и покушать, то MAGIC BAR & CHILLOUT - идеальный выбор для вас и ваших друзей.</p>	t	f	t	f	t	t	54.7254	55.9299	t	f	Кальянная MagicBar | Уфа	Кальянная MagicBar. Находимся в г. Уфа, ул. Пушкина 45/1, только у нас кальян-бар премиум-класса	\N	kalyannaya-magicbar-ufa	680	\N	386	f
255	FreeDom	Лево Булачная, 52	+7(843)225-05-59	\N	\N	https://vk.com/uk_freedomfamily	551487	1	1	Добро пожаловать на территорию курения кальяна, вишневого пуэра и угара!  Мы фантазируем, экспериментируем и угощаем вас!  Мы создаем домашнюю атмосферу с душевным общением, дымным кальяном, вкусным чаем и видеоиграми!	<p>Добро пожаловать на территорию курения кальяна, вишневого пуэра и угара! Мы фантазируем, экспериментируем и угощаем вас! Мы создаем домашнюю атмосферу с душевным общением, дымным кальяном, вкусным чаем и видеоиграми! </p><p>Мы любим играть на приставке и настольные игры как дети, курить хорошие кальяны втягивая холодный дым как взрослые, смотреть фильмы на большом телеке как подростки во времена видеотек и видеозалов, слушать негромкую хорошую музыку в отличной компании друзей, болеть за любимую команду как самый ярый фанат, и конечно же общаться как старые знакомые с абсолютно новыми для нас людьми. </p><p>&nbsp;Мы существуем на ваши пожертвования, на которые покупаем новые виды табака, чая и новинки видеоигр. </p><p>Внимание! У нас вход только с 20 лет! В случае, если ты забронировал стол, но у наших кальянщиков возникли сомнения по поводу возраста, и ты не смог его доказать, не обижайся.</p>	t	f	f	f	t	t	55.7859	49.1154	t	f	Кальянная FreeDom | Казань kalyan.space	Кальянная FreeDom городе Казань, располагаемся по адресу Лево Булачная, 52. У нас вы найдете домашнюю атмосферу с душевным общением, дымным кальяном, вкусным чаем и видеоиграми!	\N	kalyannaya-freedom-kazan	12	\N	312	f
258	Prime House	Гончарова, 56	+7(8422)72-74-75	\N	https://instagram.com/primehouse73	https://vk.com/primehouse73	479123	1	1	Отличный персонал, уютная обстановка. Быстрая подача, огромный выбор табака. Цена-качество.	Prime House - всероссийская кальянная европейского уровня теперь и в городе Ульяновск. \r\nPrime House в Ульяновске - это не только кальян-бар но и магазин где можно приобрести лучшие сорта табака и кальянные аксессуары. Покурить дымный кальян или бестабачный паровой коктейль насыщенный аромат которого поражает воображение можно как в стенах заведения где к вашим услугам дружелюбный персонал и уютная атмосфера так и заказав услугу "кальян на выезд" которая заинтересует тех кто хочет устроить день рождения или отметить торжество весело и дымно.	f	f	f	f	f	f	54.3211	48.4015	t	f	Кальянная Prime House | Ульяновск	Кальянная Prime House в городе Ульяновск располагается по адресу Гончарова, 56	\N	prime-house	45	\N	315	f
262	Smoky People	Ленина, 32	+7 (347) 262‒78‒87	http://smokypeople.ru/	https://instagram.com/smokypeople	https://vk.com/smokypeople	479561	1	1	Smoky People — это уютный кальян-бар в центре города Уфа! Который создан не только с упором на восточные традиции: курение кальянов, употребление эксклюзивного чая и восточных сладостей, но и как ночной клуб по выходным соблюдающий все модные тенденции в 	Smoky People — это уютный кальян-бар в центре города Уфа! Который создан не только с упором на восточные традиции: курение кальянов, употребление эксклюзивного чая и восточных сладостей, но и как ночной клуб по выходным соблюдающий все модные тенденции в современной танцевальной культуре.\r\nSmoky People — это место, где собираются истинные ценители кальяна и восточных традиций, шумные компании, пары, избравшие его для первого свидания, любители поесть, повеселиться, потанцевать, расслабиться до и после клуба, куда гости приходят постоянно, где знают их вкусы и пристрастия, где они чувствуют себя уютно, расслаблено и комфортно!	f	t	t	f	f	f	54.7275	55.9485	t	f	Кальянная Smoky People | Уфа	Кальянная Smoky People в городе Уфа располагается по адресу Ленина,32	\N	smoky-people	86	\N	319	f
263	Tche Tche, лаунж-клуб	Самарская, 130	+7 (846) 991‒61‒11	\N	\N	https://vk.com/loungetchetche	499099	1	1	lounge Tche Tche – одна из лучших кальянных в Самаре, где можно расслабиться, устроившись в мягких зонах на подушках, покурить ароматный кальян, насладиться вкусом настоящего китайского чая, покушать вкусные роллы. Обслуживающий персонал в кафе приветлив 	lounge Tche Tche – одна из лучших кальянных в Самаре, где можно расслабиться, устроившись в мягких зонах на подушках, покурить ароматный кальян, насладиться вкусом настоящего китайского чая, покушать вкусные роллы. Обслуживающий персонал в кафе приветлив и внимателен, а сервис не вызывает никаких нареканий.\r\n\r\nВ нашем кафе вы можете воспользоваться бесплатно WI-FI интернетом!	f	f	f	f	f	f	53.1941	50.1058	t	f	Кальянная Tche Tche | Самара	Кальянная Tche Tche находится в Самаре по адресу Самарская, 130	\N	tche-tche-loundge	96	\N	320	f
267	Saint-P Smoke	Владимирский проспект 1/47	+7‒911‒904‒70‒37	\N	\N	https://vk.com/saintpsmoke	498817	1	1	Saint-P Smoke открывает свои двери для настоящих любителей отличного, густого и по-настоящему вкусного кальяна. Для вас представлена отличная линейка разнообразных видов табаков, от легких и мягких, до крепких и очень насыщенных. 	Saint-P Smoke открывает свои двери для настоящих любителей отличного, густого и по-настоящему вкусного кальяна. Для вас представлена отличная линейка разнообразных видов табаков, от легких и мягких, до крепких и очень насыщенных. Придя к нам вы будете всегда ощущать уют и тепло, которое подарят вам гостеприимные кальянщики и конечно же само заведение SPS. Вы не только насладитесь дымным кальяном, ароматными чаями, настольными играми, но и вдохнете в себя всю красоту и величие Санкт-Петербурга.\r\n\r\nМы находимся в самом сердце Петербурга.\r\nАдрес:\r\nВладимирский проспект 1/47	f	t	t	f	f	f	59.9322	30.3469	t	f	Кальянная Saint-P Smoke | Санкт-Петербург	Кальянная Saint-P Smoke находится в Санкт-Петербурге по адресу Владимирский проспект 1/47	\N	saint-p-smoke-sankt-peterburg	140	\N	324	f
272	Наше Место	Чистопольская, 48	+7(843) 245‒27‒27	\N	https://www.instagram.com/nashemestokzn/	https://vk.com/nashemestokzn	551487	1	1	Замечательная обстановка, внимательный персонал, приятная музыка. Если хотите приятно провести - то вам к нам. Время у нас летит незаметно, оставляя только положительные эмоции.	<p>До 18.00 кальян стоит 500 руб.</p><p>Находимся мы по улице Чистопольская, 48, в нашей кальянной вы можете с друзьями поиграть в настольные игры и покурить ароматный кальян.</p><p>Табаки: альфакир, нахла, дубака, афзал, блюби, альфахама, аргилиньо + премиум табаки Танжирс, Фумари</p>	f	f	f	f	t	t	55.8184	49.1271	t	f	Наше Место Кальянная в Казани	Кальянная "Наше Место" находится на Чистопольской, 48 в городе Казань.	\N	nashe-mesto-kalyannaya-kazan	195	\N	338	f
273	ДымRoom	Островского, 67	+7(987)226‒27‒67	http://дымрум.рф	https://www.instagram.com/dm_room/	\N	551487	1	1	Здесь каждый себе найдёт занятие по душе — бесконечные битвы на X-Box, ароматные кальяны, настольные игры, хорошая музыка и крайне интересные персонажи.	<p>Кальянный клуб Дым Room — уютное заведение в самом центре Казани. Здесь каждый себе найдёт занятие по душе — бесконечные битвы на X-Box, ароматные кальяны, настольные игры, хорошая музыка и крайне интересные персонажи! Настоящая зона комфорта — здесь нереально увидеть назойливых официантов, навязывающих свои гастрономические предпочтения — еду и напитки можно приносить с собой. Доставка пиццы и прочих вкусняшек приветствуется, так что выбор только за Вами. Кроме того, Вы можете приносить с собой алкоголь, в заведении введен вполне гуманный пробковый сбор. Полная свобода действий, полёт фантазии и только хорошие эмоции — это Дым Room.</p>	f	f	f	f	f	f	55.7836	49.126	t	f	ДымRoom Кальянный клуб Казани	Кальянный Клуб ДымRoom, если хочется расслабиться, подымить и попить чай приходи к нам находимся по адресу - город Казань ул. Островского 67, вход со двора! 	\N	dymroom-kazan	203	\N	339	f
277	Continent	Галии Кайбицкой, 6а	+7(951)066‒65‒38	\N	https://www.instagram.com/continent.kzn/	https://vk.com/continentkzn	551487	1	1	Индивидуальные кабинки оформленные в своем стиле. Чай, кальян, печеньки легкий алкоголь и видеоигры.	<p>Теперь Continent работает для Вас с 18-1 каждый день, а в пт и сб до 2, по адресу Г.Кайбицкой 6А (вход через амбар). Будем рады Вас видеть!</p><p>Следите за новостями) И участвуйте в наших блиц-опросах) А самые активные получат приятные бонусы.</p><p>Тел. для брони: 8(951)066-65-38.</p><p>P.S. У нас Вы найдете то, что так давно искали. Качество гарантируем!</p>	f	t	t	f	f	f	55.7787	49.2321	t	f	Кальянная Continent Казань	Кальянная Continent г.Казань ул. Г.Кайбицкой 6А (вход через амбар). Будем рады Вас видеть.	\N	kalyannaya-continent-kazan	242	\N	343	f
278	Unity Hall	Бутлерова, 21	+7(905‒)377‒18‒50	\N	\N	http://vk.com/ukkzn	551487	1	1	Уникальность! Каждый день новые события.	<p>Уникальность.Каждый день новые события.</p><p>Концертные мероприятия, вечера кальянных знаний и экспериментов, Stand Up, закрытые культовые вечеринки и не только...</p><p>Каким бы отличным не был Ваш кальян, мы не ставим его целью посещения.</p><p>На то мы и Уникальная Кальянная: мы хотим предложить Вам нечто иное, свой мир, в котором за лояльность Вы получите нечто большее...</p><p>Настоящие эмоции от посещения, которые Вы оцените по своему усмотрению.</p><p>До встречи в единственной Уникальной Кальянной Казани, до встречи в UNITY HALL.</p>	f	f	t	f	f	f	55.7879	49.1302	t	f	Уникальная Кальянная "Unity Hall", Казань	"Unity Hall", уникальная кальянная расположенная в городе Казань по адресу ул. Бутлерова 21	\N	unikalnaya-kalyannaya-unity-hall-kazan	252	\N	344	f
285	Liberty	Верхнеполевая, 1	+7(8422)75‒50‒69	\N	https://www.instagram.com/liberty_hookah_lounge/	https://vk.com/liberty_uln	479123	1	1	Lounge заведение Liberty - это совершенно новое место в Ульяновске. Место где вы можете обрести спокойствие и покой, освободится и забыть насущные проблемы, окунуться в атмосферу дружбы, уюта и комфорта.	<p>Lounge заведение Liberty - это совершенно новое место в Ульяновске. Место где вы можете обрести спокойствие и покой, освободится и забыть насущные проблемы, окунуться в атмосферу дружбы, уюта и комфорта.</p><p>(Вход со двора)</p><p>Бронь столиков ведется по телефону.</p>	f	t	t	f	f	f	54.3253	48.3864	t	f	Кальянная Liberty в Ульяновске	Кальянная Liberty в Ульяновске находится на улице Верхнеполевая, 1 вход со двора	\N	liberty-ulyanovsk	324	\N	351	f
294	Underground	Победы, 39	+7(917)497‒40‒07	\N	https://www.instagram.com/Underground_ufa/	https://vk.com/club80678077	479561	1	1	Мы будем рады видеть вас в гости 7 дней в неделю с 18.00 до последнего гостя. У нас Вы можете недорого, насладиться чарующей магией аромата качественного кальянного табака 	<p>Мы будем рады видеть вас в гости 7 дней в неделю с 18.00 до последнего гостя. У нас Вы можете недорого, насладиться чарующей магией аромата качественного кальянного табака . Для создания атмосферы отпуска ,беззаботности и тепла сдобренная ритмами приятной музыки, всегда в наличии только лучший табак, уголь, чашки глиняные и керамические, шланги классические и аксессуары.</p><p>5 причин попробовать кальян и чай в « Underground»:</p><ul><li>Мы продаем только свежий и качественный табак.</li><li>У нас удобное месторасположение.Мы находимся в самом центре Черниковки ул.Победы 39.</li><li>Возможность насладится не только табаком, но и качественным чаем, а к нему– изысканные восточные сладости и сухофрукты</li><li>У нас два зала. Один из них VIP – где наши гости могут в дружеской компании посмотреть множество хороших фильмов. Также у нас много других интересных и увлекательных игр.</li><li>Мы гарантируем качественный отдых ! Вы почувствуете уют, гостеприимство, комфорт.</li></ul>	t	t	f	f	t	t	54.8219	56.0827	t	f	Кальянная Underground  | Уфа	Кальянная Underground в Уфе находится на улице Победы, 39	\N	kalyannaya-underground-ufa	413	\N	360	f
296	Loft	ул. Гагарина, 1/3, ТРК "Олимп", 4 этаж	+7(989)958‒54‒44	http://www.loft-ufa.ru/	https://www.instagram.com/bar_restaurant_loft_/	http://vk.com/loft_ufa	479561	1	1	«LOFT» -  стильный Bar & Restaurant с роскошным интерьером, отличной европейской кухней, кальяном и разнообразной развлекательной программой.	<p>Интерье Bar & Restaurant LOFT полностью отражает его названиеп: кирпичная кладка стен с нарочито небрежными "ободранными" панелями, металлические конструкции на потолке, к которым крепятся многочисленные точечные светильники и разные по стилистике люстры, грубая мебель соседствует с мягкими креслами, массивные стеллажи, на которых то там, то здесь уместно расположились разнообразные сувениры,- всё это создает ощущение отлично продуманного дизайна, атмосферность которого впечатлит любого, кто понимает значение понятия "стиль". Сюда приходят, чтобы в уютной, приватной обстановке послушать живые выступления музыкантов, для которых в Bar & Restaurant LOFT имеется небольшая сцена, оснащенная современным оборудованием. Здесь проходят зажигательные клубные вечеринки, разнообразные шоу-программы.</p><p>Кухня в Bar & Restaurant LOFT преимущественно европейская и японская: холодные закуски, разнообразные салаты, большой выбор супов, стейки, блюда из мяса и рыбы, на гриле, пицца, суши, роллы, роскошные десерты, шикарная винная  и коктельная карта.</p><p>Своим посетителям Bar & Restaurant LOFT предлагает сытные бизнес-ланчи, банкетное меню, возможность организации праздников.</p><p>Bar & Restaurant LOFT- идеальное место для тех, кто ищет атмосферное заведение, позволяющее не только отлично пообедать, но и полноценно и разнообразно отдохнуть.</p>	f	t	t	f	f	f	54.7652	56.0506	t	f	Кальянная Loft | Уфа	Кальянная Loft в Уфе по улице ул. Гагарина, 1/3, ТРК "Олимп", 4 этаж	\N	kalyannaya-loft-v-ufe	432	\N	362	f
301	Zona 69	Пушкина, 52	+7(843) 203-42-49	\N	https://www.instagram.com/zona69_kzn/	https://vk.com/zona69_kzn	551487	1	1	Zona 69 - интересная кальянная в самом центре Казани на улице Пушкина. Заведение находится не в подвале, а на 3 этаже, что является большим преимуществом по сравнению со многими другими заведениями.	<p>У нас вы найдете немалый выбор табаков и кальянов, в том числе кальяны Figaro, Temple, Shapes. Так же в 2015 году мы обновили дизайн, что сделало заведение более уютным и теплым.</p><p>От нашего заведения останутся приятные эмоции, днем у нас тихо и спокойно, а вечером царит клубная атмосфера. Советуем посетить нашу кальянную.</p>	f	f	f	f	f	f	55.7941	49.1257	t	f	Кальянная "Zona 69" | Казань kalyan.space	Кальянная "Zona 69" находится в Казани по адресу	\N	kalyannaya-zona69-kazan	487	\N	367	f
303	Bedouin House	Новосондецкий бульвар, 19а	+7 (8422) 98‒48‒48	https://vk.com/bedouin_house	https://www.instagram.com/bedouin_house73/	\N	479123	1	1	Думаете и еще до сих пор не решили где покурить кальян? Тогда наша кальянная именно одно из тех мест, которое сможет вас порадовать ценами, атмосферой и конечно же ароматным кальяном.	<p>Наша кальянная порадует вас красивым интерьером, внимательным персоналом и дымными кальянами.</p><p>Думаете и еще до сих пор не решили где покурить кальян? Тогда наша кальянная именно одно из тех мест, которое сможет вас порадовать ценами, атмосферой и конечно же ароматным кальяном.</p>	f	f	f	f	t	t	54.3803	48.5788	t	f	Bedouin house Ульяновск	Кальянная Bedouin house в Ульяновске находится по адресу Новосондецкий бульвар, 19а	\N	kalyannaya-bedouin-house-ulyanovsk	509	\N	369	f
306	Enjoy	Шмидта 23	250 22-23	\N	https://www.instagram.com/enjoy_kzn/	https://vk.com/enjoykzn	551487	1	1	Вкусные кальяны, ароматные чаи, Playstation, японская кухня, дружеская атмосфера.	<p>Добро пожаловать в "Enjoy", новую актуальную площадку для работы отдыха.</p><p>Дневное время в формате коворкинга:</p><ul><li>Уютное рабочее место, комфортная рабочая атмосфера и напитки.</li></ul><p>Вечернее время для отдыха:</p><ul><li>изысканный кальян с целой палитрой ярких вкусов</li><li>редкие сорта чая, включая пуэр</li><li>просмотры любимых фильмов на больших LCD-телевизорах</li><li>море настольных игр от непредсказуемых карт "Уно" до интеллектуальной "Монополии"</li><li>безумные баталии в Sony Play Station 3</li><li>все это в потрясающей атмосфере дизайнерского оформления space high-tech.</li></ul><p>"Enjoy" - это клуб для друзей. Здесь нет меню и ценников. Мы не станем пугать вас чеками с четырьмя нолями. Если вам понравилась наша работа, оставьте материальную помощь на свое усмотрение.</p><p>"Enjoy" открывает свои двери каждый будний день с 12 дня до 02 ночи. В выходные мы открыты до последнего гостя. Мы находимся по адресу ул. Шмидта 23. (прямо на перекрестке Зинина и Шмидта). Бронирование столов по телефону 250-22-23. Вход только по брони. Приходите! Будем рады вас видеть!</p><p>Он-лайн бронирование <a href="//restreserv.ru/enjoy" target="_blank">http://restreserv.ru/enjoy </p><p>Внимание! "Enjoy" не продает табак и табачные изделия, не рекламирует курение, алкоголь и наркотики. Мы за здоровый отдых взрослых людей. Вход только с <strong>18-ти</strong> лет.</p>	f	f	t	f	t	t	55.7894	49.1569	t	f	Кальянная Enjoy | Казань	Кальянная Enjoy г. Казань улица Шмидта 23	\N	kalyannaya-enjoy-kazan	549	\N	372	f
307	ДК Инкогнито	Абсалямова, 13	+7 (917) 888 26-00	\N	https://www.instagram.com/dk_inkognito/	https://vk.com/inkognitofamily	551487	1	1	Огромный выбор как крепких так и лёгких табаков,каждому по вкусу! Так же в наличие крутой земляничный чай!	<p>работаем с 13.00 до 1.00 или до последнего клиента,предварительно позвоните по номер +7 917-888-26-00 забронируйте место на удобное вам время,ребята будут Вас ждать,алкоголь не продаем,есть безалкогольные напитки(dr Pepper,Pepsi) чаи,алкоголь можете с собой принести еду можете с собой,заказать к нам в заведение,цен на кальяны у нас нет,оставляете как считаете нужным,если возникают с этим трудности,можете спросить у кальянщика.</p>	f	t	f	f	f	f	55.8176	49.1096	t	f	Кальянная ДК Инкогнито | Казань	Кальянная ДК Инкогнито г. Казань улица 	\N	kalyannaya-dk-inkognito-kazan	558	\N	373	f
313	Feel free	Минская, 12	+7(905) 318 68-91	\N	\N	https://vk.com/feel_free_kzn	551487	1	1	Хотите провести приятный вечер в кругу друзей? Двери кальянной "Feel free" всегда открыты для вас!	<p>Внимание! Идет запись на бронирование столов на Новогоднюю ночь!</p><p>Хотите провести приятный вечер в кругу хороших друзей? Двери кальянной "Feel free" всегда открыты для вас! У нас вы можете насладиться густым и дымным кальяном, ароматным вкусным чаем) А также поиграть в различные настольные игры и в Xbox) Мы работаем без фиксированной платы за услуги . Почувствуй себя свободным!</p>	f	f	f	f	t	f	55.7722	49.2208	t	f	Кальянная Feel free | Казань	Кальянная Feel free г. Казань улица Минская, 12	\N	kalyannaya-feel-free-kazan	611	\N	379	f
317	2MAN	Коммунистическая, 92	+7 (987) 604 77-30	\N	https://www.instagram.com/uk_2man/	https://vk.com/2manfamily	479561	1	1	2MAN - кальянная, ключевой особенностью которой считается необычный подход к обслуживанию. 2MAN - атмосферное место с возможностью попробовать вкусные, дымные и необычные кальяны, побеседовать с интересными людьми и отлично провести время.	<p>Приветствуем Вас! 2MAN - кальянная, ключевой особенностью которой считается необычный подход к обслуживанию. 2MAN - атмосферное место с возможностью попробовать вкусные, дымные и необычные кальяны, побеседовать с интересными людьми и отлично провести время. Официанты, меню - всех этих формальностей у нас нет.</p><p>К нам вы можете заглянуть с друзьями, поиграть в интересные настольные игры и отлично провести время, наслаждаясь кальянами наших мастеров.</p><p>У нас в гостях Вы будете погружены в нашу атмосферу тела и уюта, никакой суеты, только вкусные кальяны и общение по душам.</p><ul><li>Дух свободы и уюта;</li><li>Отсутствие суеты;</li><li>Неповторимая атмосфера;</li><li>Качественная музыка;</li><li>Большой ассортимент.</li></ul>\r\n<p>Это все наш мир. ЭТО <strong>2MAN</strong>.</p>	f	f	f	f	f	t	54.7228	55.958	t	f	Кальянная 2MAN | Уфа	Кальянная 2MAN г. Уфа улица Коммунистическая, 92	\N	kalyannaya-2man-ufa	648	\N	383	f
637	KaiLas	Красноармейская, 17/13	+7 (8422) 99‒70‒10	\N	https://instagram.com/kailas_ulsk	https://vk.com/kailas73	479123	1	1	\N	\N	f	f	f	f	f	f	54.324723	48.399757	t	f	\N	\N	\N	\N	\N	\N	\N	t
638	Ma Vie	Карла Маркса, 19	+7‒917‒618‒20‒15	\N	https://instagram.com/ma_vie73	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.321128	48.393159	t	f	\N	\N	\N	\N	\N	\N	\N	t
639	Smoke House	Репина, 8	+7 (8422) 72‒77‒00	\N	https://instagram.com/smokehouse_73	https://vk.com/smokehouse73	479123	1	1	\N	\N	f	f	f	f	f	f	54.350233	48.352184	t	f	\N	\N	\N	\N	\N	\N	\N	t
640	ХукаПлейс	Пожарный переулок, 8	+7‒906‒147‒42‒91	ul.hookahplace.ru	https://instagram.com/hookahplaceul	https://vk.com/hookahplaceul	479123	1	1	\N	\N	f	f	f	f	f	f	54.316995	48.398581	t	f	\N	\N	\N	\N	\N	\N	\N	t
641	Дым востока	Молочный переулок, 1а	+7 (8422) 70‒40‒24	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.320316	48.395139	t	f	\N	\N	\N	\N	\N	\N	\N	t
642	Табакофф	Карла Маркса, 13а к3	+7‒937‒455‒07‒54	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.320146	48.396178	t	f	\N	\N	\N	\N	\N	\N	\N	t
643	Kalianov Bar	3 Интернационала, 2	+7 (8422) 70‒18‒10	\N	https://instagram.com/kalianovbar73	https://vk.com/kalianovbar73	479123	1	1	\N	\N	f	f	f	f	f	f	54.306056	48.388565	t	f	\N	\N	\N	\N	\N	\N	\N	t
644	BarHan	Молочный переулок, 6	+7 (8422) 93‒71‒71	\N	https://instagram.com/barhan_73	https://vk.com/barhan_73	479123	1	1	\N	\N	f	f	f	f	f	f	54.320484	48.395264	t	f	\N	\N	\N	\N	\N	\N	\N	t
645	Eclipse	Карла Маркса, 7	+7 (8422) 99‒99‒10	\N	https://instagram.com/nargilia_eclipse	https://vk.com/eclipseul	479123	1	1	\N	\N	f	f	f	f	f	f	54.318529	48.399328	t	f	\N	\N	\N	\N	\N	\N	\N	t
647	Дворцовый ряд, ООО	Гая проспект, 100	+7 (8422) 36‒09‒91	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.253182	48.316753	t	f	\N	\N	\N	\N	\N	\N	\N	t
649	МЕГАПОЛИС, ЗАО	Профсоюзная, 56	+7 (8422) 36‒09‒48	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.240548	48.302817	t	f	\N	\N	\N	\N	\N	\N	\N	t
650	Мастерская 1925	Комсомольский переулок, 3Б	+7‒950‒882‒20‒00	\N	https://instagram.com/masterskaya1925	https://vk.com/m1925	479123	1	1	\N	\N	f	f	f	f	f	f	54.31416	48.387476	t	f	\N	\N	\N	\N	\N	\N	\N	t
652	СНС Волга, ООО	Локомотивная, 16	+7 (8422) 32‒16‒02	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.283816	48.352793	t	f	\N	\N	\N	\N	\N	\N	\N	t
656	Облака	Рябикова, 22Б	+7 (8422) 99‒66‒67	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.284225	48.299944	t	f	\N	\N	\N	\N	\N	\N	\N	t
666	Vegas	Промышленная, 59а	+7 (8422) 76‒00‒82	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.282925	48.30825	t	f	\N	\N	\N	\N	\N	\N	\N	t
668	Kvartira	Ливанова проспект, 9	+7 (8422) 99‒90‒22	\N	https://instagram.com/kvartira.lounge	https://vk.com/kvartira_lounge	479123	1	1	\N	\N	f	f	f	f	f	f	54.384422	48.567744	t	f	\N	\N	\N	\N	\N	\N	\N	t
669	Steam Bar	Гончарова, 38	+7‒960‒372‒90‒00	\N	https://instagram.com/steam_bar	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.318397	48.397859	t	f	\N	\N	\N	\N	\N	\N	\N	t
670	Smoke Club	Шигаева, 7а	+7 (8422) 72‒10‒25	\N	https://instagram.com/smokeclub_ulsk	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.267493	48.27803	t	f	\N	\N	\N	\N	\N	\N	\N	t
671	JUST SMOKE	Федерации, 22	+7‒906‒393‒75‒75	\N	\N	https://vk.com/just_smoke_73	479123	1	1	\N	\N	f	f	f	f	f	f	54.323378	48.396049	t	f	\N	\N	\N	\N	\N	\N	\N	t
673	the Loft	Федерации, 3	+7‒951‒095‒25‒25	\N	https://instagram.com/loft_ulsk	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.320625	48.394167	t	f	\N	\N	\N	\N	\N	\N	\N	t
674	Киоск по продаже табачной продукции	50-летия ВЛКСМ проспект, 7а киоск	+7‒960‒379‒12‒63	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.305454	48.330551	t	f	\N	\N	\N	\N	\N	\N	\N	t
679	Электронная альтернатива	Кузоватовская, 9	+7‒951‒096‒70‒30	\N	\N	https://vk.com/elektronka73	479123	1	1	\N	\N	f	f	f	f	f	f	54.279033	48.301733	t	f	\N	\N	\N	\N	\N	\N	\N	t
680	JoyeShop	Карла Маркса, 4а	8‒800‒500‒88‒38	joyeshop.ru	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.317678	48.39965	t	f	\N	\N	\N	\N	\N	\N	\N	t
681	VAPE SHOP №1	Радищева, 31	+7 (8422) 79‒21‒83	electron-cig.ru	\N	https://vk.com/electron_cig	479123	1	1	\N	\N	f	f	f	f	f	f	54.325689	48.403282	t	f	\N	\N	\N	\N	\N	\N	\N	t
682	NewSmoker.ru	Гончарова, 11а	+7 (8422) 707‒420	newsmoker.ru	\N	https://vk.com/newsmoker	479123	1	1	\N	\N	f	f	f	f	f	f	54.313863	48.394744	t	f	\N	\N	\N	\N	\N	\N	\N	t
683	ulVaper	Камышинская, 16в	+7‒909‒360‒44‒72	\N	\N	https://vk.com/ulvaper	479123	1	1	\N	\N	f	f	f	f	f	f	54.272284	48.296155	t	f	\N	\N	\N	\N	\N	\N	\N	t
684	Магазин электронных сигарет	Генерала Тюленева проспект, 25	+7‒927‒985‒96‒00	\N	\N	\N	479123	1	1	\N	\N	f	f	f	f	f	f	54.382677	48.58565	t	f	\N	\N	\N	\N	\N	\N	\N	t
685	Альтернатива	Ульяновский проспект, 16	+7‒937‒872‒10‒43	\N	\N	https://vk.com/electronic_sigar	479123	1	1	\N	\N	f	f	f	f	f	f	54.376872	48.579261	t	f	\N	\N	\N	\N	\N	\N	\N	t
686	Pro-vapers	Карла Маркса, 4а	+7‒902‒126‒34‒10	Pro-vapers.ru	\N	https://vk.com/pro_vapers_ru	479123	1	1	\N	\N	f	f	f	f	f	f	54.317635	48.399946	t	f	\N	\N	\N	\N	\N	\N	\N	t
687	Электронка	Кирова, 28	+7‒927‒831‒07‒11	\N	\N	https://vk.com/el_alternativa	479123	1	1	\N	\N	f	f	f	f	f	f	54.295862	48.375668	t	f	\N	\N	\N	\N	\N	\N	\N	t
713	Edison	Гафури, 77	+7 (347) 266‒70‒95	edisonufa.ru	https://instagram.com/edison_ufa	https://vk.com/edisonufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.731509	55.930357	t	f	\N	\N	\N	\N	\N	\N	\N	t
714	Дым	Чернышевского, 104	+7 (347) 262‒78‒87	gotosmoke.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.726149	55.95328	t	f	\N	\N	\N	\N	\N	\N	\N	t
718	Cosmo Shop	Октября проспект, 91	+7‒962‒528‒07‒67	ufa.cosmoshop.pro	https://instagram.com/cosmoshop_ufa	https://vk.com/hookahhookahufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.777079	56.02864	t	f	\N	\N	\N	\N	\N	\N	\N	t
719	Magic Bar & ChillOut	Пушкина, 45/1	+7 (347) 299‒99‒77	magicbarufa.ru	https://instagram.com/magicbar_ufa	https://vk.com/magicbar_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.725369	55.930313	t	f	\N	\N	\N	\N	\N	\N	\N	t
720	SMOKE LAB	Ибрагимова бульвар, 88	+7 (347) 299‒31‒73	\N	\N	https://vk.com/smokelab_vape_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.739359	55.971036	t	f	\N	\N	\N	\N	\N	\N	\N	t
721	KOMFORT	Худайбердина, 22	+7 (347) 266‒01‒66	\N	\N	https://vk.com/hookahartkomfort	479561	1	1	\N	\N	f	f	f	f	f	f	54.727258	55.95832	t	f	\N	\N	\N	\N	\N	\N	\N	t
723	i-tobacco	Айская, 76	+7‒987‒105‒32‒80	\N	https://instagram.com/kalyan_ufa02	https://vk.com/i_tobacco_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.733417	55.980054	t	f	\N	\N	\N	\N	\N	\N	\N	t
724	Чайный клуб дыма	Октября проспект, 49	+7‒917‒762‒22‒62	\N	\N	https://vk.com/klubdyma	479561	1	1	\N	\N	f	f	f	f	f	f	54.755231	56.002634	t	f	\N	\N	\N	\N	\N	\N	\N	t
726	Aksakov Lounge	Октября проспект, 75	+7‒917‒777‒30‒77	\N	https://instagram.com/aksakov__lounge	https://vk.com/aksakovlounge	479561	1	1	\N	\N	f	f	f	f	f	f	54.76826	56.019911	t	f	\N	\N	\N	\N	\N	\N	\N	t
727	Truemen`s	Бакалинская, 23	+7 (347) 266‒10‒61	\N	\N	https://vk.com/edisonhookah	479561	1	1	\N	\N	f	f	f	f	f	f	54.718915	55.989006	t	f	\N	\N	\N	\N	\N	\N	\N	t
728	Салам	Чудинова, 14	+7 (347) 294‒95‒77	\N	https://instagram.com/salamufa	https://vk.com/salam_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.794836	56.034832	t	f	\N	\N	\N	\N	\N	\N	\N	t
729	HookahPlace	Карла Маркса, 30	+7 (347) 266‒89‒21	hookahplaceufa.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.730909	55.94359	t	f	\N	\N	\N	\N	\N	\N	\N	t
730	HS	Обская, 2	+7‒937‒353‒63‒33	\N	\N	https://vk.com/hookah_smoke_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.715905	56.000815	t	f	\N	\N	\N	\N	\N	\N	\N	t
731	Muffin Lounge	Менделеева, 136/1	+7‒917‒042‒40‒42	\N	https://instagram.com/muffin_lounge	https://vk.com/muffin_lounge	479561	1	1	\N	\N	f	f	f	f	f	f	54.718058	56.012608	t	f	\N	\N	\N	\N	\N	\N	\N	t
732	Шишка	Центральная, 23	+7 (347) 266‒84‒36	\N	https://instagram.com/shishkaufa	https://vk.com/shishkaufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.693682	55.824787	t	f	\N	\N	\N	\N	\N	\N	\N	t
733	THE OFFICE Nargilia Lounge	Цюрупы, 76	+7‒917‒409‒02‒22	nargilia.com	https://instagram.com/theofficeufa	https://vk.com/nargiliaufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.728331	55.956571	t	f	\N	\N	\N	\N	\N	\N	\N	t
734	Аль-Султан Уфа	Октября проспект, 78	+7‒937‒855‒18‒91	\N	\N	https://vk.com/ufaalsultan	479561	1	1	\N	\N	f	f	f	f	f	f	54.763166	56.015109	t	f	\N	\N	\N	\N	\N	\N	\N	t
735	Qmar	Юрия Гагарина, 35	+7‒987‒057‒53‒83	\N	\N	https://vk.com/qmar_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.768973	56.072564	t	f	\N	\N	\N	\N	\N	\N	\N	t
736	Hoogarden	Коммунистическая, 49	+7 (347) 299‒58‒98	hoogarden.com	https://instagram.com/hoogardenufa	https://vk.com/hoogardenufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.726966	55.945151	t	f	\N	\N	\N	\N	\N	\N	\N	t
738	Biggie Smoke	Ленина, 65а	+7‒987‒254‒08‒85	\N	https://instagram.com/biggiesmoke_ufa	https://vk.com/biggiesmoke_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.738	55.953097	t	f	\N	\N	\N	\N	\N	\N	\N	t
739	Премьер, ООО	Новожёнова, 88 к3	+7 (347) 244‒88‒99	www.tkpremier.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.785014	56.066176	t	f	\N	\N	\N	\N	\N	\N	\N	t
740	МЕГАПОЛИС, ЗАО	Новожёнова, 86/3	+7 (347) 292‒40‒37	gkm.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.786562	56.063792	t	f	\N	\N	\N	\N	\N	\N	\N	t
741	SEA SMOKE LOUNGE	Караидельская, 2	+7‒987‒473‒94‒62	\N	https://instagram.com/sea_smoke_	https://vk.com/sea_smoke1	479561	1	1	\N	\N	f	f	f	f	f	f	54.707746	55.993598	t	f	\N	\N	\N	\N	\N	\N	\N	t
742	Mixed Place	Айская, 37	+7‒965‒933‒49‒17	\N	https://instagram.com/mixedplace	https://vk.com/mixedplace	479561	1	1	\N	\N	f	f	f	f	f	f	54.715983	55.978628	t	f	\N	\N	\N	\N	\N	\N	\N	t
743	К-Мастер	Октября проспект, 4/1	+7 (347) 287‒28‒60	kalyan-group.ru	https://instagram.com/kalyanmaster	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.74157	55.987823	t	f	\N	\N	\N	\N	\N	\N	\N	t
744	Лавка подарков	Менделеева, 205а	+7 (347) 286‒15‒33	lavka-ufa.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.741938	56.026757	t	f	\N	\N	\N	\N	\N	\N	\N	t
745	GAGARIN	Ленина, 65	+7‒927‒927‒19‒55	\N	https://instagram.com/gagarin.ufa	https://vk.com/gagarin_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.73742	55.95279	t	f	\N	\N	\N	\N	\N	\N	\N	t
746	Sherlock	Чернышевского, 75	+7‒917‒401‒34‒41	www.sherlock-shops.com	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.729186	55.946086	t	f	\N	\N	\N	\N	\N	\N	\N	t
747	Зефир Lounge Bar	Октября проспект, 91	+7‒919‒600‒80‒08	\N	https://instagram.com/zefir_lounge_bar	https://vk.com/zefir_lounge	479561	1	1	\N	\N	f	f	f	f	f	f	54.777447	56.029402	t	f	\N	\N	\N	\N	\N	\N	\N	t
748	СНС Уфа, ООО	Индустриальное шоссе, 4а к2	+7 (347) 279‒84‒14	www.sns.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.808347	56.084069	t	f	\N	\N	\N	\N	\N	\N	\N	t
749	Бар паровых коктейлей	Менделеева, 160/5	+7‒919‒14‒83‒922	ufalido.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.737743	56.030603	t	f	\N	\N	\N	\N	\N	\N	\N	t
750	Парильщик	Ибрагимова бульвар, 88	+7‒963‒141‒20‒84	www.ecigufa.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.739569	55.969643	t	f	\N	\N	\N	\N	\N	\N	\N	t
751	Churchill	Верхнеторговая площадь, 1	+7‒917‒424‒73‒17	churchill-tabak.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.725228	55.944372	t	f	\N	\N	\N	\N	\N	\N	\N	t
753	Чих-Пых	Максима Рыльского, 14	+7‒917‒798‒44‒44	\N	\N	https://vk.com/4uxpux	479561	1	1	\N	\N	f	f	f	f	f	f	54.768661	56.069545	t	f	\N	\N	\N	\N	\N	\N	\N	t
754	Oblako	Кустарная, 35/37	+7 (347) 275‒53‒33	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.733048	55.966718	t	f	\N	\N	\N	\N	\N	\N	\N	t
755	The hookah market	Юрия Гагарина, 14	+7‒967‒747‒77‒47	\N	https://instagram.com/the_hookah_market	https://vk.com/the_hookah_market	479561	1	1	\N	\N	f	f	f	f	f	f	54.764069	56.056182	t	f	\N	\N	\N	\N	\N	\N	\N	t
756	Colorado	Александра Невского, 20	+7‒987‒049‒99‒49	\N	\N	https://vk.com/coloradoufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.815685	56.095525	t	f	\N	\N	\N	\N	\N	\N	\N	t
757	Smoke House UFA	Октября проспект, 91	+7‒960‒800‒35‒79	\N	https://instagram.com/smokehouse_ufa	https://vk.com/shufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.777133	56.02865	t	f	\N	\N	\N	\N	\N	\N	\N	t
758	Саитгалин Д.Р., ИП	Гурьевская, 3а к11	+7 (347) 246‒02‒89	www.tabak-opt.com	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.714843	55.985544	t	f	\N	\N	\N	\N	\N	\N	\N	t
759	PANDORA	Ибрагимова бульвар, 49	+7‒917‒733‒45‒55	upandora.ru	\N	https://vk.com/upandora	479561	1	1	\N	\N	f	f	f	f	f	f	54.741848	55.962944	t	f	\N	\N	\N	\N	\N	\N	\N	t
760	SmokinBull	Мингажева, 158	+7‒987‒258‒62‒48	\N	\N	https://vk.com/starbuzz_ufa_tabak	479561	1	1	\N	\N	f	f	f	f	f	f	54.734359	55.97142	t	f	\N	\N	\N	\N	\N	\N	\N	t
761	Сапсан-Регион, ООО	Трамвайная, 2	+7 (347) 260‒03‒65	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.79681	56.060922	t	f	\N	\N	\N	\N	\N	\N	\N	t
762	Massaii Hookah Lounge	Ленина, 102	+7‒987‒031‒15‒10	\N	https://instagram.com/massaii_shisha_lounge	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.738729	55.954587	t	f	\N	\N	\N	\N	\N	\N	\N	t
763	Stanislaw	Комсомольская, 112	+7‒987‒041‒05‒64	stanislaw-tabak.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.752763	56.00878	t	f	\N	\N	\N	\N	\N	\N	\N	t
764	MILASHA HALL	50 лет Октября, 20	+7‒987‒031‒23‒58	\N	\N	https://vk.com/milasha_hall	479561	1	1	\N	\N	f	f	f	f	f	f	54.736817	55.970543	t	f	\N	\N	\N	\N	\N	\N	\N	t
765	Spot	Натальи Ковшовой, 10	+7‒987‒021‒21‒21	\N	https://instagram.com/spotufa	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.761149	56.056151	t	f	\N	\N	\N	\N	\N	\N	\N	t
766	CHILLHARD	Российская, 149	+7‒987‒617‒56‒88	\N	https://instagram.com/chillhard_	https://vk.com/chillhard	479561	1	1	\N	\N	f	f	f	f	f	f	54.776187	56.036185	t	f	\N	\N	\N	\N	\N	\N	\N	t
767	Новые технологии, ООО	Октября проспект, 8	+7 (347) 216‒37‒53	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.743462	55.990908	t	f	\N	\N	\N	\N	\N	\N	\N	t
768	GARAGE	Комсомольская, 153/2	+7‒937‒785‒59‒75	\N	https://instagram.com/garage_iskra	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.762938	56.020556	t	f	\N	\N	\N	\N	\N	\N	\N	t
769	КАМИН Hookahlab	Свердлова, 72/2	+7‒960‒380‒99‒99	\N	https://instagram.com/hookahlab_ufa	https://vk.com/hookahlab_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.725761	55.933026	t	f	\N	\N	\N	\N	\N	\N	\N	t
770	Колумб	Менделеева, 137	+7‒919‒615‒38‒87	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.71345	55.99379	t	f	\N	\N	\N	\N	\N	\N	\N	t
771	Chillim	Юрия Гагарина, 23/1	+7‒962‒523‒65‒03	\N	\N	https://vk.com/chillim_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.765519	56.067087	t	f	\N	\N	\N	\N	\N	\N	\N	t
772	AMSTERDAM	Первомайская, 28	+7‒917‒447‒60‒98	amsterdam-kalyan-ufa.com	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.816672	56.077011	t	f	\N	\N	\N	\N	\N	\N	\N	t
773	Табакерка	Октября проспект, 31	+7‒927‒303‒78‒73	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.750584	55.996917	t	f	\N	\N	\N	\N	\N	\N	\N	t
774	Русьимпорт-Уфа	Глазовская, 14/1	+7 (347) 292‒15‒22	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.692387	55.846253	t	f	\N	\N	\N	\N	\N	\N	\N	t
775	Салон табачных изделий и аксессуаров	Октября проспект, 34	+7‒987‒142‒79‒28	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.749489	56.000205	t	f	\N	\N	\N	\N	\N	\N	\N	t
776	Магазин	Красина, 21	+7‒919‒617‒32‒82	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.733833	55.934215	t	f	\N	\N	\N	\N	\N	\N	\N	t
777	NIGHT SHISHA	Молодёжный бульвар, 3	+7‒987‒583‒66‒50	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.74368	56.020878	t	f	\N	\N	\N	\N	\N	\N	\N	t
778	Трубка мира	Октября проспект, 31	+7‒917‒444‒45‒55	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.750584	55.996917	t	f	\N	\N	\N	\N	\N	\N	\N	t
779	Берлин	50 лет СССР, 3	+7‒987‒590‒57‒61	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.758701	55.999265	t	f	\N	\N	\N	\N	\N	\N	\N	t
780	Уют	Инициативная, 1/1 к6	+7‒937‒340‒00‒77	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.830394	56.094526	t	f	\N	\N	\N	\N	\N	\N	\N	t
781	Смоки Флэт лаунж	Владивостокская, 15	+7 (347) 262‒92‒15	\N	https://instagram.com/smokyflat	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.732944	55.985733	t	f	\N	\N	\N	\N	\N	\N	\N	t
782	Euphoria Garden	Кирова, 47	+7‒927‒087‒08‒00	\N	https://instagram.com/euphoriaufa	https://vk.com/euphoriaufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.729207	55.963703	t	f	\N	\N	\N	\N	\N	\N	\N	t
784	WildWildHookah	Ленина, 39/2	+7‒987‒091‒51‒69	\N	\N	https://vk.com/wildwildhookah	479561	1	1	\N	\N	f	f	f	f	f	f	54.733076	55.950593	t	f	\N	\N	\N	\N	\N	\N	\N	t
792	Nastoyashiy Vape	Октября проспект, 63	8‒800‒700‒05‒97	\N	https://instagram.com/nastoyashiy_vape	https://vk.com/nastoyashiy_vape	479561	1	1	\N	\N	f	f	f	f	f	f	54.759022	56.007857	t	f	\N	\N	\N	\N	\N	\N	\N	t
793	smokecenter vape store & bar	Ибрагимова бульвар, 49	+7‒917‒445‒06‒59	www.smokecenter.ru	https://instagram.com/smokecenter	https://vk.com/smokecenter	479561	1	1	\N	\N	f	f	f	f	f	f	54.741665	55.963653	t	f	\N	\N	\N	\N	\N	\N	\N	t
1026	Revanche	Кирова проспект, 147	+7 (846) 227‒52‒72	bcig.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.220346	50.263021	t	f	\N	\N	\N	\N	\N	\N	\N	t
794	Vaporing-Ufa	Юрия Гагарина, 1/3	+7‒987‒254‒45‒90	www.vaporing-ufa.ru	\N	https://vk.com/vaporing_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.765153	56.050345	t	f	\N	\N	\N	\N	\N	\N	\N	t
795	DRIP-DRIP	Свердлова, 92	+7‒999‒623‒88‒99	\N	https://instagram.com/dripdripvapors	https://vk.com/dripdrip	479561	1	1	\N	\N	f	f	f	f	f	f	54.725379	55.938824	t	f	\N	\N	\N	\N	\N	\N	\N	t
796	Vardex	Менделеева, 205а	8‒800‒505‒01‒25	www.vardex.ru	https://instagram.com/vardex_ru	https://vk.com/vardex_ru	479561	1	1	\N	\N	f	f	f	f	f	f	54.741453	56.026602	t	f	\N	\N	\N	\N	\N	\N	\N	t
798	Joye shop	Менделеева, 137	+7 (347) 266‒06‒48	joyeshop.ru	\N	https://vk.com/joyeshopufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.713512	55.993748	t	f	\N	\N	\N	\N	\N	\N	\N	t
799	Deep Cloud	Первомайская, 73	+7‒937‒323‒90‒40	\N	https://instagram.com/deep_cloud_vape	https://vk.com/deepcloudvape	479561	1	1	\N	\N	f	f	f	f	f	f	54.809552	56.104198	t	f	\N	\N	\N	\N	\N	\N	\N	t
800	EasyFog	Владивостокская, 12	+7‒987‒016‒84‒44	\N	https://instagram.com/easyfog	https://vk.com/easyfog	479561	1	1	\N	\N	f	f	f	f	f	f	54.733539	55.986654	t	f	\N	\N	\N	\N	\N	\N	\N	t
801	Niagara Vape Club	Маршала Жукова, 4/4	+7‒999‒133‒83‒78	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.766154	56.051474	t	f	\N	\N	\N	\N	\N	\N	\N	t
802	JokerSmoker Vape Shop	50 лет Октября, 20	+7‒987‒100‒50‒50	avrelectrosig.ru	\N	https://vk.com/avrelectrosig	479561	1	1	\N	\N	f	f	f	f	f	f	54.736727	55.970388	t	f	\N	\N	\N	\N	\N	\N	\N	t
803	Joker	Бакалинская, 27	+7‒967‒742‒11‒17	jokervape.ru	https://instagram.com/jokervape1	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.717002	55.983885	t	f	\N	\N	\N	\N	\N	\N	\N	t
804	Jubershop	Октября проспект, 12	+7‒917‒358‒90‒98	juber-shop.ru	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.744338	55.991395	t	f	\N	\N	\N	\N	\N	\N	\N	t
805	Woodpecker Vape Shop	Цюрупы, 42	+7 (347) 266‒96‒14	\N	\N	https://vk.com/woodpecker_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.726045	55.954208	t	f	\N	\N	\N	\N	\N	\N	\N	t
806	Niagara-shop	Октября проспект, 4/1	+7‒963‒236‒06‒86	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.741892	55.988251	t	f	\N	\N	\N	\N	\N	\N	\N	t
807	Vape Party	Энтузиастов, 20	+7‒906‒105‒51‒11	\N	\N	https://vk.com/vapepartyufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.758079	56.036518	t	f	\N	\N	\N	\N	\N	\N	\N	t
808	Торговая компания	Максима Рыльского, 22	+7‒937‒499‒00‒70	\N	\N	\N	479561	1	1	\N	\N	f	f	f	f	f	f	54.765489	56.073414	t	f	\N	\N	\N	\N	\N	\N	\N	t
809	The Sauce Bar	Заки Валиди, 5	+7‒927‒334‒33‒01	\N	https://instagram.com/thesaucebar	https://vk.com/thesaucebar	479561	1	1	\N	\N	f	f	f	f	f	f	54.721987	55.930042	t	f	\N	\N	\N	\N	\N	\N	\N	t
810	VapeBoutique	Космонавтов, 5	+7‒917‒766‒78‒38	\N	\N	https://vk.com/vape_boutique_ufa	479561	1	1	\N	\N	f	f	f	f	f	f	54.818211	56.061651	t	f	\N	\N	\N	\N	\N	\N	\N	t
827	1st GALLERY lounge	Меридианная, 1	+7 (843) 290‒77‒36	\N	https://instagram.com/1st_gallery_lounge	https://vk.com/1stgallery	551487	1	1	\N	\N	f	f	f	f	f	f	55.816922	49.114421	t	f	\N	\N	\N	\N	\N	\N	\N	t
828	AYATI	Пушкина, 52	+7 (843) 251‒30‒25	hayati-kzn.ru	https://instagram.com/ayati_kazan	https://vk.com/ayati_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.794024	49.125381	t	f	\N	\N	\N	\N	\N	\N	\N	t
829	THE LOFT	Кремлёвская, 21	+7 (843) 292‒37‒52	\N	https://instagram.com/loft_kzn	https://vk.com/loft_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.79346	49.116491	t	f	\N	\N	\N	\N	\N	\N	\N	t
830	Meduza	Парижской Коммуны, 14	+7 (843) 253‒44‒96	\N	\N	https://vk.com/meduzalounge	551487	1	1	\N	\N	f	f	f	f	f	f	55.782531	49.113183	t	f	\N	\N	\N	\N	\N	\N	\N	t
831	Inkognito	Абсалямова, 13	+7‒917‒888‒26‒00	\N	https://instagram.com/dk_inkognito	https://vk.com/inkognitofamily	551487	1	1	\N	\N	f	f	f	f	f	f	55.81804	49.109124	t	f	\N	\N	\N	\N	\N	\N	\N	t
832	Chulan	Чистопольская, 81	+7‒937‒615‒09‒05	\N	https://instagram.com/chulankzn	https://vk.com/chulankzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.822023	49.151354	t	f	\N	\N	\N	\N	\N	\N	\N	t
833	LOFT Club	Бурхана Шахиди, 9а	+7 (843) 245‒32‒79	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.787916	49.103744	t	f	\N	\N	\N	\N	\N	\N	\N	t
834	Смокинг	Муштари, 19 к1	+7 (843) 203‒21‒22	\N	https://instagram.com/smokingkazan	https://vk.com/smokingkzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.79174	49.134084	t	f	\N	\N	\N	\N	\N	\N	\N	t
835	Spectre Place	Дзержинского, 5	+7‒927‒436‒07‒50	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.796128	49.113685	t	f	\N	\N	\N	\N	\N	\N	\N	t
836	Plan B	Меридианная, 14а	+7‒960‒047‒28‒28	\N	\N	https://vk.com/plan_b_bar	551487	1	1	\N	\N	f	f	f	f	f	f	55.821611	49.117398	t	f	\N	\N	\N	\N	\N	\N	\N	t
837	К+	Профсоюзная, 12	+7 (843) 260‒12‒12	\N	https://instagram.com/kkk_plus	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.792209	49.113768	t	f	\N	\N	\N	\N	\N	\N	\N	t
838	Плед и Камин	Некрасова, 26	+7‒917‒912‒30‒24	\N	https://instagram.com/pledkamin4	https://vk.com/pledkamin	551487	1	1	\N	\N	f	f	f	f	f	f	55.788625	49.129308	t	f	\N	\N	\N	\N	\N	\N	\N	t
839	GR8MARVEL	Чернышевского, 35	+7 (843) 290‒38‒48	\N	https://instagram.com/gr8_marvel_kzn	https://vk.com/gr8_marvel_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.789223	49.105164	t	f	\N	\N	\N	\N	\N	\N	\N	t
840	МОСКОВСКИЙ	Соловецких Юнг, 10	+7‒927‒447‒70‒62	\N	https://instagram.com/moskovskykzn	https://vk.com/moskovsky_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.827172	49.073846	t	f	\N	\N	\N	\N	\N	\N	\N	t
841	Chernika	Сафиуллина, 8а	+7 (843) 297‒06‒26	\N	https://instagram.com/kislorodkzn	https://vk.com/kislorodkzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.753573	49.217528	t	f	\N	\N	\N	\N	\N	\N	\N	t
842	TЯGA	Астрономическая, 7	+7‒960‒053‒31‒12	tyaga-kzn.ru	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.789381	49.115797	t	f	\N	\N	\N	\N	\N	\N	\N	t
843	Нookahplace	Волкова, 70	+7‒917‒272‒20‒20	hookahplace.ru	https://instagram.com/hookahplaceofficial	https://vk.com/hookahplacetv	551487	1	1	\N	\N	f	f	f	f	f	f	55.787548	49.14405	t	f	\N	\N	\N	\N	\N	\N	\N	t
846	Dyme	Большая Красная, 34	+7‒937‒615‒21‒72	\N	https://instagram.com/dymekzn	https://vk.com/dymekzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.797502	49.122778	t	f	\N	\N	\N	\N	\N	\N	\N	t
847	Центр паровых коктейлей	Ямашева проспект, 69	+7‒937‒576‒49‒08	\N	https://instagram.com/hookah_lounge_69_	https://vk.com/hookah_lounge_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.825094	49.134935	t	f	\N	\N	\N	\N	\N	\N	\N	t
848	Все свои LOUNGE	Пушкина, 1/55а	+7 (843) 297‒26‒56	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.785497	49.119251	t	f	\N	\N	\N	\N	\N	\N	\N	t
849	Сладкая жизнь	Чистопольская, 33в	+7 (843) 253‒40‒90	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.819769	49.122089	t	f	\N	\N	\N	\N	\N	\N	\N	t
850	Мате лаундж	Гоголя, 21	+7 (843) 258‒72‒65	\N	\N	https://vk.com/matekzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.797322	49.133242	t	f	\N	\N	\N	\N	\N	\N	\N	t
851	Дым	Адоратского, 4	+7 (843) 240‒42‒44	\N	https://instagram.com/dym_kazan	https://vk.com/dym_kazan	551487	1	1	\N	\N	f	f	f	f	f	f	55.824378	49.147754	t	f	\N	\N	\N	\N	\N	\N	\N	t
852	Hubble Bubble Club	Юлиуса Фучика, 55	+7 (843) 258‒51‒22	\N	https://instagram.com/hbkazan	https://vk.com/hbkazan	551487	1	1	\N	\N	f	f	f	f	f	f	55.743635	49.204526	t	f	\N	\N	\N	\N	\N	\N	\N	t
853	Hookah Place Pushkin	Пушкина, 29а	+7 (843) 239‒38‒83	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.792615	49.124447	t	f	\N	\N	\N	\N	\N	\N	\N	t
854	Parom vapebar & shop	Карла Маркса, 41	+7‒951‒063‒99‒66	\N	https://instagram.com/parom_vapebar	https://vk.com/parom_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.795986	49.129443	t	f	\N	\N	\N	\N	\N	\N	\N	t
855	ВВС House	Астрономическая, 17	+7 (843) 240‒18‒06	\N	https://instagram.com/vvs_kazan	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.791152	49.118243	t	f	\N	\N	\N	\N	\N	\N	\N	t
856	Tooman	Гвардейская, 16а	+7‒987‒261‒54‒35	\N	https://instagram.com/tooman_kazan	https://vk.com/tooman_kazan	551487	1	1	\N	\N	f	f	f	f	f	f	55.790327	49.170762	t	f	\N	\N	\N	\N	\N	\N	\N	t
857	Vape Art	Карла Маркса, 50	+7‒967‒360‒70‒01	\N	\N	https://vk.com/vape_art116	551487	1	1	\N	\N	f	f	f	f	f	f	55.795648	49.129793	t	f	\N	\N	\N	\N	\N	\N	\N	t
858	Lion Lounge	Островского, 38	+7 (843) 259‒61‒64	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.785048	49.122131	t	f	\N	\N	\N	\N	\N	\N	\N	t
859	GreenMist	Сибгата Хакима, 42	+7‒904‒663‒31‒13	\N	https://instagram.com/greenmist_kzn	https://vk.com/greenmist_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.814355	49.134574	t	f	\N	\N	\N	\N	\N	\N	\N	t
860	Red Town	Аделя Кутуя, 68а	+7‒937‒599‒10‒25	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.784776	49.180903	t	f	\N	\N	\N	\N	\N	\N	\N	t
861	Al-Mawardi	Спартаковская, 165	+7 (843) 225‒60‒55	\N	https://instagram.com/mawardi_club	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.768484	49.153748	t	f	\N	\N	\N	\N	\N	\N	\N	t
862	Wood	Адоратского, 6в	+7‒966‒250‒35‒50	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.827894	49.147937	t	f	\N	\N	\N	\N	\N	\N	\N	t
863	MALINA	Космонавтов, 1	+7‒906‒322‒23‒21	\N	\N	https://vk.com/malina_kzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.801901	49.187138	t	f	\N	\N	\N	\N	\N	\N	\N	t
864	ШтабИК	Пушкина, 16	+7‒917‒861‒18‒39	\N	https://instagram.com/shtabikzn	https://vk.com/shtabikzn	551487	1	1	\N	\N	f	f	f	f	f	f	55.789548	49.124869	t	f	\N	\N	\N	\N	\N	\N	\N	t
865	Приют холостяка	Чернышевского, 27а	+7 (843) 292‒30‒01	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.79068	49.10718	t	f	\N	\N	\N	\N	\N	\N	\N	t
866	ART Home	Чистопольская, 79	+7‒917‒299‒27‒77	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.821516	49.152387	t	f	\N	\N	\N	\N	\N	\N	\N	t
867	EmpireLounge68	Чистопольская, 68	+7 (843) 203‒30‒22	\N	\N	https://vk.com/empirelounge68	551487	1	1	\N	\N	f	f	f	f	f	f	55.819003	49.137152	t	f	\N	\N	\N	\N	\N	\N	\N	t
868	Fantasy	Чистопольская, 19а	+7 (843) 265‒66‒67	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.819892	49.115111	t	f	\N	\N	\N	\N	\N	\N	\N	t
869	SmokeHouse	Ямашева проспект, 28а	+7‒917‒252‒74‒76	\N	https://instagram.com/smokehouse_kzn	https://vk.com/sh_kazan	551487	1	1	\N	\N	f	f	f	f	f	f	55.827708	49.094389	t	f	\N	\N	\N	\N	\N	\N	\N	t
870	КЛК	КСКа, 3	+7‒987‒265‒52‒95	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.774113	49.120927	t	f	\N	\N	\N	\N	\N	\N	\N	t
871	Marco Polo Lounge	Галиаскара Камала, 7	+7‒966‒260‒54‒54	\N	https://instagram.com/27.marco_polo_lounge	https://vk.com/club124927790	551487	1	1	\N	\N	f	f	f	f	f	f	55.784984	49.110181	t	f	\N	\N	\N	\N	\N	\N	\N	t
872	SYNDICATE	Мусина, 29Б к1	+7 (843) 258‒50‒72	\N	\N	https://vk.com/club104041057	551487	1	1	\N	\N	f	f	f	f	f	f	55.825664	49.119433	t	f	\N	\N	\N	\N	\N	\N	\N	t
873	274-й	Хусаина Мавлютова, 46	+7‒917‒288‒24‒08	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.747875	49.188966	t	f	\N	\N	\N	\N	\N	\N	\N	t
874	ARTCORE	Ямашева проспект, 51Б	+7 (843) 239‒34‒64	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.826398	49.125597	t	f	\N	\N	\N	\N	\N	\N	\N	t
875	Hookah Rooms	Баумана, 42/9	+7‒965‒620‒08‒00	\N	https://instagram.com/hr_kazan	https://vk.com/hr_kazan	551487	1	1	\N	\N	f	f	f	f	f	f	55.79205	49.111844	t	f	\N	\N	\N	\N	\N	\N	\N	t
876	Метрополь	Адоратского, 4	+7 (843) 259‒20‒30	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.823624	49.147753	t	f	\N	\N	\N	\N	\N	\N	\N	t
877	Чалбар	Спартаковская, 2Б	+7‒905‒317‒11‒47	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.779463	49.128706	t	f	\N	\N	\N	\N	\N	\N	\N	t
878	Новое Место	Чистопольская, 48	+7 (843) 259‒65‒66	\N	https://instagram.com/novoemesto116	https://vk.com/novoemesto116	551487	1	1	\N	\N	f	f	f	f	f	f	55.818401	49.126943	t	f	\N	\N	\N	\N	\N	\N	\N	t
879	Облака	Московская, 60	+7‒937‒003‒60‒60	\N	https://instagram.com/oblakaparbar.kazan	https://vk.com/oblakaparbar6	551487	1	1	\N	\N	f	f	f	f	f	f	55.785222	49.11206	t	f	\N	\N	\N	\N	\N	\N	\N	t
880	Red Room	Вишневского, 14	+7‒917‒284‒45‒69	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.784562	49.149365	t	f	\N	\N	\N	\N	\N	\N	\N	t
881	Lounge Port	Адоратского, 4	+7‒965‒588‒09‒33	\N	https://instagram.com/loungeport	https://vk.com/loungeport	551487	1	1	\N	\N	f	f	f	f	f	f	55.823415	49.148126	t	f	\N	\N	\N	\N	\N	\N	\N	t
882	New Page	Александра Попова, 6	+7 (843) 259‒78‒92	\N	\N	\N	551487	1	1	\N	\N	f	f	f	f	f	f	55.809202	49.181446	t	f	\N	\N	\N	\N	\N	\N	\N	t
883	Dream Launge	Ленина, 52	+7‒905‒008‒91‒91	\N	\N	https://vk.com/dream_lounge_hookah	551487	1	1	\N	\N	f	f	f	f	f	f	55.864321	48.364522	t	f	\N	\N	\N	\N	\N	\N	\N	t
889	Мегаполис, АО	Дзержинского, 46 к1	8‒800‒500‒28‒99	gkm.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.184907	50.176435	t	f	\N	\N	\N	\N	\N	\N	\N	t
897	CORSAR	Московское шоссе, 185а	8‒800‒500‒83‒40	inter-tabak.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.249333	50.221368	t	f	\N	\N	\N	\N	\N	\N	\N	t
899	JustWood hookah bar	Ново-Садовая, 6	+7‒927‒005‒51‒28	\N	https://instagram.com/justwood_samara	https://vk.com/justwood_samara	499099	1	1	\N	\N	f	f	f	f	f	f	53.206605	50.126095	t	f	\N	\N	\N	\N	\N	\N	\N	t
905	Чайный Пьяница	Демократическая, 24а	+7 (846) 225‒16‒75	\N	https://instagram.com/chp_smr	https://vk.com/chainiy_pianica	499099	1	1	\N	\N	f	f	f	f	f	f	53.266503	50.216937	t	f	\N	\N	\N	\N	\N	\N	\N	t
906	Табачная лавка	Молодогвардейская, 211	+7‒927‒008‒41‒13	\N	\N	https://vk.com/tablav	499099	1	1	\N	\N	f	f	f	f	f	f	53.205307	50.118981	t	f	\N	\N	\N	\N	\N	\N	\N	t
912	The light	Московское шоссе, 57	+7‒937‒667‒78‒32	\N	https://instagram.com/thelight_163	https://vk.com/the_light163	499099	1	1	\N	\N	f	f	f	f	f	f	53.224096	50.193423	t	f	\N	\N	\N	\N	\N	\N	\N	t
920	BLACK VAPE	Ново-Садовая, 8/1	+7‒917‒154‒02‒01	\N	https://instagram.com/xblackvape	https://vk.com/xblackvape	499099	1	1	\N	\N	f	f	f	f	f	f	53.207182	50.127733	t	f	\N	\N	\N	\N	\N	\N	\N	t
921	BULLET	Сергея Лазо, 19	+7‒927‒763‒01‒63	\N	https://instagram.com/bullet_hookah_bar	https://vk.com/bullet_hookah_bar	499099	1	1	\N	\N	f	f	f	f	f	f	53.346237	50.219682	t	f	\N	\N	\N	\N	\N	\N	\N	t
922	BASEMENT	Печерская, 48	+7 (846) 276‒57‒36	\N	https://instagram.com/basementloungebar	https://vk.com/club123403792	499099	1	1	\N	\N	f	f	f	f	f	f	53.20429	50.193324	t	f	\N	\N	\N	\N	\N	\N	\N	t
923	Вовсетяжкие	Ленинградская, 100	+7‒917‒946‒86‒76	\N	\N	https://vk.com/club115626825	499099	1	1	\N	\N	f	f	f	f	f	f	53.184587	50.104518	t	f	\N	\N	\N	\N	\N	\N	\N	t
924	9%	Товарная, 7н	+7 (846) 276‒84‒16	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.232167	50.294264	t	f	\N	\N	\N	\N	\N	\N	\N	t
929	MIB lounge & bar	Кирова проспект, 387	+7‒987‒911‒85‒34	\N	\N	https://vk.com/mib_lounge	499099	1	1	\N	\N	f	f	f	f	f	f	53.249772	50.225419	t	f	\N	\N	\N	\N	\N	\N	\N	t
932	Why Not Hookah	Чапаевская, 100	+7‒927‒780‒29‒24	\N	https://instagram.com/why_not_hookah	https://vk.com/whynothookah	499099	1	1	\N	\N	f	f	f	f	f	f	53.186658	50.092985	t	f	\N	\N	\N	\N	\N	\N	\N	t
933	Кальян, ООО	Юных Пионеров проспект, 134	+7‒927‒209‒02‒81	kalyan-halif.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.228251	50.252208	t	f	\N	\N	\N	\N	\N	\N	\N	t
940	Double Apple	Московское шоссе, лит Е110	+7 (846) 989‒28‒77	\N	https://instagram.com/doubleapple.smr	https://vk.com/doubleapple_smr	499099	1	1	\N	\N	f	f	f	f	f	f	53.203245	50.14266	t	f	\N	\N	\N	\N	\N	\N	\N	t
941	NARGILIA The office lounge	Буянова, 131	+7‒937‒650‒02‒08	nargilia.com	\N	https://vk.com/nargilia63	499099	1	1	\N	\N	f	f	f	f	f	f	53.196738	50.122699	t	f	\N	\N	\N	\N	\N	\N	\N	t
949	СНС Волга, ООО	Товарная, 2/1	+7 (846) 276‒83‒35	www.sns.ru	\N	https://vk.com/gcsns	499099	1	1	\N	\N	f	f	f	f	f	f	53.232905	50.29165	t	f	\N	\N	\N	\N	\N	\N	\N	t
951	Tche Tche	Промышленности, 296	+7 (846) 27‒29‒190	\N	\N	https://vk.com/loungetchetche	499099	1	1	\N	\N	f	f	f	f	f	f	53.20031	50.225321	t	f	\N	\N	\N	\N	\N	\N	\N	t
952	Cosmo shop	Некрасовская, 30	+7‒927‒753‒70‒84	cosmoshop.pro	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.190149	50.091995	t	f	\N	\N	\N	\N	\N	\N	\N	t
960	ГараЖ	Дыбенко, 23	+7‒917‒955‒31‒10	\N	\N	https://vk.com/garagesamara	499099	1	1	\N	\N	f	f	f	f	f	f	53.205553	50.19015	t	f	\N	\N	\N	\N	\N	\N	\N	t
962	O2 Play & Lounge	Ленинская, 56	+7 (846) 201‒25‒95	\N	https://instagram.com/o2play_lounge	https://vk.com/uhp_o2	499099	1	1	\N	\N	f	f	f	f	f	f	53.184497	50.104144	t	f	\N	\N	\N	\N	\N	\N	\N	t
967	GREENch	Солнечная, 7а	+7‒927‒007‒53‒32	\N	https://instagram.com/greench63	https://vk.com/greench63	499099	1	1	\N	\N	f	f	f	f	f	f	53.240229	50.191594	t	f	\N	\N	\N	\N	\N	\N	\N	t
968	Донской табак, ЗАО	Полевой проезд, 12 лит Д1	+7 (846) 279‒13‒42	dontabak.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.192111	50.269094	t	f	\N	\N	\N	\N	\N	\N	\N	t
970	Атмосфера	Куйбышева, 94	+7 (846) 225‒08‒62	\N	\N	https://vk.com/atmosfera_smr	499099	1	1	\N	\N	f	f	f	f	f	f	53.189524	50.089689	t	f	\N	\N	\N	\N	\N	\N	\N	t
971	Яр, ООО	Загородная, 1 к2	+7 (846) 279‒21‒15	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.187383	50.169898	t	f	\N	\N	\N	\N	\N	\N	\N	t
973	Black and white	Тухачевского, 22	+7‒937‒989‒31‒33	bw-cafe.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.187369	50.142084	t	f	\N	\N	\N	\N	\N	\N	\N	t
974	For_me	Рабочая, 85	+7‒937‒646‒76‒04	\N	https://instagram.com/for_me_samara	https://vk.com/public109746559	499099	1	1	\N	\N	f	f	f	f	f	f	53.191425	50.117105	t	f	\N	\N	\N	\N	\N	\N	\N	t
975	Bono	Молодогвардейская, 39	+7‒927‒777‒46‒49	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.1835	50.094575	t	f	\N	\N	\N	\N	\N	\N	\N	t
976	Hookah House Samara	6-я просека, 159а	+7‒903‒300‒06‒36	\N	\N	https://vk.com/hookahhouze	499099	1	1	\N	\N	f	f	f	f	f	f	53.245341	50.192446	t	f	\N	\N	\N	\N	\N	\N	\N	t
977	Fumi	Спортивная, 25Б	+7‒999‒171‒40‒01	\N	\N	https://vk.com/fumi_samara	499099	1	1	\N	\N	f	f	f	f	f	f	53.194595	50.127178	t	f	\N	\N	\N	\N	\N	\N	\N	t
979	HookahPlace	Белинского, 11Б	+7‒960‒819‒57‒77	\N	\N	https://vk.com/hookahplacenk	499099	1	1	\N	\N	f	f	f	f	f	f	53.101438	49.956427	t	f	\N	\N	\N	\N	\N	\N	\N	t
980	HookahMarket	Волжский проспект, 39	+7‒927‒009‒57‒75	\N	\N	https://vk.com/hookahmarketsamara	499099	1	1	\N	\N	f	f	f	f	f	f	53.208666	50.117055	t	f	\N	\N	\N	\N	\N	\N	\N	t
982	Brothers hookah bar	Полевая, 68	+7‒987‒988‒71‒69	\N	https://instagram.com/brothers_samara	https://vk.com/brotherssmr	499099	1	1	\N	\N	f	f	f	f	f	f	53.205823	50.123382	t	f	\N	\N	\N	\N	\N	\N	\N	t
984	HavanaSmoke	Южное шоссе, 5	+7‒927‒601‒91‒19	\N	\N	https://vk.com/havanasmoke	499099	1	1	\N	\N	f	f	f	f	f	f	53.141757	50.174069	t	f	\N	\N	\N	\N	\N	\N	\N	t
985	Absolem	Физкультурная, 113	+7‒999‒158‒84‒08	\N	https://instagram.com/absolem3303	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.216845	50.262976	t	f	\N	\N	\N	\N	\N	\N	\N	t
986	Grizzly shop	Радонежская, 1	+7‒927‒002‒75‒57	landing.hookahinrussia.ru	https://instagram.com/hookahsamara	https://vk.com/kupit_kalyan_samara	499099	1	1	\N	\N	f	f	f	f	f	f	53.205092	50.140996	t	f	\N	\N	\N	\N	\N	\N	\N	t
987	Ч. и К.	Товарная, 7н	+7 (846) 276‒84‒16	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.232167	50.294264	t	f	\N	\N	\N	\N	\N	\N	\N	t
988	Союз-Торг, ООО	Управленческий тупик, 3	+7 (846) 229‒83‒29	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.200315	50.254865	t	f	\N	\N	\N	\N	\N	\N	\N	t
989	Табачная лавка №1, ООО	Загородная, 1 к2	+7 (846) 991‒21‒73	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.187383	50.169898	t	f	\N	\N	\N	\N	\N	\N	\N	t
990	Магазин электронных сигарет	Антонова-Овсеенко, 9 к2	+7‒917‒110‒57‒12	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.211709	50.198679	t	f	\N	\N	\N	\N	\N	\N	\N	t
991	Чайнов	6-я просека, 151	+7‒937‒992‒32‒24	\N	https://instagram.com/chaynov63	https://vk.com/chaynov63	499099	1	1	\N	\N	f	f	f	f	f	f	53.245426	50.190052	t	f	\N	\N	\N	\N	\N	\N	\N	t
992	Табакерка на просеке	6-я просека, 147	+7‒927‒015‒77‒30	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.24619	50.189422	t	f	\N	\N	\N	\N	\N	\N	\N	t
993	Hookah Life	Полевая, 68	+7‒927‒000‒57‒75	\N	https://instagram.com/hookahlife_samara	https://vk.com/samara_hookahlife	499099	1	1	\N	\N	f	f	f	f	f	f	53.205823	50.123382	t	f	\N	\N	\N	\N	\N	\N	\N	t
994	Континент, ООО	Полевой проезд, 12 лит Д3	+7 (846) 279‒13‒32	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.192637	50.268519	t	f	\N	\N	\N	\N	\N	\N	\N	t
995	Магазин табачных изделий	Московское шоссе, 53	+7‒917‒141‒05‒05	\N	https://instagram.com/hookahs_samara	https://vk.com/hookahs_samara	499099	1	1	\N	\N	f	f	f	f	f	f	53.224246	50.192406	t	f	\N	\N	\N	\N	\N	\N	\N	t
996	Tortuga	Московское шоссе 24 км, 5	+7 (846) 379‒09‒21	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.326632	50.305976	t	f	\N	\N	\N	\N	\N	\N	\N	t
997	Постулат, ООО	Сердобская, 11	+7‒927‒265‒22‒01	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.217075	50.234511	t	f	\N	\N	\N	\N	\N	\N	\N	t
998	Gravity Lounge	Садовая, 200	+7‒967‒725‒83‒14	\N	https://instagram.com/gravityloungesamara	https://vk.com/gravitylounge	499099	1	1	\N	\N	f	f	f	f	f	f	53.197835	50.110929	t	f	\N	\N	\N	\N	\N	\N	\N	t
1004	ТРАНС-ФАРМ, ООО	Авиационная, 30	+7 (846) 221‒68‒04	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.182238	50.151883	t	f	\N	\N	\N	\N	\N	\N	\N	t
1005	Кашемир	Ивана Финютина бульвар, 47	+7 (846) 205‒60‒04	\N	\N	https://vk.com/kashemirkk	499099	1	1	\N	\N	f	f	f	f	f	f	53.322811	50.314174	t	f	\N	\N	\N	\N	\N	\N	\N	t
1014	JoyeShop	Ново-Садовая, 305а	8‒800‒500‒88‒38	joyeshop.ru	\N	https://vk.com/joyeshop	499099	1	1	\N	\N	f	f	f	f	f	f	53.236563	50.191186	t	f	\N	\N	\N	\N	\N	\N	\N	t
1015	Starbuzz E-HOSE-Самара	Ново-Садовая, 220а	+7 (846) 233‒42‒92	electron-kalyan.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.241003	50.196884	t	f	\N	\N	\N	\N	\N	\N	\N	t
1016	PROSMOK	Победы, 12	+7‒927‒725‒38‒28	www.prosmok.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.205512	50.23186	t	f	\N	\N	\N	\N	\N	\N	\N	t
1017	ДОНКАЛЬЯН	Гагарина, 129	+7 (846) 972‒22‒97	dkalyan.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.201053	50.208987	t	f	\N	\N	\N	\N	\N	\N	\N	t
1018	Черника	Гагарина, 84	+7‒987‒902‒17‒22	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.201134	50.194985	t	f	\N	\N	\N	\N	\N	\N	\N	t
1019	Dailyvape	Ново-Садовая, 224а	+7‒937‒100‒08‒07	\N	\N	https://vk.com/dailyvape	499099	1	1	\N	\N	f	f	f	f	f	f	53.247573	50.202406	t	f	\N	\N	\N	\N	\N	\N	\N	t
1020	Vape salon	Авроры, 106	+7 (846) 248‒17‒20	vape-salon.ru	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.192484	50.187879	t	f	\N	\N	\N	\N	\N	\N	\N	t
1021	Black Vape Lady Edition	5-я просека, 108	+7‒927‒747‒33‒29	\N	https://instagram.com/blackvape_le	https://vk.com/xblackvape	499099	1	1	\N	\N	f	f	f	f	f	f	53.245088	50.185707	t	f	\N	\N	\N	\N	\N	\N	\N	t
1025	Cloudbar	Ново-Садовая, 139	+7‒999‒170‒15‒97	cloudbar.org	https://instagram.com/cloud.bar	https://vk.com/cloudbar163	499099	1	1	\N	\N	f	f	f	f	f	f	53.214265	50.145942	t	f	\N	\N	\N	\N	\N	\N	\N	t
1027	CosmoVape	Некрасовская, 30	+7‒909‒342‒30‒95	cosmovape.ru	https://instagram.com/cosmo_vape	https://vk.com/cosmovape_samara	499099	1	1	\N	\N	f	f	f	f	f	f	53.190149	50.091995	t	f	\N	\N	\N	\N	\N	\N	\N	t
1028	Rail Road 1961 Vape bar & shop	Дачная, 3	+7‒906‒125‒41‒15	\N	\N	https://vk.com/rr1961	499099	1	1	\N	\N	f	f	f	f	f	f	53.202502	50.139131	t	f	\N	\N	\N	\N	\N	\N	\N	t
1029	Смоки Хаус	Московское шоссе, 185а	+7‒927‒268‒22‒87	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.249333	50.221368	t	f	\N	\N	\N	\N	\N	\N	\N	t
1030	Шахта	Ново-Садовая, 271	+7‒986‒950‒36‒00	\N	\N	https://vk.com/club107493630	499099	1	1	\N	\N	f	f	f	f	f	f	53.229784	50.182308	t	f	\N	\N	\N	\N	\N	\N	\N	t
1031	LOTOS Hookah Shop	Победы, 8	+7‒937‒793‒93‒99	\N	\N	https://vk.com/lotos163	499099	1	1	\N	\N	f	f	f	f	f	f	53.203757	50.228017	t	f	\N	\N	\N	\N	\N	\N	\N	t
1032	Miami	Полевая, 65	+7‒917‒110‒00‒81	\N	\N	https://vk.com/miamivape	499099	1	1	\N	\N	f	f	f	f	f	f	53.202377	50.126825	t	f	\N	\N	\N	\N	\N	\N	\N	t
1034	Белый Vape House	Революционная, 142/144	+7‒927‒008‒20‒04	\N	https://instagram.com/white_vape_house	https://vk.com/white_vape_house	499099	1	1	\N	\N	f	f	f	f	f	f	53.194507	50.179572	t	f	\N	\N	\N	\N	\N	\N	\N	t
1035	Магазин табачной продукции	Ново-Садовая, 305а	+7‒927‒606‒02‒64	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.236563	50.191186	t	f	\N	\N	\N	\N	\N	\N	\N	t
1036	Vape Shot	Ново-Садовая, 349г	+7 (846) 251‒55‒03	\N	\N	https://vk.com/vapersshot	499099	1	1	\N	\N	f	f	f	f	f	f	53.254118	50.209943	t	f	\N	\N	\N	\N	\N	\N	\N	t
1037	Вейп-шоп	3-й квартал, 31	+7‒927‒718‒85‒04	\N	\N	\N	499099	1	1	\N	\N	f	f	f	f	f	f	53.386302	50.170622	t	f	\N	\N	\N	\N	\N	\N	\N	t
\.


--
-- Data for Name: shops_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shops_categories (shop_id, category_id) FROM stdin;
257	3
292	3
259	3
260	3
261	3
264	3
265	3
266	3
271	3
268	3
269	3
270	3
293	3
274	3
275	3
276	3
284	3
279	3
280	3
281	3
282	3
283	3
286	3
287	3
288	3
289	3
290	3
291	3
295	3
297	3
298	3
299	3
300	3
302	3
304	3
305	3
308	3
309	3
310	3
311	3
312	3
314	3
315	3
316	3
318	3
254	3
319	3
320	3
255	3
258	3
262	3
263	3
267	3
272	3
273	3
277	3
278	3
285	3
294	3
296	3
301	3
303	3
306	3
307	3
313	3
317	3
256	3
\.


--
-- Data for Name: shops_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shops_files (shop_id, file_id) FROM stdin;
254	2
254	3
254	4
254	5
254	6
254	7
254	8
254	9
254	10
254	11
255	13
255	14
255	15
255	16
255	17
255	18
255	19
255	20
255	21
255	22
256	24
256	25
256	26
256	27
256	28
256	29
256	30
256	31
256	32
256	33
257	35
257	36
257	37
257	38
257	39
257	40
257	41
257	42
257	43
257	44
258	46
258	47
258	48
258	49
258	50
258	51
258	52
258	53
258	54
258	55
259	57
259	58
259	59
259	60
259	61
259	62
259	63
259	64
259	65
259	66
260	68
260	69
260	70
260	71
260	72
260	73
260	74
260	75
260	76
260	77
261	79
261	80
261	81
261	82
261	83
261	84
261	85
262	87
262	88
262	89
262	90
262	91
262	92
262	93
262	94
262	95
263	97
263	98
263	99
263	100
263	101
263	102
263	103
263	104
263	105
263	106
264	108
264	109
264	110
264	111
264	112
264	113
264	114
264	115
264	116
264	117
265	119
265	120
265	121
265	122
265	123
265	124
265	125
265	126
265	127
265	128
266	130
266	131
266	132
266	133
266	134
266	135
266	136
266	137
266	138
266	139
267	141
267	142
267	143
267	144
267	145
267	146
267	147
267	148
267	149
267	150
268	152
268	153
268	154
268	155
268	156
268	157
268	158
268	159
268	160
268	161
269	163
269	164
269	165
269	166
269	167
269	168
269	169
269	170
269	171
269	172
270	174
270	175
270	176
270	177
270	178
270	179
270	180
270	181
270	182
270	183
271	185
271	186
271	187
271	188
271	189
271	190
271	191
271	192
271	193
271	194
272	196
272	197
272	198
272	199
272	200
272	201
272	202
273	204
273	205
273	206
273	207
273	208
273	209
273	210
273	211
273	212
273	213
273	214
274	216
274	217
274	218
274	219
274	220
274	221
274	222
274	223
274	224
274	225
275	227
275	228
275	229
275	230
275	231
275	232
275	233
275	234
276	236
276	237
276	238
276	239
276	240
276	241
277	243
277	244
277	245
277	246
277	247
277	248
277	249
277	250
277	251
278	253
278	254
278	255
278	256
278	257
278	258
278	259
278	260
279	262
279	263
279	264
279	265
279	266
279	267
279	268
279	269
279	270
280	272
280	273
280	274
280	275
280	276
280	277
280	278
280	279
280	280
280	281
280	282
280	283
280	284
281	286
281	287
281	288
281	289
281	290
281	291
281	292
281	293
281	294
281	295
281	296
281	297
281	298
281	299
281	300
282	302
282	303
282	304
282	305
282	306
282	307
283	309
283	310
283	311
283	312
283	313
283	314
284	316
284	317
284	318
284	319
284	320
284	321
284	322
284	323
285	325
285	326
285	327
285	328
285	329
285	330
285	331
285	332
286	334
286	335
286	336
286	337
286	338
286	339
286	340
286	341
286	342
286	343
287	345
287	346
287	347
287	348
287	349
287	350
288	352
288	353
288	354
288	355
288	356
288	357
288	358
288	359
288	360
289	362
289	363
289	364
289	365
289	366
289	367
289	368
289	369
290	371
290	372
290	373
290	374
290	375
290	376
290	377
290	378
290	379
290	380
291	382
291	383
291	384
291	385
291	386
291	387
291	388
291	389
291	390
292	392
292	393
292	394
292	395
292	396
292	397
292	398
292	399
292	400
292	401
293	403
293	404
293	405
293	406
293	407
293	408
293	409
293	410
293	411
293	412
294	414
294	415
294	416
294	417
294	418
294	419
294	420
295	422
295	423
295	424
295	425
295	426
295	427
295	428
295	429
295	430
295	431
296	433
296	434
296	435
296	436
296	437
296	438
296	439
296	440
296	441
297	443
297	444
297	445
297	446
297	447
297	448
297	449
297	450
298	452
298	453
298	454
298	455
298	456
298	457
298	458
298	459
298	460
298	461
299	463
299	464
299	465
299	466
299	467
299	468
299	469
299	470
299	471
299	472
300	474
300	475
300	476
300	477
300	478
300	479
300	480
300	481
300	482
300	483
300	484
300	485
300	486
301	488
301	489
301	490
301	491
301	492
301	493
301	494
301	495
301	496
301	497
301	498
301	499
302	501
302	502
302	503
302	504
302	505
302	506
302	507
302	508
303	510
303	511
303	512
303	513
303	514
303	515
303	516
303	517
303	518
303	519
303	520
303	521
303	522
303	523
303	524
304	526
304	527
304	528
304	529
304	530
304	531
304	532
304	533
304	534
304	535
304	536
304	537
304	538
304	539
304	540
304	541
305	543
305	544
305	545
305	546
305	547
305	548
306	550
306	551
306	552
306	553
306	554
306	555
306	556
306	557
307	559
307	560
307	561
307	562
307	563
307	564
307	565
307	566
307	567
308	569
308	570
308	571
308	572
308	573
308	574
308	575
308	576
308	577
308	578
309	580
309	581
309	582
309	583
309	584
309	585
309	586
310	588
310	589
310	590
310	591
310	592
310	593
311	595
311	596
311	597
311	598
311	599
311	600
311	601
312	603
312	604
312	605
312	606
312	607
312	608
312	609
312	610
313	612
313	613
313	614
313	615
313	616
313	617
313	618
313	619
314	621
314	622
314	623
314	624
314	625
314	626
314	627
314	628
315	630
315	631
315	632
315	633
315	634
315	635
315	636
316	638
316	639
316	640
316	641
316	642
316	643
316	644
316	645
316	646
316	647
317	649
317	650
317	651
317	652
317	653
317	654
317	655
317	656
318	658
318	659
318	660
318	661
318	662
318	663
318	664
318	665
318	666
318	667
318	668
319	670
319	671
319	672
319	673
319	674
319	675
319	676
319	677
319	678
319	679
320	681
320	682
320	683
320	684
320	685
320	686
320	687
320	688
320	689
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shops_id_seq', 1117, true);


SET search_path = auth, pg_catalog;

--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_roles_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (role_id, user_id);


SET search_path = public, pg_catalog;

--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_seo_translit_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_seo_translit_key UNIQUE (seo_translit);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: days_week_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY days_week
    ADD CONSTRAINT days_week_pkey PRIMARY KEY (id);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: shops_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shops_categories
    ADD CONSTRAINT shops_categories_pkey PRIMARY KEY (shop_id, category_id);


--
-- Name: shops_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shops_files
    ADD CONSTRAINT shops_files_pkey PRIMARY KEY (shop_id, file_id);


--
-- Name: shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: shops_seo_translit_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_seo_translit_key UNIQUE (seo_translit);


--
-- Name: shops_old_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX shops_old_id_idx ON shops USING btree (old_id);


SET search_path = auth, pg_catalog;

--
-- Name: users_organization_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


SET search_path = public, pg_catalog;

--
-- Name: files_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES auth.organizations(id);


--
-- Name: shedule_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shedule
    ADD CONSTRAINT shedule_day_id_fkey FOREIGN KEY (day_id) REFERENCES days_week(id) ON DELETE CASCADE;


--
-- Name: shedule_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shedule
    ADD CONSTRAINT shedule_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES shops(id) ON DELETE CASCADE;


--
-- Name: shops_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops_categories
    ADD CONSTRAINT shops_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;


--
-- Name: shops_categories_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops_categories
    ADD CONSTRAINT shops_categories_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES shops(id) ON DELETE CASCADE;


--
-- Name: shops_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: shops_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_file_id_fkey FOREIGN KEY (file_id) REFERENCES files(id);


--
-- Name: shops_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops_files
    ADD CONSTRAINT shops_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE;


--
-- Name: shops_files_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops_files
    ADD CONSTRAINT shops_files_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES shops(id) ON DELETE CASCADE;


--
-- Name: shops_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES auth.organizations(id);


--
-- Name: shops_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

