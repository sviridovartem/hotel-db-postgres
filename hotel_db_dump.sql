--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    booking_id integer,
    customer_id integer,
    coming_date date,
    room_id integer,
    status text,
    paid boolean,
    payment_data_id integer
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    username text,
    first_name text,
    last_name text,
    pass text,
    payment_data_id integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: facility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility (
    facility_name_id integer,
    facility_name text
);


ALTER TABLE public.facility OWNER TO postgres;

--
-- Name: facility_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_list (
    facility_id integer,
    facility_name_id integer
);


ALTER TABLE public.facility_list OWNER TO postgres;

--
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    id_hotel integer NOT NULL,
    hotel_name text
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- Name: payment_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_data (
    payment_data_id integer,
    data integer
);


ALTER TABLE public.payment_data OWNER TO postgres;

--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    hotel_id integer,
    room_type text,
    room_number integer,
    room_floor integer,
    room_id integer,
    facility integer
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_type (
    room_type text,
    number_of_beds integer,
    price integer
);


ALTER TABLE public.room_type OWNER TO postgres;

--
-- Name: customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (booking_id, customer_id, coming_date, room_id, status, paid, payment_data_id) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, username, first_name, last_name, pass, payment_data_id) FROM stdin;
1	bla	Bla	Bla	81818181	1
\.


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, true);


--
-- Data for Name: facility; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility (facility_name_id, facility_name) FROM stdin;
1	true
2	none
\.


--
-- Data for Name: facility_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility_list (facility_id, facility_name_id) FROM stdin;
\.


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel (id_hotel, hotel_name) FROM stdin;
1	Spa resort1
2	Spa resort2
3	Spa resort3
4	Spa resort4
5	Spa resort5
6	Spa resort6
\.


--
-- Data for Name: payment_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_data (payment_data_id, data) FROM stdin;
1	\N
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (hotel_id, room_type, room_number, room_floor, room_id, facility) FROM stdin;
1	normal	1	1	1	\N
2	extra	2	2	2	\N
3	super extra	3	3	3	\N
\.


--
-- Data for Name: room_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_type (room_type, number_of_beds, price) FROM stdin;
normal	2	2000
super extra	1	1000
extra	3	3000
\.


--
-- Name: booking_booking_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX booking_booking_id_uindex ON public.booking USING btree (booking_id);


--
-- Name: booking_payment_data_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX booking_payment_data_id_uindex ON public.booking USING btree (payment_data_id);


--
-- Name: customer_customer_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX customer_customer_id_uindex ON public.customer USING btree (customer_id);


--
-- Name: customer_payment_data_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX customer_payment_data_id_uindex ON public.customer USING btree (payment_data_id);


--
-- Name: facility_facility_name_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX facility_facility_name_id_uindex ON public.facility USING btree (facility_name_id);


--
-- Name: facility_list_facility_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX facility_list_facility_id_uindex ON public.facility_list USING btree (facility_id);


--
-- Name: hotel_id_hotel_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX hotel_id_hotel_uindex ON public.hotel USING btree (id_hotel);


--
-- Name: payment_data_payment_data_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX payment_data_payment_data_id_uindex ON public.payment_data USING btree (payment_data_id);


--
-- Name: room_facility_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX room_facility_uindex ON public.room USING btree (facility);


--
-- Name: room_room_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX room_room_id_uindex ON public.room USING btree (room_id);


--
-- Name: room_type_room_type_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX room_type_room_type_uindex ON public.room_type USING btree (room_type);


--
-- Name: booking_customer_customer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: booking_payment_data_payment_data_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_payment_data_payment_data_id_fk FOREIGN KEY (payment_data_id) REFERENCES public.payment_data(payment_data_id);


--
-- Name: booking_room_room_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_room_room_id_fk FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- Name: facility_list_facility_facility_name_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_list
    ADD CONSTRAINT facility_list_facility_facility_name_id_fk FOREIGN KEY (facility_name_id) REFERENCES public.facility(facility_name_id);


--
-- Name: facility_list_room_facility_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_list
    ADD CONSTRAINT facility_list_room_facility_fk FOREIGN KEY (facility_id) REFERENCES public.room(facility);


--
-- Name: room_hotel_id_hotel_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_hotel_id_hotel_fk FOREIGN KEY (hotel_id) REFERENCES public.hotel(id_hotel);


--
-- Name: room_room_type_room_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_type_room_type_fk FOREIGN KEY (room_type) REFERENCES public.room_type(room_type);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

