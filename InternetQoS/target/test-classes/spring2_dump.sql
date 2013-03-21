--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.6
-- Dumped by pg_dump version 9.1.6
-- Started on 2012-10-18 12:56:38 ART

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 183 (class 3079 OID 11681)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 183
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 32001)
-- Dependencies: 6
-- Name: abstractpublication_publicationcomment; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE abstractpublication_publicationcomment (
    abstractpublication_id integer NOT NULL,
    comments_id integer NOT NULL
);


ALTER TABLE public.abstractpublication_publicationcomment OWNER TO paw;

--
-- TOC entry 163 (class 1259 OID 32008)
-- Dependencies: 6
-- Name: event; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE event (
    id integer NOT NULL,
    date date NOT NULL,
    description character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    image bytea,
    owner_id integer
);


ALTER TABLE public.event OWNER TO paw;

--
-- TOC entry 165 (class 1259 OID 32022)
-- Dependencies: 6
-- Name: event_guests; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE event_guests (
    event_id integer NOT NULL,
    event_status character varying(255),
    mapkey_id integer NOT NULL
);


ALTER TABLE public.event_guests OWNER TO paw;

--
-- TOC entry 162 (class 1259 OID 32006)
-- Dependencies: 6 163
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: paw
--

CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO paw;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 162
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paw
--

ALTER SEQUENCE event_id_seq OWNED BY event.id;


--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 162
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paw
--

SELECT pg_catalog.setval('event_id_seq', 1, false);


--
-- TOC entry 164 (class 1259 OID 32017)
-- Dependencies: 6
-- Name: eventnotification; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE eventnotification (
    id integer NOT NULL,
    event_id integer
);


ALTER TABLE public.eventnotification OWNER TO paw;

--
-- TOC entry 166 (class 1259 OID 32027)
-- Dependencies: 6
-- Name: friendrequest; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE friendrequest (
    id integer NOT NULL
);


ALTER TABLE public.friendrequest OWNER TO paw;

--
-- TOC entry 182 (class 1259 OID 32239)
-- Dependencies: 6
-- Name: hibernate_sequences; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE hibernate_sequences (
    sequence_name character varying(255),
    sequence_next_hi_value integer
);


ALTER TABLE public.hibernate_sequences OWNER TO paw;

--
-- TOC entry 167 (class 1259 OID 32032)
-- Dependencies: 6
-- Name: newcommentnotification; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE newcommentnotification (
    id integer NOT NULL,
    publicationowner_id integer
);


ALTER TABLE public.newcommentnotification OWNER TO paw;

--
-- TOC entry 168 (class 1259 OID 32037)
-- Dependencies: 6
-- Name: newcommonfriendnotification; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE newcommonfriendnotification (
    id integer NOT NULL,
    commonfriend_id integer
);


ALTER TABLE public.newcommonfriendnotification OWNER TO paw;

--
-- TOC entry 170 (class 1259 OID 32044)
-- Dependencies: 6
-- Name: notification; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE notification (
    id integer NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    read boolean NOT NULL,
    from_id integer,
    to_id integer
);


ALTER TABLE public.notification OWNER TO paw;

--
-- TOC entry 169 (class 1259 OID 32042)
-- Dependencies: 170 6
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: paw
--

CREATE SEQUENCE notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO paw;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 169
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paw
--

ALTER SEQUENCE notification_id_seq OWNED BY notification.id;


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 169
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paw
--

SELECT pg_catalog.setval('notification_id_seq', 1, false);


--
-- TOC entry 172 (class 1259 OID 32052)
-- Dependencies: 6
-- Name: publicationcomment; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE publicationcomment (
    id integer NOT NULL,
    data character varying(255) NOT NULL,
    date timestamp without time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.publicationcomment OWNER TO paw;

--
-- TOC entry 171 (class 1259 OID 32050)
-- Dependencies: 6 172
-- Name: publicationcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: paw
--

CREATE SEQUENCE publicationcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publicationcomment_id_seq OWNER TO paw;

--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 171
-- Name: publicationcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paw
--

ALTER SEQUENCE publicationcomment_id_seq OWNED BY publicationcomment.id;


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 171
-- Name: publicationcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paw
--

SELECT pg_catalog.setval('publicationcomment_id_seq', 1, false);


--
-- TOC entry 174 (class 1259 OID 32060)
-- Dependencies: 6
-- Name: request; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE request (
    id integer NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    pending boolean NOT NULL,
    read boolean NOT NULL,
    from_id integer,
    to_id integer
);


ALTER TABLE public.request OWNER TO paw;

--
-- TOC entry 173 (class 1259 OID 32058)
-- Dependencies: 6 174
-- Name: request_id_seq; Type: SEQUENCE; Schema: public; Owner: paw
--

CREATE SEQUENCE request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_id_seq OWNER TO paw;

--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 173
-- Name: request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paw
--

ALTER SEQUENCE request_id_seq OWNED BY request.id;


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 173
-- Name: request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paw
--

SELECT pg_catalog.setval('request_id_seq', 1, false);


--
-- TOC entry 175 (class 1259 OID 32066)
-- Dependencies: 6
-- Name: sharedpublication; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE sharedpublication (
    id integer NOT NULL,
    data character varying(255) NOT NULL,
    date timestamp without time zone NOT NULL,
    owner_id integer,
    target_id integer,
    sharedfrom_id integer
);


ALTER TABLE public.sharedpublication OWNER TO paw;

--
-- TOC entry 176 (class 1259 OID 32071)
-- Dependencies: 6
-- Name: simplenotification; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE simplenotification (
    type character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.simplenotification OWNER TO paw;

--
-- TOC entry 177 (class 1259 OID 32076)
-- Dependencies: 6
-- Name: simplepublication; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE simplepublication (
    id integer NOT NULL,
    data character varying(255) NOT NULL,
    date timestamp without time zone NOT NULL,
    owner_id integer,
    target_id integer
);


ALTER TABLE public.simplepublication OWNER TO paw;

--
-- TOC entry 178 (class 1259 OID 32081)
-- Dependencies: 6
-- Name: simplepublication_users; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE simplepublication_users (
    simplepublication_id integer NOT NULL,
    sharedbyuserset_id integer NOT NULL
);


ALTER TABLE public.simplepublication_users OWNER TO paw;

--
-- TOC entry 180 (class 1259 OID 32088)
-- Dependencies: 1967 6
-- Name: users; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    birthdate date NOT NULL,
    daysaheadtoshowbdays integer DEFAULT 5,
    email character varying(255) NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    nickname character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    passwordrecoveryrequestcode character varying(255),
    image bytea
);


ALTER TABLE public.users OWNER TO paw;

--
-- TOC entry 179 (class 1259 OID 32086)
-- Dependencies: 6 180
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: paw
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO paw;

--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 179
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paw
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 179
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paw
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 181 (class 1259 OID 32104)
-- Dependencies: 6
-- Name: users_users; Type: TABLE; Schema: public; Owner: paw; Tablespace: 
--

CREATE TABLE users_users (
    users_id integer NOT NULL,
    friends_id integer NOT NULL
);


ALTER TABLE public.users_users OWNER TO paw;

--
-- TOC entry 1962 (class 2604 OID 32011)
-- Dependencies: 162 163 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: paw
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);


--
-- TOC entry 1963 (class 2604 OID 32047)
-- Dependencies: 170 169 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: paw
--

ALTER TABLE ONLY notification ALTER COLUMN id SET DEFAULT nextval('notification_id_seq'::regclass);


--
-- TOC entry 1964 (class 2604 OID 32055)
-- Dependencies: 172 171 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: paw
--

ALTER TABLE ONLY publicationcomment ALTER COLUMN id SET DEFAULT nextval('publicationcomment_id_seq'::regclass);


--
-- TOC entry 1965 (class 2604 OID 32063)
-- Dependencies: 173 174 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: paw
--

ALTER TABLE ONLY request ALTER COLUMN id SET DEFAULT nextval('request_id_seq'::regclass);


--
-- TOC entry 1966 (class 2604 OID 32091)
-- Dependencies: 179 180 180
-- Name: id; Type: DEFAULT; Schema: public; Owner: paw
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1969 (class 2606 OID 32005)
-- Dependencies: 161 161 2050
-- Name: abstractpublication_publicationcomment_comments_id_key; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY abstractpublication_publicationcomment
    ADD CONSTRAINT abstractpublication_publicationcomment_comments_id_key UNIQUE (comments_id);


--
-- TOC entry 1975 (class 2606 OID 32026)
-- Dependencies: 165 165 165 2050
-- Name: event_guests_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY event_guests
    ADD CONSTRAINT event_guests_pkey PRIMARY KEY (event_id, mapkey_id);


--
-- TOC entry 1971 (class 2606 OID 32016)
-- Dependencies: 163 163 2050
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 1973 (class 2606 OID 32021)
-- Dependencies: 164 164 2050
-- Name: eventnotification_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY eventnotification
    ADD CONSTRAINT eventnotification_pkey PRIMARY KEY (id);


--
-- TOC entry 1977 (class 2606 OID 32031)
-- Dependencies: 166 166 2050
-- Name: friendrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY friendrequest
    ADD CONSTRAINT friendrequest_pkey PRIMARY KEY (id);


--
-- TOC entry 1979 (class 2606 OID 32036)
-- Dependencies: 167 167 2050
-- Name: newcommentnotification_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY newcommentnotification
    ADD CONSTRAINT newcommentnotification_pkey PRIMARY KEY (id);


--
-- TOC entry 1981 (class 2606 OID 32041)
-- Dependencies: 168 168 2050
-- Name: newcommonfriendnotification_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY newcommonfriendnotification
    ADD CONSTRAINT newcommonfriendnotification_pkey PRIMARY KEY (id);


--
-- TOC entry 1983 (class 2606 OID 32049)
-- Dependencies: 170 170 2050
-- Name: notification_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- TOC entry 1985 (class 2606 OID 32057)
-- Dependencies: 172 172 2050
-- Name: publicationcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY publicationcomment
    ADD CONSTRAINT publicationcomment_pkey PRIMARY KEY (id);


--
-- TOC entry 1987 (class 2606 OID 32065)
-- Dependencies: 174 174 2050
-- Name: request_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- TOC entry 1989 (class 2606 OID 32070)
-- Dependencies: 175 175 2050
-- Name: sharedpublication_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY sharedpublication
    ADD CONSTRAINT sharedpublication_pkey PRIMARY KEY (id);


--
-- TOC entry 1991 (class 2606 OID 32075)
-- Dependencies: 176 176 2050
-- Name: simplenotification_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY simplenotification
    ADD CONSTRAINT simplenotification_pkey PRIMARY KEY (id);


--
-- TOC entry 1993 (class 2606 OID 32080)
-- Dependencies: 177 177 2050
-- Name: simplepublication_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY simplepublication
    ADD CONSTRAINT simplepublication_pkey PRIMARY KEY (id);


--
-- TOC entry 1995 (class 2606 OID 32085)
-- Dependencies: 178 178 178 2050
-- Name: simplepublication_users_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY simplepublication_users
    ADD CONSTRAINT simplepublication_users_pkey PRIMARY KEY (simplepublication_id, sharedbyuserset_id);


--
-- TOC entry 1997 (class 2606 OID 32099)
-- Dependencies: 180 180 2050
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 1999 (class 2606 OID 32101)
-- Dependencies: 180 180 2050
-- Name: users_nickname_key; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_nickname_key UNIQUE (nickname);


--
-- TOC entry 2001 (class 2606 OID 32103)
-- Dependencies: 180 180 2050
-- Name: users_passwordrecoveryrequestcode_key; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_passwordrecoveryrequestcode_key UNIQUE (passwordrecoveryrequestcode);


--
-- TOC entry 2003 (class 2606 OID 32097)
-- Dependencies: 180 180 2050
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2005 (class 2606 OID 32108)
-- Dependencies: 181 181 181 2050
-- Name: users_users_pkey; Type: CONSTRAINT; Schema: public; Owner: paw; Tablespace: 
--

ALTER TABLE ONLY users_users
    ADD CONSTRAINT users_users_pkey PRIMARY KEY (users_id, friends_id);


--
-- TOC entry 2018 (class 2606 OID 32169)
-- Dependencies: 180 170 2002 2050
-- Name: fk2d45dd0ba3ee496f; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT fk2d45dd0ba3ee496f FOREIGN KEY (from_id) REFERENCES users(id);


--
-- TOC entry 2017 (class 2606 OID 32164)
-- Dependencies: 180 170 2002 2050
-- Name: fk2d45dd0bcdf194fe; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT fk2d45dd0bcdf194fe FOREIGN KEY (to_id) REFERENCES users(id);


--
-- TOC entry 2010 (class 2606 OID 32129)
-- Dependencies: 165 2002 180 2050
-- Name: fk34892b0025e87af6; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY event_guests
    ADD CONSTRAINT fk34892b0025e87af6 FOREIGN KEY (mapkey_id) REFERENCES users(id);


--
-- TOC entry 2011 (class 2606 OID 32134)
-- Dependencies: 165 163 1970 2050
-- Name: fk34892b0033b99226; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY event_guests
    ADD CONSTRAINT fk34892b0033b99226 FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2015 (class 2606 OID 32154)
-- Dependencies: 176 168 1990 2050
-- Name: fk3ff021946b46d6a7; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY newcommonfriendnotification
    ADD CONSTRAINT fk3ff021946b46d6a7 FOREIGN KEY (id) REFERENCES simplenotification(id);


--
-- TOC entry 2016 (class 2606 OID 32159)
-- Dependencies: 180 168 2002 2050
-- Name: fk3ff021948c13d070; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY newcommonfriendnotification
    ADD CONSTRAINT fk3ff021948c13d070 FOREIGN KEY (commonfriend_id) REFERENCES users(id);


--
-- TOC entry 2007 (class 2606 OID 32114)
-- Dependencies: 163 180 2002 2050
-- Name: fk403827a2a7ca5c6; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk403827a2a7ca5c6 FOREIGN KEY (owner_id) REFERENCES users(id);


--
-- TOC entry 2012 (class 2606 OID 32139)
-- Dependencies: 174 1986 166 2050
-- Name: fk59b21f156cbdaf7; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY friendrequest
    ADD CONSTRAINT fk59b21f156cbdaf7 FOREIGN KEY (id) REFERENCES request(id);


--
-- TOC entry 2027 (class 2606 OID 32214)
-- Dependencies: 2002 177 180 2050
-- Name: fk5f91188a2a7ca5c68addb4fa; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY simplepublication
    ADD CONSTRAINT fk5f91188a2a7ca5c68addb4fa FOREIGN KEY (owner_id) REFERENCES users(id);


--
-- TOC entry 2024 (class 2606 OID 32199)
-- Dependencies: 180 175 2002 2050
-- Name: fk5f91188a2a7ca5c6a9779c67; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY sharedpublication
    ADD CONSTRAINT fk5f91188a2a7ca5c6a9779c67 FOREIGN KEY (owner_id) REFERENCES users(id);


--
-- TOC entry 2026 (class 2606 OID 32209)
-- Dependencies: 177 180 2002 2050
-- Name: fk5f91188a96be52288addb4fa; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY simplepublication
    ADD CONSTRAINT fk5f91188a96be52288addb4fa FOREIGN KEY (target_id) REFERENCES users(id);


--
-- TOC entry 2023 (class 2606 OID 32194)
-- Dependencies: 180 175 2002 2050
-- Name: fk5f91188a96be5228a9779c67; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY sharedpublication
    ADD CONSTRAINT fk5f91188a96be5228a9779c67 FOREIGN KEY (target_id) REFERENCES users(id);


--
-- TOC entry 2028 (class 2606 OID 32224)
-- Dependencies: 178 177 1992 2050
-- Name: fk645f8283486d2c4; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY simplepublication_users
    ADD CONSTRAINT fk645f8283486d2c4 FOREIGN KEY (simplepublication_id) REFERENCES simplepublication(id);


--
-- TOC entry 2029 (class 2606 OID 32219)
-- Dependencies: 2002 178 180 2050
-- Name: fk645f8283845779be; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY simplepublication_users
    ADD CONSTRAINT fk645f8283845779be FOREIGN KEY (sharedbyuserset_id) REFERENCES users(id);


--
-- TOC entry 2009 (class 2606 OID 32124)
-- Dependencies: 1970 163 164 2050
-- Name: fk7887788533b99226; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY eventnotification
    ADD CONSTRAINT fk7887788533b99226 FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2008 (class 2606 OID 32119)
-- Dependencies: 1990 164 176 2050
-- Name: fk788778856b46d6a7; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY eventnotification
    ADD CONSTRAINT fk788778856b46d6a7 FOREIGN KEY (id) REFERENCES simplenotification(id);


--
-- TOC entry 2019 (class 2606 OID 32174)
-- Dependencies: 180 172 2002 2050
-- Name: fk8aa016b32a7ca5c6; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY publicationcomment
    ADD CONSTRAINT fk8aa016b32a7ca5c6 FOREIGN KEY (owner_id) REFERENCES users(id);


--
-- TOC entry 2006 (class 2606 OID 32109)
-- Dependencies: 1984 172 161 2050
-- Name: fk92ffd488a05892ad; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY abstractpublication_publicationcomment
    ADD CONSTRAINT fk92ffd488a05892ad FOREIGN KEY (comments_id) REFERENCES publicationcomment(id);


--
-- TOC entry 2021 (class 2606 OID 32184)
-- Dependencies: 180 174 2002 2050
-- Name: fka4878a6fa3ee496f; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY request
    ADD CONSTRAINT fka4878a6fa3ee496f FOREIGN KEY (from_id) REFERENCES users(id);


--
-- TOC entry 2020 (class 2606 OID 32179)
-- Dependencies: 180 174 2002 2050
-- Name: fka4878a6fcdf194fe; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY request
    ADD CONSTRAINT fka4878a6fcdf194fe FOREIGN KEY (to_id) REFERENCES users(id);


--
-- TOC entry 2022 (class 2606 OID 32189)
-- Dependencies: 177 175 1992 2050
-- Name: fka9779c673e35ba4f; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY sharedpublication
    ADD CONSTRAINT fka9779c673e35ba4f FOREIGN KEY (sharedfrom_id) REFERENCES simplepublication(id) ON DELETE CASCADE;


--
-- TOC entry 2025 (class 2606 OID 32204)
-- Dependencies: 1982 170 176 2050
-- Name: fkbc9acfdde41e9315; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY simplenotification
    ADD CONSTRAINT fkbc9acfdde41e9315 FOREIGN KEY (id) REFERENCES notification(id);


--
-- TOC entry 2014 (class 2606 OID 32149)
-- Dependencies: 1990 167 176 2050
-- Name: fkd51c5b4a6b46d6a7; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY newcommentnotification
    ADD CONSTRAINT fkd51c5b4a6b46d6a7 FOREIGN KEY (id) REFERENCES simplenotification(id);


--
-- TOC entry 2013 (class 2606 OID 32144)
-- Dependencies: 167 180 2002 2050
-- Name: fkd51c5b4ac9395bf2; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY newcommentnotification
    ADD CONSTRAINT fkd51c5b4ac9395bf2 FOREIGN KEY (publicationowner_id) REFERENCES users(id);


--
-- TOC entry 2030 (class 2606 OID 32229)
-- Dependencies: 2002 181 180 2050
-- Name: fkf6f8d9115eb44ba4; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY users_users
    ADD CONSTRAINT fkf6f8d9115eb44ba4 FOREIGN KEY (friends_id) REFERENCES users(id);


--
-- TOC entry 2031 (class 2606 OID 32234)
-- Dependencies: 180 181 2002 2050
-- Name: fkf6f8d911b786ce51; Type: FK CONSTRAINT; Schema: public; Owner: paw
--

ALTER TABLE ONLY users_users
    ADD CONSTRAINT fkf6f8d911b786ce51 FOREIGN KEY (users_id) REFERENCES users(id);


--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO paw;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-10-18 12:56:39 ART

--
-- PostgreSQL database dump complete
--