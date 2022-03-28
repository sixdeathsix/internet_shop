--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-03-27 21:41:42

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
-- TOC entry 220 (class 1259 OID 16460)
-- Name: basket_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_devices (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer,
    "deviceId" integer
);


ALTER TABLE public.basket_devices OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16459)
-- Name: basket_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_devices_id_seq OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 219
-- Name: basket_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_devices_id_seq OWNED BY public.basket_devices.id;


--
-- TOC entry 212 (class 1259 OID 16408)
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16407)
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 211
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- TOC entry 216 (class 1259 OID 16429)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16428)
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 215
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- TOC entry 224 (class 1259 OID 16494)
-- Name: deviceInfos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."deviceInfos" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);


ALTER TABLE public."deviceInfos" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16493)
-- Name: deviceInfos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."deviceInfos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."deviceInfos_id_seq" OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 223
-- Name: deviceInfos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."deviceInfos_id_seq" OWNED BY public."deviceInfos".id;


--
-- TOC entry 218 (class 1259 OID 16438)
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    img character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16437)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 217
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- TOC entry 232 (class 1259 OID 32948)
-- Name: histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.histories (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.histories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32947)
-- Name: histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.histories_id_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 231
-- Name: histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.histories_id_seq OWNED BY public.histories.id;


--
-- TOC entry 228 (class 1259 OID 32791)
-- Name: history_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_devices (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "historyId" integer,
    "deviceId" integer
);


ALTER TABLE public.history_devices OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32790)
-- Name: history_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_devices_id_seq OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 227
-- Name: history_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_devices_id_seq OWNED BY public.history_devices.id;


--
-- TOC entry 230 (class 1259 OID 32892)
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.models (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.models OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32891)
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.models_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 229
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.models_id_seq OWNED BY public.models.id;


--
-- TOC entry 222 (class 1259 OID 16477)
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    rate integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "deviceId" integer
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16476)
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 221
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- TOC entry 226 (class 1259 OID 16508)
-- Name: type_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_brands (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);


ALTER TABLE public.type_brands OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16507)
-- Name: type_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_brands_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 225
-- Name: type_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_brands_id_seq OWNED BY public.type_brands.id;


--
-- TOC entry 214 (class 1259 OID 16420)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16419)
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 213
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- TOC entry 210 (class 1259 OID 16396)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3226 (class 2604 OID 16463)
-- Name: basket_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices ALTER COLUMN id SET DEFAULT nextval('public.basket_devices_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 16411)
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16432)
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16497)
-- Name: deviceInfos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deviceInfos" ALTER COLUMN id SET DEFAULT nextval('public."deviceInfos_id_seq"'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16441)
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 32951)
-- Name: histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories ALTER COLUMN id SET DEFAULT nextval('public.histories_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 32794)
-- Name: history_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_devices ALTER COLUMN id SET DEFAULT nextval('public.history_devices_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 32895)
-- Name: models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models ALTER COLUMN id SET DEFAULT nextval('public.models_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16480)
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16511)
-- Name: type_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands ALTER COLUMN id SET DEFAULT nextval('public.type_brands_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 16423)
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16399)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3429 (class 0 OID 16460)
-- Dependencies: 220
-- Data for Name: basket_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3421 (class 0 OID 16408)
-- Dependencies: 212
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.baskets (id, "createdAt", "updatedAt", "userId") VALUES (82, '2022-03-27 21:38:46.158+03', '2022-03-27 21:38:46.158+03', 82);
INSERT INTO public.baskets (id, "createdAt", "updatedAt", "userId") VALUES (83, '2022-03-27 21:39:00.006+03', '2022-03-27 21:39:00.006+03', 83);


--
-- TOC entry 3425 (class 0 OID 16429)
-- Dependencies: 216
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (19, 'Apple', '2022-03-24 23:12:01.717+03', '2022-03-24 23:12:01.717+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (20, 'Xiaomi', '2022-03-24 23:12:24.87+03', '2022-03-24 23:12:24.87+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (21, 'REALME', '2022-03-24 23:12:36.165+03', '2022-03-24 23:12:36.165+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (22, 'Lenovo', '2022-03-24 23:13:08.467+03', '2022-03-24 23:13:08.467+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (23, 'Acer', '2022-03-24 23:13:16.647+03', '2022-03-24 23:13:16.647+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (24, 'ASUS', '2022-03-24 23:13:20.326+03', '2022-03-24 23:13:20.326+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (25, 'LG', '2022-03-24 23:13:50.992+03', '2022-03-24 23:13:50.992+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (26, 'Philips', '2022-03-24 23:13:58.212+03', '2022-03-24 23:13:58.212+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (27, 'Digma', '2022-03-24 23:14:10.254+03', '2022-03-24 23:14:10.254+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (28, 'Indesit', '2022-03-24 23:14:40.502+03', '2022-03-24 23:14:40.502+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (29, 'Beko', '2022-03-24 23:14:50.077+03', '2022-03-24 23:14:50.077+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (30, 'Bosch', '2022-03-24 23:14:54.668+03', '2022-03-24 23:14:54.668+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (31, 'Zanussi', '2022-03-24 23:15:04.821+03', '2022-03-24 23:15:04.821+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (32, 'Candy', '2022-03-24 23:15:08.767+03', '2022-03-24 23:15:08.767+03');
INSERT INTO public.brands (id, name, "createdAt", "updatedAt") VALUES (33, 'Атлант', '2022-03-24 23:15:23.213+03', '2022-03-24 23:15:23.213+03');


--
-- TOC entry 3433 (class 0 OID 16494)
-- Dependencies: 224
-- Data for Name: deviceInfos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (8, 'Операционная система', 'iPhone iOS 13', '2022-03-24 23:17:49.449+03', '2022-03-24 23:17:49.449+03', 57);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (9, 'Дисплей', '6.1", IPS', '2022-03-24 23:17:49.449+03', '2022-03-24 23:17:49.449+03', 57);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (10, 'Разрешение дисплея', '1792x828', '2022-03-24 23:17:49.449+03', '2022-03-24 23:17:49.449+03', 57);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (11, 'Процессор', 'Apple A13 Bionic', '2022-03-24 23:17:49.449+03', '2022-03-24 23:17:49.449+03', 57);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (12, 'Объем встроенной памяти', '64 ГБ', '2022-03-24 23:17:49.45+03', '2022-03-24 23:17:49.45+03', 57);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (13, 'Операционная система', 'iPhone iOS 14', '2022-03-24 23:18:55.374+03', '2022-03-24 23:18:55.374+03', 58);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (14, 'Дисплей', '6.1", OLED', '2022-03-24 23:18:55.374+03', '2022-03-24 23:18:55.374+03', 58);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (15, 'Разрешение дисплея', '2532x1170', '2022-03-24 23:18:55.374+03', '2022-03-24 23:18:55.374+03', 58);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (16, 'Процессор', 'Apple A14 Bionic', '2022-03-24 23:18:55.374+03', '2022-03-24 23:18:55.374+03', 58);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (17, 'Объем встроенной памяти', '128 ГБ', '2022-03-24 23:18:55.375+03', '2022-03-24 23:18:55.375+03', 58);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (18, 'Операционная система', 'iPhone iOS 15', '2022-03-24 23:19:44.635+03', '2022-03-24 23:19:44.635+03', 59);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (19, 'Дисплей', '6.7", OLED', '2022-03-24 23:19:44.635+03', '2022-03-24 23:19:44.635+03', 59);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (20, 'Разрешение дисплея', '2778x1284', '2022-03-24 23:19:44.636+03', '2022-03-24 23:19:44.636+03', 59);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (21, 'Процессор', 'Apple A15 Bionic, 6-ти ядерный', '2022-03-24 23:19:44.636+03', '2022-03-24 23:19:44.636+03', 59);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (22, 'Объем встроенной памяти', '128 ГБ', '2022-03-24 23:19:44.636+03', '2022-03-24 23:19:44.636+03', 59);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (23, 'Операционная система', 'Android 11', '2022-03-24 23:21:27.873+03', '2022-03-24 23:21:27.873+03', 60);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (24, 'Дисплей', '6.43", AMOLED', '2022-03-24 23:21:27.873+03', '2022-03-24 23:21:27.873+03', 60);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (25, 'Разрешение дисплея', '2400x1080', '2022-03-24 23:21:27.873+03', '2022-03-24 23:21:27.873+03', 60);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (26, 'Процессор', 'Mediatek Helio G95, 2050МГц, 8-ми ядерный', '2022-03-24 23:21:27.874+03', '2022-03-24 23:21:27.874+03', 60);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (27, 'Объем оперативной памяти', ' 6 ГБ', '2022-03-24 23:21:27.874+03', '2022-03-24 23:21:27.874+03', 60);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (28, 'Объем встроенной памяти', '128 ГБ', '2022-03-24 23:21:27.874+03', '2022-03-24 23:21:27.874+03', 60);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (29, 'Операционная система', 'Android 11', '2022-03-24 23:22:11.487+03', '2022-03-24 23:22:11.487+03', 61);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (30, 'Дисплей', '6.5", IPS', '2022-03-24 23:22:11.487+03', '2022-03-24 23:22:11.487+03', 61);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (31, 'Разрешение дисплея', '2400x1080', '2022-03-24 23:22:11.487+03', '2022-03-24 23:22:11.487+03', 61);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (32, 'Процессор', 'MediaTek Dimensity 700, 2200МГц, 8-ми ядерный', '2022-03-24 23:22:11.487+03', '2022-03-24 23:22:11.487+03', 61);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (33, 'Объем оперативной памяти', ' 6 ГБ', '2022-03-24 23:22:11.487+03', '2022-03-24 23:22:11.487+03', 61);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (34, 'Объем встроенной памяти', '128 ГБ', '2022-03-24 23:22:11.487+03', '2022-03-24 23:22:11.487+03', 61);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (35, 'Операционная система', 'Android 11', '2022-03-24 23:23:28.564+03', '2022-03-24 23:23:28.564+03', 62);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (36, 'Дисплей', '6.4", Super AMOLED', '2022-03-24 23:23:28.564+03', '2022-03-24 23:23:28.564+03', 62);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (37, 'Разрешение дисплея', '2400x1080', '2022-03-24 23:23:28.564+03', '2022-03-24 23:23:28.564+03', 62);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (38, 'Процессор', 'MediaTek G95, 2050МГц, 8-ми ядерный', '2022-03-24 23:23:28.564+03', '2022-03-24 23:23:28.564+03', 62);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (39, 'Объем оперативной памяти', ' 6 ГБ', '2022-03-24 23:23:28.564+03', '2022-03-24 23:23:28.564+03', 62);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (40, 'Объем встроенной памяти', '128 ГБ', '2022-03-24 23:23:28.564+03', '2022-03-24 23:23:28.564+03', 62);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (41, 'Операционная система', 'Android 11', '2022-03-24 23:24:35.742+03', '2022-03-24 23:24:35.742+03', 63);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (42, 'Дисплей', '6.5", LCD', '2022-03-24 23:24:35.743+03', '2022-03-24 23:24:35.743+03', 63);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (43, 'Разрешение дисплея', ' 1600x720', '2022-03-24 23:24:35.743+03', '2022-03-24 23:24:35.743+03', 63);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (44, 'Процессор', 'Unisoc T610, 1800МГц, 8-ми ядерный', '2022-03-24 23:24:35.743+03', '2022-03-24 23:24:35.743+03', 63);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (45, 'Объем оперативной памяти', '4 ГБ', '2022-03-24 23:24:35.743+03', '2022-03-24 23:24:35.743+03', 63);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (46, 'Объем встроенной памяти', '64 ГБ', '2022-03-24 23:24:35.743+03', '2022-03-24 23:24:35.743+03', 63);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (47, 'Экран', '15.6"; 1920х1080; IPS;', '2022-03-24 23:27:18.43+03', '2022-03-24 23:27:18.43+03', 64);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (48, 'Процессор', 'AMD Ryzen 5 5600H 3.3 ГГц (4.2 ГГц, в режиме Turbo)', '2022-03-24 23:27:18.43+03', '2022-03-24 23:27:18.43+03', 64);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (49, 'Графический процессор', 'NVIDIA GeForce RTX 3050 для ноутбуков - 4096 Мб;', '2022-03-24 23:27:18.431+03', '2022-03-24 23:27:18.431+03', 64);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (50, 'Оперативная память', '8ГБ DDR4 3200МГц;', '2022-03-24 23:27:18.431+03', '2022-03-24 23:27:18.431+03', 64);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (51, 'Диск', 'SSD 256 ГБ;', '2022-03-24 23:27:18.431+03', '2022-03-24 23:27:18.431+03', 64);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (52, 'Операционная система', 'noOS', '2022-03-24 23:27:18.431+03', '2022-03-24 23:27:18.431+03', 64);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (53, 'Экран', '15.6"; 1920х1080; TN;', '2022-03-24 23:28:11.198+03', '2022-03-24 23:28:11.198+03', 65);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (54, 'Процессор', 'Intel Core i3 1005G1 1.2 ГГц (3.4 ГГц, в режиме Turbo)', '2022-03-24 23:28:11.198+03', '2022-03-24 23:28:11.198+03', 65);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (55, 'Графический процессор', 'Intel UHD Graphics ;', '2022-03-24 23:28:11.198+03', '2022-03-24 23:28:11.198+03', 65);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (56, 'Оперативная память', '8ГБ DDR4 2133МГц;', '2022-03-24 23:28:11.198+03', '2022-03-24 23:28:11.198+03', 65);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (57, 'Диск', 'SSD 256 ГБ;', '2022-03-24 23:28:11.198+03', '2022-03-24 23:28:11.198+03', 65);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (58, 'Операционная система', 'Eshell', '2022-03-24 23:28:11.198+03', '2022-03-24 23:28:11.198+03', 65);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (59, 'Экран', '15.6"; 1920х1080;', '2022-03-24 23:29:00.527+03', '2022-03-24 23:29:00.527+03', 66);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (60, 'Процессор', 'Intel Core i5 11400H 2.7 ГГц (4.5 ГГц, в режиме Turbo)', '2022-03-24 23:29:00.527+03', '2022-03-24 23:29:00.527+03', 66);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (61, 'Графический процессор', 'NVIDIA GeForce RTX 3050 для ноутбуков - 4096 Мб;', '2022-03-24 23:29:00.527+03', '2022-03-24 23:29:00.527+03', 66);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (62, 'Оперативная память', '8ГБ DDR4 3200МГц;', '2022-03-24 23:29:00.527+03', '2022-03-24 23:29:00.527+03', 66);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (63, 'Диск', 'SSD 512 ГБ;', '2022-03-24 23:29:00.527+03', '2022-03-24 23:29:00.527+03', 66);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (64, 'Операционная система', 'noOS', '2022-03-24 23:29:00.527+03', '2022-03-24 23:29:00.527+03', 66);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (65, 'Экран', '11.6"; 1920х1080; IPS;', '2022-03-24 23:29:55.811+03', '2022-03-24 23:29:55.811+03', 67);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (66, 'Процессор', 'Intel Celeron N3350 1.1 ГГц (2.4 ГГц, в режиме Turbo)', '2022-03-24 23:29:55.811+03', '2022-03-24 23:29:55.811+03', 67);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (67, 'Графический процессор', 'Intel HD Graphics 500;', '2022-03-24 23:29:55.811+03', '2022-03-24 23:29:55.811+03', 67);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (68, 'Оперативная память', '4ГБ;', '2022-03-24 23:29:55.811+03', '2022-03-24 23:29:55.811+03', 67);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (69, 'Диск', 'SSD 64 ГБ;', '2022-03-24 23:29:55.811+03', '2022-03-24 23:29:55.811+03', 67);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (70, 'Операционная система', 'Windows 10 Home', '2022-03-24 23:29:55.811+03', '2022-03-24 23:29:55.811+03', 67);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (71, 'Экран', '14"; 2560х1600; IPS;', '2022-03-24 23:31:01.8+03', '2022-03-24 23:31:01.8+03', 68);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (72, 'Процессор', 'Intel Core i5 11320H 3.2 ГГц (4.5 ГГц, в режиме Turbo)', '2022-03-24 23:31:01.8+03', '2022-03-24 23:31:01.8+03', 68);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (73, 'Графический процессор', 'Intel Iris Xe graphics ;', '2022-03-24 23:31:01.8+03', '2022-03-24 23:31:01.8+03', 68);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (74, 'Оперативная память', '16ГБ DDR4 3200МГц;', '2022-03-24 23:31:01.801+03', '2022-03-24 23:31:01.801+03', 68);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (75, 'Диск', 'SSD 512 ГБ;', '2022-03-24 23:31:01.801+03', '2022-03-24 23:31:01.801+03', 68);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (76, 'Операционная система', 'Windows 10 trial (для ознакомления)', '2022-03-24 23:31:01.801+03', '2022-03-24 23:31:01.801+03', 68);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (77, 'Экран', '32"/ 81см, 1366 x 768, HD READY,', '2022-03-24 23:32:40.021+03', '2022-03-24 23:32:40.021+03', 69);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (78, 'Тюнеры: ', 'DVB-T2, DVB-C, DVB-S2,', '2022-03-24 23:32:40.021+03', '2022-03-24 23:32:40.021+03', 69);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (79, 'VESA ', '100x100;', '2022-03-24 23:32:40.021+03', '2022-03-24 23:32:40.021+03', 69);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (80, 'Экран', '32"/ 81см, 1920 x 1080, FULL HD,', '2022-03-24 23:33:24.87+03', '2022-03-24 23:33:24.87+03', 70);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (81, 'Тюнеры: ', 'DVB-T, DVB-T2, DVB-C, DVB-S2,', '2022-03-24 23:33:24.87+03', '2022-03-24 23:33:24.87+03', 70);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (82, 'VESA ', '200x200;', '2022-03-24 23:33:24.87+03', '2022-03-24 23:33:24.87+03', 70);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (83, 'Экран', '32"/ 81см, 1366 x 768, HD READY,', '2022-03-24 23:34:08.865+03', '2022-03-24 23:34:08.865+03', 71);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (84, 'Тюнеры: ', 'DVB-T, DVB-T2, DVB-C,', '2022-03-24 23:34:08.865+03', '2022-03-24 23:34:08.865+03', 71);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (85, 'VESA ', '100x100;', '2022-03-24 23:34:08.865+03', '2022-03-24 23:34:08.865+03', 71);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (86, 'Экран', '32"/ 81см, 1366 x 768, HD READY,', '2022-03-24 23:34:59.935+03', '2022-03-24 23:34:59.935+03', 72);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (87, 'Тюнеры: ', 'DVB-T, DVB-T2, DVB-C, DVB-S, DVB-S2,', '2022-03-24 23:34:59.936+03', '2022-03-24 23:34:59.936+03', 72);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (88, 'VESA ', '100x100;', '2022-03-24 23:34:59.936+03', '2022-03-24 23:34:59.936+03', 72);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (89, '', ' двухкамерный;', '2022-03-24 23:37:31.502+03', '2022-03-24 23:37:31.502+03', 73);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (90, 'Объем:', 'общий 298л; холодильной камеры 220л; морозильной камеры 78л;', '2022-03-24 23:37:31.502+03', '2022-03-24 23:37:31.502+03', 73);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (91, 'Морозильная камера:', 'снизу, размораживание Total No Frost;', '2022-03-24 23:37:31.502+03', '2022-03-24 23:37:31.502+03', 73);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (92, 'Класс энергопотребления:', 'A;', '2022-03-24 23:37:31.502+03', '2022-03-24 23:37:31.502+03', 73);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (93, 'Размеры (ШхВхГ):', '60 х 185 х 64 см;', '2022-03-24 23:37:31.502+03', '2022-03-24 23:37:31.502+03', 73);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (94, 'Цвет:', 'белый;', '2022-03-24 23:37:31.502+03', '2022-03-24 23:37:31.502+03', 73);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (95, '', ' двухкамерный;', '2022-03-24 23:39:00.127+03', '2022-03-24 23:39:00.127+03', 74);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (96, 'Объем:', 'общий 419л; холодильной камеры 292л; морозильной камеры 127л;', '2022-03-24 23:39:00.127+03', '2022-03-24 23:39:00.127+03', 74);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (97, 'Морозильная камера:', 'снизу, размораживание Total No Frost;', '2022-03-24 23:39:00.127+03', '2022-03-24 23:39:00.127+03', 74);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (98, 'Класс энергопотребления:', 'A+;', '2022-03-24 23:39:00.127+03', '2022-03-24 23:39:00.127+03', 74);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (99, 'Размеры (ШхВхГ):', '59.5 х 203 х 68.2 см;', '2022-03-24 23:39:00.128+03', '2022-03-24 23:39:00.128+03', 74);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (100, 'Цвет:', 'белый;', '2022-03-24 23:39:00.128+03', '2022-03-24 23:39:00.128+03', 74);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (101, '', ' двухкамерный;', '2022-03-24 23:39:40.416+03', '2022-03-24 23:39:40.416+03', 75);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (102, 'Объем:', 'общий 310л;', '2022-03-24 23:39:40.416+03', '2022-03-24 23:39:40.416+03', 75);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (103, 'Морозильная камера:', 'снизу, размораживание Total No Frost;', '2022-03-24 23:39:40.417+03', '2022-03-24 23:39:40.417+03', 75);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (104, 'Класс энергопотребления:', 'A+;', '2022-03-24 23:39:40.417+03', '2022-03-24 23:39:40.417+03', 75);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (105, 'Размеры (ШхВхГ):', '54 х 184 х 60 см;', '2022-03-24 23:39:40.417+03', '2022-03-24 23:39:40.417+03', 75);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (106, 'Цвет:', 'белый;', '2022-03-24 23:39:40.417+03', '2022-03-24 23:39:40.417+03', 75);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (107, '', ' двухкамерный;', '2022-03-24 23:40:13.765+03', '2022-03-24 23:40:13.765+03', 76);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (108, 'Объем:', 'общий 419л; холодильной камеры 290л; морозильной камеры 129л;', '2022-03-24 23:40:13.765+03', '2022-03-24 23:40:13.765+03', 76);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (109, 'Морозильная камера:', 'снизу, размораживание Total No Frost;', '2022-03-24 23:40:13.765+03', '2022-03-24 23:40:13.765+03', 76);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (110, 'Класс энергопотребления:', 'A+;', '2022-03-24 23:40:13.765+03', '2022-03-24 23:40:13.765+03', 76);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (111, 'Размеры (ШхВхГ):', '60 х 203 х 66 см;', '2022-03-24 23:40:13.765+03', '2022-03-24 23:40:13.765+03', 76);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (112, 'Цвет:', 'бежевый;', '2022-03-24 23:40:13.765+03', '2022-03-24 23:40:13.765+03', 76);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (113, '', ' двухкамерный;', '2022-03-24 23:41:03.474+03', '2022-03-24 23:41:03.474+03', 77);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (114, 'Объем:', 'общий 185л; холодильной камеры 132л; морозильной камеры 53л;', '2022-03-24 23:41:03.474+03', '2022-03-24 23:41:03.474+03', 77);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (115, 'Морозильная камера:', 'снизу, размораживание ручное;', '2022-03-24 23:41:03.474+03', '2022-03-24 23:41:03.474+03', 77);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (116, 'Класс энергопотребления:', 'A;', '2022-03-24 23:41:03.474+03', '2022-03-24 23:41:03.474+03', 77);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (117, 'Размеры (ШхВхГ):', '54.5 х 142.5 х 60 см;', '2022-03-24 23:41:03.474+03', '2022-03-24 23:41:03.474+03', 77);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (118, 'Цвет:', 'белый;', '2022-03-24 23:41:03.474+03', '2022-03-24 23:41:03.474+03', 77);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (119, 'Тип загрузки', 'фронтальная', '2022-03-24 23:43:24.25+03', '2022-03-24 23:43:24.25+03', 78);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (120, 'Класс стирки', 'A', '2022-03-24 23:43:24.25+03', '2022-03-24 23:43:24.25+03', 78);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (121, 'Класс отжима', 'C', '2022-03-24 23:43:24.25+03', '2022-03-24 23:43:24.25+03', 78);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (122, 'Максимальная загрузка', '5 кг:', '2022-03-24 23:43:24.25+03', '2022-03-24 23:43:24.25+03', 78);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (123, 'Максимальная скорость отжима', '1000 об/мин', '2022-03-24 23:43:24.25+03', '2022-03-24 23:43:24.25+03', 78);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (124, 'Цвет', 'белый', '2022-03-24 23:43:24.251+03', '2022-03-24 23:43:24.251+03', 78);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (125, 'Тип загрузки', 'фронтальная', '2022-03-24 23:44:08.133+03', '2022-03-24 23:44:08.133+03', 79);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (126, 'Класс стирки', 'A', '2022-03-24 23:44:08.133+03', '2022-03-24 23:44:08.133+03', 79);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (127, 'Класс отжима', 'C', '2022-03-24 23:44:08.133+03', '2022-03-24 23:44:08.133+03', 79);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (128, 'Максимальная загрузка', '5 кг', '2022-03-24 23:44:08.133+03', '2022-03-24 23:44:08.133+03', 79);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (129, 'Максимальная скорость отжима', '1000 об/мин', '2022-03-24 23:44:08.133+03', '2022-03-24 23:44:08.133+03', 79);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (130, 'Цвет', 'белый', '2022-03-24 23:44:08.133+03', '2022-03-24 23:44:08.133+03', 79);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (131, 'Тип загрузки', 'фронтальная', '2022-03-24 23:44:43.219+03', '2022-03-24 23:44:43.219+03', 80);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (132, 'Класс стирки', 'A', '2022-03-24 23:44:43.22+03', '2022-03-24 23:44:43.22+03', 80);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (133, 'Класс отжима', 'B', '2022-03-24 23:44:43.22+03', '2022-03-24 23:44:43.22+03', 80);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (134, 'Максимальная загрузка', '6.5 кг', '2022-03-24 23:44:43.22+03', '2022-03-24 23:44:43.22+03', 80);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (135, 'Максимальная скорость отжима', '1000 об/мин', '2022-03-24 23:44:43.22+03', '2022-03-24 23:44:43.22+03', 80);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (136, 'Цвет', 'белый', '2022-03-24 23:44:43.22+03', '2022-03-24 23:44:43.22+03', 80);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (137, 'Тип загрузки', 'фронтальная', '2022-03-24 23:45:22.081+03', '2022-03-24 23:45:22.081+03', 81);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (138, 'Класс стирки', 'A', '2022-03-24 23:45:22.081+03', '2022-03-24 23:45:22.081+03', 81);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (139, 'Класс отжима', 'C', '2022-03-24 23:45:22.081+03', '2022-03-24 23:45:22.081+03', 81);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (140, 'Максимальная загрузка', '4 кг', '2022-03-24 23:45:22.081+03', '2022-03-24 23:45:22.081+03', 81);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (141, 'Максимальная скорость отжима', '1000 об/мин', '2022-03-24 23:45:22.081+03', '2022-03-24 23:45:22.081+03', 81);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (142, 'Цвет', 'белый', '2022-03-24 23:45:22.081+03', '2022-03-24 23:45:22.081+03', 81);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (143, 'Тип загрузки', 'фронтальная', '2022-03-24 23:45:58.11+03', '2022-03-24 23:45:58.11+03', 82);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (144, 'Класс стирки', 'A', '2022-03-24 23:45:58.11+03', '2022-03-24 23:45:58.11+03', 82);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (145, 'Класс отжима', 'B', '2022-03-24 23:45:58.11+03', '2022-03-24 23:45:58.11+03', 82);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (146, 'Максимальная загрузка', '6 кг', '2022-03-24 23:45:58.11+03', '2022-03-24 23:45:58.11+03', 82);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (147, 'Максимальная скорость отжима', ' 1200 об/мин', '2022-03-24 23:45:58.11+03', '2022-03-24 23:45:58.11+03', 82);
INSERT INTO public."deviceInfos" (id, title, description, "createdAt", "updatedAt", "deviceId") VALUES (148, 'Цвет', 'белый', '2022-03-24 23:45:58.11+03', '2022-03-24 23:45:58.11+03', 82);


--
-- TOC entry 3427 (class 0 OID 16438)
-- Dependencies: 218
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (78, 'Стиральная машина Zanussi ZWSR515W, фронтальная, 5кг, 1000об/мин', 36990, 0, 'c1325750-9ea6-49fb-b15f-5bdf27e949ce.jpg', '2022-03-24 23:43:24.162+03', '2022-03-24 23:43:24.162+03', 13, 31);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (79, 'Стиральная машина Candy CS34 1052DB1/2-07, фронтальная, 5кг, 1000об/мин', 28990, 0, '3ad3dccd-0dd7-47b8-8515-e5ebf2001886.jpg', '2022-03-24 23:44:08.037+03', '2022-03-24 23:44:08.037+03', 13, 32);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (80, 'Стиральная машина Bosch WLP20265OE, фронтальная, 6.5кг, 1000об/мин', 56990, 0, '2869f9fa-7ef1-4438-86dd-ea3132cee56d.jpg', '2022-03-24 23:44:43.13+03', '2022-03-24 23:44:43.13+03', 13, 30);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (81, 'Стиральная машина Indesit EWUC 4105, фронтальная, 4кг, 1000об/мин', 26490, 0, '17688f4b-e07f-4432-9042-eb1c32ef3928.jpg', '2022-03-24 23:45:21.888+03', '2022-03-24 23:45:21.888+03', 13, 28);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (82, 'Стиральная машина LG F1296NDS0, фронтальная, 6кг, 1200об/мин', 48990, 0, 'e2a1cad6-e543-482a-925f-642e9a2599d0.jpg', '2022-03-24 23:45:58.021+03', '2022-03-24 23:45:58.021+03', 13, 25);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (57, 'Смартфон Apple iPhone 11 64Gb, MHDG3RU/A, зеленый', 61890, 0, '8f29cabb-9cdf-45cb-b1e3-b1c114b8a97c.jpg', '2022-03-24 23:17:49.356+03', '2022-03-24 23:17:49.356+03', 8, 19);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (58, 'Смартфон Apple iPhone 12 128Gb, MGJD3RU/A, (PRODUCT)RED', 79990, 0, '294a2614-9cfb-41da-89bd-cf4db9a15e29.jpg', '2022-03-24 23:18:55.279+03', '2022-03-24 23:18:55.279+03', 8, 19);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (59, 'Смартфон Apple iPhone 13 Pro Max 128Gb, MLLU3RU/A, небесно-голубой', 159490, 0, '3fa9a180-8acb-49a3-b91d-409afbb03d81.jpg', '2022-03-24 23:19:44.548+03', '2022-03-24 23:19:44.548+03', 8, 19);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (60, 'Смартфон Xiaomi Redmi Note 10S 6/128Gb, серый оникс', 24490, 0, 'f33ae540-150c-4f41-9916-669558722024.jpg', '2022-03-24 23:21:27.786+03', '2022-03-24 23:21:27.786+03', 8, 20);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (61, 'Смартфон Xiaomi Poco M3 Pro 6/128Gb, заряженный черный', 21990, 0, 'e5f335a0-7374-4da2-91a2-f4519101f0c6.jpg', '2022-03-24 23:22:11.4+03', '2022-03-24 23:22:11.4+03', 8, 20);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (62, 'Смартфон REALME 8 6/128Gb, черный', 22990, 0, '77c870c0-03ee-49fa-b840-b4e28c89fd77.jpg', '2022-03-24 23:23:28.478+03', '2022-03-24 23:23:28.478+03', 8, 21);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (63, 'Смартфон REALME C21Y 4/64Gb, голубой', 12690, 0, '1cd62041-2257-4155-8e7b-d4bc52e4e6e7.jpg', '2022-03-24 23:24:35.653+03', '2022-03-24 23:24:35.653+03', 8, 21);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (64, 'Ноутбук Lenovo IP Gaming 3 15ACH6, 15.6", IPS, AMD Ryzen 5 5600H 3.3ГГц, 8ГБ, 256ГБ SSD, NVIDIA GeForce RTX 3050 для ноутбуков - 4096 Мб, noOS, 82K201D1RK, черный', 106990, 0, '78e90011-bf73-4fe6-a3b9-eb3831b696fe.jpg', '2022-03-24 23:27:18.34+03', '2022-03-24 23:27:18.34+03', 9, 22);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (65, 'Ноутбук Acer Aspire 3 A315-56-38MN, 15.6", Intel Core i3 1005G1 1.2ГГц, 8ГБ, 256ГБ SSD, Intel UHD Graphics , Eshell, NX.HS5ER.00B, черный', 45990, 0, '7f8826e4-73be-4a27-867a-312402ee1960.jpg', '2022-03-24 23:28:11.109+03', '2022-03-24 23:28:11.109+03', 9, 23);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (66, 'Ноутбук ASUS TUF Gaming F15 FX506HCB-HN1138, 15.6", Intel Core i5 11400H 2.7ГГц, 8ГБ, 512ГБ SSD, NVIDIA GeForce RTX 3050 для ноутбуков - 4096 Мб, noOS, 90NR0723-M04800, серый', 112990, 0, '0034ab1c-8c32-4ea6-be91-f38468f91cb2.jpg', '2022-03-24 23:29:00.441+03', '2022-03-24 23:29:00.441+03', 9, 24);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (67, 'Ноутбук Digma EVE 11 C409, 11.6", IPS, Intel Celeron N3350 1.1ГГц, 4ГБ, 64ГБ SSD, Intel HD Graphics 500, Windows 10 Home, ES2056EW, черный', 18990, 0, '2b1e539a-49d8-44cb-947d-30a235911a25.jpg', '2022-03-24 23:29:55.606+03', '2022-03-24 23:29:55.606+03', 9, 27);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (68, 'Ноутбук Xiaomi Pro RedmiBook, 14", IPS, Intel Core i5 11320H 3.2ГГц, 16ГБ, 512ГБ SSD, Intel Iris Xe graphics , Windows 10 trial (для ознакомления), XMA2006-DJ, серебристый', 110990, 0, '1cad80d3-5277-4efa-b5bb-14422a9ff9ac.jpg', '2022-03-24 23:31:01.712+03', '2022-03-24 23:31:01.712+03', 9, 20);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (69, 'Телевизор Xiaomi MI TV 32 P1, 32", HD READY, черный', 26990, 0, '517d0777-ac94-45fc-8e48-c78f3812abab.jpg', '2022-03-24 23:32:39.923+03', '2022-03-24 23:32:39.923+03', 10, 20);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (70, 'Телевизор LG 32LM6350PLA, 32", FULL HD, черный', 39990, 0, 'abd3f648-4d43-4964-ae00-4f7b61c4f567.jpg', '2022-03-24 23:33:24.781+03', '2022-03-24 23:33:24.781+03', 10, 25);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (71, 'Телевизор Digma DM-LED32MQ10, 32", HD READY, черный', 16490, 0, 'a367e2c3-05b8-4299-99e0-bf259265d841.jpg', '2022-03-24 23:34:08.776+03', '2022-03-24 23:34:08.776+03', 10, 27);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (72, 'Телевизор Philips 32PHS5505/60, 32", HD READY, черный', 25999, 0, 'c434c33e-5812-4b71-afb0-b78e0429945d.jpg', '2022-03-24 23:34:59.848+03', '2022-03-24 23:34:59.848+03', 10, 26);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (73, 'Холодильник Indesit ITR 4180 W двухкамерный белый', 42890, 0, '52e1848e-a2a9-4c47-bc89-dd0653957efa.jpg', '2022-03-24 23:37:31.411+03', '2022-03-24 23:37:31.411+03', 11, 28);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (74, 'Холодильник LG GA-B509LQYL двухкамерный белый/черный', 69990, 0, '937acc54-5010-4d23-b336-353d3e5527f0.jpg', '2022-03-24 23:39:00.036+03', '2022-03-24 23:39:00.036+03', 11, 25);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (75, 'Холодильник Beko RCNK310KC0W двухкамерный белый', 44990, 0, 'c638aca6-76e1-4f0e-9730-95b01cacf36e.jpg', '2022-03-24 23:39:40.328+03', '2022-03-24 23:39:40.328+03', 11, 29);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (76, 'Холодильник Bosch KGN39VK25R двухкамерный бежевый', 81990, 0, '1d7ec192-eb01-4776-94a1-cc4f83e7217f.jpg', '2022-03-24 23:40:13.677+03', '2022-03-24 23:40:13.677+03', 11, 30);
INSERT INTO public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") VALUES (77, 'Холодильник Атлант XM-4208-000 двухкамерный белый', 27290, 0, '6a044459-6224-42e9-93b3-bdc158f90ea1.jpg', '2022-03-24 23:41:03.387+03', '2022-03-24 23:41:03.387+03', 11, 33);


--
-- TOC entry 3441 (class 0 OID 32948)
-- Dependencies: 232
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3437 (class 0 OID 32791)
-- Dependencies: 228
-- Data for Name: history_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3439 (class 0 OID 32892)
-- Dependencies: 230
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3431 (class 0 OID 16477)
-- Dependencies: 222
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3435 (class 0 OID 16508)
-- Dependencies: 226
-- Data for Name: type_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3423 (class 0 OID 16420)
-- Dependencies: 214
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.types (id, name, "createdAt", "updatedAt") VALUES (8, 'Смартфоны', '2022-03-24 23:09:31.405+03', '2022-03-24 23:09:31.405+03');
INSERT INTO public.types (id, name, "createdAt", "updatedAt") VALUES (9, 'Ноутбуки', '2022-03-24 23:09:53.801+03', '2022-03-24 23:09:53.801+03');
INSERT INTO public.types (id, name, "createdAt", "updatedAt") VALUES (10, 'Телевизоры', '2022-03-24 23:10:02.426+03', '2022-03-24 23:10:02.426+03');
INSERT INTO public.types (id, name, "createdAt", "updatedAt") VALUES (11, 'Холодильники', '2022-03-24 23:10:20.977+03', '2022-03-24 23:10:20.977+03');
INSERT INTO public.types (id, name, "createdAt", "updatedAt") VALUES (13, 'Стиральные машины', '2022-03-24 23:11:23.017+03', '2022-03-24 23:11:23.017+03');


--
-- TOC entry 3419 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, password, role, "createdAt", "updatedAt", name) VALUES (82, 'user@mail.ru', '$2b$05$opR4y/lVyVnrxydo8Ih7YeiuWFG/y21o4FKfAjTBSHEqdscnyxACy', 'USER', '2022-03-27 21:38:46.148+03', '2022-03-27 21:38:46.148+03', 'Арслан');
INSERT INTO public.users (id, email, password, role, "createdAt", "updatedAt", name) VALUES (83, 'admin@mail.ru', '$2b$05$9htDKlkOBlAiWfaK2Hs4jeTU.Uz5UJqRErAb2/p8huimRIO6tzGkm', 'ADMIN', '2022-03-27 21:39:00.003+03', '2022-03-27 21:39:00.003+03', 'Арслан');


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 219
-- Name: basket_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_devices_id_seq', 289, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 211
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 83, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 215
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 33, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 223
-- Name: deviceInfos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."deviceInfos_id_seq"', 148, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 217
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 82, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 231
-- Name: histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.histories_id_seq', 1, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 227
-- Name: history_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_devices_id_seq', 331, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 229
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.models_id_seq', 1, false);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 221
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 225
-- Name: type_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_brands_id_seq', 1, false);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 213
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 13, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 83, true);


--
-- TOC entry 3252 (class 2606 OID 16465)
-- Name: basket_devices basket_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT basket_devices_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 16413)
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 16436)
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- TOC entry 3246 (class 2606 OID 16434)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16501)
-- Name: deviceInfos deviceInfos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deviceInfos"
    ADD CONSTRAINT "deviceInfos_pkey" PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 16448)
-- Name: devices devices_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_name_key UNIQUE (name);


--
-- TOC entry 3250 (class 2606 OID 16446)
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 32953)
-- Name: histories histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 32796)
-- Name: history_devices history_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_devices
    ADD CONSTRAINT history_devices_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 32897)
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16482)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 16513)
-- Name: type_brands type_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT type_brands_pkey PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 16515)
-- Name: type_brands type_brands_typeId_brandId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_brandId_key" UNIQUE ("typeId", "brandId");


--
-- TOC entry 3240 (class 2606 OID 16427)
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- TOC entry 3242 (class 2606 OID 16425)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 16406)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3236 (class 2606 OID 16404)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 16466)
-- Name: basket_devices basket_devices_basketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3271 (class 2606 OID 16471)
-- Name: basket_devices basket_devices_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3267 (class 2606 OID 16414)
-- Name: baskets baskets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3274 (class 2606 OID 16502)
-- Name: deviceInfos deviceInfos_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deviceInfos"
    ADD CONSTRAINT "deviceInfos_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3269 (class 2606 OID 16454)
-- Name: devices devices_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3268 (class 2606 OID 16449)
-- Name: devices devices_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3277 (class 2606 OID 32802)
-- Name: history_devices history_devices_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_devices
    ADD CONSTRAINT "history_devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3278 (class 2606 OID 32898)
-- Name: models models_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT "models_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3273 (class 2606 OID 16488)
-- Name: ratings ratings_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3272 (class 2606 OID 16483)
-- Name: ratings ratings_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3276 (class 2606 OID 16521)
-- Name: type_brands type_brands_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3275 (class 2606 OID 16516)
-- Name: type_brands type_brands_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-03-27 21:41:42

--
-- PostgreSQL database dump complete
--

