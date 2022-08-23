--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-20 23:09:56

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
-- TOC entry 209 (class 1259 OID 20396)
-- Name: Account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Account" (
    "Id" integer NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Password" character varying(100) NOT NULL,
    "Role" integer NOT NULL,
    "LockUp" integer NOT NULL,
    "FirstActive" integer DEFAULT 0,
    "SecurityQuestion" character varying(500),
    "SecurityAnswer" character varying(1000)
);


ALTER TABLE public."Account" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 20402)
-- Name: Account_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Account" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Account_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 20403)
-- Name: Consume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Consume" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdPackage" integer NOT NULL,
    "Time" timestamp with time zone NOT NULL,
    "CreditLimit" integer NOT NULL,
    "Status" character varying(100) DEFAULT 'Chưa thanh toán'::character varying NOT NULL,
    "Price" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Consume" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 20408)
-- Name: Consume_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Consume" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Consume_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 20409)
-- Name: District; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."District" (
    "Id" integer NOT NULL,
    "NameDistrict" character varying(50) NOT NULL
);


ALTER TABLE public."District" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 20412)
-- Name: DistrictWard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DistrictWard" (
    "Id" integer NOT NULL,
    "IdDistrict" integer NOT NULL,
    "IdWard" integer NOT NULL
);


ALTER TABLE public."DistrictWard" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 20415)
-- Name: DistrictWard_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."DistrictWard" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."DistrictWard_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 20416)
-- Name: District_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."District" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."District_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 20417)
-- Name: HistoryManager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HistoryManager" (
    "IdHistory" integer NOT NULL,
    "IdManager" integer NOT NULL,
    "TimeStart" timestamp with time zone NOT NULL,
    "TimeEnd" timestamp with time zone NOT NULL
);


ALTER TABLE public."HistoryManager" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 20420)
-- Name: HistoryManager_IdHistory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."HistoryManager" ALTER COLUMN "IdHistory" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."HistoryManager_IdHistory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 20421)
-- Name: HistoryUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HistoryUser" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "TimeStart" timestamp without time zone NOT NULL,
    "TimeEnd" timestamp without time zone,
    "Status" integer NOT NULL,
    "Place" character varying NOT NULL
);


ALTER TABLE public."HistoryUser" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 20426)
-- Name: HistoryUser_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."HistoryUser" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."HistoryUser_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 20602)
-- Name: ManagerActivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ManagerActivity" (
    "Id" integer NOT NULL,
    "IdHistoryManager" integer NOT NULL,
    "Activity" character varying(200) NOT NULL
);


ALTER TABLE public."ManagerActivity" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 20601)
-- Name: ManagerActivity_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ManagerActivity" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ManagerActivity_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 20431)
-- Name: Package; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Package" (
    "Id" integer NOT NULL,
    "NamePackage" character varying(50) NOT NULL,
    "LimitProducts" integer NOT NULL,
    "LimitPeople" integer NOT NULL,
    "LimitTime" integer NOT NULL,
    "Introduce" character varying(1000)
);


ALTER TABLE public."Package" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 20436)
-- Name: Package_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Package" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Package_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 20437)
-- Name: Place; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Place" (
    "Id" integer NOT NULL,
    "NamePlace" character varying(50) NOT NULL,
    "Size" integer NOT NULL,
    "Amount" integer NOT NULL,
    "Role" integer NOT NULL
);


ALTER TABLE public."Place" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 20440)
-- Name: Place_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Place" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Place_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 20441)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "Id" integer NOT NULL,
    "Price" integer NOT NULL,
    "NameProduct" character varying(50) NOT NULL,
    "Unit" character varying(50) NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 20444)
-- Name: ProductImg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductImg" (
    "Id" integer NOT NULL,
    "IdProduct" integer NOT NULL,
    "Img" character varying(100) NOT NULL
);


ALTER TABLE public."ProductImg" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20447)
-- Name: ProductImg_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProductImg" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductImg_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 20448)
-- Name: ProductPackage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductPackage" (
    "Id" integer NOT NULL,
    "IdPackage" integer NOT NULL,
    "IdProduct" integer NOT NULL
);


ALTER TABLE public."ProductPackage" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20451)
-- Name: ProductPackage_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProductPackage" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductPackage_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 20452)
-- Name: Product_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Product" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Product_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 20453)
-- Name: Province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Province" (
    "Id" integer NOT NULL,
    "NameProvince" character varying(50) NOT NULL
);


ALTER TABLE public."Province" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 20456)
-- Name: ProvinceDistrict; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProvinceDistrict" (
    "Id" integer NOT NULL,
    "IdProvince" integer NOT NULL,
    "IdDistrict" integer NOT NULL
);


ALTER TABLE public."ProvinceDistrict" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 20459)
-- Name: ProvinceDistrict_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProvinceDistrict" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProvinceDistrict_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 20460)
-- Name: Province_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Province" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Province_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 20461)
-- Name: RelatedPeople; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RelatedPeople" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdRelatedUser" integer NOT NULL
);


ALTER TABLE public."RelatedPeople" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 20464)
-- Name: RelatedPeople_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."RelatedPeople" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."RelatedPeople_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 20465)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Year" integer NOT NULL,
    "Address" integer NOT NULL,
    "Status" integer NOT NULL,
    "Debt" integer NOT NULL,
    "Inform" integer DEFAULT 0 NOT NULL,
    "IdNumber" character varying(50) NOT NULL,
    "IdPayment" character varying(10)
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 20469)
-- Name: UserPlace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserPlace" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdPlace" integer NOT NULL
);


ALTER TABLE public."UserPlace" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 20472)
-- Name: UserPlace_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."UserPlace" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."UserPlace_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 20473)
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."User" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 20474)
-- Name: Ward; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ward" (
    "Id" integer NOT NULL,
    "NameWard" character varying(50) NOT NULL
);


ALTER TABLE public."Ward" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 20477)
-- Name: Ward_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Ward" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Ward_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3445 (class 0 OID 20396)
-- Dependencies: 209
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3447 (class 0 OID 20403)
-- Dependencies: 211
-- Data for Name: Consume; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3449 (class 0 OID 20409)
-- Dependencies: 213
-- Data for Name: District; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (1, 'Quận 1');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (2, 'Quận 3');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (3, 'Quận 4');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (4, 'Quận 5');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (5, 'Quận 6');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (6, 'Dĩ An');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (7, 'Thuận An');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (8, 'Thủ Dầu Một');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (9, 'Bến Cát');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (10, 'Tân Uyên');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (11, 'Ninh Kiều');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (12, 'Bình Thủy');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (13, 'Cái Răng');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (14, 'Ô Môn');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (15, 'Thốt Nốt');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (16, 'Hai Bà Trưng');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (17, 'Hà Đông');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (18, 'Long Biên');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (19, 'Tây Hồ');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (20, 'Đống Đa');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (21, 'Sơn Trà');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (22, 'Thanh Khê');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (23, 'Hải Châu');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (24, 'Cẩm Lệ');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (25, 'Liên Chiểu');


--
-- TOC entry 3450 (class 0 OID 20412)
-- Dependencies: 214
-- Data for Name: DistrictWard; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (3, 1, 3);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (4, 1, 4);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (5, 1, 5);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (6, 2, 6);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (7, 2, 7);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (8, 2, 8);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (9, 2, 9);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (10, 2, 10);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (11, 3, 11);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (12, 3, 12);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (13, 3, 13);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (14, 3, 14);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (15, 3, 15);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (16, 4, 16);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (17, 4, 17);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (18, 4, 18);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (19, 4, 19);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (20, 4, 20);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (21, 5, 21);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (22, 5, 22);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (23, 5, 23);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (24, 5, 24);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (25, 5, 25);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (26, 6, 26);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (27, 6, 27);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (28, 6, 28);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (29, 6, 29);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (30, 6, 30);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (31, 7, 31);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (32, 7, 32);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (33, 7, 33);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (34, 7, 34);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (35, 7, 35);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (36, 8, 36);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (37, 8, 37);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (38, 8, 38);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (39, 8, 39);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (40, 8, 40);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (41, 9, 41);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (42, 9, 42);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (43, 9, 43);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (44, 9, 44);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (45, 9, 45);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (46, 10, 46);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (47, 10, 47);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (48, 10, 48);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (49, 10, 49);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (50, 10, 50);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (51, 11, 51);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (52, 11, 52);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (53, 11, 53);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (54, 11, 54);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (55, 11, 55);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (56, 12, 56);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (57, 12, 57);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (58, 12, 58);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (59, 12, 59);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (60, 12, 60);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (61, 13, 61);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (62, 13, 62);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (63, 13, 63);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (64, 13, 64);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (65, 13, 65);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (66, 14, 66);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (67, 14, 67);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (68, 14, 68);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (69, 14, 69);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (70, 14, 70);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (71, 15, 71);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (72, 15, 72);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (73, 15, 73);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (74, 15, 74);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (75, 15, 75);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (76, 16, 76);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (77, 16, 77);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (78, 16, 78);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (79, 16, 79);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (80, 16, 80);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (81, 17, 81);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (82, 17, 82);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (83, 17, 83);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (84, 17, 84);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (85, 17, 85);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (86, 18, 86);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (87, 18, 87);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (88, 18, 88);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (89, 18, 89);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (90, 18, 90);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (91, 19, 91);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (92, 19, 92);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (93, 19, 93);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (94, 19, 94);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (95, 19, 95);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (96, 20, 96);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (97, 20, 97);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (98, 20, 98);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (99, 20, 99);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (100, 20, 100);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (101, 21, 101);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (102, 21, 102);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (103, 21, 103);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (104, 21, 104);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (105, 21, 105);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (106, 22, 106);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (107, 22, 107);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (108, 22, 108);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (109, 22, 109);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (110, 22, 110);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (111, 23, 111);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (112, 23, 112);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (113, 23, 113);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (114, 23, 114);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (115, 23, 115);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (116, 24, 116);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (117, 24, 117);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (118, 24, 118);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (119, 24, 119);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (120, 24, 120);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (121, 25, 121);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (122, 25, 122);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (123, 25, 123);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (124, 25, 124);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (125, 25, 125);


--
-- TOC entry 3453 (class 0 OID 20417)
-- Dependencies: 217
-- Data for Name: HistoryManager; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3455 (class 0 OID 20421)
-- Dependencies: 219
-- Data for Name: HistoryUser; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3480 (class 0 OID 20602)
-- Dependencies: 244
-- Data for Name: ManagerActivity; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3457 (class 0 OID 20431)
-- Dependencies: 221
-- Data for Name: Package; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (1, 'Package 1', 1, 5, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (2, 'Package 2', 1, 6, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (3, 'Package 3', 1, 4, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (4, 'Package 4', 1, 10, 15, NULL);


--
-- TOC entry 3459 (class 0 OID 20437)
-- Dependencies: 223
-- Data for Name: Place; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (2, 'Bệnh viện Chợ Rẫy', 10000, 8345, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (4, 'Thuận Kiều Plaza', 20000, 20000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (5, 'Bệnh viện đại học Y Dược tpHCM', 23000, 15000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (6, 'Khu cách ly tập trung quận 10', 27000, 26000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (7, 'Bệnh viện 22-12', 18000, 15000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (8, 'Khu cách ly tập trung quận Tân Bình', 14700, 9999, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (9, 'Bệnh viện Phạm Ngọc Thạch', 22000, 20000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (10, 'Bệnh viện bệnh nhiệt đới', 5000, 4000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (11, 'Bệnh viện Nhi Đồng', 1000, 1000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (12, 'Bệnh viện Bạch Mai', 6000, 4000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (13, 'Bệnh viện Hữu Nghị', 8000, 5000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (14, 'Viện Răng-Hàm-Mặt', 10000, 7000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (15, 'Bệnh viện Thống Nhất', 9000, 8000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (16, 'Bệnh viện Quân y 175', 3000, 1000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (17, 'Bệnh viện Từ Dũ', 12000, 10000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (18, 'Bệnh viện Vạn Hạnh', 2000, 1000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (19, 'Bệnh viện y học cổ truyền Cần Thơ', 4000, 2000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (20, 'Bệnh Viện Da Liễu', 3000, 1000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (3, 'Bệnh viện Đa Khoa', 9500, 2062, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (1, 'Bệnh viện dã chiến Củ Chi', 15000, 12007, 1);


--
-- TOC entry 3461 (class 0 OID 20441)
-- Dependencies: 225
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (1, 129000, 'Thịt heo', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (2, 130000, 'Cá thu', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (3, 9000, 'Bắp cải trắng', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (4, 8000, 'Rau muống', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (5, 28000, 'Rau thơm', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (6, 15000, 'Rau sống', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (7, 45000, 'Ớt sừng đỏ', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (8, 13000, 'Khổ qua', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (9, 8000, 'Đu đủ xanh', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (10, 9000, 'Củ cải trắng', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (11, 50000, 'Trái cây các loại', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (12, 25000, 'Trứng gà', 'box');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (13, 20000, 'Trứng cút', 'box');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (14, 40000, 'Bánh kẹo', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (15, 2000, 'Muối', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (16, 15000, 'Bột nêm', 'package');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (17, 30000, 'Nước mắm', 'bottle');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (18, 15000, 'Nước tương', 'bottle');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (19, 18000, 'Đường trắng', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (20, 56000, 'Dầu ăn', 'bottle');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (21, 25000, 'Gạo', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (22, 115000, 'Mỳ gói', 'box');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (23, 50000, 'Khẩu trang y tế', 'box');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (24, 35000, 'Nước rửa tay', 'bottle');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (25, 80000, 'Chai xịt khử mùi', 'bottle');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (26, 30000, 'Kem đánh răng', 'box');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (27, 35000, 'Giấy vệ sinh', 'box');


--

-- Dependencies: 226
-- Data for Name: ProductImg; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (1, 1, 'thit_heo_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (2, 1, 'thit_heo_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (3, 1, 'thit_heo_3.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (4, 2, 'ca_thu_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (5, 2, 'ca_thu_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (6, 2, 'ca_thu_3.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (7, 3, 'bap_cai_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (8, 3, 'bap_cai_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (9, 3, 'bap_cai_trang_3.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (10, 4, 'rau_muong_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (11, 4, 'rau_muong_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (12, 5, 'rau_thom_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (13, 5, 'rau_thom_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (14, 6, 'rau_song_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (15, 6, 'rau_song_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (16, 7, 'ot_sung_do_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (17, 7, 'ot_sung_do_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (18, 8, 'kho_qua_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (19, 8, 'kho_qua_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (20, 9, 'du_du_xanh_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (21, 9, 'du_du_xanh_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (22, 10, 'cu_cai_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (23, 10, 'cu_cai_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (24, 11, 'trai_cay_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (25, 11, 'trai_cay_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (26, 12, 'trung_ga_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (27, 12, 'trung_ga_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (28, 13, 'trung_cut_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (29, 13, 'trung_cut_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (30, 14, 'banh_keo_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (31, 14, 'banh_keo_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (32, 15, 'muoi_iot_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (33, 15, 'muoi_iot_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (34, 16, 'bot_nem_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (35, 16, 'bot_nem_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (36, 17, 'chinsu_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (37, 17, 'chinsu_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (38, 18, 'nuoc_tuong_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (39, 18, 'nuoc_tuong_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (40, 19, 'duong_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (41, 19, 'duong_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (42, 20, 'dau_an_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (43, 20, 'dau_an_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (44, 21, 'gao_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (45, 21, 'gao_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (46, 22, 'my_goi_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (47, 22, 'my_goi_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (48, 23, 'khau_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (49, 23, 'khau_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (50, 24, 'nuoc_rua_tay_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (51, 24, 'nuoc_rua_tay_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (52, 25, 'xit_khu_mui_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (53, 25, 'xit_khu_mui_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (54, 26, 'colgate_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (55, 26, 'colgate_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (56, 27, 'giay_ve_sinh_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (57, 27, 'giay_ve_sinh_2.jpg');


--
-- TOC entry 3464 (class 0 OID 20448)
-- Dependencies: 228
-- Data for Name: ProductPackage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (3, 1, 6);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (4, 1, 11);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (5, 1, 12);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (6, 1, 17);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (7, 1, 18);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (8, 1, 21);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (9, 1, 23);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (10, 1, 24);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (11, 2, 1);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (12, 2, 5);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (13, 2, 6);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (14, 2, 7);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (15, 2, 12);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (16, 2, 17);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (17, 2, 22);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (18, 2, 25);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (19, 2, 26);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (20, 2, 27);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (21, 3, 2);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (22, 3, 9);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (23, 3, 10);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (24, 3, 11);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (25, 3, 13);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (26, 3, 14);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (27, 3, 20);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (28, 3, 21);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (29, 3, 24);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (30, 3, 25);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (31, 4, 1);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (32, 4, 11);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (33, 4, 12);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (34, 4, 13);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (35, 4, 15);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (36, 4, 16);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (37, 4, 19);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (38, 4, 20);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (39, 4, 21);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (40, 4, 22);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (41, 4, 26);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (42, 4, 27);


--
-- TOC entry 3467 (class 0 OID 20453)
-- Dependencies: 231
-- Data for Name: Province; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (1, 'TP.Hồ Chí Minh');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (2, 'Bình Dương');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (3, 'Cần Thơ');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (4, 'Hà Nội');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (5, 'Đà Nẵng');


--
-- TOC entry 3468 (class 0 OID 20456)
-- Dependencies: 232
-- Data for Name: ProvinceDistrict; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (3, 1, 3);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (4, 1, 4);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (5, 1, 5);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (6, 2, 6);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (7, 2, 7);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (8, 2, 8);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (9, 2, 9);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (10, 2, 10);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (11, 3, 11);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (12, 3, 12);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (13, 3, 13);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (14, 3, 14);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (15, 3, 15);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (16, 4, 16);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (17, 4, 17);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (18, 4, 18);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (19, 4, 19);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (20, 4, 20);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (21, 5, 21);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (22, 5, 22);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (23, 5, 23);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (24, 5, 24);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (25, 5, 25);


--
-- TOC entry 3471 (class 0 OID 20461)
-- Dependencies: 235
-- Data for Name: RelatedPeople; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3473 (class 0 OID 20465)
-- Dependencies: 237
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3474 (class 0 OID 20469)
-- Dependencies: 238
-- Data for Name: UserPlace; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3477 (class 0 OID 20474)
-- Dependencies: 241
-- Data for Name: Ward; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (1, 'Tân Định');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (2, 'Đa Kao');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (3, 'Bến Nghé');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (4, 'Bến Thành');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (5, 'Phạm Ngũ Lão');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (6, 'Phường 09');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (7, 'Phường 10');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (8, 'Phường 11');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (9, 'Phường 12');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (10, 'Phường 10');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (11, 'Phường 01');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (12, 'Phường 02');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (13, 'Phường 03');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (14, 'Phường 04');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (15, 'Phường 06');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (16, 'Phường 01');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (17, 'Phường 02');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (18, 'Phường 03');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (19, 'Phường 04');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (20, 'Phường 05');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (21, 'Phường 01');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (22, 'Phường 02');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (23, 'Phường 03');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (24, 'Phường 04');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (25, 'Phường 05');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (26, 'An Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (27, 'Bình Thắng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (28, 'Dĩ An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (29, 'Đông Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (30, 'Tân Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (31, 'An Phú');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (32, 'An Thạnh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (33, 'Bình Chuẩn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (34, 'Bình Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (35, 'Bình Nhâm');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (36, 'Chánh Mỹ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (37, 'Chánh Nghĩa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (38, 'Định Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (39, 'Hiệp An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (40, 'Hiệp Thành');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (41, 'Hòa Lợi');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (42, 'Mỹ Phước');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (43, 'Tân Định');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (44, 'Thới Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (45, 'Vệ An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (46, 'Hội Nghĩa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (47, 'Khánh Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (48, 'Phú Chánh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (49, 'Tân Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (50, 'Thái Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (51, 'An Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (52, 'An Cư');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (53, 'An Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (54, 'An Khánh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (55, 'An Nghiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (56, 'An Thới');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (57, 'Bùi Hữu Nghĩa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (58, 'Long Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (59, 'Long Tuyền');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (60, 'Thới An Đông');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (61, 'Ba Láng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (62, 'Hưng Phú');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (63, 'Hưng Thạnh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (64, 'Lê Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (65, 'Phú Thứ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (66, 'Châu Văn Liêm');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (67, 'Long Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (68, 'Phước Thới');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (69, 'Thới An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (70, 'Thới Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (71, 'Tân Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (72, 'Tân Lộc');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (73, 'Thạnh Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (74, 'Thới Thuận');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (75, 'Thuận An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (76, 'Bạch Đằng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (77, 'Bách Khoa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (78, 'Bạch Mai');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (79, 'Cầu Dền');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (80, 'Đống Mác');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (81, 'Biên Giang');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (82, 'Dương Nội');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (83, 'Đồng Mai');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (84, 'Hà Cầu');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (85, 'Kiến Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (86, 'Bồ Đề');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (87, 'Cự Khối');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (88, 'Đức Giang');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (89, 'Gia Thụy');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (90, 'Giang Biên');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (91, 'Bưởi');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (92, 'Nhật Tân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (93, 'Phú Thượng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (94, 'Quảng An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (95, 'Thụy Khuê');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (96, 'Cát Linh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (97, 'Hàng Bột');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (98, 'Khâm Thiên');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (99, 'Khương Thượng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (100, 'Kim Liên');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (101, 'An Hải Bắc');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (102, 'An Hải Đông');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (103, 'An Hải Tây');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (104, 'Mân Thái');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (105, 'Nại Hiên Đông');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (106, 'An Khê');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (107, 'Chính Gián');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (108, 'Hòa Khê');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (109, 'Tam Thuận');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (110, 'Tân Chính');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (111, 'Bình Hiên');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (112, 'Bình Thuận');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (113, 'Hòa Cường Bắc');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (114, 'Hòa Cường Nam');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (115, 'Hòa Thuận Đông');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (116, 'Hòa Phát');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (117, 'Hòa Thọ Đông');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (118, 'Hòa Thọ Tây');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (119, 'Hòa Xuân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (120, 'Khuê Trung');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (121, 'Hòa Hiệp Bắc');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (122, 'Hòa Hiệp Nam');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (123, 'Hòa Khánh Bắc');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (124, 'Hòa Khánh Nam');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (125, 'Hòa Minh');


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 210
-- Name: Account_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Account_Id_seq"', 18, true);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 212
-- Name: Consume_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Consume_Id_seq"', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 215
-- Name: DistrictWard_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DistrictWard_Id_seq"', 125, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 216
-- Name: District_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."District_Id_seq"', 25, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 218
-- Name: HistoryManager_IdHistory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HistoryManager_IdHistory_seq"', 7, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 220
-- Name: HistoryUser_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HistoryUser_Id_seq"', 7, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 243
-- Name: ManagerActivity_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ManagerActivity_Id_seq"', 1, false);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 222
-- Name: Package_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Package_Id_seq"', 4, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 224
-- Name: Place_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Place_Id_seq"', 11, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 227
-- Name: ProductImg_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductImg_Id_seq"', 57, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 229
-- Name: ProductPackage_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductPackage_Id_seq"', 42, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 230
-- Name: Product_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_Id_seq"', 27, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 233
-- Name: ProvinceDistrict_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProvinceDistrict_Id_seq"', 25, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 234
-- Name: Province_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Province_Id_seq"', 5, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 236
-- Name: RelatedPeople_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RelatedPeople_Id_seq"', 1, false);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 239
-- Name: UserPlace_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserPlace_Id_seq"', 9, true);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 240
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 242
-- Name: Ward_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ward_Id_seq"', 125, true);


--
-- TOC entry 3254 (class 2606 OID 20479)
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3256 (class 2606 OID 20481)
-- Name: Consume Consume_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "Consume_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3260 (class 2606 OID 20483)
-- Name: DistrictWard DistrictWard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "DistrictWard_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3258 (class 2606 OID 20485)
-- Name: District District_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."District"
    ADD CONSTRAINT "District_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3262 (class 2606 OID 20487)
-- Name: HistoryManager HistoryManager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "HistoryManager_pkey" PRIMARY KEY ("IdHistory");


--
-- TOC entry 3264 (class 2606 OID 20489)
-- Name: HistoryUser HistoryUser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3288 (class 2606 OID 20606)
-- Name: ManagerActivity ManagerActivity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "ManagerActivity_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3266 (class 2606 OID 20493)
-- Name: Package Package_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Package"
    ADD CONSTRAINT "Package_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3268 (class 2606 OID 20495)
-- Name: Place Place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Place"
    ADD CONSTRAINT "Place_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3272 (class 2606 OID 20497)
-- Name: ProductImg ProductImg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "ProductImg_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3274 (class 2606 OID 20499)
-- Name: ProductPackage ProductPackage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "ProductPackage_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3270 (class 2606 OID 20501)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3278 (class 2606 OID 20503)
-- Name: ProvinceDistrict ProvinceDistrict_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "ProvinceDistrict_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3276 (class 2606 OID 20505)
-- Name: Province Province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Province"
    ADD CONSTRAINT "Province_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3280 (class 2606 OID 20507)
-- Name: RelatedPeople RelatedPeople_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "RelatedPeople_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3284 (class 2606 OID 20509)
-- Name: UserPlace UserPlace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "UserPlace_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3282 (class 2606 OID 20511)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3286 (class 2606 OID 20513)
-- Name: Ward Ward_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ward"
    ADD CONSTRAINT "Ward_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3294 (class 2606 OID 20515)
-- Name: HistoryUser HistoryUser_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3291 (class 2606 OID 20520)
-- Name: DistrictWard IDDistrict_DistrictWard_District; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDDistrict_DistrictWard_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;


--
-- TOC entry 3298 (class 2606 OID 20525)
-- Name: ProvinceDistrict IDDistrict_ProvinceDistrict_District; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDDistrict_ProvinceDistrict_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 20530)
-- Name: Consume IDPackage_Consume_Package; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDPackage_Consume_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;


--
-- TOC entry 3296 (class 2606 OID 20535)
-- Name: ProductPackage IDPackage_ProductPackage_Package; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDPackage_ProductPackage_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;


--
-- TOC entry 3303 (class 2606 OID 20540)
-- Name: UserPlace IDPlace_UserPlace_Place; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDPlace_UserPlace_Place" FOREIGN KEY ("IdPlace") REFERENCES public."Place"("Id") NOT VALID;


--
-- TOC entry 3295 (class 2606 OID 20545)
-- Name: ProductImg IDProduct_ProductImg_Product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "IDProduct_ProductImg_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;


--
-- TOC entry 3297 (class 2606 OID 20550)
-- Name: ProductPackage IDProduct_ProductPackage_Product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDProduct_ProductPackage_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;


--
-- TOC entry 3299 (class 2606 OID 20555)
-- Name: ProvinceDistrict IDProvince_ProvinceDistrict_Province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDProvince_ProvinceDistrict_Province" FOREIGN KEY ("IdProvince") REFERENCES public."Province"("Id") NOT VALID;


--
-- TOC entry 3300 (class 2606 OID 20560)
-- Name: RelatedPeople IDRelated_Related_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDRelated_Related_User" FOREIGN KEY ("IdRelatedUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 20565)
-- Name: Consume IDUser_Consume_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDUser_Consume_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 20570)
-- Name: RelatedPeople IDUser_Related_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDUser_Related_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3304 (class 2606 OID 20575)
-- Name: UserPlace IDUser_UserPlace_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDUser_UserPlace_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3292 (class 2606 OID 20580)
-- Name: DistrictWard IDWard_DistrictWard_Ward; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDWard_DistrictWard_Ward" FOREIGN KEY ("IdWard") REFERENCES public."Ward"("Id") NOT VALID;


--
-- TOC entry 3293 (class 2606 OID 20585)
-- Name: HistoryManager ID_HistoryManager_Account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "ID_HistoryManager_Account" FOREIGN KEY ("IdManager") REFERENCES public."Account"("Id") NOT VALID;


--
-- TOC entry 3305 (class 2606 OID 20607)
-- Name: ManagerActivity IdHistoryManager_HistoryManager; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "IdHistoryManager_HistoryManager" FOREIGN KEY ("IdHistoryManager") REFERENCES public."HistoryManager"("IdHistory") NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 20595)
-- Name: User Id_User_Account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Id_User_Account" FOREIGN KEY ("Id") REFERENCES public."Account"("Id") NOT VALID;


-- Completed on 2022-01-20 23:09:56

--
-- PostgreSQL database dump complete
--

