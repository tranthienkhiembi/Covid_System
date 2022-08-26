

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
    "ID" character varying(10) NOT NULL,
    "Password" character varying(100) NOT NULL,
    "Balance" integer DEFAULT 0 NOT NULL,
    "Role" integer DEFAULT 0 NOT NULL,
    "FirstActived" integer DEFAULT 1
);


ALTER TABLE public."Account" OWNER TO postgres;



INSERT INTO public."Account" ("ID", "Password", "Balance", "Role", "FirstActived") VALUES ('9999999999', '$2a$10$3v3B/DSgfq95XbE99FvhROStt1Kpsb7iWaitJBHEEfqgaXs1J5sgS', 0, 1, 1);



ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY ("ID");




