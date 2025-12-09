--
-- PostgreSQL database dump
--

\restrict 5pmBSo2ngAb6gNV0dtOAzu2U6Eng5bfLqO2sBRKyeeNZ4iADdgXOmBBWG7Z4WKV

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_id_seq OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    buyer_id integer NOT NULL,
    seller_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    total_price numeric(10,2) NOT NULL,
    status character varying(50) DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    size character varying(20),
    sizes text,
    CONSTRAINT orders_quantity_check CHECK ((quantity > 0)),
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('confirmed'::character varying)::text, ('shipped'::character varying)::text, ('delivered'::character varying)::text, ('cancelled'::character varying)::text])))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    category_id integer,
    image_url text,
    seller_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    features jsonb
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    name character varying(255),
    role character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY (ARRAY[('admin'::character varying)::text, ('customer'::character varying)::text])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, slug, created_at) FROM stdin;
1	Erkek Giyim	erkek-giyim	2025-12-04 09:36:56.756678
2	Kadın Giyim	kadin-giyim	2025-12-04 09:36:56.756678
3	Ayakkabı	ayakkabi	2025-12-04 09:36:56.756678
4	Çocuk Giyim	cocuk-giyim	2025-12-04 09:36:56.756678
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (id, user_id, product_id, created_at) FROM stdin;
9	1	12	2025-12-09 02:21:12.805596
13	1	11	2025-12-09 15:00:11.398021
14	1	13	2025-12-09 17:25:06.205253
16	1	14	2025-12-10 01:45:41.307724
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, buyer_id, seller_id, product_id, quantity, total_price, status, created_at, size, sizes) FROM stdin;
8	2	1	10	1	2250.00	pending	2025-12-04 16:11:11.141522	\N	["M","S"]
9	2	1	10	1	2250.00	pending	2025-12-04 16:11:16.626063	\N	["M","S"]
10	2	1	10	1	2250.00	pending	2025-12-04 16:15:39.131945	\N	["XL","M"]
11	2	1	10	1	2250.00	pending	2025-12-04 16:16:30.384292	\N	["S","XS"]
12	2	1	10	3	6750.00	confirmed	2025-12-04 16:20:23.191923	\N	["L","S","XL","XS"]
13	2	1	10	1	2250.00	pending	2025-12-04 16:30:20.779437	\N	["L","S","XS"]
14	2	1	10	16	36000.00	pending	2025-12-04 16:31:02.272182	\N	["L","S","XS"]
15	2	1	10	20	45000.00	pending	2025-12-04 16:31:42.976652	\N	["L","S","XS"]
16	1	2	14	1	1130.00	pending	2025-12-09 01:17:34.185091	\N	["S"]
17	1	2	14	1	1130.00	pending	2025-12-09 01:17:35.440522	\N	["S"]
18	1	2	14	1	1130.00	pending	2025-12-09 01:17:37.34692	\N	["S"]
19	1	2	14	1	1130.00	pending	2025-12-09 01:17:37.504405	\N	["S"]
20	1	2	14	1	1130.00	pending	2025-12-09 01:17:37.667842	\N	["S"]
21	1	2	14	1	1130.00	pending	2025-12-09 01:17:37.805114	\N	["S"]
22	1	2	13	6	4500.00	pending	2025-12-09 01:43:38.549	\N	["L"]
23	1	2	12	1	4451.00	pending	2025-12-09 01:55:39.526446	\N	["M"]
24	1	2	14	2	2260.00	pending	2025-12-09 01:55:39.530631	\N	["S"]
25	1	2	11	310	726950.00	pending	2025-12-09 15:07:55.331849	\N	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, description, price, category_id, image_url, seller_id, created_at, features) FROM stdin;
10	Slim Fit Dar Kesim Bisiklet Yaka %100 Pamuk Kısa Kollu Beyaz Tişört	Tişört	2250.00	1	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi7RzW7dIsiz_CJwZxh-pXVjHUJoIwShXQVVVNlTkcZ3sDu0qQXHhp5Gc3Cu_lp4L5zb85iA&s	1	2025-12-04 15:58:33.775444	{"Renk": "Beyaz", "Marka": "Altınyıldız", "sizes": ["XS", "S", "M", "XL", "L"], "Malzeme": "%100 Pamuk"}
11	Slim Fit Dar Kesim 5  Esnek Petrol Chino Pantolon	Pantolon	2345.00	1	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTySu8jG-aK3TPsWtqnXqCiKcXRhf0BqHmeQAQXdPa1KPeAjr2WkL9G-dY&s	2	2025-12-04 16:49:45.346213	{"Renk": "Siyah", "Marka": "Altınyıldız", "Malzeme": "Cep Pamuklu"}
12	Slim Fit Dar Kesim Yan Esnek Siyah Chino Pantolon	Pantolon	4451.00	1	https://images.altinyildizclassics.com/mnresize/460/690/images/ET0120000001SYH_200.jpg	2	2025-12-04 16:50:59.045687	{"sizes": ["S", "M", "L", "XL", "XS"], "Malzeme": "Cep Pamuklu"}
13	Yeşil Spor Pantolon	Pantolon	750.00	1	//sky-static.mavi.com/mnresize/820/1162/0010464-86749_image_1.jpg	2	2025-12-04 16:55:48.85012	{"Renk": "Yeşil", "Marka": "Mavi", "sizes": ["XL", "XXL", "M", "L"]}
14	Beyaz Basic Erkek Tişört	Tişört	1130.00	1	https://static.ticimax.cloud/5334/uploads/urunresimleri/buyuk/beyaz-basic-erkek-tisort-c-458e.jpg	2	2025-12-04 17:18:27.725401	{"Renk": "Beyaz", "Marka": "MADMEXT", "sizes": ["S", "XS", "XL", "L"], "Malzeme": "Basic"}
15	Kız Poco Kazak	Kazak	2500.00	2	["https://25d163.a-cdn.akinoncloud.com/products/2022/06/14/617690/2791173b-598c-4bc8-928e-9de48d4b2631_size780x1170_quality100_cropCenter.jpg","https://a4c976.a-cdn.akinoncloud.com/products/2025/08/07/291507/5c694015-a0ce-4cd1-8bef-1d5100abfc94_size3840x5760_cropCenter.jpg","https://dfcdn.defacto.com.tr/7/C9554A8_24AU_GR28_01_01.jpg"]	1	2025-12-09 01:46:05.195831	{"Renk": "3 Renk", "Marka": "Mavi", "sizes": ["XS", "S", "M", "L", "XL", "XXL"], "Malzeme": "Kaliteli"}
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password_hash, name, role, created_at) FROM stdin;
1	acunacar1@gmail.com	$2b$10$X7wWaK/nsP/y9fxyp7inpORx83HGWkk4Ye2o1UnPAzVeN4UoT/xY6	Acun Acar	admin	2025-12-04 09:55:08.077491
2	atakancan1@gmail.com	$2b$10$CjpofpevJhPswjG0ingaV.66Feun8N25IUs0N.kwLdkDVKo6ZPUUm	Atakan Can	customer	2025-12-04 10:00:56.123866
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 16, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 25, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 15, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_user_id_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_product_id_key UNIQUE (user_id, product_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_favorites_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_favorites_product ON public.favorites USING btree (product_id);


--
-- Name: idx_favorites_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_favorites_user ON public.favorites USING btree (user_id);


--
-- Name: idx_orders_buyer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_buyer ON public.orders USING btree (buyer_id);


--
-- Name: idx_orders_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_product ON public.orders USING btree (product_id);


--
-- Name: idx_orders_seller; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_seller ON public.orders USING btree (seller_id);


--
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_status ON public.orders USING btree (status);


--
-- Name: idx_products_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_category ON public.products USING btree (category_id);


--
-- Name: idx_products_seller; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_seller ON public.products USING btree (seller_id);


--
-- Name: favorites favorites_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: orders orders_buyer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: orders orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE RESTRICT;


--
-- Name: orders orders_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: products products_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 5pmBSo2ngAb6gNV0dtOAzu2U6Eng5bfLqO2sBRKyeeNZ4iADdgXOmBBWG7Z4WKV

