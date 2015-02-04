--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
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


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: batch_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE batch_history (
    id integer NOT NULL,
    batch_name character varying(64) DEFAULT NULL::character varying,
    batch_description character varying(256) DEFAULT NULL::character varying,
    hotspot_id integer,
    batch_status character varying(128) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.batch_history OWNER TO postgres;

--
-- Name: batch_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE batch_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batch_history_id_seq OWNER TO postgres;

--
-- Name: batch_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE batch_history_id_seq OWNED BY batch_history.id;


--
-- Name: billing_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billing_history (
    id integer NOT NULL,
    username character varying(128) DEFAULT NULL::character varying,
    planid integer,
    billamount character varying(200) DEFAULT NULL::character varying,
    billaction character varying(128) NOT NULL,
    billperformer character varying(200) DEFAULT NULL::character varying,
    billreason character varying(200) DEFAULT NULL::character varying,
    paymentmethod character varying(200) DEFAULT NULL::character varying,
    cash character varying(200) DEFAULT NULL::character varying,
    creditcardname character varying(200) DEFAULT NULL::character varying,
    creditcardnumber character varying(200) DEFAULT NULL::character varying,
    creditcardverification character varying(200) DEFAULT NULL::character varying,
    creditcardtype character varying(200) DEFAULT NULL::character varying,
    creditcardexp character varying(200) DEFAULT NULL::character varying,
    coupon character varying(200) DEFAULT NULL::character varying,
    discount character varying(200) DEFAULT NULL::character varying,
    notes character varying(200) DEFAULT NULL::character varying,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.billing_history OWNER TO postgres;

--
-- Name: billing_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_history_id_seq OWNER TO postgres;

--
-- Name: billing_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_history_id_seq OWNED BY billing_history.id;


--
-- Name: billing_merchant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billing_merchant (
    id integer NOT NULL,
    username character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    mac character varying(200) NOT NULL,
    pin character varying(200) NOT NULL,
    txnid character varying(200) NOT NULL,
    planname character varying(128) NOT NULL,
    planid integer NOT NULL,
    quantity character varying(200) NOT NULL,
    business_email character varying(200) NOT NULL,
    business_id character varying(200) NOT NULL,
    txn_type character varying(200) NOT NULL,
    txn_id character varying(200) NOT NULL,
    payment_type character varying(200) NOT NULL,
    payment_tax character varying(200) NOT NULL,
    payment_cost character varying(200) NOT NULL,
    payment_fee character varying(200) NOT NULL,
    payment_total character varying(200) NOT NULL,
    payment_currency character varying(200) NOT NULL,
    first_name character varying(200) NOT NULL,
    last_name character varying(200) NOT NULL,
    payer_email character varying(200) NOT NULL,
    payer_address_name character varying(200) NOT NULL,
    payer_address_street character varying(200) NOT NULL,
    payer_address_country character varying(200) NOT NULL,
    payer_address_country_code character varying(200) NOT NULL,
    payer_address_city character varying(200) NOT NULL,
    payer_address_state character varying(200) NOT NULL,
    payer_address_zip character varying(200) NOT NULL,
    payment_date timestamp(0) without time zone NOT NULL,
    payment_status character varying(200) NOT NULL,
    pending_reason character varying(200) NOT NULL,
    reason_code character varying(200) NOT NULL,
    receipt_id character varying(200) NOT NULL,
    payment_address_status character varying(200) NOT NULL,
    vendor_type character varying(200) NOT NULL,
    payer_status character varying(200) NOT NULL
);


ALTER TABLE public.billing_merchant OWNER TO postgres;

--
-- Name: billing_merchant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_merchant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_merchant_id_seq OWNER TO postgres;

--
-- Name: billing_merchant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_merchant_id_seq OWNED BY billing_merchant.id;


--
-- Name: billing_paypal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billing_paypal (
    id integer NOT NULL,
    username character varying(128) DEFAULT NULL::character varying,
    password character varying(128) DEFAULT NULL::character varying,
    mac character varying(200) DEFAULT NULL::character varying,
    pin character varying(200) DEFAULT NULL::character varying,
    txnid character varying(200) DEFAULT NULL::character varying,
    planname character varying(128) DEFAULT NULL::character varying,
    planid character varying(200) DEFAULT NULL::character varying,
    quantity character varying(200) DEFAULT NULL::character varying,
    receiver_email character varying(200) DEFAULT NULL::character varying,
    business character varying(200) DEFAULT NULL::character varying,
    tax character varying(200) DEFAULT NULL::character varying,
    mc_gross character varying(200) DEFAULT NULL::character varying,
    mc_fee character varying(200) DEFAULT NULL::character varying,
    mc_currency character varying(200) DEFAULT NULL::character varying,
    first_name character varying(200) DEFAULT NULL::character varying,
    last_name character varying(200) DEFAULT NULL::character varying,
    payer_email character varying(200) DEFAULT NULL::character varying,
    address_name character varying(200) DEFAULT NULL::character varying,
    address_street character varying(200) DEFAULT NULL::character varying,
    address_country character varying(200) DEFAULT NULL::character varying,
    address_country_code character varying(200) DEFAULT NULL::character varying,
    address_city character varying(200) DEFAULT NULL::character varying,
    address_state character varying(200) DEFAULT NULL::character varying,
    address_zip character varying(200) DEFAULT NULL::character varying,
    payment_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    payment_status character varying(200) DEFAULT NULL::character varying,
    payment_address_status character varying(200) DEFAULT NULL::character varying,
    payer_status character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.billing_paypal OWNER TO postgres;

--
-- Name: billing_paypal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_paypal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_paypal_id_seq OWNER TO postgres;

--
-- Name: billing_paypal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_paypal_id_seq OWNED BY billing_paypal.id;


--
-- Name: billing_plans; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billing_plans (
    id integer NOT NULL,
    planname character varying(128) DEFAULT NULL::character varying,
    planid character varying(128) DEFAULT NULL::character varying,
    plantype character varying(128) DEFAULT NULL::character varying,
    plantimebank character varying(128) DEFAULT NULL::character varying,
    plantimetype character varying(128) DEFAULT NULL::character varying,
    plantimerefillcost character varying(128) DEFAULT NULL::character varying,
    planbandwidthup character varying(128) DEFAULT NULL::character varying,
    planbandwidthdown character varying(128) DEFAULT NULL::character varying,
    plantraffictotal character varying(128) DEFAULT NULL::character varying,
    plantrafficup character varying(128) DEFAULT NULL::character varying,
    plantrafficdown character varying(128) DEFAULT NULL::character varying,
    plantrafficrefillcost character varying(128) DEFAULT NULL::character varying,
    planrecurring character varying(128) DEFAULT NULL::character varying,
    planrecurringperiod character varying(128) DEFAULT NULL::character varying,
    planrecurringbillingschedule character varying(128) NOT NULL,
    plancost character varying(128) DEFAULT NULL::character varying,
    plansetupcost character varying(128) DEFAULT NULL::character varying,
    plantax character varying(128) DEFAULT NULL::character varying,
    plancurrency character varying(128) DEFAULT NULL::character varying,
    plangroup character varying(128) DEFAULT NULL::character varying,
    planactive character varying(32) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.billing_plans OWNER TO postgres;

--
-- Name: billing_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_plans_id_seq OWNER TO postgres;

--
-- Name: billing_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_plans_id_seq OWNED BY billing_plans.id;


--
-- Name: billing_plans_profiles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billing_plans_profiles (
    id integer NOT NULL,
    plan_name character varying(128) NOT NULL,
    profile_name character varying(256) DEFAULT NULL::character varying
);


ALTER TABLE public.billing_plans_profiles OWNER TO postgres;

--
-- Name: billing_plans_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_plans_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_plans_profiles_id_seq OWNER TO postgres;

--
-- Name: billing_plans_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_plans_profiles_id_seq OWNED BY billing_plans_profiles.id;


--
-- Name: billing_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billing_rates (
    id integer NOT NULL,
    ratename character varying(128) NOT NULL,
    ratetype character varying(128) NOT NULL,
    ratecost integer NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.billing_rates OWNER TO postgres;

--
-- Name: billing_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_rates_id_seq OWNER TO postgres;

--
-- Name: billing_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_rates_id_seq OWNED BY billing_rates.id;


--
-- Name: cui; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cui (
    username character varying(64) NOT NULL,
    clientipaddress character varying(15) NOT NULL,
    callingstationid character varying(50) NOT NULL,
    cui character varying(32) NOT NULL,
    creationdate timestamp(0) without time zone NOT NULL,
    lastaccounting timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.cui OWNER TO postgres;

--
-- Name: dictionary; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dictionary (
    id integer NOT NULL,
    type character varying(30) DEFAULT NULL::character varying,
    attribute character varying(64) DEFAULT NULL::character varying,
    value character varying(64) DEFAULT NULL::character varying,
    format character varying(20) DEFAULT NULL::character varying,
    vendor character varying(32) DEFAULT NULL::character varying,
    recommendedop character varying(32) DEFAULT NULL::character varying,
    recommendedtable character varying(32) DEFAULT NULL::character varying,
    recommendedhelper character varying(32) DEFAULT NULL::character varying,
    recommendedtooltip character varying(512) DEFAULT NULL::character varying
);


ALTER TABLE public.dictionary OWNER TO postgres;

--
-- Name: dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dictionary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dictionary_id_seq OWNER TO postgres;

--
-- Name: dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dictionary_id_seq OWNED BY dictionary.id;


--
-- Name: hotspots; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hotspots (
    id bigint NOT NULL,
    name character varying(200) DEFAULT NULL::character varying,
    mac character varying(200) DEFAULT NULL::character varying,
    geocode character varying(200) DEFAULT NULL::character varying,
    owner character varying(200) DEFAULT NULL::character varying,
    email_owner character varying(200) DEFAULT NULL::character varying,
    manager character varying(200) DEFAULT NULL::character varying,
    email_manager character varying(200) DEFAULT NULL::character varying,
    address character varying(200) DEFAULT NULL::character varying,
    company character varying(200) DEFAULT NULL::character varying,
    phone1 character varying(200) DEFAULT NULL::character varying,
    phone2 character varying(200) DEFAULT NULL::character varying,
    type character varying(200) DEFAULT NULL::character varying,
    companywebsite character varying(200) DEFAULT NULL::character varying,
    companyemail character varying(200) DEFAULT NULL::character varying,
    companycontact character varying(200) DEFAULT NULL::character varying,
    companyphone character varying(200) DEFAULT NULL::character varying,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.hotspots OWNER TO postgres;

--
-- Name: hotspots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hotspots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotspots_id_seq OWNER TO postgres;

--
-- Name: hotspots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hotspots_id_seq OWNED BY hotspots.id;


--
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invoice (
    id integer NOT NULL,
    user_id integer,
    batch_id integer,
    date timestamp(0) without time zone NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    notes character varying(128) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_id_seq OWNER TO postgres;

--
-- Name: invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE invoice_id_seq OWNED BY invoice.id;


--
-- Name: invoice_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invoice_items (
    id integer NOT NULL,
    invoice_id integer NOT NULL,
    plan_id integer,
    amount numeric(10,2) NOT NULL,
    tax_amount numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    notes character varying(128) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.invoice_items OWNER TO postgres;

--
-- Name: invoice_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoice_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_items_id_seq OWNER TO postgres;

--
-- Name: invoice_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE invoice_items_id_seq OWNED BY invoice_items.id;


--
-- Name: invoice_status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invoice_status (
    id integer NOT NULL,
    value character varying(32) NOT NULL,
    notes character varying(128) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.invoice_status OWNER TO postgres;

--
-- Name: invoice_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoice_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_status_id_seq OWNER TO postgres;

--
-- Name: invoice_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE invoice_status_id_seq OWNED BY invoice_status.id;


--
-- Name: invoice_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invoice_type (
    id integer NOT NULL,
    value character varying(32) NOT NULL,
    notes character varying(128) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.invoice_type OWNER TO postgres;

--
-- Name: invoice_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoice_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_type_id_seq OWNER TO postgres;

--
-- Name: invoice_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE invoice_type_id_seq OWNED BY invoice_type.id;


--
-- Name: nas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nas (
    id integer NOT NULL,
    nasname character varying(128) NOT NULL,
    shortname character varying(32) DEFAULT NULL::character varying,
    type character varying(30) DEFAULT NULL::character varying,
    ports integer,
    secret character varying(60) NOT NULL,
    server character varying(64) DEFAULT NULL::character varying,
    community character varying(50) DEFAULT NULL::character varying,
    description character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.nas OWNER TO postgres;

--
-- Name: nas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nas_id_seq OWNER TO postgres;

--
-- Name: nas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nas_id_seq OWNED BY nas.id;


--
-- Name: node; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE node (
    id integer NOT NULL,
    "time" timestamp(0) without time zone NOT NULL,
    netid integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    latitude character varying(20) NOT NULL,
    longitude character varying(20) NOT NULL,
    owner_name character varying(50) NOT NULL,
    owner_email character varying(50) NOT NULL,
    owner_phone character varying(25) NOT NULL,
    owner_address character varying(100) NOT NULL,
    approval_status character varying(1) NOT NULL,
    ip character varying(20) NOT NULL,
    mac character varying(20) NOT NULL,
    uptime character varying(100) NOT NULL,
    robin character varying(20) NOT NULL,
    batman character varying(20) NOT NULL,
    memfree character varying(20) NOT NULL,
    nbs text NOT NULL,
    gateway character varying(20) NOT NULL,
    gw_qual character varying(20) NOT NULL,
    routes text NOT NULL,
    users character varying(3) NOT NULL,
    kbdown character varying(20) NOT NULL,
    kbup character varying(20) NOT NULL,
    hops character varying(3) NOT NULL,
    rank character varying(3) NOT NULL,
    ssid character varying(20) NOT NULL,
    pssid character varying(20) NOT NULL,
    gateway_bit boolean NOT NULL,
    memlow character varying(20) NOT NULL,
    usershi character varying(3) NOT NULL,
    cpu double precision NOT NULL,
    wan_iface character varying(128) DEFAULT NULL::character varying,
    wan_ip character varying(128) DEFAULT NULL::character varying,
    wan_mac character varying(128) DEFAULT NULL::character varying,
    wan_gateway character varying(128) DEFAULT NULL::character varying,
    wifi_iface character varying(128) DEFAULT NULL::character varying,
    wifi_ip character varying(128) DEFAULT NULL::character varying,
    wifi_mac character varying(128) DEFAULT NULL::character varying,
    wifi_ssid character varying(128) DEFAULT NULL::character varying,
    wifi_key character varying(128) DEFAULT NULL::character varying,
    wifi_channel character varying(128) DEFAULT NULL::character varying,
    lan_iface character varying(128) DEFAULT NULL::character varying,
    lan_mac character varying(128) DEFAULT NULL::character varying,
    lan_ip character varying(128) DEFAULT NULL::character varying,
    wan_bup character varying(128) DEFAULT NULL::character varying,
    wan_bdown character varying(128) DEFAULT NULL::character varying,
    firmware character varying(128) DEFAULT NULL::character varying,
    firmware_revision character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.node OWNER TO postgres;

--
-- Name: node_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_id_seq OWNER TO postgres;

--
-- Name: node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE node_id_seq OWNED BY node.id;


--
-- Name: operators; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operators (
    id integer NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(32) NOT NULL,
    firstname character varying(32) NOT NULL,
    lastname character varying(32) NOT NULL,
    title character varying(32) NOT NULL,
    department character varying(32) NOT NULL,
    company character varying(32) NOT NULL,
    phone1 character varying(32) NOT NULL,
    phone2 character varying(32) NOT NULL,
    email1 character varying(32) NOT NULL,
    email2 character varying(32) NOT NULL,
    messenger1 character varying(32) NOT NULL,
    messenger2 character varying(32) NOT NULL,
    notes character varying(128) NOT NULL,
    lastlogin timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.operators OWNER TO postgres;

--
-- Name: operators_acl; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operators_acl (
    id integer NOT NULL,
    operator_id integer NOT NULL,
    file character varying(128) NOT NULL,
    access boolean NOT NULL
);


ALTER TABLE public.operators_acl OWNER TO postgres;

--
-- Name: operators_acl_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operators_acl_files (
    id integer NOT NULL,
    file character varying(128) NOT NULL,
    category character varying(128) NOT NULL,
    section character varying(128) NOT NULL
);


ALTER TABLE public.operators_acl_files OWNER TO postgres;

--
-- Name: operators_acl_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE operators_acl_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operators_acl_files_id_seq OWNER TO postgres;

--
-- Name: operators_acl_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE operators_acl_files_id_seq OWNED BY operators_acl_files.id;


--
-- Name: operators_acl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE operators_acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operators_acl_id_seq OWNER TO postgres;

--
-- Name: operators_acl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE operators_acl_id_seq OWNED BY operators_acl.id;


--
-- Name: operators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE operators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operators_id_seq OWNER TO postgres;

--
-- Name: operators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE operators_id_seq OWNED BY operators.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payment (
    id integer NOT NULL,
    invoice_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    type_id integer NOT NULL,
    notes character varying(128) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_id_seq OWNED BY payment.id;


--
-- Name: payment_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payment_type (
    id integer NOT NULL,
    value character varying(32) NOT NULL,
    notes character varying(128) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.payment_type OWNER TO postgres;

--
-- Name: payment_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_type_id_seq OWNER TO postgres;

--
-- Name: payment_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_type_id_seq OWNED BY payment_type.id;


--
-- Name: proxys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proxys (
    id bigint NOT NULL,
    proxyname character varying(128) DEFAULT NULL::character varying,
    retry_delay integer,
    retry_count integer,
    dead_time integer,
    default_fallback integer,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.proxys OWNER TO postgres;

--
-- Name: proxys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proxys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proxys_id_seq OWNER TO postgres;

--
-- Name: proxys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proxys_id_seq OWNED BY proxys.id;


--
-- Name: radacct; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE radacct (
    radacctid bigint NOT NULL,
    acctsessionid character varying(64) NOT NULL,
    acctuniqueid character varying(32) NOT NULL,
    username character varying(64) NOT NULL,
    groupname character varying(64),
    realm character varying(64) DEFAULT NULL::character varying,
    nasipaddress character varying(15) NOT NULL,
    nasportid character varying(15) DEFAULT NULL::character varying,
    nasporttype character varying(32) DEFAULT NULL::character varying,
    acctstarttime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    acctstoptime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    acctsessiontime integer,
    acctauthentic character varying(32) DEFAULT NULL::character varying,
    connectinfo_start character varying(50) DEFAULT NULL::character varying,
    connectinfo_stop character varying(50) DEFAULT NULL::character varying,
    acctinputoctets bigint,
    acctoutputoctets bigint,
    calledstationid character varying(50) NOT NULL,
    callingstationid character varying(50) NOT NULL,
    acctterminatecause character varying(32),
    servicetype character varying(32) DEFAULT NULL::character varying,
    framedprotocol character varying(32) DEFAULT NULL::character varying,
    framedipaddress character varying(15),
    acctstartdelay integer,
    acctstopdelay integer,
    xascendsessionsvrkey character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public.radacct OWNER TO postgres;

--
-- Name: radacct_radacctid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE radacct_radacctid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radacct_radacctid_seq OWNER TO postgres;

--
-- Name: radacct_radacctid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE radacct_radacctid_seq OWNED BY radacct.radacctid;


--
-- Name: radcheck; Type: TABLE; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE TABLE radcheck (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    attribute character varying(64) NOT NULL,
    op character varying(2) NOT NULL,
    value character varying(253) NOT NULL
);


ALTER TABLE public.radcheck OWNER TO adsficom_symuser;

--
-- Name: radcheck_id_seq; Type: SEQUENCE; Schema: public; Owner: adsficom_symuser
--

CREATE SEQUENCE radcheck_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radcheck_id_seq OWNER TO adsficom_symuser;

--
-- Name: radcheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adsficom_symuser
--

ALTER SEQUENCE radcheck_id_seq OWNED BY radcheck.id;


--
-- Name: radgroupcheck; Type: TABLE; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE TABLE radgroupcheck (
    id integer NOT NULL,
    groupname character varying(64) NOT NULL,
    attribute character varying(64) NOT NULL,
    op character varying(2) NOT NULL,
    value character varying(253) NOT NULL
);


ALTER TABLE public.radgroupcheck OWNER TO adsficom_symuser;

--
-- Name: radgroupcheck_id_seq; Type: SEQUENCE; Schema: public; Owner: adsficom_symuser
--

CREATE SEQUENCE radgroupcheck_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radgroupcheck_id_seq OWNER TO adsficom_symuser;

--
-- Name: radgroupcheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adsficom_symuser
--

ALTER SEQUENCE radgroupcheck_id_seq OWNED BY radgroupcheck.id;


--
-- Name: radgroupreply; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE radgroupreply (
    id integer NOT NULL,
    groupname character varying(64) NOT NULL,
    attribute character varying(64) NOT NULL,
    op character varying(2) NOT NULL,
    value character varying(253) NOT NULL
);


ALTER TABLE public.radgroupreply OWNER TO postgres;

--
-- Name: radgroupreply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE radgroupreply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radgroupreply_id_seq OWNER TO postgres;

--
-- Name: radgroupreply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE radgroupreply_id_seq OWNED BY radgroupreply.id;


--
-- Name: radhuntgroup; Type: TABLE; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE TABLE radhuntgroup (
    id integer NOT NULL,
    groupname character varying(64) NOT NULL,
    nasmacaddress character varying(32) NOT NULL,
    nasipaddress character varying(15),
    nasportid character varying(15) DEFAULT NULL::character varying
);


ALTER TABLE public.radhuntgroup OWNER TO adsficom_symuser;

--
-- Name: radhuntgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: adsficom_symuser
--

CREATE SEQUENCE radhuntgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radhuntgroup_id_seq OWNER TO adsficom_symuser;

--
-- Name: radhuntgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adsficom_symuser
--

ALTER SEQUENCE radhuntgroup_id_seq OWNED BY radhuntgroup.id;


--
-- Name: radippool; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE radippool (
    id integer NOT NULL,
    pool_name character varying(30) NOT NULL,
    framedipaddress character varying(15) NOT NULL,
    nasipaddress character varying(15) NOT NULL,
    calledstationid character varying(30) NOT NULL,
    callingstationid character varying(30) NOT NULL,
    expiry_time timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    username character varying(64) NOT NULL,
    pool_key character varying(30) NOT NULL
);


ALTER TABLE public.radippool OWNER TO postgres;

--
-- Name: radippool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE radippool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radippool_id_seq OWNER TO postgres;

--
-- Name: radippool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE radippool_id_seq OWNED BY radippool.id;


--
-- Name: radpostauth; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE radpostauth (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    pass character varying(64) NOT NULL,
    reply character varying(32) NOT NULL,
    authdate timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.radpostauth OWNER TO postgres;

--
-- Name: radpostauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE radpostauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radpostauth_id_seq OWNER TO postgres;

--
-- Name: radpostauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE radpostauth_id_seq OWNED BY radpostauth.id;


--
-- Name: radreply; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE radreply (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    attribute character varying(64) NOT NULL,
    op character varying(2) NOT NULL,
    value character varying(253) NOT NULL
);


ALTER TABLE public.radreply OWNER TO postgres;

--
-- Name: radreply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE radreply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radreply_id_seq OWNER TO postgres;

--
-- Name: radreply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE radreply_id_seq OWNED BY radreply.id;


--
-- Name: radusergroup; Type: TABLE; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE TABLE radusergroup (
    id bigint NOT NULL,
    username character varying(64) NOT NULL,
    groupname character varying(64) NOT NULL,
    priority integer NOT NULL
);


ALTER TABLE public.radusergroup OWNER TO adsficom_symuser;

--
-- Name: radusergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: adsficom_symuser
--

CREATE SEQUENCE radusergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radusergroup_id_seq OWNER TO adsficom_symuser;

--
-- Name: radusergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adsficom_symuser
--

ALTER SEQUENCE radusergroup_id_seq OWNED BY radusergroup.id;


--
-- Name: realms; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE realms (
    id bigint NOT NULL,
    realmname character varying(128) DEFAULT NULL::character varying,
    type character varying(32) DEFAULT NULL::character varying,
    authhost character varying(256) DEFAULT NULL::character varying,
    accthost character varying(256) DEFAULT NULL::character varying,
    secret character varying(128) DEFAULT NULL::character varying,
    ldflag character varying(64) DEFAULT NULL::character varying,
    nostrip integer,
    hints integer,
    notrealm integer,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.realms OWNER TO postgres;

--
-- Name: realms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE realms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.realms_id_seq OWNER TO postgres;

--
-- Name: realms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE realms_id_seq OWNED BY realms.id;


--
-- Name: userbillinfo; Type: TABLE; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE TABLE userbillinfo (
    id integer NOT NULL,
    username character varying(128) DEFAULT NULL::character varying,
    planname character varying(128) DEFAULT NULL::character varying,
    hotspot_id integer,
    hotspotlocation character varying(32) DEFAULT NULL::character varying,
    contactperson character varying(200) DEFAULT NULL::character varying,
    company character varying(200) DEFAULT NULL::character varying,
    email character varying(200) DEFAULT NULL::character varying,
    phone character varying(200) DEFAULT NULL::character varying,
    address character varying(200) DEFAULT NULL::character varying,
    city character varying(200) DEFAULT NULL::character varying,
    state character varying(200) DEFAULT NULL::character varying,
    country character varying(100) DEFAULT NULL::character varying,
    zip character varying(200) DEFAULT NULL::character varying,
    paymentmethod character varying(200) DEFAULT NULL::character varying,
    cash character varying(200) DEFAULT NULL::character varying,
    creditcardname character varying(200) DEFAULT NULL::character varying,
    creditcardnumber character varying(200) DEFAULT NULL::character varying,
    creditcardverification character varying(200) DEFAULT NULL::character varying,
    creditcardtype character varying(200) DEFAULT NULL::character varying,
    creditcardexp character varying(200) DEFAULT NULL::character varying,
    notes character varying(200) DEFAULT NULL::character varying,
    changeuserbillinfo character varying(128) DEFAULT NULL::character varying,
    lead character varying(200) DEFAULT NULL::character varying,
    coupon character varying(200) DEFAULT NULL::character varying,
    ordertaker character varying(200) DEFAULT NULL::character varying,
    billstatus character varying(200) DEFAULT NULL::character varying,
    lastbill date NOT NULL,
    nextbill date NOT NULL,
    nextinvoicedue integer,
    billdue integer,
    postalinvoice character varying(8) DEFAULT NULL::character varying,
    faxinvoice character varying(8) DEFAULT NULL::character varying,
    emailinvoice character varying(8) DEFAULT NULL::character varying,
    batch_id integer,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.userbillinfo OWNER TO adsficom_symuser;

--
-- Name: userbillinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: adsficom_symuser
--

CREATE SEQUENCE userbillinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userbillinfo_id_seq OWNER TO adsficom_symuser;

--
-- Name: userbillinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adsficom_symuser
--

ALTER SEQUENCE userbillinfo_id_seq OWNED BY userbillinfo.id;


--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE TABLE userinfo (
    id integer NOT NULL,
    username character varying(128) DEFAULT NULL::character varying,
    firstname character varying(200) DEFAULT NULL::character varying,
    lastname character varying(200) DEFAULT NULL::character varying,
    email character varying(200) DEFAULT NULL::character varying,
    department character varying(200) DEFAULT NULL::character varying,
    company character varying(200) DEFAULT NULL::character varying,
    workphone character varying(200) DEFAULT NULL::character varying,
    homephone character varying(200) DEFAULT NULL::character varying,
    mobilephone character varying(200) DEFAULT NULL::character varying,
    address character varying(200) DEFAULT NULL::character varying,
    city character varying(200) DEFAULT NULL::character varying,
    state character varying(200) DEFAULT NULL::character varying,
    country character varying(100) DEFAULT NULL::character varying,
    zip character varying(200) DEFAULT NULL::character varying,
    notes character varying(200) DEFAULT NULL::character varying,
    changeuserinfo character varying(128) DEFAULT NULL::character varying,
    portalloginpassword character varying(128) DEFAULT NULL::character varying,
    enableportallogin integer,
    creationdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creationby character varying(128) DEFAULT NULL::character varying,
    updatedate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updateby character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.userinfo OWNER TO adsficom_symuser;

--
-- Name: userinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: adsficom_symuser
--

CREATE SEQUENCE userinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userinfo_id_seq OWNER TO adsficom_symuser;

--
-- Name: userinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adsficom_symuser
--

ALTER SEQUENCE userinfo_id_seq OWNED BY userinfo.id;


--
-- Name: wimax; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wimax (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    authdate timestamp(0) without time zone NOT NULL,
    spi character varying(16) NOT NULL,
    mipkey character varying(400) NOT NULL,
    lifetime integer
);


ALTER TABLE public.wimax OWNER TO postgres;

--
-- Name: wimax_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wimax_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wimax_id_seq OWNER TO postgres;

--
-- Name: wimax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wimax_id_seq OWNED BY wimax.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY batch_history ALTER COLUMN id SET DEFAULT nextval('batch_history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_history ALTER COLUMN id SET DEFAULT nextval('billing_history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_merchant ALTER COLUMN id SET DEFAULT nextval('billing_merchant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_paypal ALTER COLUMN id SET DEFAULT nextval('billing_paypal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_plans ALTER COLUMN id SET DEFAULT nextval('billing_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_plans_profiles ALTER COLUMN id SET DEFAULT nextval('billing_plans_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_rates ALTER COLUMN id SET DEFAULT nextval('billing_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dictionary ALTER COLUMN id SET DEFAULT nextval('dictionary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hotspots ALTER COLUMN id SET DEFAULT nextval('hotspots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invoice ALTER COLUMN id SET DEFAULT nextval('invoice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invoice_items ALTER COLUMN id SET DEFAULT nextval('invoice_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invoice_status ALTER COLUMN id SET DEFAULT nextval('invoice_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invoice_type ALTER COLUMN id SET DEFAULT nextval('invoice_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nas ALTER COLUMN id SET DEFAULT nextval('nas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY node ALTER COLUMN id SET DEFAULT nextval('node_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operators ALTER COLUMN id SET DEFAULT nextval('operators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operators_acl ALTER COLUMN id SET DEFAULT nextval('operators_acl_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operators_acl_files ALTER COLUMN id SET DEFAULT nextval('operators_acl_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment ALTER COLUMN id SET DEFAULT nextval('payment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_type ALTER COLUMN id SET DEFAULT nextval('payment_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proxys ALTER COLUMN id SET DEFAULT nextval('proxys_id_seq'::regclass);


--
-- Name: radacctid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY radacct ALTER COLUMN radacctid SET DEFAULT nextval('radacct_radacctid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: adsficom_symuser
--

ALTER TABLE ONLY radcheck ALTER COLUMN id SET DEFAULT nextval('radcheck_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: adsficom_symuser
--

ALTER TABLE ONLY radgroupcheck ALTER COLUMN id SET DEFAULT nextval('radgroupcheck_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY radgroupreply ALTER COLUMN id SET DEFAULT nextval('radgroupreply_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: adsficom_symuser
--

ALTER TABLE ONLY radhuntgroup ALTER COLUMN id SET DEFAULT nextval('radhuntgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY radippool ALTER COLUMN id SET DEFAULT nextval('radippool_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY radpostauth ALTER COLUMN id SET DEFAULT nextval('radpostauth_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY radreply ALTER COLUMN id SET DEFAULT nextval('radreply_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: adsficom_symuser
--

ALTER TABLE ONLY radusergroup ALTER COLUMN id SET DEFAULT nextval('radusergroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY realms ALTER COLUMN id SET DEFAULT nextval('realms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: adsficom_symuser
--

ALTER TABLE ONLY userbillinfo ALTER COLUMN id SET DEFAULT nextval('userbillinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: adsficom_symuser
--

ALTER TABLE ONLY userinfo ALTER COLUMN id SET DEFAULT nextval('userinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wimax ALTER COLUMN id SET DEFAULT nextval('wimax_id_seq'::regclass);


--
-- Data for Name: batch_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY batch_history (id, batch_name, batch_description, hotspot_id, batch_status, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: batch_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('batch_history_id_seq', 1, false);


--
-- Data for Name: billing_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_history (id, username, planid, billamount, billaction, billperformer, billreason, paymentmethod, cash, creditcardname, creditcardnumber, creditcardverification, creditcardtype, creditcardexp, coupon, discount, notes, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: billing_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_history_id_seq', 1, false);


--
-- Data for Name: billing_merchant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_merchant (id, username, password, mac, pin, txnid, planname, planid, quantity, business_email, business_id, txn_type, txn_id, payment_type, payment_tax, payment_cost, payment_fee, payment_total, payment_currency, first_name, last_name, payer_email, payer_address_name, payer_address_street, payer_address_country, payer_address_country_code, payer_address_city, payer_address_state, payer_address_zip, payment_date, payment_status, pending_reason, reason_code, receipt_id, payment_address_status, vendor_type, payer_status) FROM stdin;
\.


--
-- Name: billing_merchant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_merchant_id_seq', 1, false);


--
-- Data for Name: billing_paypal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_paypal (id, username, password, mac, pin, txnid, planname, planid, quantity, receiver_email, business, tax, mc_gross, mc_fee, mc_currency, first_name, last_name, payer_email, address_name, address_street, address_country, address_country_code, address_city, address_state, address_zip, payment_date, payment_status, payment_address_status, payer_status) FROM stdin;
\.


--
-- Name: billing_paypal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_paypal_id_seq', 1, false);


--
-- Data for Name: billing_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_plans (id, planname, planid, plantype, plantimebank, plantimetype, plantimerefillcost, planbandwidthup, planbandwidthdown, plantraffictotal, plantrafficup, plantrafficdown, plantrafficrefillcost, planrecurring, planrecurringperiod, planrecurringbillingschedule, plancost, plansetupcost, plantax, plancurrency, plangroup, planactive, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: billing_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_plans_id_seq', 1, false);


--
-- Data for Name: billing_plans_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_plans_profiles (id, plan_name, profile_name) FROM stdin;
\.


--
-- Name: billing_plans_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_plans_profiles_id_seq', 1, false);


--
-- Data for Name: billing_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_rates (id, ratename, ratetype, ratecost, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: billing_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_rates_id_seq', 1, false);


--
-- Data for Name: cui; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cui (username, clientipaddress, callingstationid, cui, creationdate, lastaccounting) FROM stdin;
\.


--
-- Data for Name: dictionary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dictionary (id, type, attribute, value, format, vendor, recommendedop, recommendedtable, recommendedhelper, recommendedtooltip) FROM stdin;
\.


--
-- Name: dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dictionary_id_seq', 1, false);


--
-- Data for Name: hotspots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hotspots (id, name, mac, geocode, owner, email_owner, manager, email_manager, address, company, phone1, phone2, type, companywebsite, companyemail, companycontact, companyphone, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: hotspots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hotspots_id_seq', 1, false);


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY invoice (id, user_id, batch_id, date, status_id, type_id, notes, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('invoice_id_seq', 1, false);


--
-- Data for Name: invoice_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY invoice_items (id, invoice_id, plan_id, amount, tax_amount, total, notes, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: invoice_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('invoice_items_id_seq', 1, false);


--
-- Data for Name: invoice_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY invoice_status (id, value, notes, creationdate, creationby, updatedate, updateby) FROM stdin;
43	open		\N	operator	\N	operator
44	disputed		\N	operator	\N	operator
45	draft		\N	operator	\N	operator
46	sent		\N	operator	\N	operator
47	paid		\N	operator	\N	operator
48	partial		\N	operator	\N	operator
\.


--
-- Name: invoice_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('invoice_status_id_seq', 48, true);


--
-- Data for Name: invoice_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY invoice_type (id, value, notes, creationdate, creationby, updatedate, updateby) FROM stdin;
22	Plans		\N	operator	\N	operator
23	Services		\N	operator	\N	operator
24	Consulting		\N	operator	\N	operator
\.


--
-- Name: invoice_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('invoice_type_id_seq', 24, true);


--
-- Data for Name: nas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nas (id, nasname, shortname, type, ports, secret, server, community, description) FROM stdin;
\.


--
-- Name: nas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nas_id_seq', 1, false);


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY node (id, "time", netid, name, description, latitude, longitude, owner_name, owner_email, owner_phone, owner_address, approval_status, ip, mac, uptime, robin, batman, memfree, nbs, gateway, gw_qual, routes, users, kbdown, kbup, hops, rank, ssid, pssid, gateway_bit, memlow, usershi, cpu, wan_iface, wan_ip, wan_mac, wan_gateway, wifi_iface, wifi_ip, wifi_mac, wifi_ssid, wifi_key, wifi_channel, lan_iface, lan_mac, lan_ip, wan_bup, wan_bdown, firmware, firmware_revision) FROM stdin;
\.


--
-- Name: node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('node_id_seq', 1, false);


--
-- Data for Name: operators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY operators (id, username, password, firstname, lastname, title, department, company, phone1, phone2, email1, email2, messenger1, messenger2, notes, lastlogin, creationdate, creationby, updatedate, updateby) FROM stdin;
17	administrator	radius	Admin	Radius	Administrator	Freeradius	Ads-Fi	555-5555	555-5555	admin@ads-fi.com	admin@ads-fi.com	skype	msn	Note	2014-07-10 11:01:31	\N	\N	\N	\N
\.


--
-- Data for Name: operators_acl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY operators_acl (id, operator_id, file, access) FROM stdin;
\.


--
-- Data for Name: operators_acl_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY operators_acl_files (id, file, category, section) FROM stdin;
\.


--
-- Name: operators_acl_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('operators_acl_files_id_seq', 1, false);


--
-- Name: operators_acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('operators_acl_id_seq', 1, false);


--
-- Name: operators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('operators_id_seq', 17, true);


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payment (id, invoice_id, amount, date, type_id, notes, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_id_seq', 1, false);


--
-- Data for Name: payment_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payment_type (id, value, notes, creationdate, creationby, updatedate, updateby) FROM stdin;
22	Cash		\N	operator	\N	operator
23	Check		\N	operator	\N	operator
24	Bank Transfer		\N	operator	\N	operator
\.


--
-- Name: payment_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_type_id_seq', 24, true);


--
-- Data for Name: proxys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proxys (id, proxyname, retry_delay, retry_count, dead_time, default_fallback, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: proxys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proxys_id_seq', 1, false);


--
-- Data for Name: radacct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY radacct (radacctid, acctsessionid, acctuniqueid, username, groupname, realm, nasipaddress, nasportid, nasporttype, acctstarttime, acctstoptime, acctsessiontime, acctauthentic, connectinfo_start, connectinfo_stop, acctinputoctets, acctoutputoctets, calledstationid, callingstationid, acctterminatecause, servicetype, framedprotocol, framedipaddress, acctstartdelay, acctstopdelay, xascendsessionsvrkey) FROM stdin;
738	80600007	b048e74b5fd345ce	luis	\N	\N	159.90.176.222	2153775111	Wireless-802.11	2014-08-12 15:17:36	2014-08-12 15:23:26	350		\N		92716	380816	00:0C:42:78:84:D0	CC:C3:EA:F4:50:41	Lost-Service			10.5.49.247/32	\N	0	\N
741	52E14AA0-00000000	464b557399b908a5	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-12 16:09:03	2014-08-12 16:10:45	102	RADIUS	\N	CONNECT 0Mbps 802.11	20372	26505	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	\N	0	\N
774	52E14AA0-00000000	464b557399b908a5	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 04:02:59	2008-02-01 04:33:03	606604	RADIUS	CONNECT 0Mbps 802.11	\N	\N	\N	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F				\N	0	0	
1332	5457E82C-00000049	9717da05204b728f	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-07 17:07:15	2014-11-07 17:09:25	131	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	91196	715697	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1205	54512733-00000016	82c410643597d7f9	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-31 10:33:30	2014-10-31 10:33:55	24	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	27712	55695	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1317	5457E82C-0000003A	ae62cac870e6f7e2	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:22:10	2014-11-05 16:24:19	129	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	99312	270568	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1318	5457E82C-0000003B	19d732ba98ac3026	vero	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:30:47	2014-11-05 16:32:27	99	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	70307	238022	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
746	8060000d	611a63d65533026d	luis	\N	\N	159.90.176.222	2153775117	Wireless-802.11	2014-08-12 18:27:26	2014-08-12 18:37:47	621				153140	1011618	00:0C:42:78:84:D0	CC:C3:EA:F4:50:41	Lost-Service			10.5.49.245/32	0	0	
1359	546DF4CF-00000000	56106c5299674b12	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 09:35:07	2014-11-20 11:34:33	7167	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	0	0	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41				\N	0	0	
1361	546DF4CF-00000000	56106c5299674b12	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 09:35:45	2014-11-20 11:35:12	7167	RADIUS	\N	CONNECT 0Mbps 802.11	0	0	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41				\N	\N	0	\N
1370	546DF4CF-00000006	52fb8fa954b36ad5	angi	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 16:29:13	2014-11-20 16:30:05	53	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	37088	46400	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
753	52E14AA0-0000000B	1b38322f4a7edcab	rasa2002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-12 21:14:56	2014-08-12 21:15:09	13	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	30275	57435	DC-9F-DB-58-92-CA:Ads-Fi-EAP	F0-25-B7-FB-FD-59	User-Request			\N	0	0	
754	52E14AA0-0000000C	9aaba6ced57b2554	rasa2002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-12 21:17:30	2014-08-12 21:29:33	722	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	84801	174412	DC-9F-DB-58-92-CA:Ads-Fi-EAP	F0-25-B7-FB-FD-59	User-Request			\N	0	0	
755	52E14AA0-0000000D	e7d816d53f8b38bb	rasa2002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-12 21:46:21	2014-08-12 21:46:35	14	RADIUS	\N	CONNECT 0Mbps 802.11	13789	10258	DC-9F-DB-58-92-CA:Ads-Fi-EAP	F0-25-B7-FB-FD-59	User-Request			\N	\N	0	\N
758	52E14AA0-0000000F	1ef7288388cd99be	rasa2002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-12 22:07:17	2014-08-12 22:07:22	4	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	6676	6812	DC-9F-DB-58-92-CA:Ads-Fi-EAP	F0-25-B7-FB-FD-59	User-Request			\N	0	0	
756	52E14AA0-0000000D	e7d816d53f8b38bb	rasa2002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-12 21:46:45	2014-08-13 09:16:58	41413	RADIUS	CONNECT 0Mbps 802.11	\N	\N	\N	DC-9F-DB-58-92-CA:Ads-Fi-EAP	F0-25-B7-FB-FD-59	NAS-Reboot			\N	0	0	
759	8060000f	94687fdaba658cac	34267205	\N	\N	159.90.176.222	2153775119	Wireless-802.11	2014-08-12 22:09:55	2014-08-13 09:16:58	40023			\N	\N	\N	00:0C:42:78:84:D0	30:19:66:50:F8:32	NAS-Reboot			10.5.49.237/32	0	0	
760	80600010	c3fbcc4f0ca521eb	173974610	\N	\N	159.90.176.222	2153775120	Wireless-802.11	2014-08-12 22:10:12	2014-08-13 09:16:58	40006			\N	\N	\N	00:0C:42:78:84:D0	F0:25:B7:FB:FD:59	NAS-Reboot			10.5.49.234/32	0	0	
761	80600012	a6205261242732c6	luis	\N	\N	159.90.176.222	2153775122	Wireless-802.11	2014-08-13 09:21:23	\N	\N			\N	\N	\N	00:0C:42:78:84:D0	CC:C3:EA:F4:50:41	\N			10.5.49.243/32	0	\N	
762	80600013	88c035786ce9b713	luis	\N	\N	159.90.176.222	2153775123	Wireless-802.11	2014-08-13 13:57:27	2014-08-13 14:12:25	898				729791	7729441	00:0C:42:78:84:D0	F0:25:B7:49:CB:A6	Lost-Service			10.5.49.231/32	0	0	
765	1234567	6507e83651b8723d	carlosotgz	\N	\N	1.2.3.4	0	ISDN	2014-08-13 16:04:37	2014-08-13 16:04:40	3				0	0						\N	0	0	
767	80600015	d859420d30e114ff	luis	\N	\N	159.90.176.222	2153775125	Wireless-802.11	2014-08-13 16:57:07	2014-08-13 17:21:18	1451				513551	2465167	00:0C:42:78:84:D0	F0:25:B7:49:CB:A6	Lost-Service			10.5.49.231/32	0	0	
1360	546DF4CF-00000000	56106c5299674b12	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 09:35:45	2014-11-20 11:35:12	7167	RADIUS	\N	CONNECT 0Mbps 802.11	0	0	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41				\N	\N	0	\N
803	52E14AA0-00000024	c23731cb6eda1bbe	test0003	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 16:58:53	2014-08-21 16:59:09	16	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	17570	26871	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1335	5457E82C-0000004A	a5c7761c80fa5e78	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-07 17:09:55	2014-11-07 17:11:01	66	RADIUS	\N	CONNECT 0Mbps 802.11	70853	427740	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	\N	0	\N
1365	546DF4CF-00000001	bd8abc9974a61f92	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 11:35:12	2014-11-20 12:00:12	1522	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	420375	729116	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41				\N	0	0	
1196	54512733-0000000D	a28dbcdcfee2c3e8	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 17:15:16	2014-10-29 17:15:51	36	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	30073	53374	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1371	546DF4CF-00000007	76e7fc7d5081a30c	angi	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-21 14:53:28	2014-11-21 14:53:33	5	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	10307	15875	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1199	54512733-00000010	2690955f4c577d1a	test	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 17:22:54	2014-10-29 17:40:42	1068	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	86852	398098	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1017	80a0003c	e48a974952161494	875785477	\N	\N	159.90.176.122	2157969468	Wireless-802.11	2014-10-24 16:47:01	2014-10-24 17:14:29	1648		\N		240187	781100	00:0C:42:78:84:CE	F0:25:B7:FB:FD:59	Idle-Timeout			10.5.50.225/32	\N	0	\N
775	52E14AA0-00000001	3670a38eec1740b4	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 04:03:00	2008-01-25 04:06:00	180	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	16111	26137	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
1206	54512733-00000017	7a5497ed8808c876	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-31 10:45:54	2014-10-31 10:51:45	351	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	82706	153882	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
776	52E14AA0-00000002	e9ebc2648d2e0fd7	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 04:35:12	2008-01-25 04:38:12	180	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	10089	16370	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
777	52E14AA0-00000003	efe45933b66d53e0	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 04:54:57	2008-01-25 04:57:57	180	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	560386	15013777	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
778	52E14AA0-00000004	da68813d2a5d535f	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 04:58:07	2008-01-25 05:01:07	180	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	40105	95369	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
779	52E14AA0-00000005	3192de951169252e	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 05:01:08	2008-01-25 05:04:08	180	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	129729	761687	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
780	52E14AA0-00000006	f83f8c25462d1eb2	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 05:05:47	2008-01-25 05:08:47	180	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	8883	15111	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
781	52E14AA0-00000007	5559f3c835a5b15b	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 05:14:20	2008-01-25 05:17:20	180	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	4052	1945	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
782	52E14AA0-00000008	fd001d95d62c47e2	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 05:29:05	2008-01-25 05:32:05	179	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	6038	4431	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	Session-Timeout			\N	0	0	
783	52E14AA0-00000009	541f81fb240e4550	luis	\N	\N	159.90.176.222	0	Wireless-802.11	2008-01-25 05:48:54	2008-01-25 05:49:58	64	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	6294	3665	DC-9F-DB-58-92-CA:Ads-Fi-EAP	64-76-BA-DA-72-4F	User-Request			\N	0	0	
791	52E14AA0-00000015	d0b63c2d29475342	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 14:09:40	2014-08-21 14:12:43	184	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	85404	914520	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
792	52E14AA0-00000016	1efb8aaa276f43ff	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 14:12:58	2014-08-21 14:14:55	116	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	16432	26286	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
794	52E14AA0-00000018	b68e94461eb44770	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 14:20:31	2014-08-21 14:21:23	53	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	15364	25244	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
802	52E14AA0-00000023	316ca154a0235539	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 16:48:24	2014-08-21 16:55:15	411	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	50195	54650	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
795	52E14AA0-00000019	863c586de37ed088	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 14:21:59	2014-08-21 14:25:18	198	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	20407	32476	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
796	52E14AA0-0000001A	01ccc3557ade89c4	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 14:41:11	2014-08-21 14:41:34	23	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	21375	40735	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
804	52E14AA0-00000025	9de4376b14fac81c	test0003	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 16:59:20	2014-08-21 17:02:04	164	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	31845	39325	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	Session-Timeout			\N	0	0	
798	52E14AA0-0000001F	ad5efd5f1c489f31	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 16:38:55	2014-08-21 16:42:45	231	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	36423	54934	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1362	546DF4CF-00000001	bd8abc9974a61f92	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 11:35:12	2014-11-20 12:00:12	1522	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	420375	729116	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41				\N	0	0	
799	52E14AA0-00000020	600d5b43e7c1dd27	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 16:44:09	2014-08-21 16:46:22	133	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	25719	45825	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
800	52E14AA0-00000021	355eff98a12eb99e	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 16:46:26	2014-08-21 16:46:58	33	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	22198	34789	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1372	546DF4CF-00000008	342425cbc1ec3257	angi	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-21 14:59:14	2014-11-21 14:59:34	19	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	23445	54538	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
801	52E14AA0-00000022	772eafee7684dbfd	test0002	\N	\N	159.90.176.222	0	Wireless-802.11	2014-08-21 16:47:07	2014-08-21 16:48:19	72	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	14330	23740	DC-9F-DB-58-92-CA:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1197	54512733-0000000E	0ed8e218b25100f4	test	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 17:17:58	2014-10-29 17:18:07	9	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	38321	114281	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1333	5457E82C-0000004A	a5c7761c80fa5e78	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-07 17:09:28	2014-11-07 17:10:34	66	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	70853	427740	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1218	5453D686-00000001	062afc858c85b400	test	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-31 14:11:16	2014-10-31 14:27:37	980	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	77675	97835	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1297	5457E82C-00000027	47461bba9cfdae59	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 15:32:16	2014-11-05 15:34:21	110	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	353454	8340389	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1310	5457E82C-00000033	6c44594650608319	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:10:46	2014-11-05 16:11:01	16	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	36885	119022	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1321	5457E82C-0000003E	5268eb04538b42f4	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:35:13	2014-11-05 16:35:15	3	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	10583	55450	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1323	5457E82C-00000040	350179a16bb85c36	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:37:14	2014-11-05 16:37:20	3	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	1040	1088	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
822	0BD158C6-00000001	725a0a0930563213	luis	\N	\N	192.168.99.4	\N	Wireless-802.11	2008-01-27 17:01:49	\N	\N			\N	\N	\N	00-18-25-15-32-82:Ads-Fi-EAP	cc-c3-ea-f4-50-41	\N			\N	0	\N	
1358	546CBE75-00000004	6f32133bc88bde3d	angi	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-19 17:01:34	2014-11-19 17:06:53	9	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	12961	21378	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1363	546DF4CF-00000001	bd8abc9974a61f92	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 11:35:12	2014-11-20 12:00:12	1522	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	420375	729116	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41				\N	0	0	
1198	54512733-0000000F	514fab0fcb15eb5f	test	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 17:22:21	2014-10-29 17:22:40	19	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	46359	173167	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1373	80e00000	2f7eeb623ea22b37	test	\N	\N	159.90.176.122	2162163712	Wireless-802.11	2014-11-21 16:55:38	2014-11-21 16:56:38	60				164716	1231278	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D	User-Request			10.5.50.237/32	0	0	
1334	5457E82C-0000004A	a5c7761c80fa5e78	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-07 17:09:55	2014-11-07 17:11:01	66	RADIUS	\N	CONNECT 0Mbps 802.11	70853	427740	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	\N	0	\N
1296	5457E82C-00000026	fa1b17e9dac951a1	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 15:26:49	2014-11-05 15:30:06	197	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	120216	294757	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1299	5457E82C-00000029	d46f190316bcf9ae	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 15:34:28	2014-11-05 15:35:38	68	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	99523	265593	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1311	5457E82C-00000034	1fe40ee99473199e	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:11:23	2014-11-05 16:11:33	10	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	494	806	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1322	5457E82C-0000003F	188d318cd30c2b1f	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:35:16	2014-11-05 16:36:41	85	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	81071	290189	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
842	52F281D0-00000007	eb32546345d9eeba	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2008-01-23 22:08:29	2008-01-23 22:08:59	30	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	41850	96352	24-A4-3C-A4-B8-B9:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
843	52F281D0-00000008	9ddff702bd429be1	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2008-01-23 22:09:24	2008-01-23 22:10:37	73	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	67427	155234	24-A4-3C-A4-B8-B9:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1364	546DF4CF-00000000	56106c5299674b12	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 09:35:45	2014-11-20 11:35:12	7167	RADIUS	\N	CONNECT 0Mbps 802.11	0	0	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41				\N	\N	0	\N
1374	80e00001	1d8f1a4129e2fd02	test	\N	\N	159.90.176.122	2162163713	Wireless-802.11	2014-11-21 16:56:04	2014-11-21 16:57:05	61				87043	636076	00:0C:42:78:84:CE	CC:C3:EA:F4:50:41	User-Request			10.5.50.238/32	0	0	
1200	54512733-00000011	5629bab09d2b4532	test	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 17:40:43	2014-10-29 17:41:04	21	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	46517	140328	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1336	5457E82C-0000004A	a5c7761c80fa5e78	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-07 17:09:55	2014-11-07 17:11:01	66	RADIUS	\N	CONNECT 0Mbps 802.11	70853	427740	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	\N	0	\N
1312	5457E82C-00000035	8bd19d6c96509030	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:12:20	2014-11-05 16:12:32	12	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	18111	72425	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1324	5457E82C-00000041	2e840ca33b0e7004	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:37:24	2014-11-05 16:50:23	780	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	265600	1975439	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1337	80c00005	4a86b181c9c6088c	prueba	\N	\N	192.168.1.9	2160066565	Wireless-802.11	2014-11-14 17:31:01	2014-11-14 19:19:15	6494		\N		510694	6641784	08:00:27:85:C3:0D	08:00:27:C4:BC:92	User-Request			10.0.0.199/32	\N	0	\N
1366	546DF4CF-00000002	e664b94562b7719a	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 12:00:13	2014-11-20 12:07:05	414	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	528770	2397004	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1375	80e00002	69edc7af8d4e0463	test	\N	\N	159.90.176.122	2162163714	Wireless-802.11	2014-11-21 17:01:41	2014-11-21 17:02:49	67				33620	271295	00:0C:42:78:84:CE	CC:C3:EA:F4:50:41	User-Request			10.5.50.238/32	0	0	
1347	80c0000a	d6ddee466524a4c4	luis	\N	\N	192.168.1.9	2160066570	Wireless-802.11	2014-11-14 19:31:30	2014-11-14 19:34:08	158		\N		41166	839867	08:00:27:85:C3:0D	08:00:27:C4:BC:92	User-Request			10.0.0.199/32	\N	0	\N
1201	54512733-00000012	46e13f2b6fb9c219	test	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 17:41:26	2014-10-29 17:42:09	43	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	37513	110619	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1295	5457E82C-00000025	495c7a8590bf6ea9	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 15:22:16	2014-11-05 15:26:16	240	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	223778	1816807	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1303	5457E82C-0000002C	e772089f61b00720	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 15:38:05	2014-11-05 15:38:42	38	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	81517	251685	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1313	5457E82C-00000036	4b6b767e1cd96376	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:12:34	2014-11-05 16:13:38	64	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	85285	254034	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1338	80c00005	4a86b181c9c6088c	prueba	\N	\N	192.168.1.9	2160066565	Wireless-802.11	2014-11-14 17:31:01	2014-11-14 19:19:15	6494		\N		510694	6641784	08:00:27:85:C3:0D	08:00:27:C4:BC:92	User-Request			10.0.0.199/32	\N	0	\N
1367	546DF4CF-00000003	fffd403904951423	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 12:07:20	2014-11-20 12:11:50	269	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	117622	137959	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1345	80c00009	70a668313441ecbc	luis	\N	\N	192.168.1.9	2160066569	Wireless-802.11	2014-11-14 19:30:19	2014-11-14 19:31:15	55				39736	1062939	08:00:27:85:C3:0D	08:00:27:C4:BC:92	User-Request			10.0.0.199/32	0	0	
1352	80c0000e	26150721e459934f	test	\N	\N	192.168.1.9	2160066574	Wireless-802.11	2014-11-14 20:20:23	\N	\N			\N	\N	\N	08:00:27:85:C3:0D	08:00:27:C4:BC:92	\N			10.0.0.199/32	0	\N	
1376	80e00003	5c1f077c62fb77c9	test	\N	\N	159.90.176.122	2162163715	Wireless-802.11	2014-11-21 17:03:41	2014-11-21 17:03:50	9				30399	349868	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D	User-Request			10.5.50.237/32	0	0	
1202	54512733-00000013	1b73d4cfb0d3e967	test	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 17:42:10	2014-10-29 17:42:27	17	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	36366	111524	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1314	5457E82C-00000037	d05751fa425b70e2	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:18:13	2014-11-05 16:19:01	48	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	64285	193988	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1319	5457E82C-0000003C	d1d3795e6af6f2fa	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:32:51	2014-11-05 16:32:56	4	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	33590	153243	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
937	8090001b	8dc52c5729fa3ab8	test	\N	\N	159.90.176.122	2156920859	Wireless-802.11	2014-10-21 14:48:01	2014-10-21 15:16:09	1688			\N	\N	\N	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D				10.5.50.240/32	0	0	
1339	80c00005	4a86b181c9c6088c	prueba	\N	\N	192.168.1.9	2160066565	Wireless-802.11	2014-11-14 17:31:00	2014-11-14 19:19:14	6494		\N		510694	6641784	08:00:27:85:C3:0D	08:00:27:C4:BC:92	User-Request			10.0.0.199/32	\N	0	\N
1368	546DF4CF-00000004	ed8355aabb71d204	jreyes	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 12:12:31	2014-11-20 12:12:40	9	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	16501	36077	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1346	80c0000a	d6ddee466524a4c4	luis	\N	\N	192.168.1.9	2160066570	Wireless-802.11	2014-11-14 19:31:29	2014-11-14 19:34:07	158				41166	839867	08:00:27:85:C3:0D	08:00:27:C4:BC:92	User-Request			10.0.0.199/32	0	0	
1377	80e00004	7a49ce5d498a64c4	test	\N	\N	159.90.176.122	2162163716	Wireless-802.11	2014-11-21 17:04:41	2014-11-21 17:07:25	164				65808	505949	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D	User-Request			10.5.50.237/32	0	0	
1203	54512733-00000014	74c0bbec5ade5bcb	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-31 10:06:58	2014-10-31 10:07:27	30	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	57624	75697	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1279	5457E82C-00000015	9cbf4f8e74e582fa	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 12:00:07	2014-11-18 16:41:56	1140109	RADIUS	CONNECT 0Mbps 802.11	\N	759049	6642753	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	NAS-Reboot			\N	0	0	
1378	80e00005	2c3196ef9fe36977	test	\N	\N	159.90.176.122	2162163717	Wireless-802.11	2014-11-21 17:05:40	2014-11-21 17:07:25	104				88946	298661	00:0C:42:78:84:CE	CC:C3:EA:F4:50:41	User-Request			10.5.50.238/32	0	0	
1305	5457E82C-0000002E	e39670b58de99cbf	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 15:51:40	2014-11-05 15:55:47	247	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	99360	266695	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1307	5457E82C-00000030	079e51ec80a9d4dc	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 15:56:37	2014-11-05 16:10:44	847	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	172608	459757	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	Session-Timeout			\N	0	0	
1315	5457E82C-00000038	b0f14748418066e6	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:19:03	2014-11-05 16:19:21	17	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	66571	235830	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
1320	5457E82C-0000003D	7d96668078cb5599	luis	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:32:57	2014-11-05 16:33:45	49	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	73264	259046	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
933	80900017	ed2fd5ee4408c099	test	\N	\N	159.90.176.122	2156920855	Wireless-802.11	2014-10-21 13:53:40	2014-10-21 13:54:02	22				78574	660436	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D	User-Request			10.5.50.248/32	0	0	
935	80900019	ff9cf6a1616520fb	test	\N	\N	159.90.176.122	2156920857	Wireless-802.11	2014-10-21 14:39:01	2014-10-21 14:39:46	45				14146	413400	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D	Lost-Service			10.5.50.247/32	0	0	
936	8090001a	152c98516afe4982	test	\N	\N	159.90.176.122	2156920858	Wireless-802.11	2014-10-21 14:40:42	2014-10-21 14:41:13	31				16586	31172	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D	User-Request			10.5.50.241/32	0	0	
947	80a0001c	b5bd3ea504c29749	test	\N	\N	159.90.176.122	2157969436	Wireless-802.11	2014-10-22 13:25:36	2014-10-22 14:16:17	2741				441894	17408575	00:0C:42:78:84:CE	98:0C:82:73:F1:D7	Idle-Timeout			10.5.50.227/32	0	0	
1369	546DF4CF-00000005	ed1eb34538f3ff83	angi	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-20 16:29:01	2014-11-20 16:29:05	5	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	5425	7263	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1379	80e00004	7a49ce5d498a64c4	test	\N	\N	159.90.176.122	2162163716	Wireless-802.11	2014-11-21 17:04:41	2014-11-21 17:07:25	164		\N		65808	505949	00:0C:42:78:84:CE	84:8E:0C:66:F2:4D	User-Request			10.5.50.237/32	\N	0	\N
1380	80e00007	ab2d4372400b251f	test	\N	\N	159.90.176.122	2162163719	Wireless-802.11	2014-11-21 17:10:11	\N	\N			\N	\N	\N	00:0C:42:78:84:CE	CC:C3:EA:F4:50:41	\N			10.5.50.238/32	0	\N	
1348	80c0000a	d6ddee466524a4c4	luis	\N	\N	192.168.1.9	2160066570	Wireless-802.11	2014-11-14 19:31:29	2014-11-14 19:34:07	158		\N		41166	839867	08:00:27:85:C3:0D	08:00:27:C4:BC:92	User-Request			10.0.0.199/32	\N	0	\N
1195	54512733-0000000C	548d3becc8ebb286	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-29 16:54:35	2014-10-29 16:55:09	34	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	38162	70860	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1204	54512733-00000015	1f0a1a5de7788082	luis	\N	\N	192.168.1.1	0	Wireless-802.11	2014-10-31 10:08:24	2014-10-31 10:17:45	561	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	679520	5675835	24-A4-3C-A4-B8-80:Ads-Fi-EAP	CC-C3-EA-F4-50-41	User-Request			\N	0	0	
1316	5457E82C-00000039	f009f49f1d67ba78	test	\N	\N	192.168.1.8	0	Wireless-802.11	2014-11-05 16:19:29	2014-11-05 16:20:24	56	RADIUS	CONNECT 0Mbps 802.11	CONNECT 0Mbps 802.11	83768	266756	24-A4-3C-A4-B8-80:Ads-Fi-EAP	D8-90-E8-28-15-D9	User-Request			\N	0	0	
943	80a0000e	c28f43fcfe007275	test	\N	\N	159.90.176.122	2157969422	Wireless-802.11	2014-10-22 11:40:14	2014-10-22 11:45:14	300				1095184	16181316	00:0C:42:78:84:CE	A0:A8:CD:7A:60:5C	Session-Timeout			10.5.50.233/32	0	0	
945	80a00015	45cdf017b1e08856	test	\N	\N	159.90.176.122	2157969429	Wireless-802.11	2014-10-22 11:46:16	2014-10-22 11:54:56	219				946953	27472008	00:0C:42:78:84:CE	A0:A8:CD:7A:60:5C	Idle-Timeout			10.5.50.233/32	0	0	
\.


--
-- Name: radacct_radacctid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('radacct_radacctid_seq', 1380, true);


--
-- Data for Name: radcheck; Type: TABLE DATA; Schema: public; Owner: adsficom_symuser
--

COPY radcheck (id, username, attribute, op, value) FROM stdin;
60	836309895	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
61	badboy	MD5-Password	:=	23c47084b5a1752cce3a7d5763def88b
62	1359192706	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
63	luisparrasanoja 	MD5-Password	:=	7b756d79795382751e1805aa37f623bf
64	luis	MD5-Password	:=	4d49ed67e56292ce1e2a7a1fceb0df0c
66	yhoandriz	MD5-Password	:=	b6f62ea084a8643cc208824250ae975d
67	ervar84	MD5-Password	:=	f2024852ac3b1c2d72d726f503b13586
68	1426690719	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
69	miguel85	MD5-Password	:=	22298fb40914e48b1556ce0c8ffa7c93
72	chilean 	MD5-Password	:=	db73dbc76a68170927872da8f4a10e1f
73	angi	MD5-Password	:=	12b3638553c1f4a535a047e7003d9ac4
74	100000236434854	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
77	aacf00	MD5-Password	:=	c5220aa76b9c83889e6c475dae6a58f2
78	514096435	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
79	dianar.2321	MD5-Password	:=	5e40d972e1605adea90ec52cdda9bd74
80	875910295	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
81	aacf1992	MD5-Password	:=	c5220aa76b9c83889e6c475dae6a58f2
83	582902746	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
84	rub3n84	MD5-Password	:=	efcbeeabfaeffd8fdce78f5d9a76d8bf
85	1212693368	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
86	jaferrerpetit	MD5-Password	:=	d2b865cd5d03287c3beaca0972a320ad
87	100003641587840	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
88	deyalithbolivar	MD5-Password	:=	167ec57a773372c33d17d7bdecc9f7c6
89	@yhoandriz 	MD5-Password	:=	b6f62ea084a8643cc208824250ae975d
90	henry17	MD5-Password	:=	0c958e1eb9e48b8834a012fdd270d866
94	510347832	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
95	jreyes	MD5-Password	:=	81dc9bdb52d04dc20036dbd8313ed055
96	1189793236	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
97	tzoltan	MD5-Password	:=	0988e4ba2d777fc37bceff37babd9f82
98	620903044	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
100	andree	MD5-Password	:=	467a55e13110f7610b966ec3d34337a9
102	joseangeltoyo12@hotmail.com	MD5-Password	:=	d7bdf92b292958f6354405c9cd0178c6
103	718393697	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
105	100003772600457	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
106	100003920923148	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
107	alejandro	MD5-Password	:=	05dd2a3edb9bea53f2bda2f6fd1f6043
108	edecio_parra	MD5-Password	:=	b4c634ea06b7eddacf5c148b9bd709b4
109	jambcore	MD5-Password	:=	dfdabd78141e944a6f35a7f19a80619f
113	1280537401	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
114	1306540341	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
115	1576913798	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
117	negonarg1	MD5-Password	:=	e324107ecc52a0bfb0472bf16efcff3d
118	maried1938	MD5-Password	:=	b96b17bdbb4ff43471ca067e1e0e9ac8
119	brando	MD5-Password	:=	d3786ec2413a8cd9413bfcb24be95a73
120	609672039	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
121	grachi	MD5-Password	:=	d8fd8787131d6770211918c443400a7f
122	727427876	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
123	robert	MD5-Password	:=	d6a492bb93afeb808c8fae34daf28d99
124	jullybr2681	MD5-Password	:=	91a7a1fa0d43f24a588bdb0d1405429c
126	1348538244	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
127	humildad	MD5-Password	:=	464399a35ca63104310c6b539963796c
128	loquita	MD5-Password	:=	e10adc3949ba59abbe56e057f20f883e
129	100004319985359	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
130	hdseo000	MD5-Password	:=	98907918c8fd71fba7a8b3d16ccf4413
131	edwinr86	MD5-Password	:=	56d405a8c7cb5cfe93a95ab982136bf4
133	cira	MD5-Password	:=	664647b4efe67843aab09603e076540b
135	msanmiguel	MD5-Password	:=	74def02a125a2b6ba98ef4a549eda2e3
136	ilka	MD5-Password	:=	135ca95faa895358d4e76f43f1602ef4
137	bxks	MD5-Password	:=	4ca1dd881b70b06b6b4fdeb74f8fb0d1
139	jodido	MD5-Password	:=	1fa2fb4371744ea2eb226a06f6ccb152
140	1672881800	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
141	1131982076	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
146	maponte	MD5-Password	:=	bacc932d29f121774c03b710d2f4f5b3
147	manuel	MD5-Password	:=	e6bb1bdf771ca40e728768ca98b26468
149	100000158604961	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
151	rimiro	MD5-Password	:=	e39ffae5414bff1e9cca32cb72a409d1
153	marcota	MD5-Password	:=	4aac3d542633aa7f43379721de903f4e
155	1073860565	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
156	wmmc	MD5-Password	:=	e2667c4b6d6ff3415e940bcd757f1eea
157	tony	MD5-Password	:=	81dc9bdb52d04dc20036dbd8313ed055
158	12345678	MD5-Password	:=	3df74bb414a618f2345b3b051b170a65
161	marcolamattina	MD5-Password	:=	4aac3d542633aa7f43379721de903f4e
163	hola	MD5-Password	:=	26729bae1fc5b60a2973324ef387fe5f
164	elstonesc	MD5-Password	:=	0081ec27c7a4c9f2f261946c828d4769
165	100006705183802	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
166	632609647	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
167	1131676125	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
168	100004610733651	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
169	isaac	MD5-Password	:=	4a4526b1ec301744aba9526d78fcb2a6
173	539510162	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
174	crisangel8	MD5-Password	:=	5f5558965237b84c379e7b6a430c6fd0
184	omeraz23	MD5-Password	:=	9120163167c05aed85f30bf88495bd89
186	561702071	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
191	100001483492952	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
59	test	Cleartext-Password	:=	test
192	jesus	MD5-Password	:=	6550e0ebef9c13fb02aba2661cb4a127
194	3	MD5-Password	:=	1679091c5a880faf6fb5e6087eb1b2dc
195	pinedajg	MD5-Password	:=	d22209d9a3d84847e5d5f26b568b752d
196	755362490	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
197	juantopia	MD5-Password	:=	243f04be89580462d3d01e7eed690fae
199	edelis	MD5-Password	:=	ffb2274564114c9f5f8bac7a6ad92004
200	100000604316115	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
203	ogarcia	MD5-Password	:=	e10adc3949ba59abbe56e057f20f883e
204	1119238505	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
208	josgre	MD5-Password	:=	bc7a67dc184fc1ce9f5c4e0230efbc06
209	hbrq1969	MD5-Password	:=	51ff4e92b999844a512ab9d531b3cdbc
212	tbell	MD5-Password	:=	2e46e9628bc3508b38dcd069eedac4e8
214	1208361294	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
215	luzcolumba20	MD5-Password	:=	52386a518e42bd7e86456e1ef4ef9f8e
216	684552043	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
217	ari12345	MD5-Password	:=	ecad359a521b6a58acf70926ab59aee6
218	chachi	MD5-Password	:=	9862677269c0bc2fb303929ffafa3ed3
219	rodmanperez	MD5-Password	:=	9862677269c0bc2fb303929ffafa3ed3
220	sofiaalcalde	MD5-Password	:=	6f3c3d52a2f2ee3ab57c8c6344c69b90
221	andrea	MD5-Password	:=	455f949c189c90ca40b82151476bf8c9
222	naybet	MD5-Password	:=	6b418f2406e774bcd99ebe76d4917bc3
223	marir	MD5-Password	:=	4e01defc77be4584a3b112096514634f
224	danny	MD5-Password	:=	ceba24191f9a13b211bab3442f3e4186
225	blahblah	MD5-Password	:=	d614830636b9b3e1c1ff7e910750da20
226	1552705712	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
227	1497336896	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
228	100001886023586	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
229	jjpyme@gmail.com	MD5-Password	:=	03696241274cf199aad33940670222c4
233	barbsarias	MD5-Password	:=	cdb35c800bbe563477a973876d970962
234	alexander	MD5-Password	:=	90a0ec2ba52a3dc9f84fd662ec5a789a
235	599570907	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
237	michaelj	MD5-Password	:=	6e7b81d0cf4a9a8e2bb7b420723f4653
238	samussamus	MD5-Password	:=	a46a892eebb2bbe77422a28e03364c7b
239	requieroyohe	MD5-Password	:=	699a48e93d788cdd6f2c47b421575f14
240	100000784113137	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
243	jmca_7@hotmail.com	MD5-Password	:=	20edc293fc81f51301f3cfe853b4dead
244	dulfadul	MD5-Password	:=	ced74d869ad82848aa9b483b17a52c7c
254	1461511154	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
255	jeanelgato	MD5-Password	:=	733abe9169b28b36aefa32da88a6e4a2
263	1094093415	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
264	100000543811218	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
265	sabgra	MD5-Password	:=	c6fd3bc633e1ca198317152f1df5b448
266	jjefferygarcia	MD5-Password	:=	03696241274cf199aad33940670222c4
242	michiwis	MD5-Password	:=	3425712bd37307a391e92975506e4f16
154	lamattina96	MD5-Password	:=	4aac3d542633aa7f43379721de903f4e
268	pperes	MD5-Password	:=	e10adc3949ba59abbe56e057f20f883e
283	jreyes2	MD5-Password	:=	81dc9bdb52d04dc20036dbd8313ed055
267	rasa2002	MD5-Password	:=	bcda4f64bc2df6ae90023abaf3ce4f8d
269	34267205	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
270	173974610	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
271	dimas	MD5-Password	:=	03d4fa1ab7ea4844e37d47fff208ffcf
272	counter	Max-Daily-Session	:=	300
273	test0002	Max-Daily-Session	:=	180
274	test0002	MD5-Password	:=	168cb5accd74bf83c8fee0e5376faf5f
276	test0003	MD5-Password	:=	2065549d13766bb469f4a421f313dacf
277	carlosotgz2	MD5-Password	:=	6adb0950f83a9f46f7a68ff7419ec3e8
286	jhosbert	MD5-Password	:=	e10adc3949ba59abbe56e057f20f883e
275	test0003	Max-Daily-Session	:=	180
294	vero	Cleartext-Password	:=	vero
\.


--
-- Name: radcheck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adsficom_symuser
--

SELECT pg_catalog.setval('radcheck_id_seq', 294, true);


--
-- Data for Name: radgroupcheck; Type: TABLE DATA; Schema: public; Owner: adsficom_symuser
--

COPY radgroupcheck (id, groupname, attribute, op, value) FROM stdin;
12	Trial	Max-All-Session	:=	14000
14	Mikrotik	Called-Station-Id	=~	^00:0C:42:([A-Fa-f0-9:]{8})$
\.


--
-- Name: radgroupcheck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adsficom_symuser
--

SELECT pg_catalog.setval('radgroupcheck_id_seq', 15, true);


--
-- Data for Name: radgroupreply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY radgroupreply (id, groupname, attribute, op, value) FROM stdin;
9	Mikrotik	Idle-Timeout	:=	180
10	Mikrotik	Port-Limit	:=	1
11	Mikrotik	Acct-Interim-Interval	:=	600
12	Mikrotik	Mikrotik-Advertise-URL	:=	http://portal.ads-fi.com/ads
13	Mikrotik	Mikrotik-Advertise-Interval	:=	600
14	Mikrotik	Fall-Through	=	yes
\.


--
-- Name: radgroupreply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('radgroupreply_id_seq', 15, true);


--
-- Data for Name: radhuntgroup; Type: TABLE DATA; Schema: public; Owner: adsficom_symuser
--

COPY radhuntgroup (id, groupname, nasmacaddress, nasipaddress, nasportid) FROM stdin;
2	CSI	24-A4-3C-A4-B8-80:Ads-Fi-EAP	\N	\N
4	SAMBIL	00:0C:42:00:0C:42	\N	\N
3	PTS	24-A4-3C-A4-B8-80:Ads-Fi-2	\N	\N
\.


--
-- Name: radhuntgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adsficom_symuser
--

SELECT pg_catalog.setval('radhuntgroup_id_seq', 4, true);


--
-- Data for Name: radippool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY radippool (id, pool_name, framedipaddress, nasipaddress, calledstationid, callingstationid, expiry_time, username, pool_key) FROM stdin;
\.


--
-- Name: radippool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('radippool_id_seq', 1, true);


--
-- Data for Name: radpostauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY radpostauth (id, username, pass, reply, authdate) FROM stdin;
1	luis	parra	Access-Accept	2014-08-12 18:27:27
2	jreyes	1234	Access-Accept	2014-08-12 18:35:48
3	jreyes	Chap-Password	Access-Accept	2014-08-12 18:35:48
4	hdvvd	bxbd	Access-Reject	2014-08-12 18:36:47
5	jreyes	1234	Access-Accept	2014-08-12 18:37:05
6	jreyes	Chap-Password	Access-Accept	2014-08-12 18:37:05
7	jreyes	1234	Access-Accept	2014-08-12 19:39:07
8	jreyes	Chap-Password	Access-Accept	2014-08-12 19:39:07
9	jreyes	1234	Access-Accept	2014-08-12 19:55:46
10	jreyes	Chap-Password	Access-Accept	2014-08-12 19:55:46
11	jreyes	1234	Access-Accept	2014-08-12 20:55:49
12	jreyes	Chap-Password	Access-Accept	2014-08-12 20:55:49
13	rasa2002	17423402	Access-Accept	2014-08-12 21:14:56
14	rasa2002	Chap-Password	Access-Accept	2014-08-12 21:14:56
15	34267205	adsfi	Access-Accept	2014-08-12 22:09:56
16	173974610	adsfi	Access-Accept	2014-08-12 22:10:13
17	jdjvs	hdhhd	Access-Reject	2014-08-13 09:20:50
18	angie	merlin	Access-Reject	2014-08-13 14:15:48
19	carlosotgz	9=C6=9F=EE=87=AF=BF=A61=FB=EA=60=5C=C5=F0=C3	Access-Reject	2014-08-13 15:32:29
20	carlosotgz	=D7=F2=05=23=BC=A0=84=F0=BA=A1=28c=FD=EB=94=7D	Access-Reject	2014-08-13 15:32:40
21	jreyes	I=11U=14=D7GGR=BFW=5B=8DH=DF=3D=0D	Access-Reject	2014-08-13 15:33:04
22	carlosotgz	adsfi	Access-Reject	2014-08-13 15:33:46
23	angi	merlin212	Access-Reject	2014-08-13 15:39:43
24	carlosotgz	adsfi	Access-Reject	2014-08-13 15:44:35
25	carlosotgz	adsfi	Access-Reject	2014-08-13 16:06:17
26	test0002	Chap-Password	Access-Reject	2014-08-21 14:15:02
27	test0002	Chap-Password	Access-Reject	2014-08-21 14:15:18
28	test0002	Chap-Password	Access-Reject	2014-08-21 14:16:04
29	test0002	Chap-Password	Access-Reject	2014-08-21 14:16:23
30	test0002	Chap-Password	Access-Reject	2014-08-21 14:41:46
31	test0002	Chap-Password	Access-Reject	2014-08-21 14:42:06
32	test0002	Chap-Password	Access-Reject	2014-08-21 16:55:28
33	test0002	Chap-Password	Access-Reject	2014-08-21 16:56:40
34	test0003	Chap-Password	Access-Reject	2014-08-21 17:02:06
35	angi	mwrlin	Access-Reject	2008-01-27 16:50:49
36	angi	mer=C3=B1in	Access-Reject	2008-01-27 17:01:27
37	hdjdv	Chap-Password	Access-Reject	2014-09-23 08:41:22
38	carlosotgz	Chap-Password	Access-Reject	2014-09-23 10:57:57
39	carlosotgz	Chap-Password	Access-Reject	2014-09-23 10:58:10
40	carlosotgz	adsfi	Access-Reject	2014-09-23 11:01:38
41	carlosotgz	Chap-Password	Access-Reject	2014-09-23 11:11:23
42	carlosotgz	adsfi	Access-Reject	2014-09-23 11:28:23
43	Look	coova	Access-Reject	2014-09-24 16:23:35
44	jreyes	Chap-Password	Access-Reject	2008-01-23 20:52:48
45	jreyes	Chap-Password	Access-Reject	2008-01-23 20:55:41
46	jreyes	Chap-Password	Access-Reject	2008-01-23 20:57:46
47	jreyes	Chap-Password	Access-Reject	2008-01-23 21:00:30
48	jreyes	Chap-Password	Access-Reject	2008-01-23 21:01:45
49	jreyes	Chap-Password	Access-Reject	2008-01-23 21:03:39
50	jreyes	Chap-Password	Access-Reject	2008-01-23 21:10:10
51	jreyes	Chap-Password	Access-Reject	2008-01-23 21:11:50
52	jreyes	Chap-Password	Access-Reject	2008-01-23 21:13:02
53	jreyes	Chap-Password	Access-Reject	2008-01-23 21:16:25
54	jreyes	Chap-Password	Access-Reject	2008-01-23 21:20:12
55	jreyes	Chap-Password	Access-Reject	2008-01-23 21:22:37
56	jreyes	Chap-Password	Access-Reject	2008-01-23 21:23:45
57	jreyes	Chap-Password	Access-Reject	2008-01-23 21:24:42
58	jreyes	Chap-Password	Access-Reject	2008-01-23 21:26:34
59	jreyes	Chap-Password	Access-Reject	2008-01-23 21:33:31
60	jreyes	Chap-Password	Access-Reject	2008-01-23 21:33:55
61	jreyes	Chap-Password	Access-Reject	2008-01-23 21:39:17
62	jreyes	Chap-Password	Access-Reject	2008-01-23 21:40:56
63	jreyes	Chap-Password	Access-Reject	2008-01-23 21:41:51
64	jreyes	Chap-Password	Access-Reject	2008-01-23 21:44:59
65	jreyes	Chap-Password	Access-Reject	2008-01-23 21:54:00
66	luis	Chap-Password	Access-Reject	2008-01-23 22:05:33
67	luis	Chap-Password	Access-Reject	2008-01-23 22:10:52
68	luis	Chap-Password	Access-Reject	2008-01-23 22:11:42
69	luis	Chap-Password	Access-Reject	2008-01-24 16:29:02
70	luis	Chap-Password	Access-Reject	2008-01-24 16:29:24
71	jreyes	Chap-Password	Access-Reject	2008-01-24 16:31:00
72	jreyes	Chap-Password	Access-Reject	2008-01-27 15:54:06
73	jreyes	Chap-Password	Access-Reject	2008-01-27 15:54:57
74	jreyes	Chap-Password	Access-Reject	2008-01-27 15:59:51
75	rasa2002	Chap-Password	Access-Reject	2014-10-08 14:40:15
76	jreyes	Chap-Password	Access-Reject	2014-10-08 16:27:25
77	jreyes	Chap-Password	Access-Reject	2014-10-08 16:28:01
78	jreyes	Chap-Password	Access-Reject	2014-10-08 16:29:11
79	jreyes	Chap-Password	Access-Reject	2014-10-08 16:38:08
80	jreyes	Chap-Password	Access-Reject	2014-10-08 16:49:03
81	jreyes	Chap-Password	Access-Reject	2014-10-08 16:50:37
82	jreyes	Chap-Password	Access-Reject	2014-10-08 16:52:49
83	jreyes	Chap-Password	Access-Reject	2014-10-08 16:54:49
84	jreyes	Chap-Password	Access-Reject	2014-10-08 16:56:49
85	jreyes	Chap-Password	Access-Reject	2014-10-08 16:59:21
86	jreyes	Chap-Password	Access-Reject	2014-10-08 17:17:01
87	jreyes	Chap-Password	Access-Reject	2014-10-08 17:29:47
88	jreyes	Chap-Password	Access-Reject	2014-10-08 17:31:51
89	jreyes	Chap-Password	Access-Reject	2014-10-08 17:34:09
90	jreyes	Chap-Password	Access-Reject	2014-10-08 17:36:17
91	jreyes	Chap-Password	Access-Reject	2014-10-09 15:35:28
92	jreyes	Chap-Password	Access-Reject	2014-10-09 15:49:43
93	jreyes	Chap-Password	Access-Reject	2014-10-09 16:35:49
94	jreyes	Chap-Password	Access-Reject	2014-10-09 16:49:02
95		Chap-Password	Access-Reject	2014-10-10 14:39:24
96		Chap-Password	Access-Reject	2014-10-10 14:41:36
97		Chap-Password	Access-Reject	2014-10-10 14:42:20
98	jreyes	Chap-Password	Access-Reject	2014-10-20 08:53:05
99	jreyes	Chap-Password	Access-Reject	2014-10-20 08:55:04
100	jreyes	Chap-Password	Access-Reject	2014-10-20 08:56:42
101	rasa2002	Chap-Password	Access-Reject	2014-10-21 12:14:02
102	rasa2002	Chap-Password	Access-Reject	2014-10-21 12:17:18
103	rasa2002	Chap-Password	Access-Reject	2014-10-21 12:19:52
104	rasa2002	Chap-Password	Access-Reject	2014-10-21 12:21:28
105	test	test	Access-Reject	2014-10-21 15:41:18
106	angi	merlin	Access-Reject	2014-10-21 15:45:43
107	angi	merlin	Access-Reject	2014-10-21 15:56:59
108	angi	merlin	Access-Reject	2014-10-21 15:57:11
109	test	tester	Access-Reject	2014-10-22 11:39:41
110	test	tester	Access-Reject	2014-10-22 11:39:52
111	jhosbert	12345	Access-Reject	2014-10-22 11:41:47
112	jhosbert	12345	Access-Reject	2014-10-22 11:42:28
113	angi	merlin	Access-Reject	2014-10-22 11:43:06
114	test	test	Access-Reject	2014-10-22 11:45:34
115	test	test	Access-Reject	2014-10-22 11:45:49
116	jreyes	1234	Access-Reject	2014-10-22 13:23:15
117	test	test	Access-Reject	2014-10-22 13:24:16
118	jreyes	1234	Access-Reject	2014-10-22 13:24:33
119	jreyes	1234	Access-Reject	2014-10-22 13:25:11
120	test	test	Access-Reject	2014-10-22 13:25:13
121	test	test	Access-Reject	2014-10-22 14:30:16
122	luis	parra	Access-Reject	2014-10-22 14:54:28
123	chilean	jesusdiaz	Access-Reject	2014-10-22 15:05:34
124	chilean	jesusdiaz	Access-Reject	2014-10-22 15:06:02
125	test	test	Access-Reject	2014-10-22 15:46:00
126	jreyes	Chap-Password	Access-Reject	2014-10-22 16:41:04
127	jreyes	Chap-Password	Access-Reject	2014-10-23 15:51:00
128	jreyes	Chap-Password	Access-Reject	2014-10-23 15:53:21
129	jreyes	Chap-Password	Access-Reject	2014-10-23 17:15:43
130	jreyes	Chap-Password	Access-Reject	2014-10-23 17:16:03
131	angi	Chap-Password	Access-Reject	2014-10-23 17:53:44
132	jreyes	Chap-Password	Access-Reject	2014-10-23 17:55:43
133	luis	Chap-Password	Access-Reject	2014-10-23 17:56:20
134	test	Chap-Password	Access-Reject	2014-10-24 13:20:35
135	luis	Chap-Password	Access-Reject	2014-10-24 16:29:09
136	angi	merlin	Access-Reject	2014-10-24 17:09:52
137	angi	merlin	Access-Reject	2014-10-24 17:13:21
138	jreyes	Chap-Password	Access-Reject	2014-10-25 18:17:18
139	angi	Chap-Password	Access-Reject	2014-10-27 09:24:45
140	angi	Chap-Password	Access-Reject	2014-10-27 09:30:39
141	angi	Chap-Password	Access-Reject	2014-10-27 09:31:25
142	jreyes	Chap-Password	Access-Reject	2014-10-27 09:33:23
143	jreyes	Chap-Password	Access-Reject	2014-10-27 09:34:35
144	jreyes	Chap-Password	Access-Reject	2014-10-27 09:52:54
145	jreyes	Chap-Password	Access-Reject	2014-10-27 10:00:26
146	jreyes	Chap-Password	Access-Reject	2014-10-27 10:01:18
147	jreyes	Chap-Password	Access-Reject	2014-10-27 10:26:13
148	jreyes	Chap-Password	Access-Reject	2014-10-27 11:27:28
149	angi	merlin	Access-Reject	2014-10-28 10:31:09
150	angi	merlin	Access-Reject	2014-10-28 10:45:41
151	angi	merlin	Access-Reject	2014-10-28 11:34:06
152	angi	merlin	Access-Reject	2014-10-28 11:42:24
153	angi	merlin	Access-Reject	2014-10-28 11:43:31
154	angi	merlin	Access-Reject	2014-10-28 11:54:26
155	angi	merlin	Access-Reject	2014-10-28 15:24:21
156	angi	Chap-Password	Access-Reject	2014-10-28 15:28:07
157	angi	Chap-Password	Access-Reject	2014-10-28 15:31:17
158	angi	Chap-Password	Access-Reject	2014-10-28 15:32:33
159	angi	Chap-Password	Access-Reject	2014-10-28 15:33:01
160	angi	Chap-Password	Access-Reject	2014-10-28 15:33:11
161	angi	Chap-Password	Access-Reject	2014-10-28 16:14:24
162	angi	Chap-Password	Access-Reject	2014-10-28 16:15:54
163	angi	Chap-Password	Access-Reject	2014-10-28 16:29:28
164	jreyes	Chap-Password	Access-Reject	2014-10-28 16:45:05
165	jreyes	Chap-Password	Access-Reject	2014-10-28 17:25:40
166	jreyes	Chap-Password	Access-Reject	2014-10-29 09:30:55
167	jreyes	Chap-Password	Access-Reject	2014-10-29 09:53:13
168	jreyes	Chap-Password	Access-Reject	2014-10-29 10:35:27
169	angi	Chap-Password	Access-Reject	2014-10-29 11:35:13
170	jreyes	Chap-Password	Access-Reject	2014-10-29 14:48:22
171	jreyes	Chap-Password	Access-Reject	2014-10-29 14:48:41
172	angi	Chap-Password	Access-Reject	2014-10-29 14:52:44
173	angi	Chap-Password	Access-Reject	2014-10-29 16:26:09
174	jreyes	Chap-Password	Access-Reject	2014-10-29 16:54:01
175		Chap-Password	Access-Reject	2014-10-29 17:24:32
176	chilean	Chap-Password	Access-Reject	2014-10-31 14:01:20
177	chilean	Chap-Password	Access-Reject	2014-10-31 14:01:45
178	chilean	Chap-Password	Access-Reject	2014-10-31 14:04:09
179	chilean	Chap-Password	Access-Reject	2014-10-31 14:05:49
180	chilean	Chap-Password	Access-Reject	2014-10-31 14:08:07
181	chilean	Chap-Password	Access-Reject	2014-10-31 14:10:19
182	chilean	Chap-Password	Access-Reject	2014-10-31 14:10:35
183	chilean	Chap-Password	Access-Reject	2014-10-31 14:19:51
184	chilean	Chap-Password	Access-Reject	2014-10-31 14:21:32
185	chilean	Chap-Password	Access-Reject	2014-10-31 14:21:47
186	chilean	Chap-Password	Access-Reject	2014-10-31 14:29:03
187	angi	Chap-Password	Access-Reject	2014-10-31 15:50:50
188	angi	Chap-Password	Access-Reject	2014-10-31 15:53:10
189	angi	Chap-Password	Access-Reject	2014-10-31 16:24:13
190	angi	Chap-Password	Access-Reject	2014-10-31 16:26:11
191	angi	Chap-Password	Access-Reject	2014-10-31 16:31:06
192	test	test	Access-Reject	2014-11-03 15:06:00
193	test	test	Access-Reject	2014-11-03 15:06:28
194	angi	Chap-Password	Access-Reject	2014-11-03 16:11:29
195	jreyes	1234	Access-Reject	2014-11-03 16:13:53
196	jreyes	Chap-Password	Access-Reject	2014-11-03 16:18:12
197	jreyes	Chap-Password	Access-Reject	2014-11-03 16:19:09
198	jreyes	Chap-Password	Access-Reject	2014-11-03 16:24:19
199	angi	Chap-Password	Access-Reject	2014-11-04 14:35:20
200	test	Chap-Password	Access-Reject	2014-11-05 11:48:32
201	test	Chap-Password	Access-Reject	2014-11-05 11:57:08
202	luis	Chap-Password	Access-Reject	2014-11-05 15:35:39
203	luis	Chap-Password	Access-Reject	2014-11-05 15:36:10
204	luis	Chap-Password	Access-Reject	2014-11-05 15:37:12
205	angi	Chap-Password	Access-Reject	2014-11-05 15:37:18
206	angi	Chap-Password	Access-Reject	2014-11-05 15:37:50
207	chilean	Chap-Password	Access-Reject	2014-11-05 15:38:43
208	chilean	Chap-Password	Access-Reject	2014-11-05 15:39:04
209	jreyes	Chap-Password	Access-Reject	2014-11-05 15:39:11
210	jreyes	Chap-Password	Access-Reject	2014-11-05 15:39:37
211	jreyes	Chap-Password	Access-Reject	2014-11-05 15:47:06
212	jreyes	Chap-Password	Access-Reject	2014-11-05 15:47:16
213	luis	Chap-Password	Access-Reject	2014-11-05 15:48:09
214	luis	Chap-Password	Access-Reject	2014-11-05 15:48:19
215	luis	Chap-Password	Access-Reject	2014-11-05 15:51:15
216	luis	Chap-Password	Access-Reject	2014-11-05 15:51:28
217	luis	Chap-Password	Access-Reject	2014-11-05 15:55:48
218	luis	Chap-Password	Access-Reject	2014-11-05 16:11:02
222	luis	Chap-Password	Access-Reject	2014-11-05 16:13:56
219	luis	Chap-Password	Access-Reject	2014-11-05 16:11:52
220	luis	Chap-Password	Access-Reject	2014-11-05 16:12:08
221	luis	Chap-Password	Access-Reject	2014-11-05 16:13:43
223	luis	Chap-Password	Access-Reject	2014-11-05 16:15:30
224	luis	Chap-Password	Access-Reject	2014-11-05 16:16:35
225	luis	Chap-Password	Access-Reject	2014-11-05 16:20:25
226	luis	Chap-Password	Access-Reject	2014-11-05 16:20:48
227	luis	Chap-Password	Access-Reject	2014-11-05 16:21:20
228	luis	Chap-Password	Access-Reject	2014-11-05 16:21:49
229	luis	Chap-Password	Access-Reject	2014-11-05 16:22:05
230	vero	Chap-Password	Access-Reject	2014-11-05 16:25:11
231	vero	Chap-Password	Access-Reject	2014-11-05 16:25:36
232	luis	Chap-Password	Access-Reject	2014-11-05 16:32:31
233	luis	Chap-Password	Access-Reject	2014-11-05 16:32:43
234	luis	Chap-Password	Access-Reject	2014-11-05 16:34:50
235	luis	Chap-Password	Access-Reject	2014-11-05 16:35:08
236	luis	Chap-Password	Access-Reject	2014-11-05 16:36:54
237	luis	Chap-Password	Access-Reject	2014-11-05 16:37:09
238	luis	Chap-Password	Access-Reject	2014-11-07 17:10:55
239	angi	Chap-Password	Access-Reject	2014-11-19 15:03:20
240	angi	Chap-Password	Access-Reject	2014-11-19 15:05:14
241	jreyes	1234	Access-Reject	2014-11-19 15:56:33
242	jreyes	1234	Access-Reject	2014-11-19 15:57:29
243	jreyes	1234	Access-Reject	2014-11-19 15:57:37
244	jreyes	1234	Access-Reject	2014-11-19 15:59:50
245	jreyes	1234	Access-Reject	2014-11-19 16:01:43
246	angi	Chap-Password	Access-Reject	2014-11-19 16:25:08
247	angi	Chap-Password	Access-Reject	2014-11-19 16:57:34
248	angi	Chap-Password	Access-Reject	2014-11-19 16:59:02
249	angi	Chap-Password	Access-Reject	2014-11-19 17:05:09
250	angi	Chap-Password	Access-Reject	2014-11-19 17:09:46
251	angi	Chap-Password	Access-Reject	2014-11-20 09:33:49
252	jreyes	Chap-Password	Access-Reject	2014-11-20 16:27:38
253	angi	Chap-Password	Access-Reject	2014-11-21 14:50:51
254	angi	Chap-Password	Access-Reject	2014-11-21 14:51:44
255	angi	Chap-Password	Access-Reject	2014-11-21 14:52:27
256	1734046100264920@wlan.mnc004.mcc734.3gppnetwork.org	Chap-Password	Access-Reject	2014-11-21 15:06:55
257		Chap-Password	Access-Reject	2014-11-21 16:49:32
258		Chap-Password	Access-Reject	2014-11-21 16:50:44
259		Chap-Password	Access-Reject	2014-11-21 16:50:45
\.


--
-- Name: radpostauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('radpostauth_id_seq', 259, true);


--
-- Data for Name: radreply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY radreply (id, username, attribute, op, value) FROM stdin;
\.


--
-- Name: radreply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('radreply_id_seq', 1, true);


--
-- Data for Name: radusergroup; Type: TABLE DATA; Schema: public; Owner: adsficom_symuser
--

COPY radusergroup (id, username, groupname, priority) FROM stdin;
20	jreyes	Mikrotik	1
25	jreyes	Trial	2
12	test	EAP	100
13	luis	EAP	100
15	chilean	EAP	100
16	vero	EAP	100
11	jreyes	EAP	100
8	angi	EAP	100
27	angi	Mikrotik	1
\.


--
-- Name: radusergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adsficom_symuser
--

SELECT pg_catalog.setval('radusergroup_id_seq', 27, true);


--
-- Data for Name: realms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY realms (id, realmname, type, authhost, accthost, secret, ldflag, nostrip, hints, notrealm, creationdate, creationby, updatedate, updateby) FROM stdin;
\.


--
-- Name: realms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('realms_id_seq', 1, false);


--
-- Data for Name: userbillinfo; Type: TABLE DATA; Schema: public; Owner: adsficom_symuser
--

COPY userbillinfo (id, username, planname, hotspot_id, hotspotlocation, contactperson, company, email, phone, address, city, state, country, zip, paymentmethod, cash, creditcardname, creditcardnumber, creditcardverification, creditcardtype, creditcardexp, notes, changeuserbillinfo, lead, coupon, ordertaker, billstatus, lastbill, nextbill, nextinvoicedue, billdue, postalinvoice, faxinvoice, emailinvoice, batch_id, creationdate, creationby, updatedate, updateby) FROM stdin;
59	836309895	\N	\N	\N		Ads-Fi	gilsonbf@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-04	2014-07-04	0	0				1	\N	administrator	\N	administrator
60	badboy	\N	\N	\N		Ads-Fi	jrodmez@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
61	1359192706	\N	\N	\N		Ads-Fi	andersonyanes666@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
62	luisparrasanoja 	\N	\N	\N		Ads-Fi	Luisgabrieparrasanoja@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
63	luis	\N	\N	\N		Ads-Fi	Elreydelpop@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
65	yhoandriz	\N	\N	\N		Ads-Fi	yhoandri_19@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
66	ervar84	\N	\N	\N		Ads-Fi	ervar_nicolas@yahoo.com.ar	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
67	1426690719	\N	\N	\N		Ads-Fi	sofia_2209_1992@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
68	miguel85	\N	\N	\N		Ads-Fi	jleon85@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
71	chilean 	\N	\N	\N		Ads-Fi	chileandr17@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
72	angi	\N	\N	\N		Ads-Fi	angiazuajecap@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
73	100000236434854	\N	\N	\N		Ads-Fi	knight_black_of_king@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
76	aacf00	\N	\N	\N		Ads-Fi	Aacf00@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
77	514096435	\N	\N	\N		Ads-Fi	tancredidavid@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
78	dianar.2321	\N	\N	\N		Ads-Fi	dabsdario21@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
79	875910295	\N	\N	\N		Ads-Fi	coucheiroc@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
80	aacf1992	\N	\N	\N		Ads-Fi	Carrenoalejandro2@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-05	2014-07-05	0	0				1	\N	administrator	\N	administrator
82	582902746	\N	\N	\N		Ads-Fi	alextovar1319@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-06	2014-07-06	0	0				1	\N	administrator	\N	administrator
83	rub3n84	\N	\N	\N		Ads-Fi	Rubenatm1@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-06	2014-07-06	0	0				1	\N	administrator	\N	administrator
84	1212693368	\N	\N	\N		Ads-Fi	leo_ra_cct@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-06	2014-07-06	0	0				1	\N	administrator	\N	administrator
85	jaferrerpetit	\N	\N	\N		Ads-Fi	Jaferrerpetit@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-07	2014-07-07	0	0				1	\N	administrator	\N	administrator
86	100003641587840	\N	\N	\N		Ads-Fi	orlando@mail-me.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-07	2014-07-07	0	0				1	\N	administrator	\N	administrator
87	deyalithbolivar	\N	\N	\N		Ads-Fi	la.princesa0808@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-07	2014-07-07	0	0				1	\N	administrator	\N	administrator
90	@yhoandriz 	\N	\N	\N		Ads-Fi	yhoandri_1919@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-08	2014-07-08	0	0				1	\N	administrator	\N	administrator
91	henry17	\N	\N	\N		Ads-Fi	henrydss2002@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-09	2014-07-09	0	0				1	\N	administrator	\N	administrator
93	510347832	\N	\N	\N		Ads-Fi	fgaivis@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-10	2014-07-10	0	0				1	\N	administrator	\N	administrator
94	jreyes	\N	\N	\N		Ads-Fi		555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-10	2014-07-10	0	0				1	\N	administrator	\N	administrator
95	1189793236	\N	\N	\N		Ads-Fi	jessetreyes@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-10	2014-07-10	0	0				1	\N	administrator	\N	administrator
96	tzoltan	\N	\N	\N		Ads-Fi	tamarazoltan@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-10	2014-07-10	0	0				1	\N	administrator	\N	administrator
97	620903044	\N	\N	\N		Ads-Fi	queenlove-bp@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-11	2014-07-11	0	0				1	\N	administrator	\N	administrator
99	andree	\N	\N	\N		Ads-Fi	adrian.424@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-12	2014-07-12	0	0				1	\N	administrator	\N	administrator
101	joseangeltoyo12@hotmail.com	\N	\N	\N		Ads-Fi	joseangeltoyo12@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
102	718393697	\N	\N	\N		Ads-Fi	kelli_torres@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
104	100003772600457	\N	\N	\N		Ads-Fi	edecjose_0512@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
105	100003920923148	\N	\N	\N		Ads-Fi	valengirl.pb98@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
106	alejandro	\N	\N	\N		Ads-Fi	alejandrocarrera01@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
107	edecio_parra	\N	\N	\N		Ads-Fi	edecjose@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
108	jambcore	\N	\N	\N		Ads-Fi	jambcorevlax@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
112	1280537401	\N	\N	\N		Ads-Fi	negrovladi@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
113	1306540341	\N	\N	\N		Ads-Fi	minenadaniela@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
114	1576913798	\N	\N	\N		Ads-Fi	redondoroberto@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
116	negonarg1	\N	\N	\N		Ads-Fi	Nehomarg1@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
117	maried1938	\N	\N	\N		Ads-Fi	mjb0711@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
118	brando	\N	\N	\N		Ads-Fi	Hdseo0002@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
119	609672039	\N	\N	\N		Ads-Fi	david_rl14@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
120	grachi	\N	\N	\N		Ads-Fi	gracilig@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
121	727427876	\N	\N	\N		Ads-Fi	rafvicent@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
122	robert	\N	\N	\N		Ads-Fi	robertgt680@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
123	jullybr2681	\N	\N	\N		Ads-Fi	Jullybr26@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
125	1348538244	\N	\N	\N		Ads-Fi	nbarriospersonal@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
126	humildad	\N	\N	\N		Ads-Fi	Manuelrodolfoaguilar@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
127	loquita	\N	\N	\N		Ads-Fi	Jullybr@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
128	100004319985359	\N	\N	\N		Ads-Fi	ericcaraballo100@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
129	hdseo000	\N	\N	\N		Ads-Fi	Yorman_elmejor_2010@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
130	edwinr86	\N	\N	\N		Ads-Fi	edwinruizcontreras@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
132	cira	\N	\N	\N		Ads-Fi	Ciria_sax@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
134	msanmiguel	\N	\N	\N		Ads-Fi	marisanmiguel68@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
135	ilka	\N	\N	\N		Ads-Fi	tucan15@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
136	bxks	\N	\N	\N		Ads-Fi	Hdseo000@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
138	jodido	\N	\N	\N		Ads-Fi	Hdseo0001@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
139	1672881800	\N	\N	\N		Ads-Fi	roosssmall@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
140	1131982076	\N	\N	\N		Ads-Fi	lalocapuntopunto@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-13	2014-07-13	0	0				1	\N	administrator	\N	administrator
145	maponte	\N	\N	\N		Ads-Fi	miguel.aponte23@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-15	2014-07-15	0	0				1	\N	administrator	\N	administrator
146	manuel	\N	\N	\N		Ads-Fi	manuel_mendoza1408@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-15	2014-07-15	0	0				1	\N	administrator	\N	administrator
148	100000158604961	\N	\N	\N		Ads-Fi	metalgeear_14@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-15	2014-07-15	0	0				1	\N	administrator	\N	administrator
150	rimiro	\N	\N	\N		Ads-Fi	negrovladi1@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-15	2014-07-15	0	0				1	\N	administrator	\N	administrator
152	marcota	\N	\N	\N		Ads-Fi	marcolamattina96@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-16	2014-07-16	0	0				1	\N	administrator	\N	administrator
153	lamattina96	\N	\N	\N		Ads-Fi	Marcolamattina1@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-16	2014-07-16	0	0				1	\N	administrator	\N	administrator
154	1073860565	\N	\N	\N		Ads-Fi	franklin18becerra@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-16	2014-07-16	0	0				1	\N	administrator	\N	administrator
155	wmmc	\N	\N	\N		Ads-Fi	wmmc	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-17	2014-07-17	0	0				1	\N	administrator	\N	administrator
156	tony	\N	\N	\N		Ads-Fi	Acarrasco@lavitalicia.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-17	2014-07-17	0	0				1	\N	administrator	\N	administrator
157	12345678	\N	\N	\N		Ads-Fi	Felixgrillo@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-17	2014-07-17	0	0				1	\N	administrator	\N	administrator
160	marcolamattina	\N	\N	\N		Ads-Fi	Marcolamattina2@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
162	hola	\N	\N	\N		Ads-Fi	Skdjdjd	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
163	elstonesc	\N	\N	\N		Ads-Fi	Elstonechris@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
164	100006705183802	\N	\N	\N		Ads-Fi	belenuslab@belenuslab.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
165	632609647	\N	\N	\N		Ads-Fi	oswel_vegas@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
166	1131676125	\N	\N	\N		Ads-Fi	josegonzalezgodoy@live.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
167	100004610733651	\N	\N	\N		Ads-Fi	excoded01@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
168	isaac	\N	\N	\N		Ads-Fi	isaac_ramirez89@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-18	2014-07-18	0	0				1	\N	administrator	\N	administrator
172	539510162	\N	\N	\N		Ads-Fi	juancho502@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-19	2014-07-19	0	0				1	\N	administrator	\N	administrator
173	crisangel8	\N	\N	\N		Ads-Fi	arcangeles888@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-19	2014-07-19	0	0				1	\N	administrator	\N	administrator
183	omeraz23	\N	\N	\N		Ads-Fi	oacain@yahoo.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-20	2014-07-20	0	0				1	\N	administrator	\N	administrator
185	561702071	\N	\N	\N		Ads-Fi	liendo_joel@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-20	2014-07-20	0	0				1	\N	administrator	\N	administrator
190	100001483492952	\N	\N	\N		Ads-Fi	jesusmanuel1702@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-21	2014-07-21	0	0				1	\N	administrator	\N	administrator
191	jesus	\N	\N	\N		Ads-Fi	santoángel124.js55@Gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-21	2014-07-21	0	0				1	\N	administrator	\N	administrator
193	3	\N	\N	\N		Ads-Fi	3	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-21	2014-07-21	0	0				1	\N	administrator	\N	administrator
194	pinedajg	\N	\N	\N		Ads-Fi	gregorjosep@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-21	2014-07-21	0	0				1	\N	administrator	\N	administrator
195	755362490	\N	\N	\N		Ads-Fi	solgirethernandez@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-21	2014-07-21	0	0				1	\N	administrator	\N	administrator
196	juantopia	\N	\N	\N		Ads-Fi	Juan_acostag@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-22	2014-07-22	0	0				1	\N	administrator	\N	administrator
198	edelis	\N	\N	\N		Ads-Fi	girlcarolay@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-22	2014-07-22	0	0				1	\N	administrator	\N	administrator
199	100000604316115	\N	\N	\N		Ads-Fi	mayextik16@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-22	2014-07-22	0	0				1	\N	administrator	\N	administrator
202	ogarcia	\N	\N	\N		Ads-Fi	default@default.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-22	2014-07-22	0	0				1	\N	administrator	\N	administrator
203	1119238505	\N	\N	\N		Ads-Fi	jesus_daniel25@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-22	2014-07-22	0	0				1	\N	administrator	\N	administrator
207	josgre	\N	\N	\N		Ads-Fi	Josgre2013@outlook.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-24	2014-07-24	0	0				1	\N	administrator	\N	administrator
208	hbrq1969	\N	\N	\N		Ads-Fi	ramos.moises@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-24	2014-07-24	0	0				1	\N	administrator	\N	administrator
211	tbell	\N	\N	\N		Ads-Fi	tbell@edil.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-25	2014-07-25	0	0				1	\N	administrator	\N	administrator
213	1208361294	\N	\N	\N		Ads-Fi	imelayerim@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
214	luzcolumba20	\N	\N	\N		Ads-Fi	Anais.armas20@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
215	684552043	\N	\N	\N		Ads-Fi	avuh03_04@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
216	ari12345	\N	\N	\N		Ads-Fi	adrianafeog@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
217	chachi	\N	\N	\N		Ads-Fi	Adriana.guzman.a@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
218	rodmanperez	\N	\N	\N		Ads-Fi	rodmanperez@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
219	sofiaalcalde	\N	\N	\N		Ads-Fi	sofiaalcaldetrujillo@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
220	andrea	\N	\N	\N		Ads-Fi	Andreavelasquez5@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
221	naybet	\N	\N	\N		Ads-Fi	okarayo@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
222	marir	\N	\N	\N		Ads-Fi	mariarosa_86@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
223	danny	\N	\N	\N		Ads-Fi	lordjim121_@HOTMAIL.COM 	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
224	blahblah	\N	\N	\N		Ads-Fi	A@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
225	1552705712	\N	\N	\N		Ads-Fi	quinteroonaider@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
226	1497336896	\N	\N	\N		Ads-Fi	onammqa@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
227	100001886023586	\N	\N	\N		Ads-Fi	jjosfmer@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-27	2014-07-27	0	0				1	\N	administrator	\N	administrator
228	jjpyme@gmail.com	\N	\N	\N		Ads-Fi	jjpyme23@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-28	2014-07-28	0	0				1	\N	administrator	\N	administrator
232	barbsarias	\N	\N	\N		Ads-Fi	Barbyarias11@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-29	2014-07-29	0	0				1	\N	administrator	\N	administrator
233	alexander	\N	\N	\N		Ads-Fi	Alexander_10@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-30	2014-07-30	0	0				1	\N	administrator	\N	administrator
234	599570907	\N	\N	\N		Ads-Fi	zidanesephiro@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-30	2014-07-30	0	0				1	\N	administrator	\N	administrator
236	michaelj	\N	\N	\N		Ads-Fi	michaelperdomo815@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-30	2014-07-30	0	0				1	\N	administrator	\N	administrator
237	samussamus	\N	\N	\N		Ads-Fi	samuel21d@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-31	2014-07-31	0	0				1	\N	administrator	\N	administrator
238	requieroyohe	\N	\N	\N		Ads-Fi	Dagotohe@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-07-31	2014-07-31	0	0				1	\N	administrator	\N	administrator
239	100000784113137	\N	\N	\N		Ads-Fi	marianalobo_1@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-01	2014-08-01	0	0				1	\N	administrator	\N	administrator
241	michiwis	\N	\N	\N		Ads-Fi	mcbt95@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-01	2014-08-01	0	0				1	\N	administrator	\N	administrator
242	jmca_7@hotmail.com	\N	\N	\N		Ads-Fi	Jmca_7@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-01	2014-08-01	0	0				1	\N	administrator	\N	administrator
243	dulfadul	\N	\N	\N		Ads-Fi	dulfadul@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-01	2014-08-01	0	0				1	\N	administrator	\N	administrator
253	1461511154	\N	\N	\N		Ads-Fi	kedani1210@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-03	2014-08-03	0	0				1	\N	administrator	\N	administrator
254	jeanelgato	\N	\N	\N		Ads-Fi	Jeanelgato@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-03	2014-08-03	0	0				1	\N	administrator	\N	administrator
262	1094093415	\N	\N	\N		Ads-Fi	jcch.ve@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-03	2014-08-03	0	0				1	\N	administrator	\N	administrator
263	100000543811218	\N	\N	\N		Ads-Fi	fabulosamadelin_12@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-03	2014-08-03	0	0				1	\N	administrator	\N	administrator
264	sabgra	\N	\N	\N		Ads-Fi	djsabgra1@hotmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-03	2014-08-03	0	0				1	\N	administrator	\N	administrator
265	jjefferygarcia	\N	\N	\N		Ads-Fi	jjpyme@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-04	2014-08-04	0	0				1	\N	administrator	\N	administrator
58	test	\N	\N	\N		Ads-Fi	testemail@domain.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-05-09	2014-05-09	0	0				1	\N	administrator	\N	administrator
266	rasa2002	\N	\N	\N		Ads-Fi	richard.rasa2002@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2008-02-02	2008-02-02	0	0				1	\N	administrator	\N	administrator
267	pperes	\N	\N	\N		Ads-Fi	pperes@peres.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2008-02-02	2008-02-02	0	0				1	\N	administrator	\N	administrator
268	34267205	\N	\N	\N		Ads-Fi	34267205@twitter.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-12	2014-08-12	0	0				1	\N	administrator	\N	administrator
269	173974610	\N	\N	\N		Ads-Fi	173974610@twitter.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-12	2014-08-12	0	0				1	\N	administrator	\N	administrator
270	dimas	\N	\N	\N		Ads-Fi	avila.dimas@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-08-13	2014-08-13	0	0				1	\N	administrator	\N	administrator
274	carlosotgz2	\N	\N	\N		Ads-Fi	carlos.otgz2@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-09-23	2014-09-23	0	0				1	\N	administrator	\N	administrator
275	jhosbert	\N	\N	\N		Ads-Fi	jhosbert.ac@gmail.com	555-55-55	PTS	Caracas	DC	Venezuela	1080								Note1	0					2014-10-22	2014-10-22	0	0				1	\N	administrator	\N	administrator
\.


--
-- Name: userbillinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adsficom_symuser
--

SELECT pg_catalog.setval('userbillinfo_id_seq', 275, true);


--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: adsficom_symuser
--

COPY userinfo (id, username, firstname, lastname, email, department, company, workphone, homephone, mobilephone, address, city, state, country, zip, notes, changeuserinfo, portalloginpassword, enableportallogin, creationdate, creationby, updatedate, updateby) FROM stdin;
58	test	testname	testlastname	testemail@domain.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
59	836309895	Gilson	Barroeta	gilsonbf@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
60	badboy	jose	rodriguez	jrodmez@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
61	1359192706	Anderson	Yanes	andersonyanes666@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
62	luisparrasanoja 	Luis 	Parra	Luisgabrieparrasanoja@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
63	luis	Gabriel	Para	Elreydelpop@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
65	yhoandriz	yhoandriz	martinez	yhoandri_19@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
66	ervar84	Nicolas	Rosales	ervar_nicolas@yahoo.com.ar	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
67	1426690719	Andreina	Iacobozzi	sofia_2209_1992@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
68	miguel85	José	León	jleon85@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
71	chilean 	jesus	diaz	chileandr17@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
72	angi	Angi	azuaje	angiazuajecap@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
73	100000236434854	Alejandro	Hernandez	knight_black_of_king@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
76	aacf00	Alex	Cafran	Aacf00@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
77	514096435	David	Tancredi	tancredidavid@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
78	dianar.2321	Dario	Rojas	dabsdario21@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
79	875910295	Carolina	Coucheiro	coucheiroc@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
80	aacf1992	Alex	Carreño	Carrenoalejandro2@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
82	582902746	Alex	Tovar	alextovar1319@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
83	rub3n84	Rubén 	Martínez 	Rubenatm1@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
84	1212693368	Leandro J	Burgos O	leo_ra_cct@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
85	jaferrerpetit	José Antonio	Ferrer	Jaferrerpetit@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
86	100003641587840	Orlando	Peña Serrano	orlando@mail-me.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
87	deyalithbolivar	deyalith	bolivar 	la.princesa0808@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
90	@yhoandriz 	Yhoandriz 	Martínez 	yhoandri_191@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
91	henry17	Henry	Sánchez	henrydss2002@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
93	510347832	Francisco	G	fgaivis@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
94	jreyes	Jesset	Reyes		Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
95	1189793236	Jesset	Reyes	jessetreyes@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
96	tzoltan	Tamara	Zoltan	tamarazoltan@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
97	620903044	Beatriz	Parra	queenlove-bp@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
99	andree	andree	sanoja	adrian.424@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
101	joseangeltoyo12@hotmail.com	jose 	toyo	joseangeltoyo12@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
103	718393697	Kelly	Fano	kelli_torres@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
104	100003772600457	Edecio	Parra	edecjose_0512@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
105	100003920923148	Luana Valentina	Pino	valengirl.pb98@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
106	alejandro	alejandro	Rodríguez	alejandrocarrera01@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
107	edecio_parra	edecio jose	parra vasquez	edecjose@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
108	jambcore	jhuan	briceño	jambcorevlax@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
112	1280537401	Jose Vladimir	Espinoza	negrovladi@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
113	1306540341	Danielle	Mg	minenadaniela@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
114	1576913798	Roberth	Brown	redondoroberto@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
116	negonarg1	Nehomar	González	Nehomarg1@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
117	maried1938	maria 	bolivar	mjb0711@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
118	brando	Brando 	Terán 	Hdseo000@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
119	609672039	David	Laínez	david_rl14@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
120	grachi	gracy	guerra	gracilig@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
121	727427876	Rafael	O	rafvicent@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
122	robert	robert	guerra	robertgt680@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
123	jullybr2681	Jully	River	Jullybr26@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
125	1348538244	Nils	Barrios	nbarriospersonal@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
126	humildad	Manuel	Aguilar	Manuelrodolfoaguilar@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
127	loquita	Juliss	River	Jullybr@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
128	100004319985359	Eric	Caraballo	ericcaraballo100@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
129	hdseo000	Yorman	Medina	Yorman_elmejor_2010@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
130	edwinr86	ruiz		edwinruizcontreras@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
132	cira	Cira	Campos	Ciria_sax@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
134	msanmiguel	Maritza	Sanmiguel	marisanmiguel68@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
135	ilka	ilka	estribi	tucan15@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
136	bxks	Sidh	Islas 	Hdseo0001@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
138	jodido	Dijeses	 Disidís	Hdseo0002@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
139	1672881800	Rosangela	Sinai	roosssmall@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
140	1131982076	Kimberlin	Sanchez	lalocapuntopunto@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
145	maponte	miguel	aponte	miguel.aponte23@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
146	manuel	manuel	mendoza	manuel_mendoza1408@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
148	100000158604961	Paul	Guerrero	metalgeear_14@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
150	rimiro	alejandro	cordova	negrovladi1@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
152	marcota	Marco	Lamattina	marcolamattina96@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
153	lamattina96	Marco	Lamattina	Marcolamattina@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
154	1073860565	Frank	Lujan	franklin18becerra@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
155	wmmc	morales	corres	wmmc	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
156	tony	Tony 	Carrasco	Acarrasco@lavitalicia.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
157	12345678	Félix	Grillo	Felixgrillo@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
160	marcolamattina	Marco	Lamattina	Marcolamattina1@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
162	hola	Msnsnss	Sjdkdjdj	Skdjdjd	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
163	elstonesc	Christopher	Elstone	Elstonechris@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
164	100006705183802	Belenus	Laboratorios	belenuslab@belenuslab.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
165	632609647	Oswell	Vegas Arias	oswel_vegas@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
166	1131676125	José	Godoy	josegonzalezgodoy@live.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
167	100004610733651	Emilio	Suarez	excoded01@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
168	isaac	isaac	ramirez 	isaac_ramirez89@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
172	539510162	Juan Carlos	Jaime	juancho502@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
173	crisangel8	cristian	mendez	arcangeles888@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
183	omeraz23	Omer	Azpurua	oacain@yahoo.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
185	561702071	Joel	Liendo	liendo_joel@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
190	100001483492952	Jesus	Sanchez	jesusmanuel1702@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
191	jesus	Jesús 	Sánchez	santoángel124.js55@Gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
193	3	jey	3	3	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
194	pinedajg	jose	pineda	gregorjosep@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
195	755362490	Solgiret	Hernandez	solgirethernandez@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
196	juantopia	Juan	Acosta	Juan_acostag@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
198	edelis	Edelis	Simons 	girlcarolay@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
199	100000604316115	Wilmen	Valera	mayextik16@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
202	ogarcia	oswaldo		default@default.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
203	1119238505	Jesus Daniel	Muñoz Medina	jesus_daniel25@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
207	josgre	José	Martinez	Josgre2013@outlook.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
208	hbrq1969	moises	ramos	ramos.moises@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
211	tbell	thanys	bell	tbell@edil.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
213	1208361294	Imel	Soto	imelayerim@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
214	luzcolumba20	Anais	Armas	Anais.armas20@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
215	684552043	Alix	Heaford	avuh03_04@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
216	ari12345	adriana 	feo	adrianafeog@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
217	chachi	Adri	Guzman	Adriana.guzman.a@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
218	rodmanperez	Rodman	Pérez 	rodmanperez@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
219	sofiaalcalde	Sofia	Alcalde	sofiaalcaldetrujillo@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
220	andrea	Andrea	Velasquez	Andreavelasquez5@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
221	naybet	victor	rodriguez	okarayo@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
222	marir	maria	duran	mariarosa_86@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
223	danny	danny	becerra	lordjim121_@HOTMAIL.COM 	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
224	blahblah	Carlos	Suarez	A@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
225	1552705712	Onaider	Quintero	quinteroonaider@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
226	1497336896	Onam	Quintero A	onammqa@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
227	100001886023586	Jhaims	Bastidas	jjosfmer@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
228	jjpyme@gmail.com	jeffery	Garcia	jjpyme@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
232	barbsarias	Balbs	Arias	Barbyarias11@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
233	alexander	Alexander 	Montero	Alexander_10@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
234	599570907	Danny	Serrano	zidanesephiro@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
236	michaelj	michael	perdomo	michaelperdomo815@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
237	samussamus	samuel	martinez	samuel21d@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
238	requieroyohe	Darwin	Rojas	Dagotohe@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
239	100000784113137	Mariiana	Lobo	marianalobo_1@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
241	michiwis	michelle	bohorquez	mcbt95@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
242	jmca_7@hotmail.com	José	Camarinha	Jmca_7@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
243	dulfadul	Dulce	Monsalve	dulfadul@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
253	1461511154	Daniel	Ortiz	kedani1210@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
254	jeanelgato	Jean	Bastidas	Jeanelgato@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
262	1094093415	Julio Cesar	Chinchilla	jcch.ve@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
263	100000543811218	Angelica Madelin	Guerrero Peña	fabulosamadelin_12@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
264	sabgra	carlos	vargas	djsabgra1@hotmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
265	jjefferygarcia	jeffery	Garcia	jjpyme1@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
266	rasa2002	Richard	Salazar	richard.rasa2002@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
267	pperes	pedro	perez	pperes@peres.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
268	34267205	Francisco	Gaivis	34267205@twitter.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
269	173974610	Richard	Salazar	173974610@twitter.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
270	dimas	dimas	avila	avila.dimas@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
274	carlosotgz2	a	a	carlos.otgz2@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
275	jhosbert	Jhosbert	Contreras	jhosbert.ac@gmail.com	Hostpot	Ads-Fi	555-55-55	555-55-55	555-55-55	PTS	Caracas	DC	Venezuela	1080	Note1	0	\N	0	\N	administrator	\N	administrator
\.


--
-- Name: userinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adsficom_symuser
--

SELECT pg_catalog.setval('userinfo_id_seq', 275, true);


--
-- Data for Name: wimax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wimax (id, username, authdate, spi, mipkey, lifetime) FROM stdin;
\.


--
-- Name: wimax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wimax_id_seq', 1, false);


--
-- Name: batch_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY batch_history
    ADD CONSTRAINT batch_history_pkey PRIMARY KEY (id);


--
-- Name: bill_info_email_unique; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY userbillinfo
    ADD CONSTRAINT bill_info_email_unique UNIQUE (email);


--
-- Name: bill_info_usr_unique; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY userbillinfo
    ADD CONSTRAINT bill_info_usr_unique UNIQUE (username);


--
-- Name: billing_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billing_history
    ADD CONSTRAINT billing_history_pkey PRIMARY KEY (id);


--
-- Name: billing_merchant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billing_merchant
    ADD CONSTRAINT billing_merchant_pkey PRIMARY KEY (id);


--
-- Name: billing_paypal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billing_paypal
    ADD CONSTRAINT billing_paypal_pkey PRIMARY KEY (id);


--
-- Name: billing_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billing_plans
    ADD CONSTRAINT billing_plans_pkey PRIMARY KEY (id);


--
-- Name: billing_plans_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billing_plans_profiles
    ADD CONSTRAINT billing_plans_profiles_pkey PRIMARY KEY (id);


--
-- Name: billing_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billing_rates
    ADD CONSTRAINT billing_rates_pkey PRIMARY KEY (id);


--
-- Name: cui_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cui
    ADD CONSTRAINT cui_pkey PRIMARY KEY (username, clientipaddress, callingstationid);


--
-- Name: dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dictionary
    ADD CONSTRAINT dictionary_pkey PRIMARY KEY (id);


--
-- Name: hotspots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hotspots
    ADD CONSTRAINT hotspots_pkey PRIMARY KEY (id);


--
-- Name: invoice_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invoice_items
    ADD CONSTRAINT invoice_items_pkey PRIMARY KEY (id);


--
-- Name: invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: invoice_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invoice_status
    ADD CONSTRAINT invoice_status_pkey PRIMARY KEY (id);


--
-- Name: invoice_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invoice_type
    ADD CONSTRAINT invoice_type_pkey PRIMARY KEY (id);


--
-- Name: nas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nas
    ADD CONSTRAINT nas_pkey PRIMARY KEY (id);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: operators_acl_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operators_acl_files
    ADD CONSTRAINT operators_acl_files_pkey PRIMARY KEY (id);


--
-- Name: operators_acl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operators_acl
    ADD CONSTRAINT operators_acl_pkey PRIMARY KEY (id);


--
-- Name: operators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operators
    ADD CONSTRAINT operators_pkey PRIMARY KEY (id);


--
-- Name: payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payment_type
    ADD CONSTRAINT payment_type_pkey PRIMARY KEY (id);


--
-- Name: proxys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proxys
    ADD CONSTRAINT proxys_pkey PRIMARY KEY (id);


--
-- Name: radacct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY radacct
    ADD CONSTRAINT radacct_pkey PRIMARY KEY (radacctid);


--
-- Name: radcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY radcheck
    ADD CONSTRAINT radcheck_pkey PRIMARY KEY (id);


--
-- Name: radgroupcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY radgroupcheck
    ADD CONSTRAINT radgroupcheck_pkey PRIMARY KEY (id);


--
-- Name: radgroupreply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY radgroupreply
    ADD CONSTRAINT radgroupreply_pkey PRIMARY KEY (id);


--
-- Name: radhuntgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY radhuntgroup
    ADD CONSTRAINT radhuntgroup_pkey PRIMARY KEY (id);


--
-- Name: radippool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY radippool
    ADD CONSTRAINT radippool_pkey PRIMARY KEY (id);


--
-- Name: radpostauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY radpostauth
    ADD CONSTRAINT radpostauth_pkey PRIMARY KEY (id);


--
-- Name: radreply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY radreply
    ADD CONSTRAINT radreply_pkey PRIMARY KEY (id);


--
-- Name: radusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY radusergroup
    ADD CONSTRAINT radusergroup_pkey PRIMARY KEY (id);


--
-- Name: realms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY realms
    ADD CONSTRAINT realms_pkey PRIMARY KEY (id);


--
-- Name: userbillinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY userbillinfo
    ADD CONSTRAINT userbillinfo_pkey PRIMARY KEY (id);


--
-- Name: userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (id);


--
-- Name: usr_info_email_unique; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT usr_info_email_unique UNIQUE (email);


--
-- Name: usr_info_usr_unique; Type: CONSTRAINT; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT usr_info_usr_unique UNIQUE (username);


--
-- Name: wimax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wimax
    ADD CONSTRAINT wimax_pkey PRIMARY KEY (id);


--
-- Name: acctsessionid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX acctsessionid ON radacct USING btree (acctsessionid);


--
-- Name: acctsessiontime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX acctsessiontime ON radacct USING btree (acctsessiontime);


--
-- Name: acctstarttime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX acctstarttime ON radacct USING btree (acctstarttime);


--
-- Name: acctstoptime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX acctstoptime ON radacct USING btree (acctstoptime);


--
-- Name: acctuniqueid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX acctuniqueid ON radacct USING btree (acctuniqueid);


--
-- Name: batch_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX batch_name ON batch_history USING btree (batch_name);


--
-- Name: bm_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX bm_username ON billing_merchant USING btree (username);


--
-- Name: bp_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX bp_username ON billing_paypal USING btree (username);


--
-- Name: framedipaddress; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX framedipaddress ON radacct USING btree (framedipaddress);


--
-- Name: groupname; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE INDEX groupname ON radgroupcheck USING btree (groupname);


--
-- Name: id; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE UNIQUE INDEX id ON radusergroup USING btree (id);


--
-- Name: mac; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mac ON hotspots USING btree (mac);


--
-- Name: name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX name ON hotspots USING btree (name);


--
-- Name: nasipaddress; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX nasipaddress ON radacct USING btree (nasipaddress);


--
-- Name: nasname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX nasname ON nas USING btree (nasname);


--
-- Name: node_mac; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX node_mac ON node USING btree (mac);


--
-- Name: op_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX op_username ON operators USING btree (username);


--
-- Name: planname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planname ON billing_plans USING btree (planname);


--
-- Name: radacct_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX radacct_username ON radacct USING btree (username);


--
-- Name: radcheck_username; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE INDEX radcheck_username ON radcheck USING btree (username);


--
-- Name: radgp_groupname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX radgp_groupname ON radgroupreply USING btree (groupname);


--
-- Name: radippool_framedipaddress; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX radippool_framedipaddress ON radippool USING btree (framedipaddress);


--
-- Name: radippool_nasip_poolkey_ipaddress; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX radippool_nasip_poolkey_ipaddress ON radippool USING btree (nasipaddress, pool_key, framedipaddress);


--
-- Name: radippool_poolname_expire; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX radippool_poolname_expire ON radippool USING btree (pool_name, expiry_time);


--
-- Name: radreply_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX radreply_username ON radreply USING btree (username);


--
-- Name: radusrgp_username; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE INDEX radusrgp_username ON radusergroup USING btree (username);


--
-- Name: ratename; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ratename ON billing_rates USING btree (ratename);


--
-- Name: rhgp_nasmacaddress; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE INDEX rhgp_nasmacaddress ON radhuntgroup USING btree (nasmacaddress);


--
-- Name: spi; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX spi ON wimax USING btree (spi);


--
-- Name: username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX username ON billing_history USING btree (username);


--
-- Name: usrbi_planname; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE INDEX usrbi_planname ON userbillinfo USING btree (planname);


--
-- Name: usrbi_username; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE INDEX usrbi_username ON userbillinfo USING btree (username);


--
-- Name: usrinf_username; Type: INDEX; Schema: public; Owner: adsficom_symuser; Tablespace: 
--

CREATE INDEX usrinf_username ON userinfo USING btree (username);


--
-- Name: wi_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wi_username ON wimax USING btree (username);


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

