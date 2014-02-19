--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: installation; Type: TABLE; Schema: public; Owner: tix_user_db; Tablespace: 
--

CREATE TABLE installation (
    id integer NOT NULL,
    encryptionkey text,
    location integer,
    name character varying(255) NOT NULL,
    owner_id integer
);


ALTER TABLE public.installation OWNER TO tix_user_db;

--
-- Name: installation_id_seq; Type: SEQUENCE; Schema: public; Owner: tix_user_db
--

CREATE SEQUENCE installation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.installation_id_seq OWNER TO tix_user_db;

--
-- Name: installation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tix_user_db
--

ALTER SEQUENCE installation_id_seq OWNED BY installation.id;


--
-- Name: isp; Type: TABLE; Schema: public; Owner: tix_user_db; Tablespace: 
--

CREATE TABLE isp (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.isp OWNER TO tix_user_db;

--
-- Name: isp_id_seq; Type: SEQUENCE; Schema: public; Owner: tix_user_db
--

CREATE SEQUENCE isp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.isp_id_seq OWNER TO tix_user_db;

--
-- Name: isp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tix_user_db
--

ALTER SEQUENCE isp_id_seq OWNED BY isp.id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: tix_user_db; Tablespace: 
--

CREATE TABLE records (
    id integer NOT NULL,
    h_rs_down real NOT NULL,
    h_rs_up real NOT NULL,
    h_wave_down real NOT NULL,
    h_wave_up real NOT NULL,
    calidad_down real NOT NULL,
    utiliz_down real NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    calidad_up real NOT NULL,
    utiliz_up real NOT NULL,
    userdowncongestion boolean DEFAULT false NOT NULL,
    userupcongestion boolean DEFAULT false NOT NULL,
    installation_id integer,
    isp_id integer,
    user_id integer
);


ALTER TABLE public.records OWNER TO tix_user_db;

--
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: tix_user_db
--

CREATE SEQUENCE records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_id_seq OWNER TO tix_user_db;

--
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tix_user_db
--

ALTER SEQUENCE records_id_seq OWNED BY records.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tix_user_db; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    birthyear integer,
    nickname character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    passwordrecoveryrequestcode character varying(255),
    type character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO tix_user_db;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tix_user_db
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO tix_user_db;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tix_user_db
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_installation; Type: TABLE; Schema: public; Owner: tix_user_db; Tablespace: 
--

CREATE TABLE users_installation (
    users_id integer NOT NULL,
    installations_id integer NOT NULL
);


ALTER TABLE public.users_installation OWNER TO tix_user_db;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY installation ALTER COLUMN id SET DEFAULT nextval('installation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY isp ALTER COLUMN id SET DEFAULT nextval('isp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY records ALTER COLUMN id SET DEFAULT nextval('records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: installation_encryptionkey_key; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY installation
    ADD CONSTRAINT installation_encryptionkey_key UNIQUE (encryptionkey);


--
-- Name: installation_pkey; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY installation
    ADD CONSTRAINT installation_pkey PRIMARY KEY (id);


--
-- Name: isp_pkey; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY isp
    ADD CONSTRAINT isp_pkey PRIMARY KEY (id);


--
-- Name: records_pkey; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- Name: users_installation_installations_id_key; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY users_installation
    ADD CONSTRAINT users_installation_installations_id_key UNIQUE (installations_id);


--
-- Name: users_nickname_key; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_nickname_key UNIQUE (nickname);


--
-- Name: users_passwordrecoveryrequestcode_key; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_passwordrecoveryrequestcode_key UNIQUE (passwordrecoveryrequestcode);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: tix_user_db; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fk40871e425f15146d; Type: FK CONSTRAINT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY records
    ADD CONSTRAINT fk40871e425f15146d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk40871e42a448ff07; Type: FK CONSTRAINT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY records
    ADD CONSTRAINT fk40871e42a448ff07 FOREIGN KEY (isp_id) REFERENCES isp(id);


--
-- Name: fk40871e42d0cc070d; Type: FK CONSTRAINT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY records
    ADD CONSTRAINT fk40871e42d0cc070d FOREIGN KEY (installation_id) REFERENCES installation(id);


--
-- Name: fk796d5e3acafbc485; Type: FK CONSTRAINT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY installation
    ADD CONSTRAINT fk796d5e3acafbc485 FOREIGN KEY (owner_id) REFERENCES users(id);


--
-- Name: fk87eb47115805ed10; Type: FK CONSTRAINT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY users_installation
    ADD CONSTRAINT fk87eb47115805ed10 FOREIGN KEY (users_id) REFERENCES users(id);


--
-- Name: fk87eb47115d77bf6e; Type: FK CONSTRAINT; Schema: public; Owner: tix_user_db
--

ALTER TABLE ONLY users_installation
    ADD CONSTRAINT fk87eb47115d77bf6e FOREIGN KEY (installations_id) REFERENCES installation(id);


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

