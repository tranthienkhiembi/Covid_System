

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



ALTER TABLE public."Account" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Account_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




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



ALTER TABLE public."Consume" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Consume_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."District" (
    "Id" integer NOT NULL,
    "NameDistrict" character varying(50) NOT NULL
);


ALTER TABLE public."District" OWNER TO postgres;



CREATE TABLE public."DistrictWard" (
    "Id" integer NOT NULL,
    "IdDistrict" integer NOT NULL,
    "IdWard" integer NOT NULL
);


ALTER TABLE public."DistrictWard" OWNER TO postgres;



ALTER TABLE public."DistrictWard" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."DistrictWard_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




ALTER TABLE public."District" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."District_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."HistoryManager" (
    "IdHistory" integer NOT NULL,
    "IdManager" integer NOT NULL,
    "TimeStart" timestamp with time zone NOT NULL,
    "TimeEnd" timestamp with time zone NOT NULL
);


ALTER TABLE public."HistoryManager" OWNER TO postgres;



ALTER TABLE public."HistoryManager" ALTER COLUMN "IdHistory" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."HistoryManager_IdHistory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."HistoryUser" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "TimeStart" timestamp without time zone NOT NULL,
    "TimeEnd" timestamp without time zone,
    "Status" integer NOT NULL,
    "Place" character varying NOT NULL
);


ALTER TABLE public."HistoryUser" OWNER TO postgres;



ALTER TABLE public."HistoryUser" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."HistoryUser_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."ManagerActivity" (
    "Id" integer NOT NULL,
    "IdHistoryManager" integer NOT NULL,
    "Activity" character varying(200) NOT NULL
);


ALTER TABLE public."ManagerActivity" OWNER TO postgres;



ALTER TABLE public."ManagerActivity" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ManagerActivity_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."Package" (
    "Id" integer NOT NULL,
    "NamePackage" character varying(50) NOT NULL,
    "LimitProducts" integer NOT NULL,
    "LimitPeople" integer NOT NULL,
    "LimitTime" integer NOT NULL,
    "Introduce" character varying(1000)
);


ALTER TABLE public."Package" OWNER TO postgres;



ALTER TABLE public."Package" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Package_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."Place" (
    "Id" integer NOT NULL,
    "NamePlace" character varying(50) NOT NULL,
    "Size" integer NOT NULL,
    "Amount" integer NOT NULL,
    "Role" integer NOT NULL
);


ALTER TABLE public."Place" OWNER TO postgres;



ALTER TABLE public."Place" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Place_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."Product" (
    "Id" integer NOT NULL,
    "Price" integer NOT NULL,
    "NameProduct" character varying(50) NOT NULL,
    "Unit" character varying(50) NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;



CREATE TABLE public."ProductImg" (
    "Id" integer NOT NULL,
    "IdProduct" integer NOT NULL,
    "Img" character varying(100) NOT NULL
);


ALTER TABLE public."ProductImg" OWNER TO postgres;



ALTER TABLE public."ProductImg" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductImg_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."ProductPackage" (
    "Id" integer NOT NULL,
    "IdPackage" integer NOT NULL,
    "IdProduct" integer NOT NULL
);


ALTER TABLE public."ProductPackage" OWNER TO postgres;



ALTER TABLE public."ProductPackage" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductPackage_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




ALTER TABLE public."Product" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Product_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."Province" (
    "Id" integer NOT NULL,
    "NameProvince" character varying(50) NOT NULL
);


ALTER TABLE public."Province" OWNER TO postgres;



CREATE TABLE public."ProvinceDistrict" (
    "Id" integer NOT NULL,
    "IdProvince" integer NOT NULL,
    "IdDistrict" integer NOT NULL
);


ALTER TABLE public."ProvinceDistrict" OWNER TO postgres;



ALTER TABLE public."ProvinceDistrict" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProvinceDistrict_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




ALTER TABLE public."Province" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Province_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."RelatedPeople" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdRelatedUser" integer NOT NULL
);


ALTER TABLE public."RelatedPeople" OWNER TO postgres;



ALTER TABLE public."RelatedPeople" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."RelatedPeople_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




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



CREATE TABLE public."UserPlace" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdPlace" integer NOT NULL
);


ALTER TABLE public."UserPlace" OWNER TO postgres;



ALTER TABLE public."UserPlace" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."UserPlace_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




ALTER TABLE public."User" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public."Ward" (
    "Id" integer NOT NULL,
    "NameWard" character varying(50) NOT NULL
);


ALTER TABLE public."Ward" OWNER TO postgres;



ALTER TABLE public."Ward" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Ward_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




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




INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (1, 'Package 1', 1, 5, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (2, 'Package 2', 1, 6, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (3, 'Package 3', 1, 4, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (4, 'Package 4', 1, 10, 15, NULL);




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




INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (1, 1, 'thit_heo_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (2, 1, 'thit_heo_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (4, 2, 'ca_thu_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (5, 2, 'ca_thu_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (7, 3, 'bap_cai_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (8, 3, 'bap_cai_trang_2.jpg');
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




INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (1, 'TP.Hồ Chí Minh');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (2, 'Bình Dương');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (3, 'Cần Thơ');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (4, 'Hà Nội');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (5, 'Đà Nẵng');




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




SELECT pg_catalog.setval('public."Account_Id_seq"', 18, true);




SELECT pg_catalog.setval('public."Consume_Id_seq"', 1, false);




SELECT pg_catalog.setval('public."DistrictWard_Id_seq"', 125, true);




SELECT pg_catalog.setval('public."District_Id_seq"', 25, true);




SELECT pg_catalog.setval('public."HistoryManager_IdHistory_seq"', 7, true);




SELECT pg_catalog.setval('public."HistoryUser_Id_seq"', 7, true);




SELECT pg_catalog.setval('public."ManagerActivity_Id_seq"', 1, false);




SELECT pg_catalog.setval('public."Package_Id_seq"', 4, true);




SELECT pg_catalog.setval('public."Place_Id_seq"', 11, true);




SELECT pg_catalog.setval('public."ProductImg_Id_seq"', 57, true);




SELECT pg_catalog.setval('public."ProductPackage_Id_seq"', 42, true);




SELECT pg_catalog.setval('public."Product_Id_seq"', 27, true);




SELECT pg_catalog.setval('public."ProvinceDistrict_Id_seq"', 25, true);




SELECT pg_catalog.setval('public."Province_Id_seq"', 5, true);




SELECT pg_catalog.setval('public."RelatedPeople_Id_seq"', 1, false);




SELECT pg_catalog.setval('public."UserPlace_Id_seq"', 9, true);




SELECT pg_catalog.setval('public."User_id_seq"', 1, false);




SELECT pg_catalog.setval('public."Ward_Id_seq"', 125, true);




ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "Consume_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "DistrictWard_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."District"
    ADD CONSTRAINT "District_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "HistoryManager_pkey" PRIMARY KEY ("IdHistory");




ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "ManagerActivity_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."Package"
    ADD CONSTRAINT "Package_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."Place"
    ADD CONSTRAINT "Place_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "ProductImg_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "ProductPackage_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "ProvinceDistrict_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."Province"
    ADD CONSTRAINT "Province_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "RelatedPeople_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "UserPlace_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."Ward"
    ADD CONSTRAINT "Ward_pkey" PRIMARY KEY ("Id");




ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;




ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDDistrict_DistrictWard_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;




ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDDistrict_ProvinceDistrict_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;




ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDPackage_Consume_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;




ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDPackage_ProductPackage_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;




ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDPlace_UserPlace_Place" FOREIGN KEY ("IdPlace") REFERENCES public."Place"("Id") NOT VALID;




ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "IDProduct_ProductImg_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;




ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDProduct_ProductPackage_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;




ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDProvince_ProvinceDistrict_Province" FOREIGN KEY ("IdProvince") REFERENCES public."Province"("Id") NOT VALID;




ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDRelated_Related_User" FOREIGN KEY ("IdRelatedUser") REFERENCES public."User"("Id") NOT VALID;




ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDUser_Consume_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;




ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDUser_Related_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;




ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDUser_UserPlace_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;




ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDWard_DistrictWard_Ward" FOREIGN KEY ("IdWard") REFERENCES public."Ward"("Id") NOT VALID;




ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "ID_HistoryManager_Account" FOREIGN KEY ("IdManager") REFERENCES public."Account"("Id") NOT VALID;




ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "IdHistoryManager_HistoryManager" FOREIGN KEY ("IdHistoryManager") REFERENCES public."HistoryManager"("IdHistory") NOT VALID;




ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Id_User_Account" FOREIGN KEY ("Id") REFERENCES public."Account"("Id") NOT VALID;


