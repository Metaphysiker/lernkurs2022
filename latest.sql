--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    user_id bigint,
    first_name character varying DEFAULT ''::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    courses jsonb DEFAULT '{}'::jsonb,
    exercises jsonb DEFAULT '{}'::jsonb
);


ALTER TABLE public.accounts OWNER TO sandro;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO sandro;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO sandro;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO sandro;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO sandro;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO sandro;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO sandro;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO sandro;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO sandro;

--
-- Name: checkbox_exercises; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.checkbox_exercises (
    id bigint NOT NULL,
    content text DEFAULT ''::text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slide_id bigint
);


ALTER TABLE public.checkbox_exercises OWNER TO sandro;

--
-- Name: checkbox_exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.checkbox_exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkbox_exercises_id_seq OWNER TO sandro;

--
-- Name: checkbox_exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.checkbox_exercises_id_seq OWNED BY public.checkbox_exercises.id;


--
-- Name: checkboxes; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.checkboxes (
    id bigint NOT NULL,
    content text,
    checkbox_exercise_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    correct_answer character varying DEFAULT 'no'::character varying
);


ALTER TABLE public.checkboxes OWNER TO sandro;

--
-- Name: checkboxes_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.checkboxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkboxes_id_seq OWNER TO sandro;

--
-- Name: checkboxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.checkboxes_id_seq OWNED BY public.checkboxes.id;


--
-- Name: clozes; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.clozes (
    id bigint NOT NULL,
    content text DEFAULT ''::text,
    correct_answer text DEFAULT ''::text,
    slide_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    text text
);


ALTER TABLE public.clozes OWNER TO sandro;

--
-- Name: clozes_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.clozes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clozes_id_seq OWNER TO sandro;

--
-- Name: clozes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.clozes_id_seq OWNED BY public.clozes.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    content text,
    commentable_type character varying,
    commentable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO sandro;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO sandro;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: cost_benefit_analyses; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.cost_benefit_analyses (
    id bigint NOT NULL,
    slide_id bigint,
    content text DEFAULT ''::text,
    cost text DEFAULT ''::text,
    benefit text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cost_benefit_analyses OWNER TO sandro;

--
-- Name: cost_benefit_analyses_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.cost_benefit_analyses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cost_benefit_analyses_id_seq OWNER TO sandro;

--
-- Name: cost_benefit_analyses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.cost_benefit_analyses_id_seq OWNED BY public.cost_benefit_analyses.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    name character varying DEFAULT ''::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description text DEFAULT ''::text,
    "group" character varying DEFAULT ''::character varying,
    slug character varying
);


ALTER TABLE public.courses OWNER TO sandro;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO sandro;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO sandro;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO sandro;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    name character varying DEFAULT ''::character varying,
    alt_text text DEFAULT ''::text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.media OWNER TO sandro;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO sandro;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: open_questions; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.open_questions (
    id bigint NOT NULL,
    slide_id bigint,
    content text DEFAULT ''::text,
    correct_answer text DEFAULT ''::text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.open_questions OWNER TO sandro;

--
-- Name: open_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.open_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_questions_id_seq OWNER TO sandro;

--
-- Name: open_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.open_questions_id_seq OWNED BY public.open_questions.id;


--
-- Name: point_systems; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.point_systems (
    id bigint NOT NULL,
    total_possible_points integer,
    points_deduction_for_mistake integer,
    pointsystemable_type character varying,
    pointsystemable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.point_systems OWNER TO sandro;

--
-- Name: point_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.point_systems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.point_systems_id_seq OWNER TO sandro;

--
-- Name: point_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.point_systems_id_seq OWNED BY public.point_systems.id;


--
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.quiz_questions (
    id bigint NOT NULL,
    content text DEFAULT ''::text,
    correct_answer character varying DEFAULT 'no'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    quiz_id bigint
);


ALTER TABLE public.quiz_questions OWNER TO sandro;

--
-- Name: quiz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.quiz_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_questions_id_seq OWNER TO sandro;

--
-- Name: quiz_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.quiz_questions_id_seq OWNED BY public.quiz_questions.id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.quizzes (
    id bigint NOT NULL,
    content text DEFAULT ''::text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slide_id bigint
);


ALTER TABLE public.quizzes OWNER TO sandro;

--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizzes_id_seq OWNER TO sandro;

--
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.quizzes_id_seq OWNED BY public.quizzes.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO sandro;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO sandro;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO sandro;

--
-- Name: slides; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.slides (
    id bigint NOT NULL,
    content text DEFAULT ''::text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    course_id bigint,
    sort integer DEFAULT 0,
    save_progress character varying DEFAULT 'false'::character varying,
    course_complete character varying DEFAULT 'false'::character varying
);


ALTER TABLE public.slides OWNER TO sandro;

--
-- Name: slides_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slides_id_seq OWNER TO sandro;

--
-- Name: slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.slides_id_seq OWNED BY public.slides.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.user_roles (
    id bigint NOT NULL,
    role_id bigint,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_roles OWNER TO sandro;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO sandro;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: sandro
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO sandro;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sandro
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO sandro;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sandro
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: checkbox_exercises id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.checkbox_exercises ALTER COLUMN id SET DEFAULT nextval('public.checkbox_exercises_id_seq'::regclass);


--
-- Name: checkboxes id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.checkboxes ALTER COLUMN id SET DEFAULT nextval('public.checkboxes_id_seq'::regclass);


--
-- Name: clozes id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.clozes ALTER COLUMN id SET DEFAULT nextval('public.clozes_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: cost_benefit_analyses id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.cost_benefit_analyses ALTER COLUMN id SET DEFAULT nextval('public.cost_benefit_analyses_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: open_questions id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.open_questions ALTER COLUMN id SET DEFAULT nextval('public.open_questions_id_seq'::regclass);


--
-- Name: point_systems id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.point_systems ALTER COLUMN id SET DEFAULT nextval('public.point_systems_id_seq'::regclass);


--
-- Name: quiz_questions id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.quiz_questions ALTER COLUMN id SET DEFAULT nextval('public.quiz_questions_id_seq'::regclass);


--
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id SET DEFAULT nextval('public.quizzes_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: slides id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.slides ALTER COLUMN id SET DEFAULT nextval('public.slides_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.accounts (id, user_id, first_name, created_at, updated_at, courses, exercises) FROM stdin;
8	\N		2022-07-30 19:15:34.164698	2022-08-06 11:58:52.809771	{"5": {"history": ["29", "30", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "53", "52", "51", "50", "49", "48", "47", "46", "45", "44", "43", "42", "41", "40", "39", "38", "37", "36", "35", "34", "33", "32", "33", "34", "35", "36", "36"]}}	{"5": {"exercises": [{"id": "6", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "7", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "8", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "9", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}]}}
22	\N		2022-09-11 04:54:38.926034	2022-09-11 04:54:38.926034	{}	{}
23	\N		2022-09-15 12:53:41.218786	2022-09-15 12:53:41.218786	{}	{}
26	\N		2022-09-15 18:57:44.753709	2022-09-15 18:57:44.753709	{}	{}
3	\N		2022-07-15 07:59:28.941448	2022-07-15 07:59:42.125047	{"2": {"history": ["16", "10", "11", "17", "12", "17", "11", "10"]}}	{}
4	\N		2022-07-16 07:41:17.800521	2022-07-16 07:41:17.800521	{}	{}
5	\N		2022-07-22 06:43:01.566866	2022-07-22 06:44:58.288114	{"1": {"history": ["5", "1", "2", "3", "4", "6", "7", "8", "9"]}, "2": {"history": ["16"]}}	{}
28	\N		2022-09-17 09:16:14.696804	2022-09-17 09:16:37.206964	{"5": {"history": ["29", "30", "28", "31", "32", "33", "34", "35", "36"]}, "6": {"history": ["70", "71", "72", "71"]}, "7": {"history": ["114", "115", "114", "115", "116"]}}	{}
24	\N		2022-09-15 12:53:41.241316	2022-09-15 12:53:41.241316	{}	{}
25	\N		2022-09-15 12:53:41.255375	2022-09-15 12:53:41.255375	{}	{}
27	\N	Sandro	2022-09-16 10:16:52.959266	2022-09-17 11:49:56.490191	{"5": {"status": "completed", "history": ["29", "29", "5", "30", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "40", "39", "38", "37", "36", "9", "35", "34", "33", "32", "31", "28", "30", "29", "30", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "68", "29"]}}	{"5": {"exercises": [{"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "4", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "5", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "6", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "7", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "8", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "9", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "10", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "11", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "12", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "13", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "14", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "15", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "16", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "17", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "18", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "19", "class": "Quiz", "answer": "", "points_scored": 3}]}}
29	\N		2022-09-17 13:00:00.517995	2022-09-17 13:00:00.517995	{}	{}
30	\N		2022-09-17 15:43:22.174148	2022-09-17 15:43:22.174148	{}	{}
10	\N		2022-08-26 06:12:24.303589	2022-09-02 15:55:15.552979	{"1": {"history": ["9", "2", "1", "6", "7"]}, "2": {"history": ["16", "10", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "27", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16"]}, "5": {"history": ["29", "30", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "40", "39", "38", "37", "36", "35", "34", "33", "32", "33", "32", "31", "28", "28", "30", "29", "30", "29", "30", "28", "30", "29", "30", "28", "31", "32", "33", "34", "35", "36", "37", "28", "29", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "26", "40", "39", "38", "37", "38", "39", "40", "29"]}}	{"5": {"exercises": [{"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "4", "class": "Quiz", "answer": "", "points_scored": 1}, {"id": "5", "class": "Quiz", "answer": "", "points_scored": 1}, {"id": "6", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "7", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "8", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "9", "class": "Quiz", "answer": "", "points_scored": 1}]}}
11	\N		2022-08-27 09:31:06.370318	2022-08-27 09:32:59.632341	{"5": {"history": ["29", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "23", "24", "25", "29", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"]}}	{"5": {"exercises": [{"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "4", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "5", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "6", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "7", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "8", "class": "Quiz", "answer": "", "points_scored": 1}]}}
13	\N		2022-09-02 15:42:58.460514	2022-09-02 15:42:59.770489	{"5": {"history": ["29"]}}	{}
34	\N		2022-09-17 17:34:21.201551	2022-09-17 17:34:21.201551	{}	{}
1	1		2022-07-08 07:07:46.511478	2022-09-17 17:18:51.490029	{"1": {"history": ["5", "5", "1", "1", "5", "1", "5", "1", "2", "1", "2", "1", "1", "5", "1", "5", "1", "2", "3", "4", "3", "2", "1", "2", "3", "4", "7", "7", "6", "4", "3", "2", "1", "5", "1", "2", "3", "4", "6", "7", "8", "9", "8", "7", "6", "4"]}, "2": {"history": ["16", "16", "16", "16", "16", "16", "16", "16", "16", "16", "10", "16", "10", "10", "11", "10", "10", "11", "11", "12", "11", "12", "11", "12", "11", "11", "12", "11", "12", "11", "10", "16", "10", "16", "10", "11", "11", "11", "12", "12", "11", "10", "16", "10", "11", "12", "12", "11", "12", "12", "11", "12", "11", "17", "17", "17", "11", "17", "16", "10", "11", "10", "11", "17", "12", "17", "11", "11", "17", "16", "10", "11", "11", "11", "10", "11", "11", "17", "11", "11", "17", "11", "11", "17", "11", "17", "11", "17", "11", "17", "12", "17", "17", "11", "10", "10", "16", "16", "10", "11", "10", "16", "10", "11", "18", "19", "19", "18", "18", "19", "19", "19", "18", "19", "20", "21", "20", "19", "20", "20", "21", "20", "21", "21", "20", "21", "21", "22", "21", "21", "22", "22", "21", "20", "21", "22", "22", "22", "22", "22", "22", "23", "23", "23", "22", "21", "20", "19", "18", "18", "19", "20", "21", "22", "18", "19", "18", "19", "18", "13", "12", "12", "17", "11", "10", "10", "10", "16", "10", "18", "10", "18", "19", "19", "16", "20", "24", "20", "21", "22", "21", "22", "21", "21", "22", "22", "21", "20", "24", "19", "18", "19", "24", "20", "21", "22", "11", "17", "11", "17", "12", "13", "12", "17", "11", "11", "17", "11", "16", "10", "18", "19", "24", "20", "24", "20", "21", "21", "22", "21", "21", "22", "22", "21", "22", "22", "17", "22", "17", "17", "12", "12", "13", "12", "13", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "12", "13", "13", "23", "13", "23", "25", "25", "23", "23", "25", "23", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "12", "13", "25", "23", "23", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "18", "19", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "23", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "26", "27", "27", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "23", "26", "27", "27", "27", "26", "27", "16", "16", "16", "16", "10", "18", "19", "24", "20", "24", "19", "18", "10", "16", "16", "10", "16", "10", "16", "16", "10", "18", "19", "19", "24", "20", "24", "19", "18", "19", "24", "20", "21", "22", "22", "17", "12", "17", "12", "13", "25", "23", "25", "23", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "27", "26", "27", "26", "27", "26", "27", "26", "23", "26", "27", "26", "27", "26", "27", "27", "193", "193", "193", "27", "26", "23", "25", "13", "25", "23", "26", "26", "27", "193", "27", "27", "26", "27", "193", "27", "27", "26", "23", "26", "23", "26", "26", "27", "26", "26", "26", "26", "23", "23", "26", "23", "26", "23", "26", "23", "26", "23", "26", "27", "193", "27", "26", "23", "25", "23", "26", "27", "193", "23", "23", "26", "23", "26", "23", "26", "23", "23", "26", "26", "27", "26", "27", "193", "27", "26", "26", "27", "193", "193", "193", "193", "193", "193", "27", "193", "194", "194", "194", "194", "195", "195", "193", "27", "196", "196", "27", "195", "194", "193", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "16", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "193", "194", "195", "27", "196", "27", "195", "27", "196", "27", "195", "27", "196", "27", "195", "27", "196", "196", "197", "198", "198", "197", "196", "27", "196", "197", "198", "197", "196", "27", "27", "16", "10", "16", "10", "18", "10", "18", "19", "18", "19", "24", "20"]}, "5": {"history": ["28", "29", "29", "28", "29", "29", "28", "29", "28", "29", "29", "29", "29", "28", "29", "29", "29", "28", "29", "29", "28", "29", "28", "29", "28", "29", "29", "28", "29", "28", "29", "28", "29", "29", "28", "29", "28", "29", "30", "28", "29", "28", "30", "30", "28", "30", "29", "30", "29", "30", "29", "30", "29", "30", "29", "30", "30", "28", "31", "31", "31", "31", "28", "31", "28", "30", "29", "30", "29", "30", "28", "30", "30", "28", "31", "32", "33", "34", "35", "36", "36", "36", "36", "36", "37", "37", "37", "37", "37", "38", "38", "38", "38", "38", "38", "39", "40", "41", "42", "43", "43", "44", "45", "46", "46", "46", "46", "45", "44", "45", "46", "46", "45", "44", "44", "45", "46", "45", "44", "43", "44", "43", "42", "41", "42", "42", "43", "43", "42", "41", "40", "39", "38", "37", "36", "37", "38", "39", "40", "41", "42", "41", "40", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "50", "50", "50", "51", "51", "51", "51", "52", "52", "52", "52", "52", "52", "52", "52", "51", "50", "49", "50", "51", "52", "53", "52", "53", "53", "53", "53", "52", "53", "52", "53", "52", "53", "53", "52", "53", "52", "51", "52", "53", "52", "53", "52", "53", "53", "53", "54", "53", "54", "53", "52", "51", "50", "49", "50", "50", "50", "50", "51", "51", "51", "52", "52", "52", "53", "54", "53", "53", "53", "52", "51", "50", "49", "48", "47", "46", "45", "44", "43", "42", "41", "40", "39", "38", "37", "36", "35", "36", "35", "34", "35", "53", "53", "53", "54", "53", "54", "53", "52", "51", "50", "49", "50", "51", "52", "53", "52", "51", "52", "53", "54", "53", "52", "51", "51", "52", "53", "54", "53", "54", "53", "54", "54", "53", "54", "54", "54", "53", "54", "54", "54", "55", "55", "56", "57", "58", "59", "60", "60", "61", "60", "61", "60", "61", "60", "61", "60", "61", "60", "59", "60", "61", "62", "62", "62", "63", "62", "63", "63", "63", "63", "63", "64", "64", "64", "65", "65", "65", "66", "66", "66", "67", "66", "65", "64", "63", "64", "65", "66", "67", "67", "67", "67", "68", "69", "68", "67", "66", "66", "65", "65", "64", "63", "62", "61", "60", "59", "58", "57", "56", "55", "54", "53", "52", "51", "50", "49", "49", "48", "47", "46", "45", "44", "43", "42", "41", "40", "39", "38", "37", "36", "35", "34", "33", "32", "31", "28", "30", "29", "30", "28", "31", "31", "32", "33", "34", "34", "35", "36", "36", "36", "37", "37", "37", "38", "38", "38", "39", "38", "37", "38", "39", "39", "40", "41", "41", "41", "42", "43", "43", "44", "45", "46", "45", "45", "46", "47", "48", "49", "48", "47", "47", "48", "49", "50", "50", "50", "50", "51", "51", "51", "52", "51", "52", "51", "51", "52", "52", "52", "53", "53", "52", "53", "54", "53", "53", "54", "54", "55", "54", "55", "55", "55", "56", "56", "56", "56", "57", "57", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "29", "30", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "67", "67", "68", "69", "68", "68", "67", "68", "68", "68", "69", "68", "29", "5", "5", "30", "28", "31", "32", "33", "34", "35", "36", "35", "36", "35", "36", "35", "36", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44"]}, "6": {"history": ["70", "70", "70", "70", "70", "71", "71", "72", "73", "74", "74", "74", "73", "74", "74", "74", "73", "72", "73", "74", "74", "74", "73", "74", "75", "75", "75", "75", "76", "76", "76", "77", "77", "77", "77", "77", "78", "79", "80", "81", "82", "83", "82", "83", "82", "83", "84", "85", "86", "85", "84", "83", "84", "84", "85", "84", "83", "82", "83", "84", "85", "85", "86", "85", "86", "85", "84", "83", "82", "83", "84", "85", "86", "86", "85", "86", "85", "84", "83", "84", "84", "85", "85", "86", "86", "86", "87", "88", "88", "88", "88", "88", "88", "88", "87", "88", "89", "89", "89", "90", "90", "90", "90", "91", "92", "92", "91", "92", "93", "93", "93", "93", "93", "93", "93", "94", "95", "96", "97", "96", "95", "94", "95", "96", "97", "96", "95", "96", "96", "97", "98", "98", "98", "98", "99", "100", "101", "102", "103", "104", "104", "104", "104", "105", "105", "105", "105", "106", "106", "106", "106", "107", "108", "108", "108", "108", "109", "109", "109", "110", "110", "111", "111", "112", "113", "113", "113", "113", "113", "113", "113", "113", "112", "113", "111", "113", "112", "113", "111", "113", "112", "112", "111", "112", "113", "112", "111", "112", "111", "112", "113", "113", "112", "70", "5", "71", "72", "73", "74", "75", "6", "76", "75", "76", "75", "6", "6", "6"]}, "7": {"status": "completed", "history": ["114", "114", "115", "116", "117", "118", "118", "118", "119", "119", "119", "119", "120", "120", "120", "121", "121", "121", "121", "122", "123", "124", "125", "126", "126", "127", "128", "129", "128", "127", "128", "129", "129", "128", "129", "130", "130", "130", "131", "131", "131", "131", "132", "132", "132", "132", "133", "133", "133", "133", "134", "135", "136", "136", "137", "138", "139", "140", "141", "141", "141", "141", "141", "142", "143", "144", "145", "145", "146", "146", "146", "146", "147", "147", "148", "149", "149", "149", "148", "147", "146", "145", "144", "143", "142", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "151", "65", "5", "114", "114"]}, "9": {"status": "completed", "history": ["152", "152", "153", "154", "155", "156", "156", "156", "157", "157", "157", "157", "157", "156", "155", "154", "155", "154", "155", "156", "157", "158", "158", "158", "159", "159", "159", "159", "160", "161", "162", "162", "163", "163", "164", "165", "165", "166", "167", "168", "169", "169", "169", "169", "170", "170", "169", "170", "171", "171", "171", "171", "171", "172", "173", "174", "175", "175", "175", "175", "176", "177", "178", "179", "180", "180", "180", "180", "181", "181", "181", "181", "182", "183", "184", "185", "186", "186", "186", "186", "187", "187", "187", "187", "188", "189", "189", "189", "189", "190", "190", "190", "190", "191", "191", "192", "68", "191", "190", "191", "190", "152", "152", "153", "154", "155", "156", "157", "158", "152", "67", "190", "66", "152", "5", "5", "67", "152"]}}	{"5": {"exercises": [{"id": "9", "class": "Quiz", "answer": "", "points_scored": 3}]}, "6": {"exercises": [{"id": "22", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "2", "class": "CheckboxExercise", "answer": "", "points_scored": 2}, {"id": "25", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "3", "class": "CheckboxExercise", "answer": "", "points_scored": 3}, {"id": "26", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "27", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "28", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "29", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "30", "class": "Quiz", "answer": "", "points_scored": 1}, {"id": "31", "class": "Quiz", "answer": "", "points_scored": 3}]}, "7": {"exercises": [{"id": "4", "class": "CheckboxExercise", "answer": "", "points_scored": 3}, {"id": "1", "class": "Cloze", "answer": "", "points_scored": 2}]}, "9": {"exercises": [{"id": "42", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "43", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "44", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "45", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "6", "class": "CheckboxExercise", "answer": "", "points_scored": 3}, {"id": "49", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "51", "class": "Quiz", "answer": "", "points_scored": 3}]}}
35	\N		2022-09-17 17:39:03.736639	2022-09-17 17:39:03.736639	{}	{}
36	\N		2022-09-17 17:47:27.074514	2022-09-17 17:47:27.074514	{}	{}
37	\N		2022-09-17 17:53:16.759452	2022-09-17 17:53:16.759452	{}	{}
38	\N		2022-09-17 17:53:18.793777	2022-09-17 17:53:18.793777	{}	{}
39	\N		2022-09-17 18:21:49.949865	2022-09-17 18:21:49.949865	{}	{}
40	\N		2022-09-17 18:36:23.448171	2022-09-17 18:36:23.448171	{}	{}
41	\N		2022-09-17 18:39:07.337037	2022-09-17 18:39:07.337037	{}	{}
42	\N		2022-09-17 18:46:44.257686	2022-09-17 18:46:44.257686	{}	{}
21	\N		2022-09-10 00:16:35.960721	2022-09-17 18:55:33.986653	{"6": {"history": ["70"]}, "7": {"history": ["114", "115", "116", "117", "118", "119", "118", "119", "118"]}}	{}
9	\N		2022-08-06 11:59:40.014189	2022-09-09 18:24:04.002865	{"1": {"history": ["7", "6", "4", "3", "2", "1", "5", "1", "2", "1", "5", "5", "1", "2", "3", "4", "6", "7", "8", "9"]}, "2": {"history": ["16", "16", "10", "16", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "27", "193", "27", "26", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "18", "19", "24", "20", "21", "22", "21", "22", "21", "22", "21", "22", "17", "12", "13", "25", "23", "25", "23", "26", "23", "26", "23", "25", "23", "26", "23", "25", "23", "26", "23", "26", "27", "193", "27", "26", "23", "26", "23", "26", "27", "26", "23", "25", "13", "25", "23", "26", "27", "26", "27", "193", "27", "26", "23", "26", "27", "193", "27", "193", "26", "27", "193", "194", "193", "27", "26", "27", "193", "194", "26", "27", "193", "194", "194", "194", "26", "23", "25", "23", "26", "194", "26", "194", "195", "27", "195", "194", "26", "194", "195", "194", "26", "23", "25", "23", "26", "194", "195", "27", "195", "194", "26", "194", "195", "27", "195", "194", "26", "23", "25", "13", "12", "17", "12", "13", "25", "23", "26", "194", "195", "27", "195", "194", "26", "26", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "193", "26", "193", "194", "195", "194", "193", "26", "193", "194", "195", "27", "27", "196", "27", "195", "194", "193", "26", "23", "25", "23", "26", "193", "194", "195", "194", "193", "26", "27"]}, "5": {"history": ["29", "30", "28", "31", "28", "30", "29", "30", "29", "30", "28", "31", "28", "31", "28", "30", "29", "30", "28", "31", "28", "30", "29", "30", "28", "31", "28", "31", "32", "33", "34", "35", "36", "35", "34", "33", "32", "31", "28", "30", "28", "31", "32", "33", "34", "35", "36", "37", "36", "35", "36", "37", "38", "39", "38", "37", "36", "35", "36", "37", "38", "39", "40", "39", "38", "39", "40", "39", "40", "41", "40", "41", "42", "43", "44", "45", "44", "45", "46", "47", "46", "47", "48", "49", "50", "49", "50", "49", "48", "47", "46", "45", "44", "43", "42", "41", "40", "39", "38", "37", "36", "35", "34", "33", "32", "31", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "52", "51", "52", "51", "52", "51", "52", "53", "52", "53", "54", "53", "54", "55", "54", "55", "54", "55", "56", "55", "56", "57", "58", "59", "60", "61", "62", "63", "62", "63", "64", "65", "64", "65", "66", "67", "68", "69", "68", "69", "68", "68", "67", "66", "65", "64", "63", "62", "61", "62", "63", "64", "65", "66", "67", "68", "69", "68"]}, "7": {"history": ["114", "115", "116", "117", "118", "119", "114", "115", "116", "117", "118", "119", "120", "121", "120", "119", "120", "121", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "140", "139", "138", "137", "138", "139", "140", "141"]}}	{"5": {"exercises": [{"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "4", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "5", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "9", "class": "Quiz", "answer": "", "points_scored": 3}]}, "7": {"exercises": [{"id": "32", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "33", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "35", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "36", "class": "Quiz", "answer": "", "points_scored": 3}]}}
16	\N		2022-09-09 15:57:28.719721	2022-09-09 15:58:28.045782	{"2": {"history": ["16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13"]}}	{}
17	\N		2022-09-09 16:14:43.99602	2022-09-16 12:23:53.585103	{"5": {"history": ["29", "30", "28", "30", "28", "30", "28", "31", "28", "31", "32"]}, "6": {"history": ["70", "71", "72", "71", "1"]}, "7": {"history": ["114", "115", "114"]}}	{}
14	\N		2022-09-02 15:44:00.995426	2022-09-02 15:57:54.0334	{"5": {"history": ["29", "30", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "50", "51", "52", "53", "54", "55", "56", "57", "56", "57", "58", "59", "60", "61", "60", "61", "62", "63", "64", "65", "66", "65", "66", "67", "66", "67", "68"]}}	{"5": {"exercises": [{"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "4", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "5", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "6", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "7", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "8", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "9", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "10", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "11", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "12", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "13", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "14", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "15", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "16", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "17", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "18", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "19", "class": "Quiz", "answer": "", "points_scored": 1}]}}
18	\N		2022-09-09 16:17:28.036371	2022-09-09 16:17:38.595981	{"2": {"history": ["16", "10", "18", "19", "18", "10"]}}	{}
19	\N		2022-09-09 16:18:13.438687	2022-09-09 16:18:13.438687	{}	{}
20	\N		2022-09-09 16:19:22.633877	2022-09-09 16:19:45.617079	{"2": {"history": ["16", "10", "18", "10", "18", "19", "24", "20", "24", "20", "21", "22", "17", "12", "17"]}}	{}
7	\N		2022-07-23 21:02:19.68971	2022-09-03 09:18:00.005014	{"1": {"history": ["2", "7", "4", "3", "1", "6", "8"]}, "2": {"history": ["16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "26", "27", "26", "27"]}, "5": {"history": ["29", "30", "28", "31", "32", "33", "34", "35", "36", "37"]}, "6": {"history": ["70"]}}	{"5": {"exercises": [{"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}]}}
2	\N		2022-07-08 07:56:36.557928	2022-09-03 15:02:45.509214	{"1": {"history": ["1", "5", "9", "7", "2", "6", "2", "3", "6", "9"]}, "2": {"history": ["16", "16", "16", "10", "16", "10", "16", "10", "10", "11", "17"]}, "5": {"history": ["31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "31", "28", "31", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "28", "28", "29", "1", "0", "1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "23", "24", "25", "26", "27", "28", "29", "30", "28", "31", "32", "33", "34", "33", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "59", "60", "59", "60", "61", "62", "63", "62", "63", "64", "63", "64", "65", "29", "29", "30", "28", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "54", "55", "56", "57", "58", "57", "58", "59", "60", "61", "62", "63", "29", "29", "30", "28", "30", "28", "30", "28", "31", "28", "31", "32", "33", "34", "35", "36", "37", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "50", "51", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "68", "67"]}, "6": {"history": ["70", "71", "72", "73", "72", "71", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "84", "83", "84", "85"]}}	{"1": {"exercises": [{"id": "1", "class": "Quiz", "answer": "", "points_scored": 0}]}, "5": {"exercises": [{"id": "4", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "5", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "6", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "3", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "7", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "8", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "9", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "11", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "15", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "13", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "14", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "10", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "12", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "16", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "17", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "18", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "19", "class": "Quiz", "answer": "", "points_scored": 2}]}}
15	\N		2022-09-03 09:18:22.808806	2022-09-03 09:18:22.808806	{}	{}
6	\N		2022-07-22 14:50:46.836492	2022-08-27 14:07:48.076253	{"2": {"history": ["16", "10", "18", "19", "21", "20", "21", "19", "20", "19", "20", "19", "20", "19", "19", "20", "16", "10", "18", "19", "18", "19", "18", "19", "16", "10", "18", "19", "24", "20", "21", "20", "24", "20", "21", "20", "21", "22", "21", "20", "21", "22", "11", "17", "12", "13", "23", "13", "12", "17", "11", "22", "21", "20", "21", "22", "21", "20", "24", "24", "24", "19", "19", "19", "19", "18", "18", "18", "18", "18", "10", "10", "10", "10", "10", "10", "16", "16", "16", "16", "10", "18", "10", "18", "19", "24", "20", "21", "22", "11", "17", "11", "22", "11", "17", "12", "13", "23", "13", "12", "17", "11", "22", "21", "20", "24", "19", "18", "10", "16", "10", "18", "19", "24", "20", "21", "22", "17", "12", "13", "12", "17", "22", "17", "12", "13", "12", "17", "22", "21", "20", "24", "19", "18", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "23", "25", "23", "25", "13", "12", "13", "25", "13", "12", "17", "22", "21", "20", "24", "19", "24", "20", "21", "22", "17", "12", "13", "25", "23", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "16", "10", "18", "19", "18", "19", "24", "20", "24", "20", "21", "22", "17", "12", "13", "25", "23", "23", "25", "23", "26", "23", "25", "25", "13", "12", "17", "22", "21", "20", "24", "19", "18", "10", "16", "10", "16", "10", "18", "19", "24", "20", "21", "22", "17", "22", "17", "12", "13", "12", "13", "25", "23", "25", "13", "25", "23", "26"]}, "5": {"history": ["29", "30", "28", "30", "29", "30", "29", "30", "28", "30", "29", "30", "28", "30", "28", "30", "28", "31", "31", "32", "31", "31", "32", "33", "32", "31", "32", "33", "32", "33", "34", "35", "34", "35", "36", "31", "32", "33", "34", "35", "36", "31", "32", "33", "34", "35", "36", "37", "36", "37", "36", "37", "36", "37", "31", "32", "33", "34", "35", "36", "37", "36", "37", "38", "37", "38", "37", "38", "37", "36", "37", "38", "37", "38", "37", "38", "37", "36", "35", "36", "37", "38", "37", "38", "37", "38", "37", "38", "37", "38", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "45", "46", "45", "44", "43", "44", "45", "44", "45", "46", "45", "46", "45", "46", "47", "48", "49", "50", "49", "50", "49", "50", "51", "52", "51", "52", "51", "52", "51", "51", "31", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "52", "53", "31", "32", "33", "33", "33", "34", "33", "34", "34", "34", "34", "34", "35", "35", "35", "35", "35", "35", "35", "36", "36", "36", "36", "36", "36", "36", "37", "37", "37", "37", "37", "37", "37", "37", "38", "38", "38", "38", "38", "38", "39", "39", "39", "39", "39", "39", "40", "40", "40", "40", "40", "40", "40", "40", "40", "41", "41", "41", "41", "41", "41", "41", "42", "42", "42", "42", "42", "42", "42", "42", "42", "42", "42", "43", "43", "43", "43", "43", "44", "43", "43", "44", "44", "44", "44", "44", "44", "44", "44", "44", "44", "45", "45", "42", "44", "42", "43", "42", "42", "44", "42", "41", "34", "39", "34", "35", "38", "35", "38", "35", "38", "35", "38", "37", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "52", "53", "53", "54", "53", "52", "51", "52", "52"]}}	{"5": {"exercises": [{"id": "3", "class": "Quiz", "points_scored": 1}, {"id": "4", "class": "Quiz", "points_scored": 1}, {"id": "5", "class": "Quiz", "points_scored": 3}, {"id": "9", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "7", "class": "Quiz", "answer": "", "points_scored": 3}]}}
31	\N		2022-09-17 16:48:30.832609	2022-09-17 16:48:30.832609	{}	{}
32	\N		2022-09-17 17:06:38.759935	2022-09-17 17:06:38.759935	{}	{}
33	\N		2022-09-17 17:21:49.262755	2022-09-17 17:21:49.262755	{}	{}
43	\N		2022-09-17 18:49:01.678021	2022-09-17 18:52:14.423807	{"6": {"history": ["70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "90", "91", "90", "91", "92", "93", "94", "93"]}, "7": {"history": ["4", "119", "118", "119", "120", "121", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "129", "130", "129", "130", "131", "132", "133", "132", "133", "134", "135", "134", "135", "134", "135", "136", "137", "138", "139", "53", "140", "139", "140", "141", "140", "139", "138", "137"]}}	{"6": {"exercises": [{"id": "24", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "25", "class": "Quiz", "answer": "", "points_scored": 2}]}, "7": {"exercises": [{"id": "36", "class": "Quiz", "answer": "", "points_scored": 2}, {"id": "37", "class": "Quiz", "answer": "", "points_scored": 3}, {"id": "38", "class": "Quiz", "answer": "", "points_scored": 3}]}}
44	\N		2022-09-17 18:55:41.156627	2022-09-17 18:56:00.302986	{"6": {"history": ["70", "70"]}}	{}
45	\N		2022-09-17 18:57:31.997145	2022-09-17 18:57:31.997145	{}	{}
46	\N		2022-09-17 19:09:07.800366	2022-09-17 19:09:07.800366	{}	{}
47	\N		2022-09-17 19:14:15.580954	2022-09-17 19:14:15.580954	{}	{}
48	\N		2022-09-17 19:14:15.810548	2022-09-17 19:14:15.810548	{}	{}
49	\N		2022-09-17 19:15:39.217856	2022-09-17 19:15:39.217856	{}	{}
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
12	image	Course	6	12	2022-09-03 07:43:41.302163
14	image	Course	2	14	2022-09-09 12:51:18.96657
15	medal_image	Course	7	15	2022-09-17 11:50:49.947202
6	image	Course	1	6	2022-06-02 21:16:46.576011
8	image	Course	3	8	2022-06-03 09:03:44.013617
9	image	Course	4	9	2022-06-03 09:06:16.475991
10	file	Medium	1	10	2022-07-08 07:14:00.53382
11	image	Course	5	11	2022-07-29 06:50:19.146218
16	image	Course	9	16	2022-09-17 16:56:18.408462
18	image	Course	7	18	2022-09-17 17:02:48.409034
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
12	nfgl86auaomxwyq4px0ki621xa0v	domino-12cfe676cbdece28fd8979f56c6cf97f385743c9e6196f204f3bf07a6936ff63.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	153437	ynOzMW4OeH1p5f7xHjOyOA==	2022-09-03 07:43:41.297016
14	i9k9le1pbrjei6a1ldec1f7rplzj	markus-spiske-dYZumbs8f_E-unsplash.webp	image/webp	{"identified":true,"analyzed":true}	amazon	37512	HCbq2haosy5/tb2Ad6oc7g==	2022-09-09 12:51:18.938237
15	irtpsd59g5s9vlonq0sn4low82x9	Screenshot_20220805_110902.png	image/png	{"identified":true,"analyzed":true}	amazon	1120	Tirzk618euQKpox93qo3qw==	2022-09-17 11:50:49.941368
6	7u9gssea8s81q36xvk1j9c4eo7b7	markus-spiske-dYZumbs8f_E-unsplash.webp	image/webp	{"identified":true,"analyzed":true}	amazon	37512	HCbq2haosy5/tb2Ad6oc7g==	2022-06-02 21:16:46.574164
8	1hw9oyc9ismpjabn0bi18uh19tgx	benjamin-davies-JrZ1yE1PjQ0-unsplash.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	57221	KR6xlhAdgTRN33psv2/kxQ==	2022-06-03 09:03:44.011361
9	k0lw3yss1ka4tafv1fu0p3lhr967	benjamin-davies-JrZ1yE1PjQ0-unsplash.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	57221	KR6xlhAdgTRN33psv2/kxQ==	2022-06-03 09:06:16.473879
10	jbx3rhnu8wuqehh8x1cgqfupbs8p	markus-spiske-dYZumbs8f_E-unsplash.webp	image/webp	{"identified":true,"analyzed":true}	amazon	37512	HCbq2haosy5/tb2Ad6oc7g==	2022-07-08 07:14:00.526788
11	zee08g6x4etb6e3rpoh88qe8f51a	hamster.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	276104	m4SbfN/eMu3S8fa2+JxG0g==	2022-07-29 06:50:19.144516
16	aa58w1aktg3x60st8m5wjc4bp5hc	Kopf_des_Aristoteles_1.jpg	image/jpeg	{"identified":true,"width":682,"height":599,"analyzed":true}	amazon	48540	E5aZ4EOlDKN6UXWgOxqF2w==	2022-09-17 16:56:18.405559
18	utiulakcaxahrepk3ihw3my7b2sg	vackground-up8ooQ1Pm2s-unsplash (1).jpg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	amazon	40804	gEPnevoP4yYpZbl09OAJ9Q==	2022-09-17 17:02:48.407186
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2022-05-18 07:15:07.978556	2022-05-18 07:15:07.978556
\.


--
-- Data for Name: checkbox_exercises; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.checkbox_exercises (id, content, created_at, updated_at, slide_id) FROM stdin;
2	<p class="text-center"><strong>Kreuze</strong>&nbsp;nun diese Grundmerkmale an!</p>	2022-09-03 08:51:28.692037	2022-09-03 08:51:28.692037	88
3	<p class="text-center"><strong>Kreuze</strong>&nbsp;die richtigen Eigenschaften an!</p>\n<p>Eine&nbsp;<strong>brauchbare Definition von Gl&uuml;ck</strong>&nbsp;...</p>	2022-09-03 09:21:21.598006	2022-09-03 09:21:21.598006	93
4	<p><strong>Kreuze</strong>&nbsp;nun diese Grundmerkmale an!</p>	2022-09-03 13:25:56.532445	2022-09-03 13:25:56.532445	136
5	<p>"Die Zeugen Jehovas sind eine Religionsgemeinschaft. Sie lehnen die Bluttransfusion aus religi&ouml;sen Gr&uuml;nden ab. Sie w&uuml;rden lieber sterben, als das Blut von anderen Menschen anzunehmen. Soll ein Arzt einen Zeugen Jehovas verbluten lassen oder ihn gegen seinen Wunsch behandeln und Blut geben?"</p>	2022-09-03 13:40:32.738951	2022-09-03 13:40:32.738951	147
6	<p class="text-center"><strong>Kreuze</strong>&nbsp;nun diese Grundmerkmale an!</p>	2022-09-03 16:50:22.367777	2022-09-03 16:50:22.367777	175
\.


--
-- Data for Name: checkboxes; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.checkboxes (id, content, checkbox_exercise_id, created_at, updated_at, correct_answer) FROM stdin;
1	Der Utilitarismus bewertet die Folgen oder Konsequenzen danach, wie viel Geld oder Reichtum sie bringen.	2	2022-09-03 08:52:01.291109	2022-09-03 08:52:01.291109	no
2	Der Utilitarismus bewertet Handlungen im Bezug auf die Person, die die Handlungen vollzieht.	2	2022-09-03 08:52:39.241571	2022-09-03 08:52:39.241571	no
3	Der Utilitarismus achtet auf den Gesamtnutzen.	2	2022-09-03 08:53:05.2751	2022-09-03 08:53:05.2751	yes
4	Der Utilitarismus achtet auf den Nutzen aller Männer, die älter als 30 sind.	2	2022-09-03 08:53:25.615351	2022-09-03 08:53:25.615351	no
5	Der Utilitarismus bewertet die Folgen oder Konsequenzen danach, wie viel Nutzen sie bringen.	2	2022-09-03 08:53:46.698062	2022-09-03 08:53:46.698062	yes
6	Der Utilitarismus bewertet Handlungen im Bezug auf ihre Folgen oder Konsequenzen.	2	2022-09-03 08:53:59.730586	2022-09-03 08:53:59.730586	yes
7	... muss so lange und so kompliziert wie nur möglich sein.	3	2022-09-03 09:21:56.040569	2022-09-03 09:21:56.040569	no
8	... muss angeben, was Glück und was das Gegenteil von Glück ist.	3	2022-09-03 09:22:12.051304	2022-09-03 09:22:12.051304	yes
9	... muss erklären, wie man Glück messen kann.	3	2022-09-03 09:22:30.056396	2022-09-03 09:22:30.056396	yes
10	... muss mindestens drei Fremdwörter beinhalten.	3	2022-09-03 09:22:46.348239	2022-09-03 09:22:46.348239	no
11	... muss angeben, was glücklich und was unglücklich macht.	3	2022-09-03 09:23:07.138192	2022-09-03 09:23:07.138192	yes
12	... muss Bilder von glücklichen Menschen zeigen.	3	2022-09-03 09:23:25.956488	2022-09-03 09:23:25.956488	no
13	Der Kantianismus bewertet Handlungen danach, ob man sie auch dann wollen kann, wenn alle sie tun würden.	4	2022-09-03 13:26:11.135932	2022-09-03 13:26:11.135932	yes
14	Der Kantianismus stellt Regeln oder Pflichten auf, die jeder immer und in jeder Situation befolgen muss.	4	2022-09-03 13:26:27.859865	2022-09-03 13:26:27.859865	yes
15	Der Kantianismus beurteilt eine Handlung an sich.	4	2022-09-03 13:27:13.962919	2022-09-03 13:27:13.962919	yes
16	Der Kantianismus stellt Regeln und Pflichten auf, die man befolgen kann, wenn man grad Lust drauf hat.	4	2022-09-03 13:27:27.305841	2022-09-03 13:27:27.305841	no
17	Der Kantianismus beurteilt nicht Handlungen, sondern Charaktereigenschaften.	4	2022-09-03 13:27:37.343059	2022-09-03 13:27:37.343059	no
18	Der Kantianismus bewertet Handlungen im Bezug auf ihre Folgen oder Konsequenzen.	4	2022-09-03 13:27:47.283769	2022-09-03 13:27:47.283769	no
19	Die Pflicht, Patienten die Wahrheit zu sagen.	5	2022-09-03 13:41:17.788253	2022-09-03 13:41:17.788253	no
20	Die Pflicht, Patienten nicht sterben zu lassen.	5	2022-09-03 13:41:44.569474	2022-09-03 13:41:44.569474	yes
21	Die Pflicht, die Wünsche der Patienten zu respektieren. 	5	2022-09-03 13:41:56.26105	2022-09-03 13:41:56.26105	yes
22	Die Pflicht, Patienten nicht für wissenschaftliche Forschung zu missbrauchen.	5	2022-09-03 13:42:19.976907	2022-09-03 13:42:19.976907	no
24	Für die aristotelische Ethik sind Laster notwendig für ein gutes und glückliches Leben.	6	2022-09-03 16:51:01.023693	2022-09-03 16:51:01.023693	no
25	Die aristotelische Ethik bestimmt die Tugend als eine extreme Charaktereigenschaft.	6	2022-09-03 16:51:18.291838	2022-09-03 16:51:18.291838	no
26	Die aristotelische Ethik bestimmt die Tugend als das Mittlere zwischen zwei Extremen.	6	2022-09-03 16:51:33.638883	2022-09-03 16:51:33.638883	yes
27	Für die aristotelische Ethik sind Tugenden notwendig für ein gutes und glückliches Leben.	6	2022-09-03 16:51:59.382187	2022-09-03 16:51:59.382187	yes
28	Die aristotelische Ethik beurteilt eine Handlung an sich.	6	2022-09-03 16:52:22.733329	2022-09-03 16:52:22.733329	no
23	Die aristotelische Ethik beurteilt Charaktereigenschaften.	6	2022-09-03 16:50:36.536108	2022-09-03 16:52:42.970285	yes
\.


--
-- Data for Name: clozes; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.clozes (id, content, correct_answer, slide_id, created_at, updated_at, text) FROM stdin;
1	<p><strong>Versuche die L&uuml;cken richtig auszuf&uuml;llen!</strong></p>\n<p>&nbsp;</p>	wollen\nalle	149	2022-09-03 13:47:13.340369	2022-09-03 13:47:13.340369	"Ethisch richtiges Handeln bedeutet nach Kant nicht, dass man blind und ohne zu Hinterfragen die Befehle der Vorgesetzten ausführt.\n\nEthisch richtiges Handeln bedeutet, nur die Handlungen auszuführen, von denen man\n\n[0]\n\nkann, dass alle sie ausführen würden.\n\nDa man nicht wollen kann, dass\n\n[1]\n\neinen Mord ausführen, war es auch falsch von Eichmann, Befehle auszuführen, die zu einem Mord führten."
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.comments (id, content, commentable_type, commentable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cost_benefit_analyses; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.cost_benefit_analyses (id, slide_id, content, cost, benefit, created_at, updated_at) FROM stdin;
1	111				2022-09-03 10:51:47.400611	2022-09-03 10:51:47.400611
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.courses (id, name, created_at, updated_at, description, "group", slug) FROM stdin;
6	Konsequentialismus	2022-09-03 07:43:41.281717	2022-09-03 07:43:41.307262	Darf man etwas Schlimmes tun, um etwas Gutes zu erreichen? Sollen wir Handlungen danach beurteilen, wie viel Glück sie in die Welt bringen? Heiligt der Zweck die Mittel?	ethik	konsequentialismus
1	Klimagerechtigkeit	2022-05-18 07:17:54.197706	2022-06-02 21:16:46.577737	Wer trägt die Verantwortung für den Klimawandel? Wer darf wie viel CO2 ausstossen? Dürfen wir alle fossilen Brennstoffen aufbrauchen oder sollten wir noch etwas für die nächsten Generationen übrig lassen?		\N
5	Einführung in die Ethik	2022-07-29 06:50:19.125584	2022-09-16 12:24:38.1083	In diesem Einführungskurs lernst du die wichtigsten Theorien, Begriffe und Argumente der Ethik kennen!	ethik	einfuehrung-in-die-ethik
2	1. Was hat Klimawandel mit Gerechtigkeit zu tun?	2022-06-03 08:45:08.631134	2022-09-16 12:27:11.717397	Warum ergibt sich aus dem Klimawandel eine gerechtigkeits-theoretische begründete Verantwortung	klimagerechtigkeit	was-hat-klimawandel-mit-gerechtigkeit-zu-tun
3	Warum schulden wir künftigen Generationen etwas?	2022-06-03 09:03:44.000751	2022-06-03 09:03:44.015631	Zukunftsverantwortung		\N
4	Was schulden wir künftigen Generationen?	2022-06-03 09:06:16.459504	2022-06-03 09:06:16.477875	Zukunftsverantwortung (2)		\N
9	Tugendethik	2022-09-03 14:52:05.163653	2022-09-17 16:56:18.410129	Was für eine Person soll ich sein? Welche Charaktereigenschaften sind gut und welche schlecht? Gibt es so was wie ein gutes Leben?	ethik	tugendethik
7	Deontologie	2022-09-03 12:49:08.890893	2022-09-17 17:02:48.410661	Soll man seine Versprechen immer halten? Ist Lügen auch dann schlecht, wenn man gute Absichten hat? Gibt es Regeln, die wir immer befolgen sollten?	ethik	deontologie
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.media (id, name, alt_text, created_at, updated_at) FROM stdin;
1	Climate Justice Now	Climate Justice Now	2022-07-08 07:14:00.488994	2022-07-08 07:14:00.540191
\.


--
-- Data for Name: open_questions; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.open_questions (id, slide_id, content, correct_answer, created_at, updated_at) FROM stdin;
1	130	<p class="ml-3"><em>Handle nur nach derjenigen Maxime, durch die du zugleich wollen kannst, dass sie ein allgemeines Gesetz werde.</em></p>\n<p>&nbsp;</p>\n<div class="input-group input-group-lg mb-3">&nbsp;</div>	kategorischer Imperativ\nkategorische Imperativ\nkategorisch Imperativ	2022-09-03 13:14:14.309295	2022-09-03 13:14:14.309295
2	170	<p class="text-center">Wie nennt Aristoteles dieses h&ouml;chste Gut oder letztendliches Ziel?</p>	Eudaimonia	2022-09-03 16:45:43.834151	2022-09-03 16:45:43.834151
\.


--
-- Data for Name: point_systems; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.point_systems (id, total_possible_points, points_deduction_for_mistake, pointsystemable_type, pointsystemable_id, created_at, updated_at) FROM stdin;
1	3	1	CheckboxExercise	1	2022-07-22 09:14:17.692584	2022-07-22 09:14:17.692584
2	3	1	Quiz	3	2022-07-29 09:50:07.98182	2022-07-29 09:50:07.98182
3	3	1	Quiz	4	2022-07-29 10:53:16.574723	2022-07-29 10:53:16.574723
4	3	1	Quiz	5	2022-07-29 11:11:44.550884	2022-07-29 11:11:44.550884
5	3	1	Quiz	6	2022-07-29 13:38:57.658125	2022-07-29 13:38:57.658125
6	3	1	Quiz	7	2022-07-29 13:54:27.693087	2022-07-29 13:54:27.693087
7	3	1	Quiz	8	2022-07-29 13:57:07.577384	2022-07-29 13:57:07.577384
8	3	1	Quiz	9	2022-07-30 10:14:16.422679	2022-07-30 10:14:16.422679
9	3	1	Quiz	10	2022-08-06 09:42:14.611951	2022-08-06 09:42:14.611951
10	3	1	Quiz	11	2022-08-06 09:45:48.738168	2022-08-06 09:45:48.738168
11	3	1	Quiz	12	2022-08-06 09:46:49.839782	2022-08-06 09:46:49.839782
12	3	1	Quiz	13	2022-08-06 09:47:54.129868	2022-08-06 09:47:54.129868
13	3	1	Quiz	14	2022-08-06 11:29:18.282745	2022-08-06 11:29:18.282745
14	3	1	Quiz	15	2022-08-06 11:30:50.106421	2022-08-06 11:30:50.106421
15	3	1	Quiz	16	2022-08-06 11:33:48.487858	2022-08-06 11:33:48.487858
16	3	1	Quiz	17	2022-08-06 11:34:58.367421	2022-08-06 11:34:58.367421
17	3	1	Quiz	18	2022-08-06 11:36:31.802222	2022-08-06 11:36:31.802222
18	3	1	Quiz	19	2022-08-06 11:37:33.095776	2022-08-06 11:37:33.095776
19	3	1	Quiz	20	2022-09-03 08:28:53.941996	2022-09-03 08:28:53.941996
20	3	1	Quiz	21	2022-09-03 08:33:44.447681	2022-09-03 08:33:44.447681
21	3	1	Quiz	22	2022-09-03 08:37:12.862217	2022-09-03 08:37:12.862217
22	3	1	Quiz	23	2022-09-03 08:38:42.824677	2022-09-03 08:38:42.824677
23	3	1	CheckboxExercise	2	2022-09-03 08:51:28.699275	2022-09-03 08:51:28.699275
24	3	1	Quiz	24	2022-09-03 08:57:04.109959	2022-09-03 08:57:04.109959
25	3	1	Quiz	25	2022-09-03 09:00:51.280706	2022-09-03 09:00:51.280706
26	3	1	CheckboxExercise	3	2022-09-03 09:21:21.602822	2022-09-03 09:21:21.602822
27	3	1	Quiz	26	2022-09-03 09:30:42.964618	2022-09-03 09:30:42.964618
28	3	1	Quiz	27	2022-09-03 09:38:54.707378	2022-09-03 09:38:54.707378
29	3	1	Quiz	28	2022-09-03 09:42:28.329241	2022-09-03 09:42:28.329241
30	3	1	Quiz	29	2022-09-03 10:40:47.159703	2022-09-03 10:40:47.159703
31	3	1	Quiz	30	2022-09-03 10:45:21.777133	2022-09-03 10:45:21.777133
32	3	1	Quiz	31	2022-09-03 10:48:00.83092	2022-09-03 10:48:00.83092
33	3	1	CostBenefitAnalysis	1	2022-09-03 10:51:47.417686	2022-09-03 10:51:47.417686
34	3	1	Quiz	32	2022-09-03 12:53:16.758584	2022-09-03 12:53:16.758584
35	3	1	Quiz	33	2022-09-03 12:54:49.136313	2022-09-03 12:54:49.136313
36	3	1	Quiz	34	2022-09-03 13:00:27.612971	2022-09-03 13:00:27.612971
37	3	1	Quiz	35	2022-09-03 13:02:03.593945	2022-09-03 13:02:03.593945
38	3	1	OpenQuestion	1	2022-09-03 13:14:14.31534	2022-09-03 13:14:14.31534
39	3	1	Quiz	36	2022-09-03 13:16:09.849175	2022-09-03 13:16:09.849175
40	3	1	Quiz	37	2022-09-03 13:19:06.609272	2022-09-03 13:19:06.609272
41	3	1	Quiz	38	2022-09-03 13:21:42.534676	2022-09-03 13:21:42.534676
42	3	1	CheckboxExercise	4	2022-09-03 13:25:56.538533	2022-09-03 13:25:56.538533
43	3	1	Quiz	39	2022-09-03 13:31:14.643624	2022-09-03 13:31:14.643624
44	3	1	Quiz	40	2022-09-03 13:38:09.277721	2022-09-03 13:38:09.277721
45	3	1	CheckboxExercise	5	2022-09-03 13:40:32.745647	2022-09-03 13:40:32.745647
46	3	1	Cloze	1	2022-09-03 13:47:13.34645	2022-09-03 13:47:13.34645
47	3	1	Quiz	41	2022-09-03 14:56:20.749994	2022-09-03 14:56:20.749994
48	3	1	Quiz	42	2022-09-03 14:57:55.920001	2022-09-03 14:57:55.920001
49	3	1	Quiz	43	2022-09-03 16:24:27.204927	2022-09-03 16:24:27.204927
50	3	1	Quiz	44	2022-09-03 16:27:20.992851	2022-09-03 16:27:20.992851
51	3	1	Quiz	45	2022-09-03 16:42:29.313278	2022-09-03 16:42:29.313278
52	3	1	OpenQuestion	2	2022-09-03 16:45:43.841515	2022-09-03 16:45:43.841515
53	3	1	Quiz	46	2022-09-03 16:46:42.455967	2022-09-03 16:46:42.455967
54	3	1	CheckboxExercise	6	2022-09-03 16:50:22.37519	2022-09-03 16:50:22.37519
55	3	1	Quiz	47	2022-09-03 16:55:28.119911	2022-09-03 16:55:28.119911
56	3	1	Quiz	48	2022-09-03 16:57:02.274365	2022-09-03 16:57:02.274365
57	3	1	Quiz	49	2022-09-03 17:00:52.263878	2022-09-03 17:00:52.263878
58	3	1	Quiz	50	2022-09-03 17:03:41.208055	2022-09-03 17:03:41.208055
59	3	1	Quiz	51	2022-09-03 17:06:44.487595	2022-09-03 17:06:44.487595
60	3	1	Quiz	52	2022-09-03 17:08:12.27104	2022-09-03 17:08:12.27104
\.


--
-- Data for Name: quiz_questions; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.quiz_questions (id, content, correct_answer, created_at, updated_at, quiz_id) FROM stdin;
1	Die reichen Menschen verursachen mehr Treibhausgase als die armen Menschen	yes	2022-05-24 05:33:04.379439	2022-05-24 05:33:04.379439	1
2	Die armen Menschen verursachen gleich viel CO2 als die reichen	no	2022-05-24 05:33:42.55373	2022-05-24 05:33:42.55373	1
3	Alle Bevölkerungsgruppen verursachen ungefähr gleich viel CO2	no	2022-05-24 05:34:18.977746	2022-05-24 05:34:18.977746	1
4	Die Menschen, die wenig CO2 in der Atmosphäre verursachen, trifft der Klimawandel härter.	yes	2022-05-24 05:43:16.345977	2022-05-24 05:43:16.345977	2
5	Die Menschen, die denn ganzen Tag Pause machen, dürfen jetzt zusätzlich Heizkosten sparen.	no	2022-05-24 05:46:09.489377	2022-05-24 05:46:09.489377	2
6	Eine ethische Theorie sagt uns, wie morgen das Wetter sein wird.	no	2022-07-29 09:50:23.420592	2022-07-29 09:50:23.420592	3
7	Eine ethische Theorie erklärt uns, warum es Sterne am Himmel gibt.	no	2022-07-29 09:51:05.588028	2022-07-29 09:51:05.588028	3
8	Eine ethische Theorie sagt uns, wie wir uns in einer bestimmten Situation verhalten sollen.	yes	2022-07-29 09:51:34.50202	2022-07-29 09:51:34.50202	3
9	Eine ethische Theorie sagt uns, dass jeder selber entscheiden kann, wie man handeln soll.	no	2022-07-29 10:53:59.819182	2022-07-29 10:53:59.819182	4
11	Eine ethische Theorie sagt uns, dass es eigentlich egal ist, wie man handelt.	no	2022-07-29 10:57:26.211784	2022-07-29 10:57:26.211784	4
10	Eine ethische Theorie fordert, dass wir so handeln müssen, wie sie uns vorgibt, zu handeln.	yes	2022-07-29 10:54:41.075872	2022-07-29 10:57:45.050407	4
13	Eine ethische Theorie gilt nur für religiöse Menschen.	no	2022-07-29 11:12:15.558043	2022-07-29 11:12:15.558043	5
14	Eine ethische Theorie gilt nur für Frauen, nicht aber für Männer.	no	2022-07-29 11:13:18.953745	2022-07-29 11:13:18.953745	5
12	Eine ethische Theorie gilt für alle.	yes	2022-07-29 11:11:58.490609	2022-07-29 11:13:45.016402	5
21	Ob eine Handlung gut oder schlecht ist, hängt von der Handlung selbst ab.	no	2022-07-29 14:18:16.303922	2022-07-29 14:18:16.303922	8
22	Ob eine Handlung gut oder schlecht ist, hängt von den Folgen ab, die eine Handlung nach sich zieht.	yes	2022-07-29 14:18:45.154345	2022-07-29 14:18:45.154345	8
24	Ob eine Handlung gut oder schlecht ist, hängt von der Handlung selbst ab.	yes	2022-07-30 10:14:54.818694	2022-07-30 10:17:23.954467	9
50	Eine Handlung ist gut oder schlecht, unabhängig davon, wie viel Glück oder Leid sie verursacht.	no	2022-08-06 12:55:06.114133	2022-08-06 12:55:06.114133	10
19	Ob eine Handlung gut oder schlecht ist, hängt davon ab, ob sie aus einer Tugend oder aus einem Laster entspringt.	yes	2022-07-29 13:55:26.231941	2022-08-06 09:38:55.800982	7
27	Eine Handlung ist gut, wenn sie viel Glück produziert und schlecht, wenn sie viel Leid verursacht.	yes	2022-08-06 09:43:29.649675	2022-08-06 09:43:29.649675	10
28	Eine Handlung ist gut, wenn sie gleich viel Glück wie Leid verursacht.	no	2022-08-06 09:44:26.385778	2022-08-06 09:44:26.385778	10
29	Eine Handlung ist gut, wenn man wollen kann, dass alle sie tun würden.	yes	2022-08-06 09:46:13.032345	2022-08-06 09:46:13.032345	11
30	Klugheit, Weisheit, Gerechtigkeit, Tapferkeit und Mässigung	yes	2022-08-06 09:47:12.904076	2022-08-06 09:47:12.904076	12
31	Aberglaube, Ungerechtigkeit, Feigheit und Zügellosigkeit	yes	2022-08-06 09:48:19.091414	2022-08-06 09:48:24.419403	13
32	Konsequentialismus	yes	2022-08-06 11:29:34.262394	2022-08-06 11:29:34.262394	14
33	Deontologie	no	2022-08-06 11:29:43.705258	2022-08-06 11:29:43.705258	14
34	Tugendethik	no	2022-08-06 11:29:52.28528	2022-08-06 11:29:52.28528	14
35	Weil die Handlung an sich bewertet wurde.	no	2022-08-06 11:32:12.978104	2022-08-06 11:32:12.978104	15
36	Weil die Handlung im Bezug auf Charaktereigenschaften bewertet wurde.	no	2022-08-06 11:32:40.865424	2022-08-06 11:32:40.865424	15
37	Weil die Handlung im Bezug auf die Folgen bewertet wurde.	yes	2022-08-06 11:33:02.436501	2022-08-06 11:33:02.436501	15
38	Kosequentialismus	no	2022-08-06 11:34:04.101261	2022-08-06 11:34:04.101261	16
39	Deontologie	no	2022-08-06 11:34:15.029052	2022-08-06 11:34:15.029052	16
40	Tugendethik	yes	2022-08-06 11:34:26.727947	2022-08-06 11:34:26.727947	16
41	Weil die Handlung an sich bewertet wurde.	no	2022-08-06 11:35:11.24698	2022-08-06 11:35:11.24698	17
42	Weil die Handlung im Bezug auf Charaktereigenschaften bewertet wurde.	yes	2022-08-06 11:35:42.280986	2022-08-06 11:35:42.280986	17
43	Weil die Handlung im Bezug auf die Folgen bewertet wurde.	no	2022-08-06 11:36:01.689363	2022-08-06 11:36:01.689363	17
44	Konsequentialismus	no	2022-08-06 11:36:41.067791	2022-08-06 11:36:41.067791	18
45	Deontologie	yes	2022-08-06 11:36:52.102889	2022-08-06 11:36:52.102889	18
46	Tugendethik	no	2022-08-06 11:37:00.965615	2022-08-06 11:37:00.965615	18
49	Weil die Handlung im Bezug auf die Folgen bewertet wurde.	no	2022-08-06 11:38:59.669693	2022-08-06 11:38:59.669693	19
15	Ein Teilgebiet der Psychologie, das sich mit Fragen wie "Warum sind manche Menschen egoistisch?" beschäftigt.	no	2022-07-29 13:39:25.187417	2022-08-06 12:35:10.741445	6
16	Ein Teilgebiet der Soziologie, das sich mit Fragen wie "Warum gibt es arme und reiche Menschen?" beschäftigt.	no	2022-07-29 13:40:06.274076	2022-08-06 12:39:19.163653	6
17	Ein Teilgebiet der Philosophie, das sich mit Fragen wie "Was soll ich tun?" beschäftigt.	yes	2022-07-29 13:40:32.681949	2022-08-06 12:40:08.424983	6
51	Eine Handlung ist gut, wenn die Mehrheit sie tun würde.	no	2022-08-06 12:57:01.360807	2022-08-06 12:57:01.360807	11
18	Ob eine Handlung gut oder schlecht ist, hängt von den Folgen ab, die eine Handlung nach sich zieht.	no	2022-07-29 13:54:48.43458	2022-08-06 12:48:28.522908	7
20	Ob eine Handlung gut oder schlecht ist, hängt von der Handlung selbst ab.	no	2022-07-29 13:56:28.207466	2022-08-06 12:49:08.159836	7
23	Ob eine Handlung gut oder schlecht ist, hängt davon ab, ob sie aus einer Tugend oder aus einem Laster entspringt.	no	2022-07-29 14:19:48.529087	2022-08-06 12:50:13.945047	8
25	Ob eine Handlung gut oder schlecht ist, hängt davon ab, ob sie aus einer Tugend oder aus einem Laster entspringt.	no	2022-07-30 10:16:44.552366	2022-08-06 12:51:11.827851	9
26	Ob eine Handlung gut oder schlecht ist, hängt von den Folgen ab, die eine Handlung nach sich zieht.	no	2022-07-30 10:32:06.299524	2022-08-06 12:51:40.619685	9
52	Eine Handlung ist gut, wenn alle sie tun würden.	no	2022-08-06 12:57:50.041475	2022-08-06 12:57:50.041475	11
53	Gericht, Gesetz, Richter,  Jura und Legislative	no	2022-08-06 13:01:21.696307	2022-08-06 13:01:49.10412	12
54	Staat, Gemeinschaft, Organisation, Firma und Verein	no	2022-08-06 13:02:43.516262	2022-08-06 13:02:43.516262	12
55	Gewicht, Graviation, Lastwagen, Physik und Fahrzeug	no	2022-08-06 13:04:26.383532	2022-08-06 13:04:26.383532	13
56	Kirche, Gott, Religion, Kreuz und Kloster	no	2022-08-06 13:05:39.44668	2022-08-06 13:05:39.44668	13
47	Weil die Handlung an sich bewertet wurde.	yes	2022-08-06 11:37:46.803519	2022-09-02 15:56:49.116434	19
48	Weil die Handlung im Bezug auf Charaktereigenschaften bewertet wurde.	no	2022-08-06 11:38:35.671015	2022-09-02 15:57:23.117773	19
57	Diese Theorie ist nicht konsequentialistisch	yes	2022-09-03 08:29:20.062822	2022-09-03 08:29:49.717561	20
58	Diese Theorie ist konsequentialistisch	no	2022-09-03 08:30:51.015764	2022-09-03 08:30:51.015764	20
59	Weil das Wort "Konsequentialismus" nirgends vorkommt.	no	2022-09-03 08:34:12.094348	2022-09-03 08:34:12.094348	21
60	Weil eine Handlung nicht im Bezug auf Charaktereigenschaften beurteilt wird.	no	2022-09-03 08:34:37.115173	2022-09-03 08:34:37.115173	21
61	Weil eine Handlung nicht im Bezug auf ihre Folgen oder Konsequenzen beurteilt wird.	yes	2022-09-03 08:35:06.962583	2022-09-03 08:35:06.962583	21
62	Diese Theorie ist konsequentialistisch	yes	2022-09-03 08:37:30.826767	2022-09-03 08:37:30.826767	22
63	Diese Theorie ist nicht konsequentialistisch	no	2022-09-03 08:37:58.988263	2022-09-03 08:37:58.988263	22
64	Das Ziel ist die Erhaltung der Demokratie.	yes	2022-09-03 08:39:05.527163	2022-09-03 08:39:05.527163	23
65	Das Ziel ist die Beseitigung von Armut.	no	2022-09-03 08:39:28.305469	2022-09-03 08:39:28.305469	23
66	Das Ziel ist die Förderung von Bildung.	no	2022-09-03 08:40:04.717696	2022-09-03 08:40:04.717696	23
67	Ja	yes	2022-09-03 08:57:22.827806	2022-09-03 08:57:22.827806	24
68	Nein	no	2022-09-03 08:57:33.996096	2022-09-03 08:57:33.996096	24
69	Der Konsequentialismus	no	2022-09-03 09:01:32.210922	2022-09-03 09:01:32.210922	25
70	Das Nutzenprinzip	no	2022-09-03 09:01:43.165414	2022-09-03 09:01:43.165414	25
71	Das Universalprinzip	yes	2022-09-03 09:01:54.533468	2022-09-03 09:01:54.533468	25
72	Der Utilitarismus ist einfach anwendbar.	no	2022-09-03 09:31:09.071294	2022-09-03 09:31:09.071294	26
73	Der Utilitarismus ist pragmatisch und zielorientiert.	yes	2022-09-03 09:31:39.899503	2022-09-03 09:31:39.899503	26
74	Der Utilitarismus fördert Glück, ein Gut, das sowieso alle wollen.	no	2022-09-03 09:32:37.053074	2022-09-03 09:32:37.053074	26
75	Der Utilitarismus kann zu Ungleichbehandlung von Menschen führen.	no	2022-09-03 09:39:57.023342	2022-09-03 09:39:57.023342	27
76	Eine ökonomische Bemessung ist kategorial verschieden von einer ethischen Beurteilung.	yes	2022-09-03 09:40:31.69301	2022-09-03 09:40:31.69301	27
77	Utilitaristisches Verhalten kann persönliche Beziehungen und Freundschaften ruinieren.	no	2022-09-03 09:41:30.158896	2022-09-03 09:41:30.158896	27
78	Es ist zu schwierig, den Gesamtnutzen zu errechnen.	yes	2022-09-03 09:43:27.457815	2022-09-03 09:43:27.457815	28
79	Der Utilitarismus kann zu Ungleichbehandlung von Menschen führen.	no	2022-09-03 09:43:55.456621	2022-09-03 09:43:55.456621	28
80	Utilitaristisches Verhalten kann persönliche Beziehungen und Freundschaften ruinieren.	no	2022-09-03 09:44:21.288172	2022-09-03 09:44:21.288172	28
81	Utilitaristisches Verhalten kann persönliche Beziehungen und Freundschaften ruinieren.	no	2022-09-03 10:41:12.074576	2022-09-03 10:41:12.074576	29
82	Eine ökonomische Bemessung ist kategorial verschieden von einer ethischen Beurteilung.	no	2022-09-03 10:41:35.1586	2022-09-03 10:41:35.1586	29
83	Der Utilitarismus kann zu Ungleichbehandlung von Menschen führen.	yes	2022-09-03 10:42:44.825998	2022-09-03 10:42:44.825998	29
84	... wie versprochen seinem Freund zurückgeben.	no	2022-09-03 10:46:00.193952	2022-09-03 10:46:00.193952	30
85	... der Hilfsorganisation spenden.	yes	2022-09-03 10:46:25.99565	2022-09-03 10:46:25.99565	30
86	... für sich selbst behalten.	no	2022-09-03 10:46:48.962566	2022-09-03 10:46:48.962566	30
87	Ja	no	2022-09-03 10:48:55.591121	2022-09-03 10:48:55.591121	31
88	Nein	yes	2022-09-03 10:49:09.435627	2022-09-03 10:49:09.435627	31
89	Diese Theorie ist deontologisch	yes	2022-09-03 12:53:39.579128	2022-09-03 12:53:39.579128	32
90	Diese Theorie ist nicht deontologisch	no	2022-09-03 12:53:53.740823	2022-09-03 12:53:53.740823	32
92	Weil die Handlung im Bezug auf Charaktereigenschaften beurteilt wird.	no	2022-09-03 12:56:10.884908	2022-09-03 12:56:10.884908	33
91	Weil die Handlung selbst beurteilt wird.	yes	2022-09-03 12:55:40.252456	2022-09-03 12:56:52.965166	33
93	Weil die Handlung im Bezug auf ihre Folgen oder Konsequenzen beurteilt wird.	no	2022-09-03 12:57:27.318973	2022-09-03 12:57:27.318973	33
94	Diese Theorie ist deontologisch	no	2022-09-03 13:00:41.786471	2022-09-03 13:00:41.786471	34
95	Diese Theorie ist nicht deontologisch	no	2022-09-03 13:00:57.753552	2022-09-03 13:00:57.753552	34
96	Weil man die Absichten eines Menschen nicht erkennen kann.	no	2022-09-03 13:02:27.771787	2022-09-03 13:02:27.771787	35
97	Weil nicht die Handlung selbst, sondern die Absichten, die hinter der Handlung stehen, beurteilt werden.	yes	2022-09-03 13:03:08.568341	2022-09-03 13:03:08.568341	35
98	Weil alle deontologische Theorien das Lügen verbieten	no	2022-09-03 13:03:30.373733	2022-09-03 13:03:30.373733	35
99	Nein, weil zu viel Abfall in der Umwelt früher oder später zu Krankheiten und Seuchen führen.	no	2022-09-03 13:16:49.354867	2022-09-03 13:16:49.354867	36
100	Nein, weil wenn jeder Littering betreiben würde, die Umwelt komplett zugemüllt wird.	yes	2022-09-03 13:17:05.352706	2022-09-03 13:17:05.352706	36
101	Nein, weil nur faule Menschen Littering betreiben.	no	2022-09-03 13:17:21.838943	2022-09-03 13:17:21.838943	36
102	Ja, weil anständige Menschen Gefundenes zurückgeben.	no	2022-09-03 13:19:29.170054	2022-09-03 13:19:29.170054	37
103	Ja, weil eine Welt, in der alle Gefundenes zurückgeben, eine wünschenswerte Welt ist.	yes	2022-09-03 13:20:15.401284	2022-09-03 13:20:15.401284	37
104	Ja, weil man wahrscheinlich einen Finderlohn bekommt.	no	2022-09-03 13:20:36.457326	2022-09-03 13:20:36.457326	37
105	Ja, weil Versprechen keine rechtlich bindende Verträge sind.	no	2022-09-03 13:22:05.770237	2022-09-03 13:22:05.770237	38
106	Nein, weil es äusserst gemein ist, Versprechen zu brechen.	no	2022-09-03 13:22:24.320992	2022-09-03 13:22:24.320992	38
107	Nein, weil wenn jeder Versprechen brechen würde, das Vertrauen zwischen den Menschen zerstört wird.	yes	2022-09-03 13:22:49.184388	2022-09-03 13:22:49.184388	38
108	Der Kantianismus ist einfach anwendbar.	no	2022-09-03 13:31:44.986709	2022-09-03 13:31:44.986709	39
109	Der Kantianismus wird der Intuition gerecht, dass alle die gleichen Regeln befolgen sollen.	yes	2022-09-03 13:32:22.093839	2022-09-03 13:32:22.093839	39
110	Mit dem Kantianismus kann man keine grausamen Taten rechtfertigen.	no	2022-09-03 13:32:57.584233	2022-09-03 13:32:57.584233	39
111	Der Kantianismus kann zu einem Konflikt zwischen zwei oder mehreren Pflichten führen.	no	2022-09-03 13:38:44.115546	2022-09-03 13:38:44.115546	40
112	Der Kantianismus ist nicht für Extremfälle geeignet.	yes	2022-09-03 13:39:13.922125	2022-09-03 13:39:13.922125	40
113	Der Kantianismus vernachlässigt Gefühle und Neigungen.	no	2022-09-03 13:39:44.113977	2022-09-03 13:39:44.113977	40
114	Diese Theorie ist tugendethisch	no	2022-09-03 14:56:38.791458	2022-09-03 14:56:38.791458	41
115	Diese Theorie ist nicht tugendethisch	yes	2022-09-03 14:56:55.399763	2022-09-03 14:56:55.399763	41
116	Weil keine Charaktereigenschaften beurteilt werden.	yes	2022-09-03 14:59:07.881517	2022-09-03 14:59:07.881517	42
117	Weil das Wort "Tugend" nirgends vorkommt.	no	2022-09-03 14:59:22.3303	2022-09-03 14:59:22.3303	42
118	Weil Handlungen nicht als solche beurteilt werden.	no	2022-09-03 15:00:25.782082	2022-09-03 15:00:25.782082	42
119	Diese Theorie ist tugendethisch	yes	2022-09-03 16:24:43.278928	2022-09-03 16:24:43.278928	43
120	Diese Theorie ist nicht tugendethisch	no	2022-09-03 16:24:57.690263	2022-09-03 16:24:57.690263	43
121	Weil Charaktereigenschaften beurteilt werden.	yes	2022-09-03 16:27:42.686876	2022-09-03 16:27:42.686876	44
122	Weil das Wort "Person" irgendwo vorkommt.	no	2022-09-03 16:28:05.933618	2022-09-03 16:28:05.933618	44
123	Weil Handlungen danach beurteilt werden, welche Folgen oder Konsequenzen  sie haben.	no	2022-09-03 16:28:31.424777	2022-09-03 16:28:31.424777	44
124	Fleiss	yes	2022-09-03 16:43:06.178467	2022-09-03 16:43:06.178467	45
125	gute Erziehung	no	2022-09-03 16:43:24.850459	2022-09-03 16:43:24.850459	45
126	Ordnungsliebe	no	2022-09-03 16:43:35.188155	2022-09-03 16:43:35.188155	45
127	Durch tugendhaftes Leben	yes	2022-09-03 16:46:55.779101	2022-09-03 16:46:55.779101	46
128	Durch Anschaffung von Reichtum	no	2022-09-03 16:47:10.530939	2022-09-03 16:47:10.530939	46
129	Durch Selbstaufopferung	no	2022-09-03 16:47:24.673641	2022-09-03 16:47:24.673641	46
130	Durch ein religiöses Leben	no	2022-09-03 16:47:40.20499	2022-09-03 16:47:40.20499	46
131	Die aristotelische Ethik berücksichtigt die Absichten einer handelnden Person.	yes	2022-09-03 16:56:06.759946	2022-09-03 16:56:06.759946	47
132	Die aristotelische Ethik berücksichtigt die Komplexität des Lebens.	no	2022-09-03 16:56:23.802048	2022-09-03 16:56:23.802048	47
133	In der aristotelischen Ethik geht es nicht nur um richtiges Handeln, sondern um das gute Leben allgemein und wie man es erreichen kann.	no	2022-09-03 16:56:34.135316	2022-09-03 16:56:34.135316	47
134	Die aristotelische Ethik berücksichtigt die Absichten einer handelnden Person.	no	2022-09-03 16:57:30.240562	2022-09-03 16:57:30.240562	48
135	Die aristotelische Ethik berücksichtigt die Komplexität des Lebens.	no	2022-09-03 16:57:40.967229	2022-09-03 16:57:40.967229	48
136	In der aristotelischen Ethik geht es nicht nur um richtiges Handeln, sondern um das gute Leben allgemein und wie man es erreichen kann.	yes	2022-09-03 16:57:58.270978	2022-09-03 16:57:58.270978	48
137	Die aristotelische Ethik bietet kein Verfahren an, das uns hilft, Entscheidungen zu treffen.	no	2022-09-03 17:01:10.235796	2022-09-03 17:01:10.235796	49
138	Das tugendhafte Leben führt nicht immer zum glücklichen Leben.	no	2022-09-03 17:01:55.352538	2022-09-03 17:01:55.352538	49
139	Die aristotelische Ethik ist zu relativ.	yes	2022-09-03 17:02:15.051033	2022-09-03 17:02:15.051033	49
140	Die aristotelische Ethik bietet kein Verfahren an, das uns hilft, Entscheidungen zu treffen.	yes	2022-09-03 17:04:21.198699	2022-09-03 17:04:21.198699	50
141	Die aristotelische Ethik ist zu relativ.	no	2022-09-03 17:04:37.665775	2022-09-03 17:04:37.665775	50
142	Das tugendhafte Leben führt nicht immer zum glücklichen Leben.	no	2022-09-03 17:04:46.071252	2022-09-03 17:04:46.071252	50
143	Stumpfsinnigkeit	no	2022-09-03 17:07:15.981962	2022-09-03 17:07:15.981962	51
144	Furcht	yes	2022-09-03 17:07:26.991807	2022-09-03 17:07:26.991807	51
145	Knauserei	no	2022-09-03 17:07:35.204731	2022-09-03 17:07:35.204731	51
146	Eine tugendhafte Person würde so tun, als hätte sie nichts gesehen.	no	2022-09-03 17:08:38.055945	2022-09-03 17:08:38.055945	52
147	Eine tugendhafte Person würde ausrasten und den Freund mit Prügel bestrafen.	no	2022-09-03 17:08:48.080853	2022-09-03 17:08:48.080853	52
148	Eine tugendhafte Person würde ein tadelndes Gespräch mit seinem Freund führen.	yes	2022-09-03 17:08:57.631191	2022-09-03 17:08:57.631191	52
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.quizzes (id, content, created_at, updated_at, slide_id) FROM stdin;
1	Was fällt auf?	2022-05-24 05:32:02.993774	2022-05-24 05:32:11.552952	7
2	Was könnte die doppelte Ungerechtigkeit sein?	2022-05-24 05:41:30.697035	2022-05-24 05:41:30.697035	9
9	<p style="text-align: center;"><strong>Deontologie</strong></p>	2022-07-30 10:14:16.41549	2022-07-30 10:23:06.729	53
20	<p>"Eine Handlung ist dann gut, wenn sie von&nbsp;<strong>Gott gewollt</strong>&nbsp;ist.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Wenn Gott nicht will, dass Menschen t&ouml;ten, dann ist T&ouml;ten&nbsp;<strong>immer falsch</strong>!"</p>	2022-09-03 08:28:53.926513	2022-09-03 08:28:53.926513	74
6	<p style="text-align: center;"><strong>Ethik</strong></p>	2022-07-29 13:38:57.652236	2022-07-30 19:11:34.213184	50
7	<p style="text-align: center;"><strong>Tugendethik</strong></p>	2022-07-29 13:54:27.689278	2022-07-30 19:12:49.999396	51
8	<p style="text-align: center;"><strong>Konsequentialismus</strong></p>	2022-07-29 13:57:07.574242	2022-07-30 19:13:25.529954	52
10	<p style="text-align: center;"><strong>Utilitarismus</strong></p>	2022-08-06 09:42:14.604853	2022-08-06 09:42:34.789213	54
11	<p style="text-align: center;"><strong>Kantianismus</strong></p>	2022-08-06 09:45:48.73494	2022-08-06 09:45:48.73494	55
12	<p style="text-align: center;"><strong>Tugenden</strong></p>	2022-08-06 09:46:49.836443	2022-08-06 09:46:49.836443	56
13	<p style="text-align: center;"><strong>Laster</strong></p>	2022-08-06 09:47:54.126136	2022-08-06 09:47:54.126136	57
14	<p>"Was Toni getan hat, war&nbsp;<strong>falsch!</strong></p>\n<p>Tonis Falschinformation f&uuml;hrte dazu, dass Lara ihre Stelle verlor, der Kunde ver&auml;rgert und Geld verschwendet wurde.</p>\n<p>H&auml;tte Toni diese Falschinformation nicht gegeben, dann w&auml;re das alles nicht passiert, was besser gewesen w&auml;re."</p>	2022-08-06 11:29:18.265247	2022-08-06 11:29:18.265247	62
15	<p>"Was Toni getan hat, war&nbsp;<strong>falsch!</strong></p>\n<p>Tonis Falschinformation f&uuml;hrte dazu, dass Lara ihre Stelle verlor, der Kunde ver&auml;rgert und Geld verschwendet wurde.</p>\n<p>H&auml;tte Toni diese Falschinformation nicht gegeben, dann w&auml;re das alles nicht passiert, was besser gewesen w&auml;re."</p>	2022-08-06 11:30:50.103236	2022-08-06 11:31:31.764512	63
16	<p>"Was Toni getan hat, war&nbsp;<strong>falsch!</strong></p>\n<p>Toni hat Lara eine Falschinformation gegeben, weil er eifers&uuml;chtig auf den Erfolg von Lara gewesen ist.</p>\n<p>Toni hat also&nbsp;<strong>aus Eifersucht</strong>&nbsp;gehandelt. Eine gute Person w&uuml;rde nicht aus Eifersucht handeln und deswegen war Tonis Handlung falsch."</p>	2022-08-06 11:33:48.483312	2022-08-06 11:33:48.483312	64
17	<p>"Was Toni getan hat, war&nbsp;<strong>falsch!</strong></p>\n<p>Toni hat Lara eine Falschinformation gegeben, weil er eifers&uuml;chtig auf den Erfolg von Lara gewesen ist.</p>\n<p>Toni hat also&nbsp;<strong>aus Eifersucht</strong>&nbsp;gehandelt. Eine gute Person w&uuml;rde nicht aus Eifersucht handeln und deswegen war Tonis Handlung falsch."</p>	2022-08-06 11:34:58.364149	2022-08-06 11:34:58.364149	65
18	<p>"Was Toni getan hat, war&nbsp;<strong>falsch!</strong></p>\n<p>Toni hat Lara absichtlich eine Falschinformation gegeben, in anderen Worten, er hat sie&nbsp;<strong>angelogen</strong>.</p>\n<p>Es ist immer falsch zu l&uuml;gen. Die L&uuml;ge ist eine Handlung, die an sich falsch ist. Darum war Tonis Handlung falsch."</p>	2022-08-06 11:36:31.798972	2022-08-06 11:36:31.798972	66
19	<p>"Was Toni getan hat, war&nbsp;<strong>falsch!</strong></p>\n<p>Toni hat Lara absichtlich eine Falschinformation gegeben, in anderen Worten, er hat sie&nbsp;<strong>angelogen</strong>.</p>\n<p>Es ist immer falsch zu l&uuml;gen. Die L&uuml;ge ist eine Handlung, die an sich falsch ist. Darum war Tonis Handlung falsch."</p>	2022-08-06 11:37:33.092196	2022-08-06 11:37:33.092196	67
3	<p><strong>Welches</strong> der folgenden Merkmale ist ein <strong>Merkmal</strong> einer <strong>ethischen Theorie</strong>?</p>	2022-07-29 09:50:07.96545	2022-08-06 12:18:40.769936	36
4	<p><strong>Welches</strong> der folgenden Merkmale ist ein <strong>Merkmal</strong> einer <strong>ethischen Theorie</strong>?</p>	2022-07-29 10:53:16.569898	2022-08-06 12:19:41.353368	37
5	<p><strong>Welches</strong> der folgenden Merkmale ist ein <strong>Merkmal</strong> einer <strong>ethischen Theorie</strong>?</p>	2022-07-29 11:11:44.547015	2022-08-06 12:19:52.194699	38
21	<p>"Eine Handlung ist dann gut, wenn sie von&nbsp;<strong>Gott gewollt</strong>&nbsp;ist.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Wenn Gott nicht will, dass Menschen t&ouml;ten, dann ist T&ouml;ten&nbsp;<strong>immer falsch</strong>!"</p>	2022-09-03 08:33:44.443613	2022-09-03 08:33:44.443613	75
22	<p>"Die Demokratie ist das wichtigste Gut unserer Gesellschaft.</p>\n<p>Darum ist eine Handlung dann gut, wenn sie hilft, die&nbsp;<strong>Demokratie am Leben zu erhalten</strong>.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Das Ausgrenzen von Minderheiten unterh&ouml;hlt die Demokratie. Darum ist das Ausgrenzen von Minderheiten&nbsp;<strong>falsch</strong>!"</p>	2022-09-03 08:37:12.858165	2022-09-03 08:37:12.858165	76
23	<p>"Die Demokratie ist das wichtigste Gut unserer Gesellschaft.</p>\n<p>Darum ist eine Handlung dann gut, wenn sie hilft, die&nbsp;<strong>Demokratie am Leben zu erhalten</strong>.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Das Ausgrenzen von Minderheiten unterh&ouml;hlt die Demokratie. Darum ist das Ausgrenzen von Minderheiten&nbsp;<strong>falsch</strong>!"</p>	2022-09-03 08:38:42.820728	2022-09-03 08:38:42.820728	77
24	<p>W&uuml;rde eine Utilitaristin die Einf&uuml;hrung der Todesstrafe bef&uuml;rworten?</p>	2022-09-03 08:57:04.105578	2022-09-03 08:57:04.105578	89
25	<p>"Jeder ist auf sich alleine gestellt.</p>\n<p>Darum ist es in Ordnung, wenn jeder nur seine eigenen Ziele verfolgt oder nur das macht, was zur Befriedigung seiner eigenen Interessen dient.</p>\n<p>Eine Handlung ist somit gut, wenn ihre Konsequenzen n&uuml;tzlich f&uuml;r die eigenen Ziele sind."</p>	2022-09-03 09:00:51.276177	2022-09-03 09:00:51.276177	90
26	<p>"Robin Hood ist ein&nbsp;<strong>Held des Volkes</strong>!</p>\n<p>Er&nbsp;<strong>raubt</strong>&nbsp;reiche Menschen aus und&nbsp;<strong>verteilt seine Beute</strong>&nbsp;unter den Armen und Schwachen.</p>\n<p>W&uuml;rde Robin Hood sein Geld auf ehrliche Weise verdienen, dann k&ouml;nnte er niemals so vielen Armen und Schwachen helfen, als mit Raub, Diebstahl oder Pl&uuml;nderung."</p>	2022-09-03 09:30:42.959004	2022-09-03 09:30:42.959004	98
27	<p>"Der Utilitarismus macht die seltsame Annahme, dass Gl&uuml;ck etwas sei, das man messen oder z&auml;hlen k&ouml;nne.</p>\n<p>Doch Gl&uuml;ck ist nicht einfach eine Ware, von der man mehr oder weniger haben kann. Gl&uuml;ck ist ein bestimmter Zustand unserer Seele.</p>\n<p>Und genau weil man Gl&uuml;ck nicht so einfach messen kann, kann man Handlungen nicht danach beurteilen, wie viel Gl&uuml;ck sie bringen."</p>	2022-09-03 09:38:54.70245	2022-09-03 09:38:54.70245	104
28	<p>"In einer Demokratie stimmen Personen &uuml;ber Gesetze ab, die Konsequenzen f&uuml;r das Zusammenleben der Menschen haben.</p>\n<p>Wenn es zu schwierig w&auml;re, die Konsequenzen unserer Handlungen abzusch&auml;tzen, m&uuml;ssten wir dann nicht auch demokratische Abstimmungen abschaffen?"</p>	2022-09-03 09:42:28.324902	2022-09-03 09:42:28.324902	105
29	<p>"Sklaverei verursacht Leid und Qual in sehr vielen Formen.</p>\n<p>Der Genuss von G&uuml;tern und Luxuswaren hingegen, die von den Sklaven hergestellt werden, sind nur kleine Freuden.</p>\n<p>Daher wird der Nutzen von Sklaverei&nbsp;<strong>nie</strong>&nbsp;den Schaden von Sklaverei &uuml;berwiegen."</p>	2022-09-03 10:40:47.149028	2022-09-03 10:40:47.149028	106
36	<p>W&auml;hle die Antwort aus, die von einer kantischen Ethik stammen k&ouml;nnte!</p>	2022-09-03 13:16:09.841436	2022-09-03 13:16:09.841436	131
46		2022-09-03 16:46:42.449181	2022-09-03 16:46:42.449181	171
30	<p><strong>&Uuml;berlege dir</strong>, wie eine utilitaristische Person in deiner Situation handeln w&uuml;rde!</p>\n<hr>\n<p>Eine utilitaristische Person w&uuml;rde das Geld ...</p>	2022-09-03 10:45:21.772825	2022-09-03 10:45:21.772825	108
31	<p><strong>W&uuml;rde ein Utilitarist die Einf&uuml;hrung einer Diktatur bef&uuml;rworten?</strong></p>	2022-09-03 10:48:00.826771	2022-09-03 10:48:00.826771	109
32	<p>"Eine Handlung ist immer dann schlecht, wenn die Handlung selbst&nbsp;<strong>grausam</strong>,&nbsp;<strong>gewaltt&auml;tig</strong>&nbsp;oder&nbsp;<strong>furchteinfl&ouml;ssend</strong>&nbsp;ist.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Es ist&nbsp;<strong>falsch</strong>, jemanden Gewalt anzudrohen, weil die Androhung von Gewalt&nbsp;<strong>furchteinfl&ouml;ssend</strong>&nbsp;ist."</p>	2022-09-03 12:53:16.752779	2022-09-03 12:53:16.752779	118
33	<p>"Eine Handlung ist immer dann schlecht, wenn die Handlung selbst&nbsp;<strong>grausam</strong>,&nbsp;<strong>gewaltt&auml;tig</strong>&nbsp;oder&nbsp;<strong>furchteinfl&ouml;ssend</strong>&nbsp;ist.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Es ist&nbsp;<strong>falsch</strong>, jemanden Gewalt anzudrohen, weil die Androhung von Gewalt&nbsp;<strong>furchteinfl&ouml;ssend</strong>&nbsp;ist."</p>	2022-09-03 12:54:49.132165	2022-09-03 12:54:49.132165	119
34	<p>"Ob eine Handlung gut oder schlecht ist, h&auml;ngt davon ab,&nbsp;<strong>mit welcher Absicht</strong>&nbsp;man sie ausf&uuml;hrt.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Wenn man b&ouml;se Absichten hat, dann ist es&nbsp;<strong>falsch</strong>, zu l&uuml;gen.</p>\n<p>Wenn man hingegen gute Absichten hat, dann ist es&nbsp;<strong>richtig</strong>, zu l&uuml;gen."</p>	2022-09-03 13:00:27.608853	2022-09-03 13:00:27.608853	120
35	<p>"Ob eine Handlung gut oder schlecht ist, h&auml;ngt davon ab,&nbsp;<strong>mit welcher Absicht</strong>&nbsp;man sie ausf&uuml;hrt.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Wenn man b&ouml;se Absichten hat, dann ist es&nbsp;<strong>falsch</strong>, zu l&uuml;gen.</p>\n<p>Wenn man hingegen gute Absichten hat, dann ist es&nbsp;<strong>richtig</strong>, zu l&uuml;gen."</p>	2022-09-03 13:02:03.58953	2022-09-03 13:02:03.58953	121
37	<p>W&auml;hle die Antwort aus, die von einer kantischen Ethik stammen k&ouml;nnte!</p>	2022-09-03 13:19:06.604961	2022-09-03 13:19:06.604961	132
38	<p>W&auml;hle die Antwort aus, die von einer kantischen Ethik stammen k&ouml;nnte!</p>	2022-09-03 13:21:42.531077	2022-09-03 13:21:42.531077	133
39	<p>"Wer sich nicht an die Regeln h&auml;lt, muss mit einer Strafe rechnen.</p>\n<p>Vor dem Gesetz sind schliesslich&nbsp;<strong>alle gleich</strong>.</p>\n<p>Woher Sie auch kommen m&ouml;gen, wie wichtig Ihre Eltern auch sein m&ouml;gen und wie freundlich Sie auch l&auml;cheln k&ouml;nnen,&nbsp;<strong>niemand bekommt hier eine Sonderbehandlung</strong>, Ende der Diskussion."</p>	2022-09-03 13:31:14.638866	2022-09-03 13:31:14.638866	141
40	<p>"Wie viele andere, bekomme auch ich ein schlechtes Bauchgef&uuml;hl, wenn ich daran denke einen Menschen t&ouml;ten zu m&uuml;ssen.</p>\n<p>Dennoch m&uuml;ssen wir stark sein und die T&ouml;tung manchmal zulassen.</p>\n<p>Denn nur so k&ouml;nnen wir in gewissen F&auml;llen das Leben von 1'000 oder gar 10'000 Unschuldigen retten."</p>	2022-09-03 13:38:09.27224	2022-09-03 13:38:09.27224	146
41	<p>"Eine Handlung ist gut, wenn sie Armut vermindert und eine Handlung ist schlecht, wenn sie Armut verursacht.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Es ist&nbsp;<strong>falsch</strong>, von armen Menschen Geld zu stehlen.</p>\n<p>Hingegen ist es&nbsp;<strong>richtig</strong>, von reichen Menschen zu stehlen und das Geld den Armen zu geben."</p>	2022-09-03 14:56:20.738746	2022-09-03 14:56:20.738746	156
42	<p>"Eine Handlung ist gut, wenn sie Armut vermindert und eine Handlung ist schlecht, wenn sie Armut verursacht.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Es ist&nbsp;<strong>falsch</strong>, von armen Menschen Geld zu stehlen.</p>\n<p>Hingegen ist es&nbsp;<strong>richtig</strong>, von reichen Menschen zu stehlen und das Geld den Armen zu geben."</p>	2022-09-03 14:57:55.917197	2022-09-03 14:57:55.917197	157
43	<p>"Gute Charaktereigenschaften sind&nbsp;<strong>Freundlichkeit</strong>&nbsp;und&nbsp;<strong>Ehrlichkeit</strong>.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Eine gute Person macht keine falschen Komplimente, weil sie&nbsp;<strong>ehrlich</strong>&nbsp;ist.</p>\n<p>Eine schlechte Person hingegen macht viele falsche Komplimente,&nbsp;<strong>weil sie sich einschleimen will</strong>."</p>	2022-09-03 16:24:27.195096	2022-09-03 16:24:27.195096	158
44	<p>"Gute Charaktereigenschaften sind&nbsp;<strong>Freundlichkeit</strong>&nbsp;und&nbsp;<strong>Ehrlichkeit</strong>.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Eine gute Person macht keine falschen Komplimente, weil sie&nbsp;<strong>ehrlich</strong>&nbsp;ist.</p>\n<p>Eine schlechte Person hingegen macht viele falsche Komplimente,&nbsp;<strong>weil sie sich einschleimen will</strong>."</p>	2022-09-03 16:27:20.98754	2022-09-03 16:27:20.98754	159
45	<p>&Uuml;berlege dir, was jeweils die goldene Mitte zwischen den zwei genannten Extremen sein k&ouml;nnte!</p>\n<table style="border-collapse: collapse; width: 100%;" border="1"><colgroup><col style="width: 33.3333%;"><col style="width: 33.3333%;"><col style="width: 33.3333%;"></colgroup>\n<tbody>\n<tr>\n<td>Extrem</td>\n<td>Mitte</td>\n<td>Extrem</td>\n</tr>\n<tr>\n<td>Faulheit, Tr&auml;gheit</td>\n<td>?</td>\n<td>Hektische Betriebsamkeit, Workaholic</td>\n</tr>\n</tbody>\n</table>\n<div class="row mx-2">\n<div id="extrem2" class="col-5 text-center"></div>\n</div>\n<div id="possiblevirtues" class="mx-auto"></div>\n<div class="mx-auto">&nbsp;</div>\n<div class="mx-auto">&nbsp;</div>	2022-09-03 16:42:29.307779	2022-09-03 16:42:29.307779	169
47	<p>"Es ist sicher gut, wenn Grosskonzerne sich entscheiden, viel Geld f&uuml;r einen wohlt&auml;tigen Zweck zu spenden.</p>\n<p>Aber leider tun sie das nicht, weil sie grossz&uuml;gig sind, sondern nur,&nbsp;<strong>weil sie ihr Image aufbessern wollen</strong>.</p>\n<p>Eine brauchbare Ethik muss daher&nbsp;<strong>diese diese scheinheilige Fassade durchschauen</strong>&nbsp;und&nbsp;<strong>kritisieren k&ouml;nnen</strong>."</p>	2022-09-03 16:55:28.115543	2022-09-03 16:55:28.115543	180
48	<p>"Wenn uns jemand sagt, dass wir dieses tun und jenes unterlassen sollen, dann muss uns diese Person erkl&auml;ren,&nbsp;<strong>warum</strong>&nbsp;wir dieses tun und jenes unterlassen sollten.</p>\n<p>Warum, zum Beispiel, sollte ich Geld spenden, wenn ich das Geld viel lieber behalten m&ouml;chte?</p>\n<p>Oder warum sollte ich in den Krieg ziehen, wenn ich Angst davor habe, mein Leben zu verlieren?</p>\n<p>Nur eine Ethik, die diese Fragen plausibel beantworten kann, ist in meinen Augen eine gute Ethik."</p>	2022-09-03 16:57:02.269864	2022-09-03 16:57:02.269864	181
49	<p>"Heutzutage ist jeder gegen Sklaverei. Das war aber nicht immer so. Fr&uuml;her war Sklaverei ein allt&auml;gliches Ph&auml;nomen und viele haben die Sklaverei verteidigt.</p>\n<p>Sogar Aristoteles hat die Sklaverei verteidigt. Wenn Aristoteles in einer anderen Kultur aufgewachsen w&auml;re, und zwar in einer, in der Sklaverei verboten ist, dann h&auml;tte er die Sklaverei nicht verteidigt."</p>	2022-09-03 17:00:52.256939	2022-09-03 17:00:52.256939	186
50	<p>"Ethische Fragen sind leicht gestellt, aber schwierig zu beantworten. Wer glaubt, man k&ouml;nnte ethische Fragen mit einem Regelsystem oder mit einem Verfahren beantworten, verkennt die Komplexit&auml;t des Lebens.</p>\n<p>Eine brauchbare Ethik muss daher eine sein, die die Komplexit&auml;t des Lebens ber&uuml;cksichtigt. Die tugendhafte Person weiss das und verzichtet auf einfach anwendbare Verfahren oder Regelsysteme."</p>	2022-09-03 17:03:41.197279	2022-09-03 17:03:41.197279	187
51	<div id="concept" class="text-center mb-1">\n<div class="p-1">\n<p>Franz l&auml;uft bei jeder Gefahr sofort weg.</p>\n</div>\n</div>	2022-09-03 17:06:44.482877	2022-09-03 17:06:44.482877	189
52	<p>Du siehst, wie dein Freund die Tasche einer Frau klaut und daraus alle Wertsachen entnimmt.</p>\n<p>Du weisst, dass dein Freund arbeitslos ist und finanzielle Schwierigkeiten hat.</p>\n<p><strong>Was w&uuml;rde eine tugendhafte Person in deiner Situation tun?</strong></p>	2022-09-03 17:08:12.266249	2022-09-03 17:08:12.266249	190
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
1	admin	2022-05-18 07:15:30.934231	2022-05-18 07:15:30.934231
2	teacher	2022-05-18 07:15:30.939977	2022-05-18 07:15:30.939977
3	student	2022-05-18 07:15:30.943975	2022-05-18 07:15:30.943975
4	admin	2022-05-18 07:17:53.891539	2022-05-18 07:17:53.891539
5	teacher	2022-05-18 07:17:53.895132	2022-05-18 07:17:53.895132
6	student	2022-05-18 07:17:53.897764	2022-05-18 07:17:53.897764
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.schema_migrations (version) FROM stdin;
20220514120604
20220516113006
20220516113147
20220516114639
20220517083639
20220517084024
20220517084327
20220517093157
20220517184415
20220517184512
20220521080806
20220531202126
20220604195152
20220618112557
20220625085137
20220708065503
20220715182218
20220715182426
20220716041607
20220716070522
20220716094604
20220716130127
20220716132630
20220723084801
20220729062858
20220806164209
20220826065559
20220826065607
20220903190750
\.


--
-- Data for Name: slides; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.slides (id, content, created_at, updated_at, course_id, sort, save_progress, course_complete) FROM stdin;
1	<h1>Treibhausgase</h1>\n<p>Seit der industriellen Revolution im 18. Jahrhundert wird der &uuml;ber Jahrmillionen in Steinkohle, Braunkohle, Erd&ouml;l und Erdgas fixierte Kohlenstoff durch Verbrennung als Kohlendioxid (CO2) in die Atmosph&auml;re abgegeben.</p>\n<p>Auch durch die immer gr&ouml;ssere Nutztierhaltung wird immer mehr Methan (CH4) in die Atmosph&auml;re ausgestossen.</p>\n<p>CO2 und CH4 geh&ouml;ren zu den sogenannten <strong>Treibhausgasen</strong>. Treibhausgasen nehmen in der Atmosph&auml;re Strahlung auf und erw&auml;rmen die Luft.&nbsp;</p>	2022-05-18 07:19:14.948932	2022-05-21 17:11:05.034173	1	1	false	false
2	<h1>Klimawandel</h1>\n<p>Dadurch, dass immer mehr Treibhausgase in die Atmosph&auml;re abgeben werden, erh&ouml;ht sich die globale Durchschnittstemperatur auf der Erde.</p>\n<p>Damit entsteht ein <strong>Klimawandel</strong>, der durch menschliche Aktivit&auml;ten verursacht wurde.</p>\n<p>&nbsp;</p>	2022-05-18 07:23:37.201466	2022-05-21 17:11:05.039375	1	2	false	false
3	<h1>Die Folgen des Klimawandels</h1>\n<p>Zu den direkten Folgen des Klimawandels geh&ouml;ren:</p>\n<ul>\n<li>steigende Maximaltemperaturen</li>\n<li>steigende Minimaltemperaturen</li>\n<li>steigender Meeresspiegel</li>\n<li>h&ouml;here Meerestemperaturen</li>\n<li>zunehmende Starkniederschl&auml;ge (Starkregen und Hagel)</li>\n<li>Zunahme des Anteils heftiger tropischer Wirbelst&uuml;rme</li>\n<li>Zunahme von Trockenheit und D&uuml;rre</li>\n<li>R&uuml;ckgang des arktischen Meereises und der Schneebedeckung</li>\n<li>Gletscherschwund und Gletscherr&uuml;ckgang</li>\n<li>tauender Permafrost</li>\n</ul>	2022-05-18 19:31:42.816565	2022-05-21 17:11:05.046381	1	3	false	false
4	<h1>Was tun?</h1>\n<p>Da der Klimawandel problematische Folgen hat, stellt sich die Frage, was wir tun k&ouml;nnen, um den Klimawandel zu entsch&auml;rfen.</p>\n<p>Wo entstehen Treibhausgase? Wer verursacht wie viel? Wer ist am st&auml;rksten davon betroffen?</p>\n<p>Zusammenstellungen der Informationen:</p>\n<p>&nbsp;</p>	2022-05-18 20:09:00.283886	2022-05-21 17:11:05.053597	1	4	false	false
5	<h1>Klimagerechtigkeit?</h1>\n<p>Was hat der Klimawandel mit Gerechtigkeit zu tun?</p>\n<p>In diesem Kurs lernst du, welche Gerechtigkeitsfragen der Klimawandel aufwirft.</p>	2022-05-21 17:10:59.375412	2022-05-21 17:16:54.197408	1	0	false	false
6	<div data-controller="who-creates-climate-change">\n<div style="width: 100%; height: 100vh;" data-who-creates-climate-change-target="output">&nbsp;</div>\n</div>	2022-05-24 05:00:03.418008	2022-05-24 05:00:03.439504	1	5	false	false
7	<p>Was f&auml;llt auf, wenn man sich die Zahlen anschaut?</p>	2022-05-24 05:31:51.535113	2022-05-24 05:31:51.543344	1	6	false	false
8	<p>Infographik dazu, dass &auml;rmere Menschen h&auml;rter vom Klimawandel betroffen sind.</p>	2022-05-24 05:39:05.114538	2022-05-24 05:39:05.12327	1	7	false	false
14	<h2 style="text-align: center;">Kompetenzen</h2>\n<ul>\n<li>Du kannst erkl&auml;ren, warum wir k&uuml;nftigen Generationen etwas schulden.</li>\n</ul>	2022-06-03 09:05:05.892128	2022-06-03 09:05:05.905806	3	1	false	false
10	<h1 style="text-align: center;">Kompetenzen</h1>\n<p>In diesem Kurs erwirbst du folgende Kompetenzen:</p>\n<p>KE1: Ich kann beschreiben warum der menschengemachte Klimawandel eine doppelte Ungerechtigkeit darstellt mit Blick auf seine Verursachung und seinen Auswirkungen. Damit kann ich begr&uuml;nden, warum der von Menschen verursachte Klimawandel ein Gerechtigkeitsproblem darstellt und damit die Frage aufwirft, wie die Pflichten im Umgang mit dem Klimawandel gerecht verteilt werden.&nbsp;</p>\n<p><br>KE2: Ich kann skeptische Meinungen zum Klimawandel mit Hilfe der doppelten Ungerechtigkeit, die der Klimawandel darstellt, zur&uuml;ckweisen. Bei der Begr&uuml;ndung kann ich mich auf naturwissenschaftliche Erkenntnisse beziehen und daraus auf Gerechtigkeitsfragen schliessen.&nbsp;</p>	2022-06-03 08:49:30.868722	2022-07-08 08:03:41.029857	2	1	false	false
9	<p>Anhand dieser Situation spricht Person X von einer "doppelten Ungerechtigkeit".&nbsp;</p>	2022-05-24 05:40:01.538474	2022-05-24 05:43:31.787865	1	8	false	false
28	<h1>Kompetenzen</h1>\n<p>In diesem Kurs erwirbst du folgende Kompetenzen:</p>\n<ul class="space-between-li-20">\n<li>Du kannst&nbsp;<strong>drei ethische Theorien</strong>&nbsp;nennen.</li>\n<li>Du kannst erkl&auml;ren, wie diese ethischen Theorien eine&nbsp;<strong>Handlung bewerten</strong>.</li>\n<li>Du kannst Bewertungen von Handlungen&nbsp;<strong>einer ethischen Theorie zuordnen</strong>.</li>\n</ul>	2022-07-29 06:51:50.513957	2022-07-29 07:38:42.594356	5	2	false	false
15	<h2 style="text-align: center;">Kompetenzen</h2>\n<ul>\n<li>Du kannst erkl&auml;ren, was wir den k&uuml;nftigen Generationen schulden</li>\n</ul>	2022-06-03 09:06:58.32528	2022-06-03 09:06:58.340687	4	1	false	false
18	<h1>Was ist Gerechtigkeit?</h1>\n<p>Das Wort Gerechtigkeit wird auf verschiedene Weisen verwendet und kann verschiedene Bedeutungen annehmen.</p>\n<p>Im Folgenden wird ein kleiner &Uuml;berblick pr&auml;sentiert, welche Verwendungsweisen das Wort Gerechtigkeit hat.</p>	2022-07-22 07:26:05.94279	2022-07-22 14:18:08.240135	2	2	false	false
64	<p>&Uuml;berlege dir,&nbsp;<strong>von welcher Ethik</strong>&nbsp;die folgende Bewertung stammen k&ouml;nnte!</p>	2022-08-06 11:33:38.092481	2022-08-06 11:33:38.097826	5	36	false	false
65	<p><strong>Warum</strong>&nbsp;ist diese Bewertung typisch f&uuml;r die Tugendethik?</p>	2022-08-06 11:34:49.491023	2022-08-06 11:34:49.496048	5	37	false	false
17	<h1>Was ist Klimawandel?</h1>\n<p>&nbsp;</p>\n<p>&nbsp;</p>	2022-07-08 09:03:25.809799	2022-07-22 16:27:26.640216	2	8	false	false
13	<h1>Klimawandel</h1>\n<p>Dadurch, dass immer mehr Treibhausgase in die Atmosph&auml;re abgeben werden, erh&ouml;ht sich die globale Durchschnittstemperatur auf der Erde.</p>\n<p>Damit entsteht ein&nbsp;<strong>Klimawandel</strong>, der durch menschliche Aktivit&auml;ten verursacht wurde.</p>	2022-06-03 08:59:26.07259	2022-07-22 16:29:03.71648	2	10	false	false
37		2022-07-29 10:53:04.072576	2022-08-06 12:19:35.200045	5	9	false	false
29	<h1 class="text-center">Warum sich mit Ethik befassen?</h1>\n<p>Wir&nbsp;<strong>loben</strong>&nbsp;und&nbsp;<strong>kritisieren</strong>&nbsp;uns gegenseitig f&uuml;r unsere&nbsp;<strong>Taten</strong>.</p>\n<p>Wir sagen Dinge wie:</p>\n<p>-&nbsp;<strong>"Das h&auml;ttest du nicht tun sollen!"</strong></p>\n<p>Oder:</p>\n<p>-&nbsp;<strong>"Das hast du sehr gut gemacht!"</strong></p>\n<p>Aber&nbsp;<strong>warum</strong>&nbsp;eigentlich?</p>\n<p>Was genau macht eine Handlung&nbsp;<strong>richtig</strong>? Was eine Handlung&nbsp;<strong>falsch</strong>? Wann ist Lob&nbsp;<strong>wirklich</strong>&nbsp;angebracht? Und mit&nbsp;<strong>welchen Gr&uuml;nden</strong>&nbsp;d&uuml;rfen wir andere&nbsp;<strong>kritisieren</strong>?</p>\n<p>Die&nbsp;<strong>Ethik</strong>&nbsp;gibt Antworten auf all diese Fragen.</p>	2022-07-29 06:52:44.603645	2022-07-29 06:52:55.025419	5	0	false	false
47	<h1 class="text-center">Die Tugendethik</h1>\n<p><strong>Tugendethik</strong>&nbsp;ist ein Sammelbegriff f&uuml;r ethische Theorien, die Charaktereigenschaften beurteilen.</p>\n<p>Das Wort "Tugend" ist abgeleitet von&nbsp;<em>taugen</em>&nbsp;oder&nbsp;<em>Tauglichkeit</em>.</p>\n<p>Ein guter Mensch ist einer, der&nbsp;<strong>gute Charaktereigenschaften</strong>&nbsp;besitzt.</p>\n<p>Gute, lobenswerte oder ausgezeichnete Charaktereigenschaften werden auch&nbsp;<strong>Tugenden</strong>&nbsp;genannt.</p>\n<p>Beispiele f&uuml;r Tugenden sind&nbsp;<strong>Klugheit, Gerechtigkeit, Tapferkeit</strong>&nbsp;oder&nbsp;<strong>M&auml;ssigung</strong>.</p>\n<p>Daher kommt auch der Name "<em>Tugend</em>ethik".</p>\n<p>Das Gegenteil einer Tugend ist ein&nbsp;<strong>Laster</strong>.</p>\n<p>Beispiele f&uuml;r Laster sind&nbsp;<strong>Aberglaube, Ungerechtigkeit, Feigheit</strong>&nbsp;oder&nbsp;<strong>Z&uuml;gellosigkeit</strong>.</p>	2022-07-29 13:36:27.659342	2022-08-06 12:28:24.348343	5	19	false	false
131	<h1 class="text-center">Die Kantische Antwort?</h1>\n<p><strong>Littering</strong>&nbsp;ist das unsachgem&auml;sse Wegwerfen von M&uuml;ll in die Umwelt.</p>\n<p><strong>Darf man Littering betreiben?</strong></p>	2022-09-03 13:15:55.759765	2022-09-03 13:15:55.767315	7	17	false	false
49	<h1 class="text-center">&Uuml;bung</h1>\n<p>Auf der n&auml;chsten Seite siehst du oben ein <strong>Wort</strong>&nbsp;und darunter&nbsp;<strong>drei K&auml;stchen</strong>&nbsp;mit Text.</p>\n<p>Versuche herauszufinden,&nbsp;<strong>welches</strong>&nbsp;der drei K&auml;stchen&nbsp;<strong>zum obenstehenden Wort passt</strong>!</p>\n<p><strong>Klicke</strong>&nbsp;dann auf das K&auml;stchen, von dem du denkst, dass es zum obenstehenden Wort passt!</p>	2022-07-29 13:38:02.336481	2022-07-29 13:38:02.34089	5	21	false	false
46	<h1 class="text-center">Ein Beispiel</h1>\n<p>Nach dem Kantianismus sollten wir vor jeder Handlung pr&uuml;fen, ob unsere Handlung eine ist,&nbsp;<strong>von der wir wollen k&ouml;nnen, dass alle sie tun w&uuml;rden.</strong></p>\n<p><strong>Stell dir vor</strong>, du wanderst im&nbsp;<strong>Nationalpark</strong>. Unterwegs machst du eine Essenspause. Nach dem Essen hat sich&nbsp;<strong>ein Abfallhaufen</strong>&nbsp;gebildet. Du k&ouml;nntest den Abfall liegen lassen oder ihn mitnehmen.</p>\n<p>Solltest du den Abfall liegen lassen?</p>\n<p>Nach dem Kantianismus musst du pr&uuml;fen, ob du es wollen kannst, wenn&nbsp;<strong>jeder seinen Abfall im Nationalpark liegen lassen w&uuml;rde</strong>.</p>\n<p>Wenn jeder seinen Abfall im Nationalpark liegen lassen w&uuml;rde, dann g&auml;be es vor lauter M&uuml;ll gar keinen Nationalpark mehr. Da du das nicht wollen kannst,&nbsp;<strong>darfst du den Abfall nicht liegenlassen.</strong></p>	2022-07-29 13:31:19.020393	2022-07-29 13:35:05.199206	5	18	false	false
44	<h1 class="text-center">Die Deontologie</h1>\n<p><strong>Deontologie</strong>&nbsp;ist ein Sammelbegriff f&uuml;r ethische Theorien, die Handlungen&nbsp;<strong>als solche</strong>&nbsp;beurteilen.</p>\n<p>In der Deontologie werden Handlungen nicht im Bezug auf die Folgen beurteilt, sondern die&nbsp;<strong>Handlungen selbst</strong>&nbsp;werden beurteilt.</p>\n<p>Das griechische Wort&nbsp;<em><u>to deon</u></em>&nbsp;bedeutet "das Notwendige" oder "das Erforderliche".</p>\n<p>Daher kommt auch der Name "<em>Deon</em>tologie".</p>\n<p>Eine Handlung ist gut, wenn sie&nbsp;<strong>an sich gut</strong>&nbsp;ist und eine Handlung ist schlecht, wenn sie&nbsp;<strong>an sich schlecht</strong>&nbsp;ist.</p>\n<p>Die Frage ist nun, was man unter einer&nbsp;<strong>an sich guten Handlung</strong>&nbsp;und einer&nbsp;<strong>an sich schlechten Handlung</strong>&nbsp;genau verstehen soll.</p>	2022-07-29 13:30:23.239626	2022-07-29 13:35:23.658998	5	16	false	false
48	<h1 class="text-center">Ein Beispiel</h1>\n<p>In der Tugendethik werden Handlungen danach bewertet, ob sie&nbsp;<strong>aus einer Tugend</strong>&nbsp;oder&nbsp;<strong>aus einem Laster entspringen</strong>.</p>\n<p><strong>Stell dir vor</strong>, du hast etwas&nbsp;<strong>aus Neid</strong>&nbsp;gestohlen.</p>\n<p>Die Frage ist nun, ob&nbsp;<strong>aus Neid stehlen</strong>&nbsp;etwas ist, das wir von einer tugendhaften Person erwarten w&uuml;rden.</p>\n<p>Wenn wir unter einer&nbsp;<strong>tugendhaften Person</strong>&nbsp;eine&nbsp;<strong>gerechte</strong>&nbsp;Person verstehen, dann w&uuml;rden wir erwarten, dass eine tugendhafte Person&nbsp;<strong>aus einem Sinn f&uuml;r Gerechtigkeit</strong>&nbsp;stiehlt.</p>\n<p>Da du aber&nbsp;<strong>aus Neid</strong>&nbsp;und&nbsp;<strong>nicht aus einem Sinn f&uuml;r Gerechtigkeit</strong>&nbsp;gestohlen hast, war deine Handlung&nbsp;<strong>schlecht</strong>.</p>	2022-07-29 13:37:00.66854	2022-07-29 13:37:00.673002	5	20	false	false
38		2022-07-29 11:11:38.082091	2022-08-06 12:20:02.427143	5	10	false	false
50	<h1 class="text-center">Welches K&auml;stchen passt?</h1>	2022-07-29 13:38:33.782316	2022-07-30 19:11:46.249443	5	22	false	false
66	<p>&Uuml;berlege dir,&nbsp;<strong>von welcher Ethik</strong>&nbsp;die folgende Bewertung stammen k&ouml;nnte!</p>	2022-08-06 11:36:24.959317	2022-08-06 11:36:24.963488	5	38	false	false
67	<p><strong>Warum</strong>&nbsp;ist diese Bewertung typisch f&uuml;r die Deontologie?</p>	2022-08-06 11:37:25.473964	2022-08-06 11:37:25.478377	5	39	false	false
31	<h1>Was ist Ethik?</h1>\n<p>Die Ethik ist ein <strong>Teilgebiet der Philosophie</strong>.</p>\n<p>Sie besch&auml;ftigt sich mit Fragen wie:</p>\n<ul class="space-between-li-10">\n<li><strong>Was soll ich tun?</strong></li>\n<li><strong>Wie verhalte ich mich richtig?</strong></li>\n</ul>\n<p>Ethische Fragen tauchen im Alltag &uuml;berall auf.</p>\n<p><strong>Zum Beispiel:</strong>&nbsp;Darf ich meinen Nachbarn anl&uuml;gen? Soll ich dem alten Mann &uuml;ber die Strasse helfen? Muss ich mein Versprechen immer halten?</p>\n<p><strong>Philosophen</strong>&nbsp;und&nbsp;<strong>Philosophinnen</strong>&nbsp;denken &uuml;ber solche Fragen nach und versuchen, die besten Antworten auf diese Fragen zu finden.</p>	2022-07-29 07:56:07.037079	2022-08-06 12:16:46.965461	5	3	false	false
45	<h1 class="text-center">Der Kantianismus</h1>\n<p>Der&nbsp;<strong>Kantianismus</strong>&nbsp;ist eine Variante einer deontologischen Theorie.</p>\n<p>Der Kantianismus&nbsp;<strong>definiert</strong>, was eine gute und was eine schlechte Handlung ist:</p>\n<ul>\n<li>Eine Handlung ist gut, wenn man wollen kann, dass&nbsp;<strong>alle sie tun w&uuml;rden</strong>.</li>\n<li>Eine Handlung ist schlecht, wenn man wollen kann, dass&nbsp;<strong>alle sie&nbsp;<u>nicht</u>&nbsp;tun w&uuml;rden</strong>.</li>\n</ul>\n<p><strong>Beispiel f&uuml;r eine schlechte Handlung:</strong></p>\n<p><strong>Diebstahl</strong>&nbsp;ist eine Handlung, die an sich schlecht ist. Ich will nicht in einer Welt leben, in der alle stehlen.</p>\n<p><strong>Beispiel f&uuml;r eine gute Handlung:</strong></p>\n<p><strong>Wahrheit sagen</strong>&nbsp;ist eine Handlung, die an sich gut ist. Ich will in einer Welt leben, in der alle die Wahrheit sagen.</p>	2022-07-29 13:30:49.586869	2022-08-06 12:25:42.124701	5	17	false	false
26	<h1>Besonderheiten der Klimaproblematik</h1>\n<p>Wenn es um Klima-Gerechtigkeit geht, dann ergeben sich Probleme oder Schwierigkeiten, die sich anderswo nicht ergeben.&nbsp;</p>\n<p>Im Folgenden werden 4 solche Probleme oder Schwierigkeiten aufgezeigt.&nbsp;</p>\n<ol>\n<li>Die Ursachen und Wirkungen des Klimawandels liegen zeitlich weit auseinander.</li>\n<li>Die Ursachen und Wirklungen des Klimawandels liegen r&auml;umlich weit auseinander.</li>\n<li>Die Ursachen des Klimawandels sind stark fragmentiert.</li>\n<li>Der Klimawandel ist ein Problem des Umgangs mit grossen Unsicherheiten.</li>\n</ol>	2022-07-23 07:44:00.429319	2022-09-09 09:29:20.893762	2	13	false	false
20	<p><strong>Gerechtigkeit als etwas, das uns zusteht und das wir einforden k&ouml;nnen</strong></p>\n<p>Wenn wir entdecken, dass G&uuml;ter ungerecht verteilt werden, dann empfinden wir das als ein Fehlverhalten, das korrigiert werden muss.</p>\n<p>Wenn wir bei der Verteilung von G&uuml;tern weniger erhalten, als uns zusteht, dann k&ouml;nnen wir eine gerechtere Verteilung einfordern.</p>\n<p>Gerechtigkeit ist also verschieden von Wohlt&auml;tigkeit oder Barmherzigkeit.</p>\n<p>W&auml;hrend wir ein Recht darauf haben, gewisse G&uuml;ter zu erhalten, die wir nicht bekommen haben, haben wir kein Recht darauf, Spenden oder Geschenke zu erhalten.</p>	2022-07-22 08:42:02.913894	2022-07-22 15:17:10.587736	2	5	false	false
68	<h1>Kurs abgeschlossen!</h1>	2022-08-06 11:54:00.169924	2022-09-03 07:41:40.343128	5	40	false	true
158	<p class="text-center"><strong>&Uuml;berlege dir</strong>, ob die folgende Theorie&nbsp;<strong>tugendethisch</strong>&nbsp;ist!</p>	2022-09-03 16:24:11.47765	2022-09-03 16:24:11.502144	9	6	false	false
90	<p class="text-center"><strong>Welches Merkmal</strong>&nbsp;des Utilitarismus&nbsp;<strong>passt nicht</strong>&nbsp;zur folgenden Aussage?</p>	2022-09-03 09:00:45.20213	2022-09-03 09:00:45.207932	6	20	false	false
30	<h1 class="text-center">Warum sich mit Ethik befassen? (2)</h1>\n<p>Das Studium der&nbsp;<strong>Ethik</strong>&nbsp;hilft dir,&nbsp;<strong>besser</strong>&nbsp;&uuml;ber Taten oder Handlungen&nbsp;<strong>nachzudenken</strong>&nbsp;und sie&nbsp;<strong>zu beruteilen</strong>.</p>\n<p>Die Ethik gibt dir einen&nbsp;<strong>Werkzeugkasten</strong>, mit dem du&nbsp;<strong>logisch</strong>&nbsp;und&nbsp;<strong>argumentativ</strong> &uuml;ber die Richtigkeit oder Falschheit von Handlungen diskutieren kannst.</p>\n<p>Auch unterst&uuml;tzt dich dieser Werkzeugkasten dabei, die&nbsp;<strong>richtigen Entscheidungen</strong>&nbsp;im Leben zu treffen.</p>\n<p>Nebenbei erwirbst du&nbsp;<strong>analytische F&auml;higkeiten</strong>&nbsp;und ein&nbsp;<strong>kritisches Denkverm&ouml;gen</strong>, die dir sowohl im Beruf als auch im allt&auml;glichen Leben n&uuml;tzlich sein werden.</p>	2022-07-29 07:37:48.424177	2022-07-29 09:44:02.892096	5	1	false	false
21	<p><strong>Gerechtigkeit als Unparteilichkeit&nbsp;</strong></p>\n<p>Wir sprechen auch von Ungerechtigkeit, wenn eine Person oder Organisation parteiisch handelt.</p>\n<p>Zum Beispiel empfinden wir es als ungerecht, wenn Mitarbeitende nur deshalb mehr Lohn bekommen, weil sie mit der vorgesetzten Person befreundet sind.</p>\n<p>Oder wenn Jobs an Familienmitgliedern vergeben werden, statt an Personen, die besser f&uuml;r den Job geeignet w&auml;ren.</p>	2022-07-22 08:43:21.039031	2022-07-22 16:19:45.56241	2	6	false	false
24	<p>Dabei muss es sich nicht immer um materielle G&uuml;ter wie Nahrungsmittel handeln.</p>\n<p>Die Frage nach der richtigen Verteilung stellt sich auch bei Dingen wie Freiheiten oder Pflichten.</p>\n<p>Wir empfinden es zum Beispiel als ungerecht, wenn eine Person sich alles erlauben kann, w&auml;hrend andere Personen f&uuml;r die gleichen Handlungen bestraft werden.</p>\n<p>&nbsp;</p>	2022-07-22 15:15:14.214908	2022-07-22 15:15:33.625857	2	4	false	false
72	<h1>Der Konsequentialismus</h1>\n<p><strong>Konsequentialismus</strong>&nbsp;ist ein Sammelbegriff f&uuml;r ethische Theorien, die Handlungen aufgrund ihrer&nbsp;<strong>Folgen</strong>&nbsp;oder&nbsp;<strong>Konsequenzen</strong>&nbsp;beurteilen.</p>\n<p>Daher auch der Name "<em>Konsequen</em>tialismus".</p>\n<p>Eine Handlung ist&nbsp;<strong>gut</strong>, wenn sie&nbsp;<strong>gute Folgen</strong>&nbsp;hat und eine Handlung ist&nbsp;<strong>schlecht</strong>, wenn sie&nbsp;<strong>schlechte Folgen</strong>&nbsp;hat.</p>\n<p>Die Frage ist nun, was man genau unter&nbsp;<strong>guten</strong>&nbsp;und&nbsp;<strong>schlechten Folgen</strong>&nbsp;verstehen soll.</p>	2022-09-03 08:20:15.013352	2022-09-03 08:20:15.019884	6	2	false	false
70	<h1 class="text-center">Warum sich mit Konsequentialismus befassen?</h1>\n<p>Es lohnt sich mit dem Konsequentialismus zu befassen, weil konsequentialistische Begr&uuml;ndungen oder Argumente im Alltag und in der Politik <strong>oft vorkommen</strong>.</p>\n<p>Das Studium des Konsequentialismus hilft dir, konsequentialistische Begr&uuml;ndungen oder Argumente zu&nbsp;<strong>erkennen</strong>, zu&nbsp;<strong>analysieren</strong>&nbsp;und zu&nbsp;<strong>kritisieren</strong>.</p>\n<p>Indem du &uuml;ber die&nbsp;<strong>St&auml;rken</strong>&nbsp;und&nbsp;<strong>Schw&auml;chen</strong>&nbsp;des Konsequentialismus nachdenkst, lernst du, bessere&nbsp;<strong>Entscheidungen zu treffen</strong>&nbsp;und kannst andere beraten, wie sie sich entscheiden&nbsp;<strong>sollen</strong>.</p>	2022-09-03 07:46:04.735914	2022-09-03 07:46:35.981137	6	0	false	false
56	<h1>Welches K&auml;stchen passt?</h1>	2022-08-06 09:46:38.818463	2022-08-06 09:46:38.822756	5	28	false	false
51	<h1 class="text-center">Welches K&auml;stchen passt?</h1>	2022-07-29 13:54:22.103612	2022-07-30 19:13:03.411347	5	23	false	false
53	<h1 class="text-center">Welches K&auml;stchen passt?</h1>	2022-07-30 10:12:14.698895	2022-07-30 10:17:47.310086	5	25	false	false
52	<h1 class="text-center">Welches K&auml;stchen passt?</h1>	2022-07-29 13:57:02.240548	2022-07-30 19:13:42.769395	5	24	false	false
55	<h1>Welches K&auml;stchen passt?</h1>	2022-08-06 09:45:26.105097	2022-08-06 09:45:26.111699	5	27	false	false
57	<h1>Welches K&auml;stchen passt?</h1>	2022-08-06 09:47:43.264354	2022-08-06 09:47:43.270623	5	29	false	false
39	<h1 class="text-center">Drei Ethische Theorien</h1>\n<p>Auf den n&auml;chsten Seiten lernst du <strong>drei ethische Theorien</strong>&nbsp;kennen.</p>\n<p>Diese drei Theorien unterscheiden sich in der&nbsp;<strong>Art und Weise</strong>, wie sie&nbsp;<strong>Handlungen beurteilen</strong>:</p>\n<p><strong>Konsequentialismus:&nbsp;</strong>Eine Handlung ist gut, wenn sie gute Folgen hat.</p>\n<p><strong>Deontologie:&nbsp;</strong>Eine Handlung ist gut, wenn die Handlung an sich gut ist.</p>\n<p><strong>Tugendethik:&nbsp;</strong>Eine Handlung ist gut, wenn sie aus einer Tugend entspringt.</p>	2022-07-29 11:15:58.137471	2022-08-06 12:22:13.485685	5	11	false	false
12	<p><strong>Treibhausgase</strong></p>\n<p>Seit der industriellen Revolution im 18. Jahrhundert wird der &uuml;ber Jahrmillionen in Steinkohle, Braunkohle, Erd&ouml;l und Erdgas fixierte Kohlenstoff durch Verbrennung als Kohlendioxid (CO2) in die Atmosph&auml;re abgegeben.</p>\n<p>Auch durch die immer gr&ouml;sser werdende Nutztierhaltung wird immer mehr Methan (CH4) in die Atmosph&auml;re ausgestossen.</p>\n<p>CO2 und CH4 geh&ouml;ren zu den sogenannten&nbsp;<strong>Treibhausgasen</strong>. Treibhausgasen nehmen in der Atmosph&auml;re Strahlung auf und erw&auml;rmen die Luft.&nbsp;</p>	2022-06-03 08:58:59.787258	2022-07-22 16:28:45.043262	2	9	false	false
41	<h1 class="text-center">Der Utilitarismus</h1>\n<p>Der&nbsp;<strong>Utilitarismus</strong>&nbsp;ist eine Variante einer konsequentialistischen Theorie.</p>\n<p>Der Utilitarismus&nbsp;<strong>definiert</strong>, was gute und was schlechte Folgen sind:</p>\n<ul class="space-between-li-10">\n<li>Eine Handlung ist gut, wenn sie&nbsp;<strong>viel Gl&uuml;ck bringt</strong>.</li>\n<li>Eine Handlung ist schlecht, wenn sie&nbsp;<strong>viel Leid produziert</strong>.</li>\n</ul>\n<p><strong>Beispiel f&uuml;r eine gute Handlung:</strong></p>\n<p>Ich besuchte meine Freundin im Spital. Das machte sie sehr gl&uuml;cklich.</p>\n<p><strong>Beispiel f&uuml;r eine schlechte Handlung:</strong></p>\n<p>Jemand hat mir mit dem Hammer auf die Finger gehauen. Das hat mir sehr weh getan.</p>	2022-07-29 13:29:01.332981	2022-08-06 12:23:45.585221	5	13	false	false
25	<h1>Die Folgen des Klimawandels</h1>\n<p>Zu den direkten Folgen des Klimawandels geh&ouml;ren:</p>\n<ul>\n<li>steigende Maximaltemperaturen</li>\n<li>steigende Minimaltemperaturen</li>\n<li>steigender Meeresspiegel</li>\n<li>h&ouml;here Meerestemperaturen</li>\n<li>zunehmende Starkniederschl&auml;ge (Starkregen und Hagel)</li>\n<li>Zunahme des Anteils heftiger tropischer Wirbelst&uuml;rme</li>\n<li>Zunahme von Trockenheit und D&uuml;rre</li>\n<li>R&uuml;ckgang des arktischen Meereises und der Schneebedeckung</li>\n<li>Gletscherschwund und Gletscherr&uuml;ckgang</li>\n<li>tauender Permafrost</li>\n</ul>	2022-07-22 16:30:09.721323	2022-07-22 16:30:19.868803	2	11	false	false
40	<h1 class="text-center">Der Konsequentialismus</h1>\n<p><strong>Konsequentialismus</strong>&nbsp;ist ein Sammelbegriff f&uuml;r ethische Theorien, die Handlungen aufgrund ihrer&nbsp;<strong>Folgen</strong>&nbsp;oder&nbsp;<strong>Konsequenzen</strong>&nbsp;beurteilen.</p>\n<p>Daher auch der Name "<em>Konsequen</em>tialismus".</p>\n<p>Eine Handlung ist&nbsp;<strong>gut</strong>, wenn sie&nbsp;<strong>gute Folgen</strong>&nbsp;hat und eine Handlung ist&nbsp;<strong>schlecht</strong>, wenn sie&nbsp;<strong>schlechte Folgen</strong>&nbsp;hat.</p>\n<p>Die Frage ist nun, was man genau unter&nbsp;<strong>guten</strong>&nbsp;und&nbsp;<strong>schlechten Folgen</strong>&nbsp;verstehen soll.</p>	2022-07-29 13:28:33.077581	2022-07-29 13:28:33.083935	5	12	false	false
69	<h1>Mehr Literatur</h1>\n<ul>\n<li>"Ethik f&uuml;r Dummies" - von Christopher Panza, Adam Potthast und Stefan Pannor</li>\n<li>"Ethik - ein Comic-Buch" - von Dave Robinson</li>\n<li>"Ethik - eine Einf&uuml;hrung" - von Otfried H&ouml;ffe</li>\n</ul>\n<p>&nbsp;</p>\n<h1>Quellen</h1>\n<ul>\n<li>"Einf&uuml;hrung in die philosophische Ethik" - von Dietmar H&uuml;bner</li>\n<li>"Einf&uuml;hrung in die Ethik" - von Annemarie Pieper</li>\n<li>"Einf&uuml;hrung in die Ethik" - von Herlinde Pauer-Studer</li>\n</ul>\n<p>&nbsp;</p>	2022-08-06 11:57:30.702882	2022-08-06 13:11:44.266277	5	41	false	false
54	<h1 class="text-center">Welches K&auml;stchen passt?</h1>	2022-07-30 10:35:22.833583	2022-07-30 10:35:22.840704	5	26	false	false
58	<h1 class="text-center">Typische Bewertungen</h1>\n<p>Ethische Theorien bewerten Handlungen auf&nbsp;<strong>unterschiedliche Weise</strong>.</p>\n<p>In den n&auml;chsten Folien wirst du&nbsp;<strong>ein Fallbeispiel</strong>&nbsp;kennenlernen.</p>\n<p>Danach siehst du&nbsp;<strong>drei ethische Bewertungen von einer Handlung</strong>, die im Fallbeispiel vorgekommen ist.</p>\n<p>Versuche anschliessend herauszufinden,&nbsp;<strong>welche Bewertung typisch f&uuml;r welche Ethik ist!</strong></p>	2022-08-06 09:48:52.781085	2022-08-06 09:48:52.785819	5	30	false	false
59	<h1>Der Post-Mitarbeiter</h1>	2022-08-06 09:49:24.443847	2022-08-06 09:49:24.448952	5	31	false	false
60	<h1 class="text-center">Der Post-Mitarbeiter</h1>\n<p><strong>Toni</strong>&nbsp;arbeitet seit 10 Jahren bei der Post.</p>\n<p>Obwohl Toni sich M&uuml;he gibt, hatte er bisher wenig Erfolg bei der Arbeit.</p>\n<p>Er bekommt oft schwierige Kunden und es gelingt ihm nur selten, gute Gesch&auml;fte abzuschliessen.</p>\n<p><strong>Lara</strong>&nbsp;ist Tonis Mitarbeiterin.</p>\n<p>Obwohl sie erst vor einem Jahr angefangen hat, wurde sie schon zwei Mal bef&ouml;rdert.</p>\n<p>Lara ist beliebt und talentiert. Sie schafft es immer wieder, gute Gesch&auml;fte abzuschliessen.</p>	2022-08-06 09:50:27.601302	2022-08-06 09:50:27.606257	5	32	false	false
61	<h1 class="text-center">Der Post-Mitarbeiter</h1>\n<p>Weil Lara so erfolgreich ist, wurde sie beauftragt, von nun an den&nbsp;<strong>wichtigsten Kunden</strong>&nbsp;zu betreuen.</p>\n<p>Da Toni schon l&auml;nger bei der Post arbeitet und diesen wichtigen Kunden gut kennt, fragt Lara Toni um Rat.</p>\n<p>Weil Toni eifers&uuml;chtig ist, gibt er Lara&nbsp;<strong>absichtlich eine Falschinformation</strong>.</p>\n<p>Aufgrund dieser Falschinformation macht Lara einen verh&auml;ngnisvollen Fehler, der den Kunden ver&auml;rgert und der viel Geld verschwendet.</p>\n<p>Lara verliert daraufhin ihre Stelle bei der Post.</p>	2022-08-06 09:51:16.026823	2022-08-06 09:51:16.031903	5	33	false	false
71	<h1>Kompetenzen</h1>\n<p>In diesem Kurs erwirbst du folgende Kompetenzen:</p>\n<ul class="space-between-li-10">\n<li>Du kannst&nbsp;<strong>konsequentialistische Theorien</strong>&nbsp;anhand eines Merkmals&nbsp;<strong>erkennen</strong>.</li>\n<li>Du kannst&nbsp;<strong>drei Grundmerkmale des Utilitarismus</strong>&nbsp;nennen.</li>\n<li>Du kannst&nbsp;<strong>drei St&auml;rken</strong>&nbsp;und&nbsp;<strong>drei Schw&auml;chen</strong>&nbsp;des Utilitarismus nennen.</li>\n<li>Du kannst eine Handlung aus einer&nbsp;<strong>utilitaristischen Perspektive heraus beurteilen</strong>.</li>\n</ul>	2022-09-03 08:18:37.804627	2022-09-03 08:18:37.812653	6	1	false	false
132	<h1 class="text-center">Die Kantische Antwort? (2)</h1>\n<p><strong>Soll man Gefundenes wieder zur&uuml;ckgeben</strong>?</p>	2022-09-03 13:18:53.540985	2022-09-03 13:18:53.546911	7	18	false	false
133	<h1 class="text-center">Die Kantische Antwort? (3)</h1>\n<p><strong>Darf man Versprechen brechen?</strong></p>	2022-09-03 13:21:20.475261	2022-09-03 13:21:20.481576	7	19	false	false
32	<h1>Was soll ich tun?</h1>\n<p>Hin und wieder kommt es vor, dass&nbsp;<strong>wir nicht wissen</strong>, was wir in einer bestimmten Situation tun sollen.</p>\n<p>Manchmal haben wir Gr&uuml;nde&nbsp;<strong>daf&uuml;r</strong>, als auch&nbsp;<strong>dagegen</strong>, eine bestimmte Handlung zu tun oder zu unterlassen.</p>\n<p><strong>Zum Beispiel:&nbsp;</strong>Soll ich meinem Vorgesetzten die Wahrheit sagen, auch wenn ich damit meinen Freund in Schwierigkeit bringe?</p>\n<p>Einerseits haben wir die Pflicht, unserem Vorgesetzten die Wahrheit zu sagen. Andererseits wollen wir unsere Freunde vor &Auml;rger bewahren.</p>\n<p>Die ethische Frage lautet hier:&nbsp;<strong>Was soll ich in dieser Situation tun?</strong></p>	2022-07-29 09:47:43.375348	2022-07-29 09:47:43.432164	5	4	false	false
33	<h1 class="text-center">Drei ethische Theorien</h1>\n<p>Damit wir besser auf ethische Fragen antworten k&ouml;nnen, entwickeln Philosophen und Philosophinnen&nbsp;<strong>ethische Theorien</strong>.</p>\n<p>Diese Theorien helfen uns,&nbsp;<strong>Entscheidungen zu treffen</strong>, wenn wir nicht wissen, was wir in einer bestimmten Situation tun sollen.</p>\n<p>Drei ethische Theorien sind besonders einflussreich. Sie heissen&nbsp;<strong>Konsequentialismus</strong>,&nbsp;<strong>Deontologie</strong>&nbsp;und&nbsp;<strong>Tugendethik</strong>.</p>	2022-07-29 09:48:05.213427	2022-07-29 09:48:05.227656	5	5	false	false
34	<h1 class="text-center">Was ist eine ethische Theorie?</h1>\n<p>Eine ethische Theorie hat&nbsp;<strong>drei Merkmale</strong>.</p>\n<p>1. Eine ethische Theorie&nbsp;<strong>sagt uns, wie</strong>&nbsp;wir uns in einer bestimmten Situation&nbsp;<strong>verhalten sollen.</strong></p>\n<p>2. Eine ethische Theorie&nbsp;<strong>fordert</strong>, dass wir so handeln&nbsp;<strong>m&uuml;ssen</strong>, wie sie uns vorgibt, zu handeln.</p>\n<p><strong>Das heisst:</strong>&nbsp;Wenn wir nicht so handeln, wie es eine ethische Theorie von uns fordert, dann tun wir&nbsp;<strong>etwas Falsches</strong>&nbsp;und wir&nbsp;<strong>m&uuml;ssen uns &auml;ndern</strong>.</p>\n<p>3. Eine ethische Theorie&nbsp;<strong>richtet sich an alle</strong>&nbsp;gleichermassen.</p>\n<p>Eine ethische Theorie gilt nicht nur f&uuml;r alle Schweizer oder f&uuml;r alle Deutsche, sondern f&uuml;r&nbsp;<strong>alle, die nach dieser Theorie handeln k&ouml;nnen</strong>.</p>	2022-07-29 09:48:45.442985	2022-07-29 09:48:45.456415	5	6	false	false
35	<h1 class="text-center">&Uuml;bung</h1>\n<p>Auf der n&auml;chsten Seite findest du eine <strong>&Uuml;bung</strong>&nbsp;vor!</p>\n<p>Du bekommst&nbsp;<strong>oben</strong>&nbsp;eine Frage gestellt und du kannst&nbsp;<strong>unten</strong>&nbsp;zwischen verschiedenen Antworten eine&nbsp;<strong>ausw&auml;hlen</strong>.</p>\n<p>Wenn du diese &Uuml;bung richtig l&ouml;st, dann bekommst du&nbsp;<strong>Punkte</strong>.</p>\n<p>Wenn du die &Uuml;bung gleich beim ersten Mal richtig l&ouml;st, dann erh&auml;ltst du&nbsp;<strong>die volle Punktzahl</strong>.</p>\n<p>Wenn du aber zuerst einen Fehler gemacht hast, dann erh&auml;ltst du bei der richtigen Antwort&nbsp;<strong>weniger Punkte</strong>.</p>\n<p><strong>Versuche also gleich beim ersten Mal die richtige Antwort zu finden!</strong></p>	2022-07-29 09:49:30.910449	2022-07-29 09:49:30.922278	5	7	false	false
43	<h1 class="text-center">Ein Beispiel (2)</h1>\n<p>Welchen Antrag solltest du ausw&auml;hlen?</p>\n<p>Nach dem Utilitarismus musst du dir &uuml;berlegen,&nbsp;<strong>welcher Antrag am meisten Leid verhindert</strong>&nbsp;und&nbsp;<strong>am meisten Gl&uuml;ck hervorbringt</strong>.</p>\n<p>Da&nbsp;<strong>zahlenm&auml;ssig</strong>&nbsp;mehr Menschen an Malaria sterben, als an AIDS, kannst du mehr&nbsp;<strong>Leid verhindern</strong>&nbsp;und mehr&nbsp;<strong>Gl&uuml;ck hervorbringen</strong>, wenn du den ersten Antrag ausw&auml;hlst.</p>\n<p>Nach dem Utilitarismus sollten wir uns&nbsp;<strong>immer</strong>&nbsp;so verhalten.</p>\n<p>Wir sollten uns&nbsp;<strong>in jeder Situation</strong>&nbsp;&uuml;berlegen, wie wir am meisten Gl&uuml;ck hervorbringen und am meisten Leid verhindern k&ouml;nnen.</p>	2022-07-29 13:29:45.702339	2022-07-29 13:35:49.326588	5	15	false	false
42	<h1 class="text-center">Ein Beispiel</h1>\n<p>Nach dem Utilitarismus sollten wir uns so verhalten, dass wir&nbsp;<strong>m&ouml;glichst viel Gl&uuml;ck hervorbringen</strong>&nbsp;und&nbsp;<strong>m&ouml;glichst wenig Leid produzieren</strong>.</p>\n<p><strong>Stell dir vor</strong>, du arbeitest f&uuml;r den&nbsp;<strong>Nationalfonds</strong>. Deine Aufgabe ist es, zu entscheiden,&nbsp;<strong>welche Forschung finanziert werden soll</strong>&nbsp;und&nbsp;<strong>welche nicht</strong>.</p>\n<p>Du musst nun zwischen zwei Antr&auml;gen einen ausw&auml;hlen:</p>\n<p>Der erste Antrag m&ouml;chte ein&nbsp;<strong>Medikament gegen Malaria</strong>&nbsp;entwickeln. T&auml;glich&nbsp;<strong>sterben 1'200 Menschen an Malaria</strong>.</p>\n<p>Der zweite Antrag m&ouml;chte ein&nbsp;<strong>Medikament gegen AIDS</strong>&nbsp;entwickeln. T&auml;glich&nbsp;<strong>sterben 400 Menschen an AIDS</strong>.</p>	2022-07-29 13:29:22.275146	2022-07-29 13:35:42.602106	5	14	false	false
62	<p>&Uuml;berlege dir,&nbsp;<strong>von welcher Ethik</strong>&nbsp;die folgende Bewertung stammen k&ouml;nnte!</p>	2022-08-06 11:29:05.458116	2022-08-06 11:29:05.463528	5	34	false	false
63	<p><strong>Warum</strong>&nbsp;ist diese Bewertung typisch f&uuml;r den Konsequentialismus?</p>	2022-08-06 11:30:11.976196	2022-08-06 11:30:11.98058	5	35	false	false
36		2022-07-29 09:49:49.603765	2022-08-06 12:18:53.108672	5	8	false	false
159	<p class="text-center"><strong>Warum</strong>&nbsp;ist diese Theorie tugendethisch?</p>	2022-09-03 16:27:15.371151	2022-09-03 16:27:15.379759	9	7	false	false
161	<h1 class="text-center">Aristoteles</h1>\n<p>Die aristotelische Ethik hat <strong>drei Grundmerkmale</strong>:</p>\n<p>1. Als eine tugendethische Theorie&nbsp;<strong>beurteilt</strong>&nbsp;die aristotelische Ethik&nbsp;<strong>Charaktereigenschaften</strong>.</p>\n<p>2. Die aristotelische Ethik bestimmt die Tugend als&nbsp;<strong>das Mittlere zwischen zwei Extremen</strong>.</p>\n<p>3. F&uuml;r die aristotelische Ethik sind Tugenden&nbsp;<strong>notwendig</strong>&nbsp;f&uuml;r ein&nbsp;<strong>gutes</strong>&nbsp;und&nbsp;<strong>gl&uuml;ckliches Leben</strong>.</p>	2022-09-03 16:29:39.735206	2022-09-03 16:29:39.742386	9	9	false	false
73	<h1 class="text-center">Konsequentialistische Theorien</h1>\n<p>Alle konsequentialistischen Theorien beurteilen Handlungen im Bezug auf ihre <strong>Folgen</strong>&nbsp;oder&nbsp;<strong>Konsequenzen</strong>.</p>\n<p>Untereinander unterscheiden sich konsequentialistische Theorien nur in der&nbsp;<strong>Art und Weise</strong>, wie sie Folgen oder Konsequenzen&nbsp;<strong>bewerten</strong>.</p>\n<p>Konsequentialistische Theorien kann man daran&nbsp;<strong>erkennen</strong>, dass sie immer auf&nbsp;<strong>ein Ziel</strong>&nbsp;hin gerichtet sind.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>"Eine Handlung ist gut, wenn sie hilft,&nbsp;<strong>die Armut in der Welt zu verringern</strong>!"</p>\n<p>"Eine Handlung ist gut, wenn sie hilft,&nbsp;<strong>mehr Menschen als zuvor gl&uuml;cklich zu machen</strong>!"</p>	2022-09-03 08:28:23.621118	2022-09-03 08:28:23.631584	6	3	false	false
74	<p class="text-center"><strong>&Uuml;berlege dir</strong>, ob die folgende Theorie&nbsp;<strong>konsequentialistisch</strong>&nbsp;ist!</p>	2022-09-03 08:28:42.617056	2022-09-03 08:28:42.625515	6	4	false	false
75	<p class="text-center"><strong>Warum</strong>&nbsp;ist die folgende Theorie&nbsp;<strong>nicht konsequentialistisch</strong>?</p>	2022-09-03 08:33:37.49487	2022-09-03 08:33:37.500326	6	5	false	false
76	<p class="text-center"><strong>&Uuml;berlege dir</strong>, ob die folgende Theorie&nbsp;<strong>konsequentialistisch</strong>&nbsp;ist!</p>	2022-09-03 08:37:04.871398	2022-09-03 08:37:04.878311	6	6	false	false
77	<p class="text-center">Was ist das&nbsp;<strong>Ziel</strong>&nbsp;der folgenden Theorie?</p>	2022-09-03 08:38:33.394827	2022-09-03 08:38:33.401352	6	7	false	false
78	<h1 class="text-center">Der Utilitarismus</h1>\n<p>Der <strong>Utilitarismus</strong>&nbsp;ist eine Variante einer konsequentialistischen Theorie.</p>\n<p>Im Namen "Utilitarismus" steckt das lateinischen Wort&nbsp;<em>utilitas</em>, das "Nutzen" bedeutet.</p>\n<p>Der Utilitarismus&nbsp;<strong>definiert</strong>, was gute und was schlechte Folgen sind:</p>\n<p>&nbsp;</p>\n<ul class="space-between-li-10">\n<li>Eine Handlung ist gut, wenn sie&nbsp;<strong>viel Nutzen bringt</strong>.</li>\n<li>Eine Handlung ist schlecht, wenn sie&nbsp;<strong>keinen Nutzen bringt</strong>&nbsp;oder sogar&nbsp;<strong>Nutzen verhindert</strong>.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Nach dem Utilitarismus sollten wir immer so handeln, dass&nbsp;<strong>m&ouml;glichst viel Nutzen</strong>&nbsp;entsteht.</p>	2022-09-03 08:40:57.719753	2022-09-03 08:40:57.72592	6	8	false	false
79	<h1>Drei Grundmerkmale</h1>\n<p>Der Utilitarismus hat <strong>drei Grundmerkmale</strong>:</p>\n<p>1. Als eine konsequentialistische Theorie beurteilt der Utilitarismus eine Handlung im Bezug auf ihre&nbsp;<strong>Folgen</strong>&nbsp;oder&nbsp;<strong>Konsequenzen</strong>.</p>\n<p>2. Der Utilitarismus bewertet die Folgen oder Konsequenzen danach, wie viel&nbsp;<strong>Nutzen sie bringen</strong>&nbsp;(oder&nbsp;<strong>nicht bringen</strong>).</p>\n<p>Die Idee, dass Folgen oder Konsequenzen danach bewertet werden sollen, wie viel Nutzen sie bringen, nennt man auch das&nbsp;<strong>Nutzenprinzip</strong>.</p>\n<p>3. Der Utilitarismus achtet auf den&nbsp;<strong>Gesamtnutzen</strong>, nicht nur auf den Nutzen f&uuml;r eine bestimmte Person oder f&uuml;r eine bestimmte Gruppe.</p>\n<p>Die Idee, dass man auf den Gesamtnutzen achten soll, nennt man auch das&nbsp;<strong>Universalprinzip</strong>.</p>	2022-09-03 08:41:34.595649	2022-09-03 08:41:34.600829	6	9	false	false
80	<h1 class="text-center">Das Nutzenprinzip</h1>\n<p>Wenn eine Handlung gut ist, wenn sie viel Nutzen bringt, dann stellt sich die Frage, <strong>was unter Nutzen genau zu verstehen ist</strong>.</p>\n<p>Ein klassischer Vorschlag ist die&nbsp;<strong>Gleichsetzung</strong>&nbsp;von Nutzen mit&nbsp;<strong>Gl&uuml;ck</strong>.</p>\n<p>Demnach ist eine Handlung gut, wenn sie&nbsp;<strong>viel Gl&uuml;ck hervorbringt</strong>.</p>\n<p>Oder anders formuliert:</p>\n<p>Wir sollten uns so verhalten, dass wir&nbsp;<strong>m&ouml;glichst viel Gl&uuml;ck hervorbringen</strong>.</p>	2022-09-03 08:43:15.694769	2022-09-03 08:43:15.701404	6	10	false	false
81	<h1 class="text-center">Kosten- und Nutzenanalyse</h1>\n<p>Weiter vertritt der Utilitarismus die Idee, dass Nutzen oder Gl&uuml;ck und deren Gegenteile (z.B. Schaden oder Leid) <strong>gegeneinander ab- und aufgewogen werden k&ouml;nnen</strong>.</p>\n<p>Die Art und Weise, wie der Utilitarismus eine Handlung beurteilt, kann mit einer&nbsp;<strong>Kosten- und Nutzenanalyse</strong>&nbsp;aus der &Ouml;konomie verglichen werden:</p>\n<p>Man&nbsp;<strong>listet</strong>&nbsp;zuerst alle Nutzen auf der einen Seite auf und alle Sch&auml;den auf der anderen.</p>\n<p>Danach errechnet man auf jeder Seite die&nbsp;<strong>Summe</strong>&nbsp;und schaut, ob die Summe aller Nutzen die Summe aller Sch&auml;den&nbsp;<strong>&uuml;berwiegt</strong>&nbsp;oder nicht.</p>\n<p>Auf den n&auml;chsten Folien findest du ein Beispiel einer solchen Analyse.</p>	2022-09-03 08:43:30.210519	2022-09-03 08:43:30.215706	6	11	false	false
89	<p>Angenommen,&nbsp;<strong>die Einf&uuml;hrung der Todesstrafe</strong>&nbsp;h&auml;tte folgende Konsequenzen:</p>\n<table class="table">\n<tbody>\n<tr>\n<td>Weniger Kriminalit&auml;t durch Abschreckung</td>\n<td>+20</td>\n</tr>\n<tr>\n<td>Weniger Gef&auml;ngniskosten</td>\n<td>+9</td>\n</tr>\n<tr>\n<td>Sorge um m&ouml;gliche Fehlprozesse</td>\n<td>-7</td>\n</tr>\n<tr>\n<td>Angst davor, selber die Todesstrafe zu bekommen</td>\n<td>-4</td>\n</tr>\n<tr>\n<td>Keine Angst mehr vor Wiederholungst&auml;tern</td>\n<td>+11</td>\n</tr>\n</tbody>\n</table>	2022-09-03 08:56:44.32229	2022-09-03 08:56:44.327431	6	19	false	false
82	<h1 class="text-center">Eltern ins Altersheim bringen?</h1>\n<p><strong>Leonie</strong>&nbsp;und&nbsp;<strong>Johannes</strong>&nbsp;sind Geschwister. Sie beide&nbsp;<strong>haben eine eigene Familie</strong>&nbsp;und&nbsp;<strong>arbeiten</strong>&nbsp;tags&uuml;ber.</p>\n<p>Sie&nbsp;<strong>k&uuml;mmern sich abwechselnd um ihre Eltern.</strong></p>\n<p>Mit zunehmenden Alter brauchen die Eltern&nbsp;<strong>mehr und mehr Unterst&uuml;tzung</strong>.</p>\n<p>Eines Tages, w&auml;hrend Leonie und Johannes am Arbeiten waren, fiel der&nbsp;<strong>von Schwindel geplagte Vater</strong>&nbsp;auf den Boden.</p>\n<p>Gl&uuml;cklicherweise war die Nachbarin zugegen und hat dem Vater sofort geholfen.</p>\n<p>Dennoch machen Leonie und Johannes sich Sorgen um ihre Eltern. Was w&auml;re passiert, wenn die Nachbarin nicht zugegen gewesen w&auml;re?</p>\n<p>Sie &uuml;berlegen sich, die Eltern in ein&nbsp;<strong>Altersheim zu bringen</strong>.</p>	2022-09-03 08:44:06.567003	2022-09-03 08:44:06.57313	6	12	false	false
92	<h1>Ein Versuch, Gl&uuml;ck zu definieren</h1>\n<p>"Gl&uuml;ck ist das&nbsp;<strong>Empfinden von Lust</strong>.</p>\n<p>Das Gegenteil von Gl&uuml;ck ist&nbsp;<strong>Leid</strong>. Leid ist das&nbsp;<strong>Empfinden von Schmerzen</strong>.</p>\n<p><strong>Gl&uuml;cklich</strong>&nbsp;wird man, wenn man Schokolade isst, ein gutes Buch liest oder Spass mit Freunden hat.</p>\n<p><strong>Ungl&uuml;cklich</strong>&nbsp;wird man, wenn man krank ist, sich verletzt oder wenn man Langeweile hat.</p>\n<p>Gl&uuml;ck kann man daran&nbsp;<strong>messen</strong>, wie viel Lust oder Schmerzen eine Person empfindet.</p>\n<p>Wenn sie viel Lust empfindet, dann ist sie sehr gl&uuml;cklich. Wenn sie viel Leid empfindet, dann ist sie sehr ungl&uuml;cklich."</p>	2022-09-03 09:03:18.887487	2022-09-03 09:03:18.892664	6	22	false	false
94	<h1 class="text-center">St&auml;rken</h1>\n<p>Der Utilitarismus ist einer der bekanntesten und einflussreichsten ethischen Theorien &uuml;berhaupt. Und das nicht grundlos.</p>\n<p>Im Folgenden werden&nbsp;<strong>drei St&auml;rken</strong>&nbsp;des Utilitarismus hervorgehoben.</p>\n<p>&nbsp;</p>\n<ol class="space-between-li-20">\n<li>Der Utilitarismus ist&nbsp;<strong>einfach anwendbar</strong>.</li>\n<li>Der Utilitarismus ist&nbsp;<strong>pragmatisch</strong>&nbsp;und&nbsp;<strong>zielorientiert</strong>.</li>\n<li>Der Utilitarismus f&ouml;rdert Gl&uuml;ck, ein Gut,&nbsp;<strong>das sowieso alle wollen.</strong></li>\n</ol>	2022-09-03 09:25:49.476302	2022-09-03 09:25:49.485439	6	24	false	false
171	<p class="text-center">Wie k&ouml;nnen wir nach Aristoteles&nbsp;<strong>Eudaimonia erreichen</strong>?</p>	2022-09-03 16:46:37.366369	2022-09-03 16:46:37.375043	9	19	false	false
83	<h1 class="text-center">Eltern ins Altersheim bringen? (2)</h1>\n<p>Leonie und Johannes &uuml;berlegen sich, welche Vorteile und welche Nachteile es h&auml;tte, wenn sie ihre Eltern ins Altersheim bringen w&uuml;rden.</p>\n<p>Sie listen auf der einen Seite&nbsp;<strong>alle Nutzen</strong>&nbsp;auf und auf der anderen Seite&nbsp;<strong>alle Sch&auml;den</strong>, die ein Einzug ins Altersheim h&auml;tte.</p>\n<p>Sie weisen dann jedem Nutzen und jedem Schaden&nbsp;<strong>einen Wert zu</strong>.</p>\n<p>Wenn ein Nutzen sehr angenehm ist und sehr viel Freude bereitet, dann weisen sie ihm einen&nbsp;<strong>hohen, positiven Wert</strong>&nbsp;zu.</p>\n<p>Wenn ein Nutzen nur ganz wenig Freude bereitet, dann bekommt er nur einen&nbsp;<strong>kleinen, positiven Wert</strong>.</p>\n<p>Umgekehrt weisen sie einem Schaden einen&nbsp;<strong>hohen, negativen Wert</strong>&nbsp;zu, wenn er sehr unangenehm ist und sehr viel Leid bereitet.</p>\n<p>Einem kleinen Schaden weisen sie&nbsp;<strong>einen kleinen, negativen Wert</strong>&nbsp;zu.</p>	2022-09-03 08:44:36.392145	2022-09-03 08:44:36.398013	6	13	false	false
85	<h1 class="text-center">Eltern ins Altersheim bringen? (4)</h1>\n<p><strong>-1</strong>&nbsp;bedeutet ein leichter Abstieg im Gl&uuml;cksempfinden, w&auml;hrend&nbsp;<strong>-20</strong>&nbsp;elende Qual bedeutet.</p>\n<p><strong>Der Schaden</strong></p>\n<table class="table">\n<tbody>\n<tr>\n<td>Im Altersheim m&uuml;ssen die Eltern den Regeln des Altersheim folgen. Sie verlieren ihre Unabh&auml;ngigkeit.</td>\n<td>-15</td>\n</tr>\n<tr>\n<td>Im Altersheim ist man selten f&uuml;r sich alleine. Die Eltern verlieren ihre Privatsph&auml;re.</td>\n<td>-12</td>\n</tr>\n<tr>\n<td>Das Altersheim kostet viel Geld. Die Kinder m&uuml;ssen f&uuml;r das Altersheim zahlen.</td>\n<td>-5</td>\n</tr>\n<tr>\n<td><strong>Total:</strong></td>\n<td><strong>-32</strong></td>\n</tr>\n</tbody>\n</table>	2022-09-03 08:46:22.967733	2022-09-03 08:48:03.311444	6	15	false	false
87	<h1 class="text-center">Das Universalprinzip</h1>\n<p>Das dritte Grundmerkmal des Utilitarismus ist das <strong>Universalprinzip</strong>.</p>\n<p>Das Universalprinzip des Utilitarismus fordert, dass bei der Errechnung des Gesamtnutzens einer Handlung das&nbsp;<strong>Wohl all jener</strong>&nbsp;ber&uuml;cksichtigt werden, die von einer Handlung betroffen sind.</p>\n<p><strong>Das heisst:&nbsp;</strong>Man soll nicht nur das&nbsp;<strong>eigene</strong>&nbsp;Wohl oder das Wohl seiner&nbsp;<strong>Freunde</strong>&nbsp;oder das seiner eigenen&nbsp;<strong>Familie</strong>&nbsp;ber&uuml;cksichtigen, sondern auch das Wohl&nbsp;<strong><u>aller anderen</u></strong>.</p>\n<p>Mit "alle anderen" sind&nbsp;<strong>alle Wesen</strong>&nbsp;gemeint, die ein&nbsp;<strong>Wohl haben</strong>&nbsp;oder die&nbsp;<strong>Gl&uuml;ck</strong>&nbsp;oder&nbsp;<strong>Leid</strong>&nbsp;empfinden k&ouml;nnen.</p>\n<p>Damit sind nicht nur Menschen gemeint, sondern oftmals auch&nbsp;<strong>Tiere</strong>.</p>	2022-09-03 08:49:49.054755	2022-09-03 08:49:49.063609	6	17	false	false
86	<h1 class="text-center">Eltern ins Altersheim bringen? (5)</h1>\n<p>In dieser Analyse kam heraus, dass die Handlung, die Eltern ins Altersheim zu bringen, mehr Schaden als Nutzen hervorbringt.</p>\n<p>Aufsummiert hat diese Handlung einen Nutzenswert von&nbsp;<strong>+24</strong>&nbsp;und einen Schadenswert von&nbsp;<strong>-32</strong>.</p>\n<p>Zusammengez&auml;hlt gibt es einen&nbsp;<strong>Gesamtnutzen</strong>&nbsp;von&nbsp;<strong>-8</strong> und somit ist die Handlung, die Eltern ins Altersheim zu bringen, schlechter, als die Handlung, Eltern <strong>nicht</strong>&nbsp;ins Altersheim zu bringen.</p>\n<p>Gem&auml;ss dem Utilitarismus sollten wir bei allen Handlungen auf den Gesamtnutzen achten.&nbsp;<strong>Je h&ouml;her</strong>&nbsp;der Gesamtnutzen,&nbsp;<strong>desto besser</strong>.</p>\n<p>Daraus ergibt sich der ber&uuml;hmte utilitaristische Slogan:</p>\n<p><em>"Das gr&ouml;sstm&ouml;gliche Gl&uuml;ck f&uuml;r die gr&ouml;sstm&ouml;gliche Zahl!"</em></p>	2022-09-03 08:46:49.567511	2022-09-03 08:48:55.710737	6	16	false	false
88	<p class="text-center">Auf den vorigen Seiten hast du die <strong>drei Grundmerkmale</strong>&nbsp;des Utilitarismus kennen gelernt.</p>	2022-09-03 08:51:14.387272	2022-09-03 08:51:14.392936	6	18	false	false
84	<h1 class="text-center">Eltern ins Altersheim bringen? (3)</h1>\n<p><strong>+1</strong>&nbsp;bedeutet ein leichter Anstieg im Gl&uuml;cksempfinden, w&auml;hrend&nbsp;<strong>+20</strong>&nbsp;ekstatische Freude bedeutet.</p>\n<p><strong>Der Nutzen</strong></p>\n<table class="table">\n<tbody>\n<tr>\n<td>Bei einem Unfall ist im Altersheim immer jemand zugegen. Es gibt mehr Sicherheit f&uuml;r die Eltern.</td>\n<td>+12</td>\n</tr>\n<tr>\n<td>Im Altersheim begegnen den Eltern viele andere Menschen. Sie sind tags&uuml;ber nicht mehr so einsam.</td>\n<td>+8</td>\n</tr>\n<tr>\n<td>Es gibt regelm&auml;ssiges Essen in der Mensa. Die Kinder m&uuml;ssen nicht mehr f&uuml;r die Eltern kochen und haben mehr Freizeit.</td>\n<td>+4</td>\n</tr>\n<tr>\n<td><strong>Total:</strong></td>\n<td><strong>+24</strong></td>\n</tr>\n</tbody>\n</table>	2022-09-03 08:45:24.712067	2022-09-03 08:47:57.804004	6	14	false	false
91	<h1 class="text-center">Eine Herausforderung</h1>\n<p>Jeder Utilitarist und jede Utilitaristin steht vor der Herausforderung, zu bestimmen, was <strong>genau unter Nutzen oder Gl&uuml;ck zu verstehen ist</strong>.</p>\n<p>Da im Utilitarismus Handlungen danach bewertet werden, wie viel Nutzen oder Gl&uuml;ck sie bringen,&nbsp;<strong>braucht es eine klare Definition dieser Begriffe</strong>.</p>\n<p>Eine brauchbare Definition muss Antworten auf diese Fragen geben k&ouml;nnen:</p>\n<p>1. Was ist Gl&uuml;ck? Was ist das Gegenteil von Gl&uuml;ck?</p>\n<p>2. Was macht gl&uuml;cklich? Was macht ungl&uuml;cklich?</p>\n<p>3. Wie kann man Gl&uuml;ck&nbsp;<strong>messen</strong>?</p>	2022-09-03 09:02:27.190604	2022-09-03 09:02:27.196819	6	21	false	false
93	<p><strong>Welche drei Eigenschaften</strong>&nbsp;muss eine brauchbare Definition von Gl&uuml;ck haben?</p>	2022-09-03 09:20:51.630108	2022-09-03 09:20:51.63689	6	23	false	false
104	<p class="text-center"><strong>Welche Kritik</strong>&nbsp;am Utilitarismus wird hier ausgedr&uuml;ckt?</p>	2022-09-03 09:38:43.549591	2022-09-03 09:38:43.556081	6	34	false	false
105	<p class="text-center"><strong>Welche Kritik</strong>&nbsp;am Utilitarismus wird hier hinterfragt?</p>	2022-09-03 09:42:13.312811	2022-09-03 09:42:13.320598	6	35	false	false
95	<h1 class="text-center">Einfach anwendbar</h1>\n<p>Nach dem Utilitarismus sollten wir so handeln, dass wir m&ouml;glichst <strong>viel Nutzen oder Gl&uuml;ck</strong>&nbsp;hervorbringen und m&ouml;glichst&nbsp;<strong>viel Schaden oder Leid</strong>&nbsp;verhindern.</p>\n<p><strong>Das heisst:</strong></p>\n<p>Das&nbsp;<strong>einzige</strong>, was wir tun m&uuml;ssen, um&nbsp;<strong>richtig</strong>&nbsp;zu handeln, ist vor jeder Entscheidung zu&nbsp;<strong>&uuml;berlegen</strong>, mit welcher Handlung wir m&ouml;glichst viel Nutzen oder Gl&uuml;ck hervorbringen und m&ouml;glichst viel Schaden oder Leid verhindern k&ouml;nnen, und dann&nbsp;<strong>diese Handlung auszuf&uuml;hren</strong>.</p>\n<p>Der Utilitarismus ist somit eine ethische Theorie, die man&nbsp;<strong>sehr leicht anwenden</strong>&nbsp;kann, weil man&nbsp;<strong>nur diese eine Regel befolgen muss</strong>.</p>	2022-09-03 09:26:15.572832	2022-09-03 09:26:15.578919	6	25	false	false
99	<h1 class="text-center">Schw&auml;chen</h1>\n<p>Der Utilitarismus ist nicht ohne Kritik geblieben.</p>\n<p>Im Folgenden werden&nbsp;<strong>vier Einw&auml;nde</strong>&nbsp;gegen&uuml;ber dem Utilitarismus erl&auml;utert:</p>\n<p>&nbsp;</p>\n<ol class="space-between-li-20">\n<li>Eine &ouml;konomische Bemessung&nbsp;<strong>ist grunds&auml;tzlich verschieden</strong>&nbsp;von einer ethischen Beurteilung.</li>\n<li>Es ist&nbsp;<strong>zu schwierig</strong>, den Gesamtnutzen&nbsp;<strong>zu errechnen</strong>.</li>\n<li>Der Utilitarismus kann zu&nbsp;<strong>Ungleichbehandlung von Menschen</strong>&nbsp;f&uuml;hren.</li>\n<li>Utilitaristisches Verhalten kann pers&ouml;nliche Beziehungen und Freundschaften&nbsp;<strong>ruinieren</strong>.</li>\n</ol>	2022-09-03 09:34:10.92324	2022-09-03 09:34:10.929172	6	29	false	false
97	<h1 class="text-center">Mehr Gl&uuml;ck f&uuml;r alle</h1>\n<p>Wir alle streben danach, <strong>gl&uuml;cklich</strong>&nbsp;zu werden.</p>\n<p>Zwar haben nicht alle die gleiche Vorstellung davon, was es heisst, gl&uuml;cklich zu sein, aber grunds&auml;tzlich scheint Gl&uuml;ck etwas zu sein, wonach wir&nbsp;<strong>alle streben</strong>.</p>\n<p>Das Ziel des Utilitarismus ist die&nbsp;<strong>Vermehrung</strong>&nbsp;von Nutzen und Gl&uuml;ck und die&nbsp;<strong>Verminderung</strong>&nbsp;von Schaden und Leid.</p>\n<p>Der Utilitarismus ist darum eine sehr attraktive Theorie, weil er das zu vermehren versucht, was ohnehin alle wollen, n&auml;mlich&nbsp;<strong>Gl&uuml;ck</strong>.</p>	2022-09-03 09:27:08.695929	2022-09-03 09:27:08.702676	6	27	false	false
96	<h1 class="text-center">Pragmatisch und zielorientiert</h1>\n<p>Das Ziel des Utilitarismus ist die <strong>Vermehrung</strong>&nbsp;von Nutzen und Gl&uuml;ck und die&nbsp;<strong>Verminderung</strong>&nbsp;von Schaden und Leid.</p>\n<p>Dieses Ziel sollten wir&nbsp;<strong>so gut wie nur m&ouml;glich</strong>&nbsp;erreichen.</p>\n<p><strong>Das heisst:</strong></p>\n<p>Wir d&uuml;rfen&nbsp;<strong>alles tun</strong>&nbsp;und&nbsp;<strong>alles unternehmen</strong>, was zu diesem Ziel f&uuml;hrt!</p>\n<p>Auch Mord, Diebstahl und L&uuml;gen sind, <strong>wenn</strong> sie&nbsp;effektiv&nbsp;zur Vermehrung von Gl&uuml;ck oder zur Verminderung von Leid beitragen,&nbsp;<strong>erlaubte Handlungen</strong>.</p>\n<p>Der Utilitarismus ist somit sehr&nbsp;<strong>pragmatisch</strong>&nbsp;und&nbsp;<strong>zielorientiert</strong>.</p>	2022-09-03 09:26:48.772456	2022-09-03 09:29:57.389592	6	26	false	false
98	<p class="text-center"><strong>Welche St&auml;rke</strong>&nbsp;des Utilitarismus kommt hier zum Ausdruck?</p>	2022-09-03 09:30:23.147652	2022-09-03 09:30:23.153971	6	28	false	false
100	<h1 class="text-center">&Ouml;konomisches Denken in der Ethik?</h1>\n<p>"Nutzen" ist ein Begriff, den man normalerweise in den <strong>Wirtschaftswissenschaften</strong>&nbsp;(z.B. in der &Ouml;konomie) antrifft.</p>\n<p>In den Wirtschaftswissenschaften geht es haupts&auml;chlich nicht um ethische Fragen, sondern um die&nbsp;<strong>Vermehrung von Gewinn</strong>&nbsp;oder die&nbsp;<strong>Steigerung von Profit</strong>.</p>\n<p>Da die Ethik und die Wirtschaftswissenschaften&nbsp;<strong>unterschiedliche Fragen</strong>&nbsp;zu beantworten versuchen, lautet nun eine Kritik, dass der&nbsp;<strong>Nutzenbegriff nichts in der Ethik zu suchen habe</strong>.</p>\n<p>Ethische Fragen sollten daher nicht mit einer an die &Ouml;konomie angelehnte Methode beantworten werden, weil ethische und &ouml;konomische Fragen&nbsp;<strong>grunds&auml;tzlich verschieden</strong>&nbsp;sind.</p>	2022-09-03 09:34:49.888365	2022-09-03 09:34:49.89442	6	30	false	false
101	<h1 class="text-center">Anwendbarkeit?</h1>\n<p>Nach dem Utilitarismus sollten wir immer so handeln, dass der Gesamtnutzen f&uuml;r alle Betroffenen so hoch wie m&ouml;glich ist.</p>\n<p>Damit wir den Gesamtnutzen errechnen k&ouml;nnen,&nbsp;<strong>m&uuml;ssen wir absch&auml;tzen, welche Folgen unsere Handlungen haben werden.</strong></p>\n<p>Doch Handlungen haben manchmal&nbsp;<strong>unerwartete Folgen oder Nebeneffekte</strong>. Wir k&ouml;nnen deshalb nie mit Sicherheit wissen, wie sich unsere Handlungen auf uns und auf andere auswirken werden.</p>\n<p>Eine weitere Kritik lautet, dass es&nbsp;<strong>viel zu schwierig sei, die Konsequenzen unserer Handlungen zuverl&auml;ssig vorherzusehen.</strong></p>\n<p>Daher k&ouml;nne man auch nicht von einer Person erwarten, dass sie utilitaristisch handelt, weil sie die Folgen ihrer Handlungen nicht vorhersehen kann.</p>	2022-09-03 09:36:03.274151	2022-09-03 09:36:03.27964	6	31	false	false
102	<h1 class="text-center">Ungleichbehandlung durch Nutzenmaximierung?</h1>\n<p>Weiter wird kritisiert, dass es Situationen geben kann, in denen der Utilitarismus eine <strong>Ungleichbehandlung von Menschen</strong>&nbsp;bef&uuml;rworten w&uuml;rde.</p>\n<p>Angenommen, es gibt zwei Gesellschaften, eine&nbsp;<strong>ohne Sklaverei</strong>&nbsp;und eine&nbsp;<strong>mit Sklaverei</strong>.</p>\n<p>In der Gesellschaft mit Sklaverei werden Sklaven ausgebeutet und m&uuml;ssen viel Leid ertragen. Da aber mit der Sklaverei viele G&uuml;ter und Waren hergestellt werden, werden viele Menschen dank der Sklaverei gl&uuml;cklich.</p>\n<p>Es k&ouml;nnte nun m&ouml;glich sein, dass&nbsp;<strong>mehr Menschen in der Gesellschaft mit Sklaverei gl&uuml;cklich sind, als in der Gesellschaft ohne Sklaverei</strong>.</p>\n<p>Der Utilitarismus w&uuml;rde in diesem Fall die Sklaverei f&uuml;r gut befinden, was f&uuml;r Kritiker und Kritikerinnen unakzeptabel ist.</p>	2022-09-03 09:36:47.780329	2022-09-03 09:36:47.786009	6	32	false	false
106	<p class="text-center">Gegen&nbsp;<strong>welche Kritik</strong>&nbsp;wird der Utilitarismus hier verteidigt?</p>	2022-09-03 10:40:34.447121	2022-09-03 10:40:34.456345	6	36	false	false
103	<h1 class="text-center">Pers&ouml;nliche Beziehungen und Freundschaften?</h1>\n<p>Oft wird auch kritisiert, dass der Utilitarismus <strong>pers&ouml;nliche Beziehungen und Freundschaften ruiniert</strong>.</p>\n<p>Pers&ouml;nliche Beziehungen und Freundschaften beruhen auf&nbsp;<strong>Vertrauen</strong>&nbsp;und&nbsp;<strong>N&auml;he</strong>.</p>\n<p>So erwarten wir von unseren Freunden, dass sie f&uuml;r uns da sind und von Eltern, dass sie sich ganz besonders um ihre eigenen Kinder sorgen.</p>\n<p>Der Utilitarismus kann je nach Situation fordern, unsere Freunde&nbsp;<strong>im Stich zu lassen</strong>, weil wir dadurch mehr Nutzen f&uuml;r alle generieren k&ouml;nnen.</p>\n<p>Auch w&uuml;rde der Utilitarismus fordern, dass Eltern sich&nbsp;<strong>zuerst um andere Kinder sorgen sollen</strong>, wenn diese die Hilfe dringender n&ouml;tig haben, als die eigenen Kinder.</p>	2022-09-03 09:37:44.497101	2022-09-03 09:37:44.502389	6	33	false	false
107	<h1 class="text-center">Der reiche Freund</h1>\n<p><strong>Stell dir vor:</strong>&nbsp;Du hast einen&nbsp;<strong>reichen</strong>&nbsp;Freund.</p>\n<p>Dein reicher Freund hat dir&nbsp;<strong>200 Franken</strong>&nbsp;ausgeliehen. Du hast ihm versprochen, das Geld so bald wie m&ouml;glich zur&uuml;ckzugeben.</p>\n<p>Heute hast du das Geld zusammen und machst dich auf dem Weg, ihm das Geld zur&uuml;ckzugeben.</p>\n<p>Unterwegs begegnest du einer&nbsp;<strong>Hilfsorganisation</strong>.</p>\n<p>Die Menschen der Hilfsorganisation erkl&auml;ren dir, dass man mit einer Spende von 200 Franken&nbsp;<strong>sehr viel Gutes tun kann</strong>. Man k&ouml;nnte damit zum Beispiel extreme Armut oder Hungersn&ouml;te bek&auml;mpfen.</p>	2022-09-03 10:44:14.535723	2022-09-03 10:44:14.545753	6	37	false	false
108	<h1 class="text-center">Der reiche Freund</h1>	2022-09-03 10:45:01.36001	2022-09-03 10:45:01.365321	6	38	false	false
109	<p class="text-center">Angenommen, die&nbsp;<strong>Abschaffung der Demokratie</strong>&nbsp;und die&nbsp;<strong>Einf&uuml;hrung einer Diktatur</strong>&nbsp;h&auml;tte folgende Konsequenzen:</p>\n<table class="table">\n<tbody>\n<tr>\n<td>Die Bev&ouml;lkerung f&uuml;hlt sich machtlos, weil sie sich nicht mehr politisch beteiligen kann.</td>\n<td>-20</td>\n</tr>\n<tr>\n<td>Die Steuern senken sich, weil die Kosten f&uuml;r Abstimmungen und B&uuml;rokratie wegfallen.</td>\n<td>+9</td>\n</tr>\n<tr>\n<td>Eine Diktatur kann langfristig planen und somit besser f&uuml;r alle wirtschaften.</td>\n<td>+5</td>\n</tr>\n<tr>\n<td>Die Bev&ouml;lkerung hat mehr Freizeit, weil sie sich nicht mehr politisch engagieren muss.</td>\n<td>+7</td>\n</tr>\n<tr>\n<td>Eine Diktatur kann unbeliebte Gesetze einf&uuml;hren.</td>\n<td>-3</td>\n</tr>\n</tbody>\n</table>	2022-09-03 10:47:32.483972	2022-09-03 10:47:32.489113	6	39	false	false
110	<h1 class="text-center">Deine Kosten- und Nutzenanalyse</h1>\n<p>In vielen L&auml;ndern wird diskutiert, ob man die <strong>Sterbehilfe</strong>&nbsp;erlauben soll oder nicht.</p>\n<p>Sterbehilfe ist, wenn eine Person einer anderen beim Sterben hilft, das heisst,&nbsp;<strong>sie t&ouml;tet</strong>.</p>\n<p>Die Sterbehilfe unterscheidet sich vom Mord darin, dass die Person, die sterben m&ouml;chte,&nbsp;<strong>ausdr&uuml;cklich darum bittet, get&ouml;tet zu werden</strong>.</p>\n<p>Welche&nbsp;<strong>Vorteile</strong>&nbsp;und welche&nbsp;<strong>Nachteile</strong>&nbsp;h&auml;tte das Erlauben der Sterbehilfe?</p>\n<p><strong>&Uuml;berlege dir</strong>, welche Nutzen und welche Sch&auml;den beim Erlauben der Sterbehilfe entstehen w&uuml;rden und&nbsp;<strong>gib</strong> sie auf der n&auml;chsten Seite <strong>an</strong>!</p>	2022-09-03 10:49:54.193413	2022-09-03 10:50:44.536307	6	40	false	false
111	<p class="text-center">Welche Konsequenzen h&auml;tte das&nbsp;<strong>Erlauben der Sterbehilfe</strong>?</p>\n<div id="table-to-be-replaced"></div>	2022-09-03 10:51:26.674389	2022-09-03 10:51:26.679725	6	41	false	false
127	<p>Versuche, die&nbsp;<strong>richtige Reihenfolge der Schritte</strong> zu bestimmen!</p>	2022-09-03 13:10:04.065192	2022-09-03 13:10:04.071031	7	13	false	false
112	<h1 class="text-center">Kurs abgeschlossen!</h1>	2022-09-03 10:53:18.64842	2022-09-03 12:43:29.667165	6	42	false	true
117	<h1 class="text-center">Deontologische Theorien</h1>\n<p>Alle deontologische Theorien beurteilen Handlungen danach, ob sie <strong>an sich gut</strong>&nbsp;oder&nbsp;<strong>an sich schlecht</strong>&nbsp;sind.</p>\n<p>Untereinander unterscheiden sich deontologische Theorien nur in der&nbsp;<strong>Art und Weise</strong>, wie sie Handlungen&nbsp;<strong>bewerten</strong>.</p>\n<p>Deontologische Theorien kann man daran erkennen, dass sie immer &uuml;ber eine bestimmte Handlung nachdenken,&nbsp;<u>nicht</u>&nbsp;aber &uuml;ber ihre Folgen oder &uuml;ber die Person, die diese Handlung ausf&uuml;hrt.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>"<strong>Folter</strong>&nbsp;ist immer&nbsp;<strong>eine schlechte Handlung</strong>, egal in welcher Situation man sich auch befinden mag."</p>\n<p>"Jeder&nbsp;<strong>muss</strong>&nbsp;seine&nbsp;<strong>Versprechen halten</strong>. Auch Politikerinnen und Politiker."</p>	2022-09-03 12:52:48.505954	2022-09-03 12:52:48.512191	7	3	false	false
118	<p class="text-center"><strong>&Uuml;berlege dir</strong>, ob die folgende Theorie&nbsp;<strong>deontologisch</strong>&nbsp;ist!</p>	2022-09-03 12:53:05.119607	2022-09-03 12:53:05.124095	7	4	false	false
119	<p class="text-center"><strong>Warum</strong>&nbsp;ist diese Theorie deontologisch?</p>	2022-09-03 12:54:38.005708	2022-09-03 12:54:38.010945	7	5	false	false
125	<h1 class="text-center">Beispiel Schwarzfahren</h1>\n<p><strong>Schwarzfahren</strong>&nbsp;ist das Benutzen eines Zuges ohne ein g&uuml;ltiges Billet zu besitzen.</p>\n<p>Darf man nach der kantischen Ethik schwarzfahren?</p>\n<p>Wie w&uuml;rde eine Welt aussehen,&nbsp;<strong>in der alle schwarzfahren w&uuml;rden?</strong></p>\n<p>In einer Welt, in der alle schwarzfahren w&uuml;rden,&nbsp;<strong>ginge</strong>&nbsp;fr&uuml;her oder sp&auml;ter das&nbsp;<strong>Bahnunternehmen zugrunde</strong>.</p>\n<p>In einer solchen Welt kann man also gar nicht mehr den Zug benutzen.</p>\n<p>Da eine solche Welt&nbsp;<strong>nicht w&uuml;nschenswert</strong>&nbsp;ist, kann man nun die Regel ableiten:</p>\n<p><strong>"Du sollst nicht schwarzfahren!"</strong></p>	2022-09-03 13:08:36.20396	2022-09-03 13:08:36.209518	7	11	false	false
126	<h1 class="text-center">&Uuml;bung</h1>\n<p>Jasmin versucht, den <strong>kategorischen Imperativ anzuwenden</strong>:</p>\n<hr>\n<p><strong>Jasmin</strong>&nbsp;ist eine Direktorin und hat eine&nbsp;<strong>Arbeitsstelle</strong>&nbsp;zu vergeben.</p>\n<p>Ihre Freundin&nbsp;<strong>Nadja</strong>&nbsp;bewirbt sich auf diese Stelle.</p>\n<p>Weil Nadja Schwierigkeiten hat, eine Arbeitsstelle zu finden, bittet sie Jasmin darum,&nbsp;<strong>ihr die Stelle zu geben</strong>, auch wenn sie nicht die beste Kandidatin ist.</p>\n<p>Jasmin fragt sich nun: "Darf ich meine Freundin gegen&uuml;ber besseren Kandidierenden bevorzugen?"</p>	2022-09-03 13:09:15.646736	2022-09-03 13:09:15.653579	7	12	false	false
134	<h1 class="text-center">Allgemeine G&uuml;ltigkeit</h1>\n<p>Es ist hilfreich, Kants Ethik mit der Mathematik zu vergleichen:</p>\n<p>Mathematische Gleichungen sind entweder&nbsp;<strong>immer falsch</strong>&nbsp;oder&nbsp;<strong>immer wahr</strong>.</p>\n<p>Die Gleichung "2 + 3 = 5" ist immer wahr,<br>w&auml;hrend die Gleichung "2 + 3 = 8" immer falsch ist.</p>\n<p>Die Wahrheit oder Falschheit einer mathematischen Gleichung ver&auml;ndert sich&nbsp;<strong>nie</strong>.</p>\n<p><strong>Egal in welcher Situation man ist</strong>&nbsp;und&nbsp;<strong>egal in welcher Zeit man lebt</strong>, zwei und drei werden zusammen immer f&uuml;nf ergeben.</p>	2022-09-03 13:24:39.940965	2022-09-03 13:24:39.94595	7	20	false	false
157	<p class="text-center"><strong>Warum</strong>&nbsp;ist diese Theorie nicht tugendethisch?</p>	2022-09-03 14:57:47.089722	2022-09-03 14:57:47.095044	9	5	false	false
113	<h3 class="text-center">Mehr Literatur</h3>\n<div class="list-group">\n<ul>\n<li><a class="list-group-item list-group-item-action" href="https://www.buchhaus.ch/buecher/fachbuecher/religion_ethik/ethik_grenz/detail/ISBN-9783825239855/H%C3%B6ffe-Otfried/Einf%C3%BChrung-in-die-utilitaristische-Ethik" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die utilitaristische Ethik"</strong> - von Otfried H&ouml;ffe</a></li>\n<li><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/peter-singer/praktische-ethik/id/9783150189191" target="_blank" rel="noopener"><strong>"Praktische Ethik"</strong>&nbsp;- von Peter Singer</a></li>\n</ul>\n</div>\n<h3 class="text-center">Quellen</h3>\n<div class="list-group">\n<ul>\n<li><a class="list-group-item list-group-item-action" href="http://www.utb-shop.de/autoren/hubner-dietmar/einfuhrung-in-die-philosophische-ethik-7843.html" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die philosophische Ethik"</strong>&nbsp;- von H&uuml;bner, Dietmar</a></li>\n<li><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/annemarie-pieper/einfuehrung-in-die-ethik/id/9783825246969" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die Ethik"</strong> - von Annemarie Pieper</a></li>\n<li><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/herlinde-pauer-studer/einfuehrung-in-die-ethik/id/9783825223502" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die Ethik"</strong>&nbsp;- von Herlinde Pauer-Studer</a></li>\n</ul>\n</div>\n<p>&nbsp;</p>	2022-09-03 10:55:18.698093	2022-09-03 12:43:29.680183	6	43	false	false
115	<h1 class="text-center">Kompetenzen</h1>\n<p>In diesem Kurs erwirbst du folgende Kompetenzen:</p>\n<ul class="space-between-li-10">\n<li>Du kannst&nbsp;<strong>deontologische Theorien</strong>&nbsp;anhand eines Merkmals&nbsp;<strong>erkennen</strong>.</li>\n<li>Du kannst&nbsp;<strong>drei Grundmerkmale des Kantianismus</strong>&nbsp;nennen.</li>\n<li>Du kannst&nbsp;<strong>drei St&auml;rken</strong>&nbsp;und&nbsp;<strong>drei Schw&auml;chen</strong>&nbsp;des Kantianismus nennen.</li>\n<li>Du kannst eine Handlung aus einer&nbsp;<strong>kantianischen Perspektive heraus beurteilen</strong>.</li>\n</ul>	2022-09-03 12:52:08.325313	2022-09-03 12:52:08.341074	7	1	false	false
114	<h1 class="text-center">Warum sich mit Deontologie befassen?</h1>\n<p>Deontologische Ideen lassen sich in vielen religi&ouml;sen Texten wiederfinden und sind intuitiv in vielen von uns vorhanden. So w&uuml;rden viele sagen, dass Handlungen wie <strong>Mord</strong>&nbsp;oder&nbsp;<strong>L&uuml;gen</strong>&nbsp;immer irgendwie schlecht sind.</p>\n<p>Weil deontologische Ideen &uuml;berall anzutreffen sind, lohnt es sich auch, sich mit der Deontologie genauer zu befassen.</p>\n<p>Das Studium der Deontologie hilft dir, deontologische Begr&uuml;ndungen oder Argumente besser zu&nbsp;<strong>erkennen</strong>, zu&nbsp;<strong>analysieren</strong>&nbsp;und zu&nbsp;<strong>kritisieren</strong>.</p>\n<p>Indem du &uuml;ber die&nbsp;<strong>St&auml;rken</strong>&nbsp;und&nbsp;<strong>Schw&auml;chen</strong>&nbsp;der Deontologie nachdenkst, lernst du, bessere&nbsp;<strong>Entscheidungen zu treffen</strong>&nbsp;und kannst andere beraten, wie sie sich entscheiden&nbsp;<strong>sollen</strong>.</p>	2022-09-03 12:50:21.885299	2022-09-03 12:50:40.579461	7	0	false	false
116	<h1 class="text-center">Deontologie</h1>\n<p><strong>Deontologie</strong>&nbsp;ist ein Sammelbegriff f&uuml;r ethische Theorien, die Handlungen&nbsp;<strong>als solche</strong>&nbsp;beurteilen.</p>\n<p>Das griechische Wort&nbsp;<em><u>to deon</u></em>&nbsp;bedeutet "das Notwendige" oder "das Erforderliche".</p>\n<p>Daher kommt auch der Name "<em>Deon</em>tologie".</p>\n<p>Deontologische Theorien stellen&nbsp;<strong>Regeln</strong>&nbsp;oder&nbsp;<strong>Pflichten</strong>&nbsp;auf, die&nbsp;<strong>notwendigerweise</strong>&nbsp;zu befolgen sind.</p>\n<p>Die Deontologie wird darum manchmal auch&nbsp;<strong>Pflichtethik</strong>&nbsp;genannt.</p>\n<p>Beispiele f&uuml;r solche Regeln oder Pflichten sind:</p>\n<p class="ml-3"><em>Du sollst nicht l&uuml;gen.</em></p>\n<p class="ml-3"><em>Du sollst nicht t&ouml;ten.</em></p>\n<p class="ml-3"><em>Du sollst keine Versprechen brechen.</em></p>	2022-09-03 12:52:26.196853	2022-09-03 12:52:26.203833	7	2	false	false
120	<p class="text-center"><strong>&Uuml;berlege dir</strong>, ob die folgende Theorie&nbsp;<strong>deontologisch</strong>&nbsp;ist!</p>	2022-09-03 13:00:12.970296	2022-09-03 13:00:12.981777	7	6	false	false
121	<p class="text-center"><strong>Warum</strong>&nbsp;ist diese Theorie nicht deontologisch?</p>	2022-09-03 13:01:50.536614	2022-09-03 13:01:50.544832	7	7	false	false
122	<h1 class="text-center">Der Kantianismus</h1>\n<p>Als Hauptvertreter der Deontologie gilt der Philosoph <strong>Immanuel Kant</strong>.</p>\n<p>Seine Ethik wird manchmal "Kantianismus" oder die "kantische Ethik" genannt.</p>\n<p>Kant formulierte den ber&uuml;hmten&nbsp;<strong>kategorischen Imperativ</strong>:</p>\n<p class="ml-3"><em>Handle nur nach derjenigen Maxime, durch die du zugleich wollen kannst, dass sie ein allgemeines Gesetz werde.</em></p>\n<p>Nach Kant gibt es also ein&nbsp;<strong>Verfahren</strong>, mit dem man herausfinden kann, welche Regeln wir befolgen m&uuml;ssen und welche nicht.</p>	2022-09-03 13:06:29.301791	2022-09-03 13:06:29.307005	7	8	false	false
123	<h1 class="text-center">Der Kantianismus (2)</h1>\n<p>Der Kantianismus hat <strong>drei Grundmerkmale</strong>:</p>\n<p>1. Als eine deontologische Theorie beurteilt der Kantianismus eine Handlung&nbsp;<strong>an sich</strong>.</p>\n<p>2. Der Kantianismus bewertet Handlungen danach, ob man sie auch dann wollen kann, wenn&nbsp;<strong>alle sie tun w&uuml;rden</strong>.</p>\n<p>3. Der Kantianismus stellt Regeln oder Pflichten auf, die&nbsp;<strong>jeder immer</strong>&nbsp;und&nbsp;<strong>in jeder Situation</strong>&nbsp;befolgen muss.</p>	2022-09-03 13:07:13.78058	2022-09-03 13:07:13.786562	7	9	false	false
124	<h1 class="text-center">Der kategorische Imperativ</h1>\n<p>Der kategorische Imperativ ist ein <strong>Verfahren</strong>, mit dem man herausfinden kann, welche Regeln wir befolgen m&uuml;ssen und welche nicht.</p>\n<p>Dieses Verfahren l&auml;uft in vier Schritten ab:</p>\n<p>1. Nimm eine Handlung.</p>\n<p>2. Stell dir nun eine Welt vor, in der&nbsp;<strong><u>alle</u></strong>&nbsp;diese Handlung ausf&uuml;hren w&uuml;rden.</p>\n<p>3. &Uuml;berlege dir, ob diese Welt&nbsp;<strong>w&uuml;nschenswert</strong>&nbsp;ist oder nicht.</p>\n<p>4. Wenn diese Welt w&uuml;nschenswert ist, dann kannst die Regel ableiten, dass&nbsp;<strong>alle die Handlung ausf&uuml;hren</strong>&nbsp;sollten.</p>\n<p>Wenn diese Welt nicht w&uuml;nschenswert ist, dann kannst du die Regel ableiten, dass&nbsp;<strong>alle die Handlung&nbsp;<u>nicht</u></strong>&nbsp;ausf&uuml;hren sollten.</p>	2022-09-03 13:07:44.313689	2022-09-03 13:07:44.318952	7	10	false	false
173	<h1 class="text-center">Wie erwirbt man Tugenden? (2)</h1>\n<p>Das Erwerben von ethischen Tugenden kann man mit dem Erwerben von F&auml;higkeiten <strong>vergleichen</strong>:</p>\n<p>Um zu lernen, wie man ein&nbsp;<strong>Fahrrad repariert</strong>, m&uuml;ssen wir zuerst jemandem zuschauen, der weiss, wie man Fahrr&auml;der repariert.</p>\n<p>Doch alleine vom Zuschauen lernen wir nicht, Fahrr&auml;der zu reparieren, wir m&uuml;ssen es auch selber probieren.</p>\n<p>Je mehr und je &ouml;fter wir Fahrr&auml;der reparieren, desto mehr Erfahrungen sammeln wir und desto besser k&ouml;nnen wir Fahrr&auml;der reparieren.</p>\n<p>Irgendwann sind wir so ge&uuml;bt darin, Fahrr&auml;der zu reparieren, dass wir keine Hilfe mehr von anderen ben&ouml;tigen.</p>	2022-09-03 16:49:05.317437	2022-09-03 16:49:05.324961	9	21	false	false
128	<h1 class="text-center">Vernunft</h1>\n<p>Wichtig ist zu beachten, dass Kants Ethik nicht konsequentialistisch ist.</p>\n<p>Kant argumentiert&nbsp;<strong><u>nicht</u></strong>, dass eine Welt, in der niemand schwarz f&auml;hrt, eine n&uuml;tzlichere oder eine angenehmere Welt ist (auch wenn dies der Fall sein k&ouml;nnte).</p>\n<p>Stattdessen argumentiert Kant, dass Regeln wie "<em>Du sollst schwarzfahren</em>"&nbsp;<strong>gegen die Vernunft sind</strong>. Das heisst, sie f&uuml;hren, wenn alle sie befolgen w&uuml;rden, zu&nbsp;<strong>Widerspr&uuml;chen</strong>.</p>\n<p>Umgekehrt sind Regeln wie "<em>Du sollst nicht schwarzfahren</em>" von der&nbsp;<strong>Vernunft geboten</strong>, weil sie, wenn alle sie befolgen w&uuml;rden,&nbsp;<strong><u>nicht</u></strong>&nbsp;zu&nbsp;<strong>Widerspr&uuml;chen</strong>&nbsp;f&uuml;hren.</p>\n<p>Eine vern&uuml;nftige Person sollte nach Kant&nbsp;<strong>selber erkennen k&ouml;nnen</strong>, welche Regeln sie befolgen soll und welche nicht.</p>	2022-09-03 13:11:40.573007	2022-09-03 13:11:40.579763	7	14	false	false
129	<h1 class="text-center">Vernunft (2)</h1>\n<p>F&uuml;r Kant sind ethische Regeln <strong>Gebote der Vernunft</strong>.</p>\n<p>Wenn jemand eine Regel befolgt, die, wenn alle sie befolgen w&uuml;rden, zu Widerspr&uuml;chen f&uuml;hrt, dann ist diese Person&nbsp;<strong>unvern&uuml;nftig</strong>. Sie ist unvern&uuml;nftig, weil sie&nbsp;<strong>Widerspr&uuml;che zul&auml;sst</strong>.</p>\n<p><strong>Zum Beispiel:&nbsp;</strong>Darf man l&uuml;gen?</p>\n<p>Man kann nicht wollen, dass alle l&uuml;gen, weil es dann&nbsp;<strong>gar keinen Sinn mehr macht, miteinander zu reden</strong>.</p>\n<p>Wenn nun eine Person trotzdem l&uuml;gt, dann l&auml;sst sie den folgenden&nbsp;<strong>Widerspruch</strong>&nbsp;zu:</p>\n<p><strong>Einerseits</strong>&nbsp;will sie, dass alle die Regel&nbsp;<em>"Du sollst nicht l&uuml;gen!"</em>&nbsp;befolgen, aber&nbsp;<strong>andererseits</strong>&nbsp;nimmt sie sich selber von der Regel aus.</p>	2022-09-03 13:12:25.096231	2022-09-03 13:12:43.072159	7	15	false	false
130	<h1 class="text-center">Kants Imperativ</h1>\n<p>Wie heisst dieser von Immanuel Kant formulierte Imperativ:</p>	2022-09-03 13:13:20.246515	2022-09-03 13:13:20.269303	7	16	false	false
135	<h3 class="text-center">Allgemeine G&uuml;ltigkeit (2)</h3>\n<p>F&uuml;r Kant sind ethische Regeln wie mathematische Gleichungen.</p>\n<p>Regeln sind entweder&nbsp;<strong>immer zu befolgen</strong>&nbsp;oder&nbsp;<strong>nie zu befolgen</strong>.</p>\n<p>Wenn eine Regel, wenn alle sie befolgen w&uuml;rden, zu Widerspr&uuml;chen f&uuml;hrt, dann ist diese Regel&nbsp;<strong>nie zu befolgen</strong>.</p>\n<p>Eine solche Regel zu befolgen ist genauso&nbsp;<strong>immer falsch</strong>, wie eine falsche mathematische Gleichung&nbsp;<strong>immer falsch</strong>&nbsp;ist.</p>\n<p>Und genauso wie eine falsche mathematische Gleichung in&nbsp;<strong>jeder Situation</strong>&nbsp;und zu&nbsp;<strong>jeder Zeit</strong>&nbsp;falsch ist, ist auch das Befolgen einer falschen Regel&nbsp;<strong>immer</strong>&nbsp;und&nbsp;<strong>in jeder Situation</strong>&nbsp;falsch.</p>	2022-09-03 13:25:08.646297	2022-09-03 13:25:08.651197	7	21	false	false
136	<p>Auf den vorigen Seiten hast du die <strong>drei Grundmerkmale</strong>&nbsp;des Kantianismus kennen gelernt.</p>	2022-09-03 13:25:41.605575	2022-09-03 13:25:41.610433	7	22	false	false
137	<h1 class="text-center">St&auml;rken</h1>\n<p>Der Kantianismus ist einer der bekanntesten und einflussreichsten ethischen Theorien &uuml;berhaupt. Und das nicht grundlos.</p>\n<p>Im Folgenden werden&nbsp;<strong>drei St&auml;rken</strong>&nbsp;des Kantianismus hervorgehoben.</p>\n<p>&nbsp;</p>\n<ol class="space-between-li-20">\n<li>Der Kantianismus ist&nbsp;<strong>einfach anwendbar</strong>.</li>\n<li>Der Kantianismus wird der Intuition gerecht, dass&nbsp;<strong>alle die gleichen Regeln befolgen sollen</strong>.</li>\n<li>Mit dem Kantianismus kann man&nbsp;<strong>keine grausamen Taten rechtfertigen</strong>.</li>\n</ol>\n<p>&nbsp;</p>	2022-09-03 13:29:21.329877	2022-09-03 13:29:21.33622	7	23	false	false
138	<h1 class="text-center">Einfach anwendbar</h1>\n<p>Mit Hilfe des kategorischen Imperativs k&ouml;nnen wir Regeln ableiten, die wir <strong>notwendigerweise</strong>&nbsp;befolgen m&uuml;ssen.</p>\n<p>Da diese Regeln&nbsp;<strong>immer</strong>&nbsp;und&nbsp;<strong>in jeder Situation</strong>&nbsp;gelten, brauchen wir diese Regeln&nbsp;<strong>nur einmal</strong>&nbsp;mit Hilfe des kategorischen Imperativs abzuleiten.</p>\n<p>Sobald wir diese Regeln abgeleitet haben,&nbsp;<strong>m&uuml;ssen wir sie nur noch befolgen</strong>.</p>\n<p>Wenn wir also einmal die Regel&nbsp;<em>"Du sollst nicht l&uuml;gen!"</em>&nbsp;abgeleitet haben, dann brauchen wir sie nur noch ausnahmslos zu befolgen und fertig.</p>\n<p>Der Kantianismus ist somit eine ethische Theorie, die man&nbsp;<strong>sehr leicht anwenden</strong>&nbsp;kann.</p>	2022-09-03 13:29:39.558246	2022-09-03 13:29:39.563692	7	24	false	false
139	<h1 class="text-center">Gleiche Regeln f&uuml;r alle</h1>\n<p>Im Grundgesetz steht:</p>\n<p><strong>"Alle Menschen sind vor dem Gesetz gleich."</strong></p>\n<p>Die Idee, dass&nbsp;<strong>alle Menschen gleich</strong>&nbsp;sind und alle nach den&nbsp;<strong>gleichen Regeln</strong>&nbsp;oder&nbsp;<strong>Gesetze</strong>&nbsp;leben sollen, ist intuitiv und weit verbreitet.</p>\n<p>Der Kantianismus wird dieser Intuition gerecht, indem er Regeln und Pflichten aufstellt, die&nbsp;<strong>immer</strong>&nbsp;und&nbsp;<strong>f&uuml;r alle</strong>&nbsp;gelten.</p>\n<p>Wenn jemand ein Gesetz bricht oder sich nicht an die Regeln h&auml;lt, dann macht sich diese Person auch dann&nbsp;<strong>schuldig</strong>, wenn sie sich in einer schwierigen oder ung&uuml;nstigen Situation befindet.</p>	2022-09-03 13:30:01.685983	2022-09-03 13:30:01.692102	7	25	false	false
140	<h1 class="text-center">Grausame Taten</h1>\n<p>In der Geschichte der Menschheit lassen sich viele Beispiele finden, in denen Menschen <strong>grausame Dinge</strong>&nbsp;taten, wie zum Beispiel&nbsp;<strong>Folter</strong>&nbsp;oder&nbsp;<strong>Massenmord</strong>.</p>\n<p>Nicht selten wurden diese grausamen Taten mit der Absicht gerechtfertigt, eine&nbsp;<strong>bessere Welt</strong>&nbsp;zu erschaffen.</p>\n<p>Da der Kantianismus eine Handlung unabh&auml;ngig von den Konsequenzen oder der Situation bewertet, kann man mit dem Kantianismus&nbsp;<strong>keine grausamen Handlungen rechtfertigen</strong>.</p>\n<p>Eine Handlung wie Folter&nbsp;<strong>ist und bleibt verboten</strong>, kann die Situation noch so kompliziert und kann die Absicht noch so nobel sein.</p>	2022-09-03 13:30:22.981741	2022-09-03 13:30:22.989426	7	26	false	false
141	<p class="text-center"><strong>Welche St&auml;rke</strong>&nbsp;des Kantianismus kommt hier zum Ausdruck?</p>	2022-09-03 13:31:04.690778	2022-09-03 13:31:04.695836	7	27	false	false
142	<h1 class="text-center">Schw&auml;chen</h1>\n<p>Der Kantianismus ist nicht ohne Kritik geblieben.</p>\n<p>Im Folgenden werden&nbsp;<strong>drei Einw&auml;nde</strong>&nbsp;gegen&uuml;ber dem Kantianismus erl&auml;utert:</p>\n<p>&nbsp;</p>\n<ol class="space-between-li-20">\n<li>Der Kantianismus kann zu einem&nbsp;<strong>Konflikt zwischen zwei oder mehreren Pflichten</strong>&nbsp;f&uuml;hren.</li>\n<li>Der Kantianismus&nbsp;<strong>ist nicht f&uuml;r Extremf&auml;lle geeignet</strong>.</li>\n<li>Der Kantianismus&nbsp;<strong>vernachl&auml;ssigt Gef&uuml;hle und Neigungen</strong>.</li>\n</ol>	2022-09-03 13:35:36.144617	2022-09-03 13:35:36.151383	7	28	false	false
180	<p><strong>Welche St&auml;rke</strong>&nbsp;der aristotelische Ethik kommt hier zum Ausdruck?</p>	2022-09-03 16:55:20.59506	2022-09-03 16:55:20.604177	9	28	false	false
181	<p><strong>Welche St&auml;rke</strong>&nbsp;der aristotelische Ethik kommt hier zum Ausdruck?</p>	2022-09-03 16:56:49.818841	2022-09-03 16:56:49.82667	9	29	false	false
143	<h1 class="text-center">Konflikte zwischen Pflichten</h1>\n<p>Eine Kritik lautet, dass es im Kantianismus zu Konflikten zwischen zwei oder mehreren Pflichten kommen kann.</p>\n<p>Angenommen, du versteckst eine unschuldige Person in deinem Haus vor der brutalen Mafia.</p>\n<p>Eines Tages kommt die Mafia bei dir vorbei und fragt dich, wo sich diese Person befindet.</p>\n<p><strong>Was tun?</strong></p>\n<p>Hier scheint ein Konflikt zwischen der Pflicht,&nbsp;<em>die Wahrheit zu sagen</em>&nbsp;und der Pflicht,&nbsp;<em>Unschuldige zu besch&uuml;tzen</em>&nbsp;vorzuliegen.</p>\n<p><strong>Egal wie man handelt, man macht in beiden F&auml;llen etwas falsch.</strong></p>\n<p>F&uuml;r Kritiker und Kritikerinnen darf eine Ethik keine solche Konflikte zulassen.</p>	2022-09-03 13:36:03.972223	2022-09-03 13:36:03.979127	7	29	false	false
152	<h1 class="text-center">Warum sich mit Tugendethik befassen?</h1>\n<p>Die Tugendethik ist eine spannende Ethik, weil sie sich mit <strong>Charaktereigenschaften</strong>&nbsp;auseinandersetzt.</p>\n<p>Sie fragt nicht nur, wie wir uns gegen&uuml;ber anderen verhalten sollen, sondern auch, wie&nbsp;<strong>wir</strong>&nbsp;uns pers&ouml;nlich&nbsp;<strong>verbessern</strong>&nbsp;und&nbsp;<strong>entwickeln</strong>&nbsp;k&ouml;nnen.</p>\n<p>Das Studium der Tugendethik hilft dir, tugendethische Begr&uuml;ndungen oder Argumente zu&nbsp;<strong>erkennen</strong>, zu&nbsp;<strong>analysieren</strong>&nbsp;und zu&nbsp;<strong>kritisieren</strong>.</p>\n<p>Indem du &uuml;ber die&nbsp;<strong>St&auml;rken</strong>&nbsp;und&nbsp;<strong>Schw&auml;chen</strong>&nbsp;der Tugendethik nachdenkst, lernst du, bessere&nbsp;<strong>Entscheidungen zu treffen</strong>&nbsp;und kannst andere beraten, wie sie sich entscheiden&nbsp;<strong>sollen</strong>.</p>	2022-09-03 14:52:05.166287	2022-09-03 14:52:56.695427	9	0	false	false
144	<h1 class="text-center">Extremf&auml;lle</h1>\n<p>Eine weitere Kritik lautet, dass der Kantianismus nicht f&uuml;r <strong>Extremf&auml;lle</strong>&nbsp;geeignet ist.</p>\n<p><strong>Angenommen,</strong>&nbsp;du k&ouml;nntest einer Person das Leben retten, indem du eine andere Person t&ouml;test.</p>\n<p>Da eine Welt, in der alle t&ouml;ten w&uuml;rden,&nbsp;<strong>nicht w&uuml;nschenswert</strong>&nbsp;w&auml;re, ist es nach dem Kantianismus&nbsp;<strong>verboten, zu t&ouml;ten.</strong></p>\n<p>Was aber, wenn die Zahl der Personen, die durch einen Mord gerettet werden k&ouml;nnen,&nbsp;<strong>erh&ouml;ht</strong>&nbsp;wird?</p>\n<p>Solltest du auch dann eine Person nicht t&ouml;ten, wenn du 100 Personen retten k&ouml;nntest? Oder 1'000 Personen? 10'000 Personen? Eine Million?</p>\n<p>Nach dem Kantianismus sollen wir auch dann nicht t&ouml;ten,&nbsp;<strong>wenn wir dadurch Millionen von Menschen das Leben retten k&ouml;nnten</strong>.</p>\n<p>Diese Forderung ist f&uuml;r Kritiker und Kritikerinnen unvern&uuml;nftig.</p>	2022-09-03 13:36:34.628932	2022-09-03 13:36:34.635001	7	30	false	false
145	<h1 class="text-center">Gef&uuml;hle und Neigungen</h1>\n<p>Eine n&auml;chste Kritik lautet, dass der Kantianismus <strong>Gef&uuml;hle und Neigungen vernachl&auml;ssigt</strong>.</p>\n<p>Friedrich Schiller schrieb in Reaktion zu Kant:</p>\n<p>"Gerne dien ich den Freunden, doch tu ich es leider mit Neigung. Und so wurmt es mir oft, dass ich nicht tugendhaft bin."</p>\n<p>Nach dem Kantianismus sollten wir unseren Freunden helfen,&nbsp;<u>nicht</u>, weil wir Gef&uuml;hle f&uuml;r sie haben, sondern, weil es&nbsp;<strong>unsere Pflicht ist</strong>, ihnen zu helfen.</p>\n<p>Kritiker und Kritikerinnen finden das verkehrt: Sollten wir nicht&nbsp;<strong>zuerst aus Mitgef&uuml;hl oder aus Neigungen</strong>&nbsp;handeln und erst dann aus Pflicht?</p>	2022-09-03 13:36:56.332565	2022-09-03 13:36:56.33817	7	31	false	false
146	<p class="text-center"><strong>Welche Schw&auml;che</strong>&nbsp;des Kantianismus kommt hier zum Ausdruck?</p>	2022-09-03 13:37:48.925413	2022-09-03 13:37:48.936784	7	32	false	false
147	<p class="text-center"><strong>Welche</strong>&nbsp;zwei Pflichten konfligieren im folgenden Textabschnitt?</p>	2022-09-03 13:40:13.75206	2022-09-03 13:40:13.758301	7	33	false	false
148	<h1 class="text-center">Der Fall Eichmann</h1>\n<p><strong>Adolf Eichmann</strong>&nbsp;war ein deutscher SS-Obersturmbannf&uuml;hrer w&auml;hrend der Zeit des Nationalsozialismus.</p>\n<p>Eichmann ist mitverantwortlich&nbsp;<strong>f&uuml;r die Ermordung von sch&auml;tzungsweise sechs Millionen Menschen</strong>.</p>\n<p>Vor Gericht verteidigte Eichmann seine Taten. Er argumentierte, dass er unschuldig sei, weil er&nbsp;<strong>lediglich die Befehle der Vorgesetzten ausf&uuml;hrte</strong>.</p>\n<p>Eichmann beteuerte, dass er nur&nbsp;<strong>seine Pflichten erf&uuml;llt hat.</strong></p>\n<p>Handelte Eichmann im Sinne der kantischen Ethik?</p>	2022-09-03 13:43:59.139782	2022-09-03 13:43:59.145182	7	34	false	false
149	<p>Die folgende Position argumentiert, dass Eichmann&nbsp;<u>nicht</u>&nbsp;im Sinne der kantischen Ethik gehandelt hat.</p>	2022-09-03 13:44:38.463933	2022-09-03 13:44:38.469667	7	35	false	false
150	<h3 class="text-center">Kurs abgeschlossen!</h3>	2022-09-03 13:51:14.451168	2022-09-03 13:51:14.457119	7	36	false	true
153	<h1 class="text-center">Kompetenzen</h1>\n<p>In diesem Kurs erwirbst du folgende Kompetenzen:</p>\n<ul class="space-between-li-10">\n<li>Du kannst&nbsp;<strong>tugendethische Theorien</strong>&nbsp;anhand eines Merkmals&nbsp;<strong>erkennen</strong>.</li>\n<li>Du kannst&nbsp;<strong>drei Grundmerkmale der aristotelischen Ethik</strong>&nbsp;nennen.</li>\n<li>Du kannst&nbsp;<strong>drei St&auml;rken</strong>&nbsp;und&nbsp;<strong>drei Schw&auml;chen</strong>&nbsp;der aristotelischen Ethik nennen.</li>\n<li>Du kannst eine Handlung aus einer&nbsp;<strong>aristotelischen Perspektive heraus beurteilen</strong>.</li>\n</ul>	2022-09-03 14:54:38.210978	2022-09-03 14:54:38.216134	9	1	false	false
154	<h1 class="text-center">Tugendethik</h1>\n<p><strong>Tugendethik</strong>&nbsp;ist ein Sammelbegriff f&uuml;r ethische Theorien, die Charaktereigenschaften beurteilen.</p>\n<p>Das Wort "Tugend" ist abgeleitet von&nbsp;<em>taugen</em>&nbsp;oder&nbsp;<em>Tauglichkeit</em>.</p>\n<p>Daher kommt auch der Name "<em>Tugend</em>ethik".</p>\n<p>Die Grundfrage der Tugendethik lautet:&nbsp;<em>"Was f&uuml;r eine Person soll ich sein?"</em></p>\n<p>Eine gute Person ist eine, die&nbsp;<strong>gute Charaktereigenschaften</strong>&nbsp;besitzt.</p>\n<p>Gute, lobenswerte oder ausgezeichnete Charaktereigenschaften werden&nbsp;<strong>Tugenden</strong>&nbsp;genannt.</p>\n<p>Schlechte, tadelnswerte oder mangelhafte Charaktereigenschaften werden&nbsp;<strong>Laster</strong>&nbsp;genannt.</p>	2022-09-03 14:54:57.475109	2022-09-03 14:54:57.479225	9	2	false	false
155	<h1 class="text-center">Tugendethische Theorien</h1>\n<p>Alle tugendethische Theorien beurteilen <strong>Charaktereigenschaften</strong>.</p>\n<p>Untereinander unterscheiden sich tugendethische Theorien nur in der&nbsp;<strong>Art und Weise</strong>, wie sie Charaktereigenschaften&nbsp;<strong>bewerten</strong>.</p>\n<p>Tugendethische Theorien kann man daran erkennen, dass sie immer dar&uuml;ber nachdenken,&nbsp;<strong>wie</strong>&nbsp;eine Person sein soll oder&nbsp;<strong>welche Eigenschaften</strong>&nbsp;eine gute Person haben muss.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>"Eine gute Person ist eine, die&nbsp;<strong>mutig</strong>,&nbsp;<strong>selbstsicher</strong>&nbsp;und&nbsp;<strong>fit</strong>&nbsp;ist."</p>\n<p>"Eine schlechte Person ist eine, die&nbsp;<strong>faul</strong>,&nbsp;<strong>unzuverl&auml;ssig</strong>&nbsp;und&nbsp;<strong>arrogant</strong>&nbsp;ist."</p>	2022-09-03 14:55:39.68462	2022-09-03 14:55:39.688999	9	3	false	false
156	<p class="text-center"><strong>&Uuml;berlege dir</strong>, ob die folgende Theorie&nbsp;<strong>tugendethisch</strong>&nbsp;ist!</p>	2022-09-03 14:56:02.304282	2022-09-03 14:56:02.310639	9	4	false	false
160	<h1 class="text-center">Aristoteles</h1>\n<p>Als Hauptvertreter der Tugendethik gilt der Philosoph <strong>Aristoteles</strong>.</p>\n<p>Seine Ethik wird manchmal die "aristotelische Ethik" oder "Aristotelismus" genannt.</p>\n<p>F&uuml;r Aristoteles ist die tugendhafte Person f&auml;hig,&nbsp;<strong>eine Situation richtig einzusch&auml;tzen</strong>&nbsp;und&nbsp;<strong>der Situation angemessen zu handeln.</strong></p>\n<p>Die tugendhafte Person ist eine, die sich&nbsp;<strong>gute Charaktereigenschaften angew&ouml;hnt hat</strong>&nbsp;und&nbsp;<strong>ihnen entsprechend handelt</strong>.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Eine tugendhafte Person hilft anderen in Not,&nbsp;<strong>weil sie hilfsbereit ist</strong>&nbsp;und&nbsp;<u>nicht</u>, weil sie mit einer Belohnung rechnet.</p>	2022-09-03 16:29:21.899105	2022-09-03 16:29:21.906786	9	8	false	false
151	<h3 class="text-center">Mehr Literatur</h3>\n<div class="list-group"><a class="list-group-item list-group-item-action" href="https://www.amazon.de/Kant-f%C3%BCr-Anf%C3%A4nger-kategorische-Imperativ/dp/3423301449/ref=pd_sim_0_2/262-1712323-7551832?_encoding=UTF8&amp;pd_rd_i=3423301449&amp;pd_rd_r=4535801b-4a6f-11e9-a590-23588706d4a1&amp;pd_rd_w=Fr4Dv&amp;pd_rd_wg=UMfPM&amp;pf_rd_p=b0773d2f-6335-4e3d-8bed-091e22ee3de4&amp;pf_rd_r=N8G57VF0WDCH8SBZWW7W&amp;psc=1&amp;refRID=N8G57VF0WDCH8SBZWW7W" target="_blank" rel="noopener"><strong>"Kant f&uuml;r Anf&auml;nger: Der kategorische Imperativ"</strong>&nbsp;- von Ralf Ludwig</a><a class="list-group-item list-group-item-action" href="https://www.amazon.de/Immanuel-Kant-Otfried-H%C3%B6ffe/dp/3406459773/ref=sr_1_64?s=books&amp;ie=UTF8&amp;qid=1553017973&amp;sr=1-64&amp;keywords=Kant+Ethik" target="_blank" rel="noopener"><strong>"Immanuel Kant"</strong>&nbsp;- von Otfried H&ouml;ffe</a></div>\n<p>&nbsp;</p>\n<h3 class="text-center">Quellen</h3>\n<div class="list-group"><a class="list-group-item list-group-item-action" href="http://www.utb-shop.de/autoren/hubner-dietmar/einfuhrung-in-die-philosophische-ethik-7843.html" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die philosophische Ethik"</strong>&nbsp;- von H&uuml;bner, Dietmar</a><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/annemarie-pieper/einfuehrung-in-die-ethik/id/9783825246969" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die Ethik"</strong>&nbsp;- von Annemarie Pieper</a><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/herlinde-pauer-studer/einfuehrung-in-die-ethik/id/9783825223502" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die Ethik"</strong>&nbsp;- von Herlinde Pauer-Studer</a></div>	2022-09-03 13:52:28.324978	2022-09-03 13:55:33.321447	7	37	false	false
162	<h1 class="text-center">Eudaimonia</h1>\n<p>F&uuml;r Aristoteles ist jedes menschliche Handeln auf <strong>ein Gut</strong>&nbsp;oder auf&nbsp;<strong>ein Ziel gerichtet</strong>.</p>\n<p>Manche G&uuml;ter wollen wir&nbsp;<strong>um ihrer selbst willen</strong>, andere nur&nbsp;<strong>als Mittel zum Zweck</strong>, n&auml;mlich um andere G&uuml;ter zu erhalten.</p>\n<p>Nach Aristoles gibt es nun ein&nbsp;<strong>h&ouml;chstes Gut</strong>&nbsp;oder ein&nbsp;<strong>letztendliches Ziel</strong>. Dieses h&ouml;chste Gut nennt Aristoteles&nbsp;<strong>Eudaimonia</strong>.</p>\n<p>Eudaimonia steht f&uuml;r das&nbsp;<strong>gute Leben</strong>, das&nbsp;<strong>gelungene Leben</strong>&nbsp;oder die&nbsp;<strong>Gl&uuml;ckseligkeit</strong>.</p>\n<p>Nach Aristoteles streben wir letzendlich alle danach, Eudaimonia zu erreichen.</p>	2022-09-03 16:30:09.696319	2022-09-03 16:30:09.711454	9	10	false	false
163	<h1 class="text-center">Lebensform</h1>\n<p>Nach Aristoteles erreichen wir Eudaimonia, indem wir auf eine <strong>bestimmte Art und Weise leben</strong>&nbsp;oder eine&nbsp;<strong>bestimmte Lebensform</strong>&nbsp;annehmen.</p>\n<p>Diese Lebensform ist f&uuml;r Aristoteles das&nbsp;<strong>tugendhafte Leben</strong>.</p>\n<p>Das tugendhafte Leben besteht darin,&nbsp;<strong>so zu leben</strong>&nbsp;und&nbsp;<strong>so zu handeln</strong>, wie&nbsp;<strong>eine tugendhafte Person leben und handeln w&uuml;rde</strong>.</p>\n<p><strong>In anderen Worten:</strong></p>\n<p>Laut Aristoteles k&ouml;nnen wir nur gl&uuml;cklich werden, wenn wir uns die&nbsp;<strong>richtigen Charaktereigenschaften angew&ouml;hnen</strong>, n&auml;mlich die Tugenden.</p>	2022-09-03 16:31:15.056337	2022-09-03 16:31:15.075049	9	11	false	false
164	<h1 class="text-center">Tugenden</h1>\n<p>Aristoteles unterscheidet zwischen zwei Kategorien von Tugenden, <strong>verstandesm&auml;ssige</strong>&nbsp;und&nbsp;<strong>ethische</strong>&nbsp;Tugenden:</p>\n<p>&nbsp;</p>\n<table class="table table-bordered">\n<thead>\n<tr>\n<th scope="col">verstandesm&auml;ssig</th>\n<th scope="col">ethisch</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Weisheit</td>\n<td>Grossz&uuml;gigkeit</td>\n</tr>\n<tr>\n<td>Klugheit</td>\n<td>Besonnenheit</td>\n</tr>\n<tr>\n<td>Auffassungsgabe</td>\n<td>Tapferkeit</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p>Diese Tugenden sind f&uuml;r Aristoteles besonders wichtig, aber es sind nicht die einzigen.</p>	2022-09-03 16:33:04.181064	2022-09-03 16:33:04.190488	9	12	false	false
167	<h1 class="text-center">Beispiel Spenden</h1>\n<p>Eine tugendhafte Person ist <strong>grossz&uuml;gig</strong>.</p>\n<p>Grossz&uuml;gigkeit ist das Mittlere zwischen zwei Extremen, n&auml;mlich&nbsp;<strong>Knauserei</strong>&nbsp;und&nbsp;<strong>Verschwendungssucht</strong>.</p>\n<p>Im Falle eines Notfalls muss eine Person &uuml;berlegen, wie sie handeln soll.</p>\n<p>Eine tugendhafte Person handelt genauso, dass sie nicht&nbsp;<strong>zu knauserig</strong>&nbsp;und nicht&nbsp;<strong>zu verschwenderisch</strong>, sondern&nbsp;<strong>genau richtig</strong>&nbsp;handelt, n&auml;mlich&nbsp;<strong>grossz&uuml;gig</strong>.</p>\n<p>Nichts oder wenig zu spenden, w&auml;re&nbsp;<strong>knauserig</strong>, man w&uuml;rde an Grossz&uuml;gigkeit&nbsp;<strong>mangeln</strong></p>\n<p>Zu viel zu spenden w&auml;re&nbsp;<strong>verschwenderisch</strong>, man h&auml;tte&nbsp;<strong>zu viel</strong>&nbsp;Grossz&uuml;gigkeit.</p>\n<p>Die tugendhafte Person handelt genau im richtigen Mass: Sie spendet genug, aber nicht zu viel, um nicht selbst in Armut zu fallen.</p>	2022-09-03 16:39:03.712177	2022-09-03 16:39:03.721249	9	15	false	false
165	<h1 class="text-center">Goldene Mitte</h1>\n<p>Aristoteles bestimmt die Tugend als das <strong>Mittlere zwischen zwei Extremen</strong>.</p>\n<p>Die folgende Tabelle zeigt in der Mitte&nbsp;<strong>die Tugend</strong>&nbsp;und links und rechts die zwei&nbsp;<strong>Extremen</strong>.</p>\n<div class="text-center rounded bg-white p-2 my-3"><img class="img-fluid" src="https://www.lernkurs.philosophie.ch/assets/tugenden-78046614c5916284eeacd4e40ce1e78914339a92222c2be86eb3d83db6370b5b.png"></div>\n<table style="border-collapse: collapse; width: 100%;" border="1"><colgroup><col style="width: 33.2283%;"><col style="width: 33.2283%;"><col style="width: 33.2283%;"></colgroup>\n<tbody>\n<tr>\n<td>Laster</td>\n<td>Tugend</td>\n<td>Laster</td>\n</tr>\n<tr>\n<td>Furcht</td>\n<td>Tapferkeit</td>\n<td>Draufg&auml;ngertum</td>\n</tr>\n<tr>\n<td>Knauserei</td>\n<td>Grossz&uuml;gigkeit</td>\n<td>Verschwendungssucht</td>\n</tr>\n<tr>\n<td>Stumpfsinnigkeit</td>\n<td>Besonnenheit</td>\n<td>Z&uuml;gellosigkeit</td>\n</tr>\n</tbody>\n</table>\n<p>Die handelnde Person soll jeweils versuchen, die <strong>goldene Mitte</strong>&nbsp;zu treffen.</p>	2022-09-03 16:36:15.752662	2022-09-03 16:38:05.333139	9	13	false	false
166	<h1 class="text-center">Beispiel Krieg</h1>\n<p>Eine tugendhafte Person ist <strong>tapfer</strong>.</p>\n<p>Tapferkeit ist das Mittlere zwischen zwei Extremen, n&auml;mlich&nbsp;<strong>Furcht</strong>&nbsp;und&nbsp;<strong>Draufg&auml;ngertum</strong>.</p>\n<p>Im Falle eines Krieges muss eine Person &uuml;berlegen, wie sie handeln soll.</p>\n<p>Eine tugendhafte Person handelt genauso, dass sie nicht&nbsp;<strong>zu feige</strong>&nbsp;und nicht&nbsp;<strong>zu draufg&auml;ngerisch</strong>, sondern&nbsp;<strong>genau richtig</strong>&nbsp;handelt, n&auml;mlich&nbsp;<strong>tapfer</strong>.</p>\n<p>Vor dem Krieg zu fliehen w&auml;re&nbsp;<strong>feige</strong>, man w&uuml;rde an Tapferkeit&nbsp;<strong>mangeln</strong>.</p>\n<p>Sich waghalsig und todesmutig in den Kampf zu st&uuml;rzen w&auml;re&nbsp;<strong>draufg&auml;ngerisch</strong>, man h&auml;tte&nbsp;<strong>zu viel</strong>&nbsp;Tapferkeit.</p>\n<p>Die tugendhafte Person handelt genau im richtigen Mass: Sie nimmt am Krieg teil, ohne zu feige oder zu draufg&auml;ngerisch zu sein.</p>	2022-09-03 16:38:30.109488	2022-09-03 16:38:30.119826	9	14	false	false
172	<h1 class="text-center">Wie erwirbt man Tugenden?</h1>\n<p>Nach Aristoteles erwerben wir verstandesm&auml;ssige Tugenden durch <strong>Belehrung</strong>&nbsp;und&nbsp;<strong>Unterricht</strong>, die ethischen Tugenden hingegen durch&nbsp;<strong>&Uuml;bung</strong>&nbsp;und&nbsp;<strong>Gew&ouml;hnung</strong>.</p>\n<p>Ethische Tugenden erwerben wir&nbsp;<u>nicht</u>&nbsp;dadurch, indem wir von ihnen h&ouml;ren oder &uuml;ber sie nachdenken.</p>\n<p>Ethische Tugenden erwerben wir, indem wir&nbsp;<strong>tugendhaften Personen nachahmen</strong>.</p>\n<p>Wenn wir&nbsp;<strong>regelm&auml;ssig</strong>&nbsp;und&nbsp;<strong>oft</strong>&nbsp;die Handlungen von tugendhaften Personen&nbsp;<strong>kopieren</strong>, dann fangen wir mit der Zeit an, die Tugenden zu &uuml;bernehmen, bis wir irgendwann selber tugendhaft sind.</p>	2022-09-03 16:48:15.801162	2022-09-03 16:48:15.809169	9	20	false	false
196	<h1>Ursachen sind stark fragmentiert</h1>\n<p>Das <strong>3. Problem</strong> besteht darin, dass Ursachen hinsichtlich des Klimawandels oft stark fragmentiert sind.</p>\n<p>Im Beispiel mit dem Fahrrad-Fahrer ist es <strong>eine Person</strong>, die mit <strong>einer Handlung</strong> f&uuml;r den Schaden verantwortlich ist.</p>\n<p>Im Beispiel mit dem Autofahrer sind es <strong>ganz viele Menschen</strong>, die mit <strong>einer Vielzahl von Handlungen</strong> den Schaden verursachen.</p>\n<p>Es gibt keinen klar erkennbaren Zusammenhang zwischen den vielen Handlungen und den Sch&auml;den,&nbsp; die sie verursachen.</p>	2022-09-09 10:09:21.235047	2022-09-09 13:00:23.489644	2	18	false	false
168	<h1 class="text-center">Beispiel S&uuml;ssigkeiten</h1>\n<p>Eine tugendhafte Person ist <strong>besonnen</strong>.</p>\n<p>Besonnenheit ist das Mittlere zwischen zwei Extremen, n&auml;mlich&nbsp;<strong>Stumpfsinnigkeit</strong>&nbsp;und&nbsp;<strong>Z&uuml;gellosigkeit</strong>.</p>\n<p>Eine Person muss sich &uuml;berlegen, wie viele S&uuml;ssigkeiten sie essen darf und wie viele nicht.</p>\n<p>Eine tugendhafte Person handelt genauso, dass sie nicht&nbsp;<strong>zu stumpfsinnig</strong>&nbsp;und nicht&nbsp;<strong>zu z&uuml;gellos</strong>, sondern&nbsp;<strong>genau richtig</strong>&nbsp;handelt, n&auml;mlich&nbsp;<strong>besonnen</strong>.</p>\n<p>Keine oder nur wenige S&uuml;ssigkeiten zu essen w&auml;re&nbsp;<strong>stumpfsinnig</strong>, man untertreibt es.</p>\n<p>Zu viele S&uuml;ssigkeiten zu essen w&auml;re&nbsp;<strong>z&uuml;gellos</strong>, man &uuml;bertreibt es.</p>\n<p>Die tugendhafte Person isst genau im richtigen Mass: Sie isst genug, um nicht stumpfsinnig zu sein, aber nicht zu viel, um nicht fett zu werden.</p>	2022-09-03 16:39:22.524311	2022-09-03 16:39:22.531694	9	16	false	false
169	<h1>Goldene Mitte?</h1>\n<p>&nbsp;</p>	2022-09-03 16:40:56.834837	2022-09-03 16:40:56.843089	9	17	false	false
170	<p>Nach Aristoteles gibt es ein <strong>letztendliches Ziel</strong> oder ein <strong>h&ouml;chstes Gut</strong>.</p>	2022-09-03 16:44:59.289543	2022-09-03 16:44:59.296931	9	18	false	false
176	<h1 class="text-center">St&auml;rken</h1>\n<p>Die Tugendethik war die Standardtheorie der Antike und hat die Geschichte der Ethik massgeblich beeinflusst.</p>\n<p>Im Folgenden werden&nbsp;<strong>drei St&auml;rken</strong>&nbsp;der aristotelischen Ethik hervorgehoben.</p>\n<p>&nbsp;</p>\n<ol class="space-between-li-20">\n<li>Die aristotelische Ethik&nbsp;<strong>ber&uuml;cksichtigt die Absichten</strong>&nbsp;einer handelnden Person.</li>\n<li>Die aristotelische Ethik&nbsp;<strong>ber&uuml;cksichtigt die Komplexit&auml;t des Lebens</strong>.</li>\n<li>In der aristotelischen Ethik geht es nicht nur um richtiges Handeln, sondern&nbsp;<strong>um das gute Leben allgemein</strong>&nbsp;und&nbsp;<strong>wie man es erreichen kann</strong>.</li>\n</ol>	2022-09-03 16:53:54.140039	2022-09-03 16:53:54.147275	9	24	false	false
177	<h1 class="text-center">Absichten</h1>\n<p>Manchmal vollbringen Menschen gute Taten, nicht weil sie gut sind, sondern weil sie heimlich auf eine <strong>Belohnung hoffen</strong>&nbsp;oder weil sie&nbsp;<strong>ber&uuml;hmt werden m&ouml;chten</strong>.</p>\n<p>Da die aristotelische Ethik&nbsp;<strong>Charaktereigenschaften</strong>&nbsp;und nicht Handlungen beurteilt, kann sie auch Menschen kritisieren, die an sich gute Taten vollbringen, aber&nbsp;<strong>schlechte</strong>&nbsp;oder&nbsp;<strong>fragw&uuml;rdige Absichten</strong>&nbsp;haben.</p>\n<p>Eine Person, die gute Taten aus&nbsp;<strong>Ruhmgier</strong>&nbsp;oder&nbsp;<strong>Egoismus</strong>&nbsp;vollbringt, ist nicht tugendhaft, sondern&nbsp;<strong>lasterhaft</strong>.</p>\n<p>Die aristotelische Ethik ist somit eine ethische Theorie, die die&nbsp;<strong>Absichten</strong>&nbsp;oder die&nbsp;<strong>Motivation</strong>&nbsp;einer handelnden Person ber&uuml;cksichtigt.</p>	2022-09-03 16:54:10.977553	2022-09-03 16:54:10.985082	9	25	false	false
178	<h1 class="text-center">Komplexit&auml;t</h1>\n<p>Aristoteles hat verstanden, dass man im Leben immer mit <strong>schwierigen</strong>&nbsp;Fragen und Problemen konfrontiert wird, die keine einfachen Antworten oder L&ouml;sungen haben.</p>\n<p>Deshalb betont Aristoteles die&nbsp;<strong>Erfahrung</strong>, die es braucht, um eine Situation&nbsp;<strong>richtig einzusch&auml;tzen</strong>&nbsp;und der Situation&nbsp;<strong>angemessen zu handeln</strong>.</p>\n<p>Aristoteles reduziert das richtige Handeln nicht auf das Anwenden eines Prinzips oder auf das blosse Befolgen von Regeln.</p>\n<p>Stattdessen fordert er,&nbsp;<strong>Erfahrungen zu sammeln</strong>, um so auch in schwierigen Situationen das Richtige zu tun.</p>\n<p>Die aristotelische Ethik ist somit eine ethische Theorie, die der Komplexit&auml;t des Lebens gerecht wird.</p>	2022-09-03 16:54:24.8512	2022-09-03 16:54:24.859753	9	26	false	false
179	<h1 class="text-center">Das gute Leben</h1>\n<p>F&uuml;r Aristoteles ist ein gl&uuml;ckliches und ein tugendhaftes Leben <strong>ein und dasselbe</strong>.</p>\n<p>Aristoteles pr&auml;sentiert nicht nur eine Anleitung zum richtigen Handeln, sondern auch eine Anleitung zum gl&uuml;cklichen Leben:</p>\n<p>Aristoteles betont, wie wichtig eine&nbsp;<strong>funktionierende Gesellschaft</strong>&nbsp;f&uuml;r ein gutes Leben ist. Denn nur in einer solchen kann man seine Potenziale verwirklichen oder seine Talente entfalten und so wahrhaftig gl&uuml;cklich werden.</p>\n<p>Auch betont er, wie wichtig&nbsp;<strong>Freunde</strong>&nbsp;und&nbsp;<strong>materielle G&uuml;ter</strong>&nbsp;f&uuml;r ein gl&uuml;ckliches Leben sind.</p>\n<p>Da eine tugendhafte Person sich um seine Freunde k&uuml;mmert, angemessen mit materiellen G&uuml;tern umgeht und zur gesellschaftlichen Harmonie beitr&auml;gt, wird die tugendhafte Person automatisch auch&nbsp;<strong>gl&uuml;cklich</strong>.</p>	2022-09-03 16:54:39.546779	2022-09-03 16:54:39.55808	9	27	false	false
182	<h1 class="text-center">Schw&auml;chen</h1>\n<p>Die aristotelische Ethik ist nicht ohne Kritik geblieben.</p>\n<p>Im Folgenden werden&nbsp;<strong>drei Einw&auml;nde</strong>&nbsp;gegen&uuml;ber der aristotelischen Ethik erl&auml;utert:</p>\n<p>&nbsp;</p>\n<ol class="space-between-li-20">\n<li>Die aristotelische Ethik kann&nbsp;<strong>keine konkreten Empfehlungen abgeben</strong>.</li>\n<li>Die aristotelische Ethik ist&nbsp;<strong>zu relativ</strong>.</li>\n<li>Das tugendhafte Leben f&uuml;hrt&nbsp;<strong>nicht immer</strong>&nbsp;zum gl&uuml;cklichen Leben.</li>\n</ol>	2022-09-03 16:59:04.84221	2022-09-03 16:59:04.849986	9	30	false	false
183	<h1 class="text-center">Zu vage?</h1>\n<p>Eine Kritik lautet, dass die aristotelische Ethik <strong>zu vage</strong>&nbsp;ist.</p>\n<p>Die aristotelische Ethik bietet&nbsp;<strong>kein Verfahren</strong>&nbsp;an, das uns hilft, in konkreten Situationen Entscheidungen zu treffen.</p>\n<p>Stattdessen r&auml;t uns die aristotelische Ethik das zu tun, was&nbsp;<strong>eine tugendhafte Person tun w&uuml;rde.</strong></p>\n<p>Solange wir aber nicht wissen, wie eine tugendhafte Person sich in einer konkreten Situation verhalten w&uuml;rde, bringt uns dieser Ratschlag nicht weiter.</p>\n<p>F&uuml;r Kritiker und Kritikerinnen muss eine Ethik in der Lage sein,&nbsp;<strong>ein Verfahren anzubieten</strong>, das uns hilft, Entscheidungen zu treffen.</p>	2022-09-03 16:59:22.433199	2022-09-03 16:59:22.449023	9	31	false	false
174	<h1 class="text-center">Wie erwirbt man Tugenden? (3)</h1>\n<p>Ethische Tugenden erwerben wir &auml;hnlich wie die F&auml;higkeit, Fahrr&auml;der zu reparieren:</p>\n<p>Um&nbsp;<strong>tapfer zu werden</strong>, m&uuml;ssen wir zuerst jemandem zuschauen, der die Tugend der Tapferkeit besitzt.</p>\n<p><strong>Zum Beispiel:&nbsp;</strong>Eine tapfere Person ist eine, die bei einem Verbrechen nicht tatenlos zusieht, sondern sofort zu Hilfe eilt.</p>\n<p>Doch alleine vom Zuschauen werden wir nicht tapfer, wir m&uuml;ssen es auch selber probieren.</p>\n<p>Je mehr und je &ouml;fter wir Dinge tun, die eine tapfere Person tut, desto mehr Erfahrungen sammeln wir und desto besser k&ouml;nnen wir tapfer sein.</p>\n<p>Irgendwann sind wir so ge&uuml;bt darin, tapfer zu sein, dass wir es einfach sind, ohne mehr dar&uuml;ber nachdenken zu m&uuml;ssen.</p>	2022-09-03 16:49:23.109199	2022-09-03 16:49:23.118613	9	22	false	false
175	<p>Auf den vorigen Seiten hast du die <strong>drei Grundmerkmale</strong>&nbsp;der aristotelischen Ethik kennen gelernt.</p>	2022-09-03 16:49:51.331622	2022-09-03 16:49:51.340991	9	23	false	false
184	<h1 class="text-center">Relativismus?</h1>\n<p>Eine weitere Kritik lautet, dass die aristotelische Ethik <strong>zu relativ ist</strong>.</p>\n<p>Aristoteles sagt, dass wir&nbsp;<strong>tugendhaften Personen nachahmen sollen</strong>.</p>\n<p>Doch&nbsp;<strong>wer</strong>&nbsp;sind diese tugendhaften Person? Wo finden wir sie?</p>\n<p>Aristoteles meint, dass wir immer&nbsp;<strong>in unserem Umfeld</strong>&nbsp;tugendhafte Personen erkennen k&ouml;nnen.</p>\n<p>Wenn man sich aber die verschiedenen Kulturen der Welt ansieht, dann merkt man, dass es&nbsp;<strong>unterschiedliche Ideale</strong>&nbsp;oder&nbsp;<strong>Vorbilder</strong>&nbsp;gibt.</p>\n<p>H&auml;ngt das Bild einer tugendhaften Person relativ von der&nbsp;<strong>Kultur</strong>&nbsp;ab, in der man lebt?</p>\n<p>F&uuml;r Kritiker und Kritikerinnen darf eine Ethik nicht von der Kultur abh&auml;ngen.</p>	2022-09-03 16:59:38.920538	2022-09-03 16:59:38.928967	9	32	false	false
185	<h1 class="text-center">Das gute Leben?</h1>\n<p>F&uuml;r Aristoteles ist ein gl&uuml;ckliches und ein tugendhaftes Leben <strong>ein und dasselbe</strong>.</p>\n<p>Doch ist ein tugendhaftes Leben und ein gl&uuml;ckliches Leben wirklich&nbsp;<strong>das gleiche</strong>?</p>\n<p><strong>F&uuml;hrt</strong>&nbsp;ein tugendhaftes Leben wirklich&nbsp;<strong>immer</strong>&nbsp;zu einem gl&uuml;cklichen Leben?</p>\n<p>Kritiker und Kritikerinnen argumentieren, dass ein tugendhaftes Leben&nbsp;<strong>nicht immer</strong>&nbsp;zu einem gl&uuml;cklichen Leben f&uuml;hrt.</p>\n<p><strong>Zum Beispiel:</strong></p>\n<p>Ist ein&nbsp;<strong>krimineller Mafia-Boss</strong>, der in Reichtum und Luxus lebt, wirklich&nbsp;<strong>weniger gl&uuml;cklich</strong>, als eine tugendhafte Person, die grossz&uuml;gig spendet und deshalb bescheidener leben muss?</p>	2022-09-03 16:59:59.519252	2022-09-03 16:59:59.527932	9	33	false	false
186	<p><strong>Welche Kritik</strong>&nbsp;an der aristotelischen Ethik wird hier ge&auml;ussert?</p>	2022-09-03 17:00:45.654505	2022-09-03 17:00:45.662633	9	34	false	false
187	<p>Gegen&nbsp;<strong>welche Kritik</strong>&nbsp;wird die aristotelische Ethik hier verteidigt?</p>	2022-09-03 17:03:31.113776	2022-09-03 17:03:31.12211	9	35	false	false
188	<h1 class="text-center">Laster?</h1>\n<p>Auf der n&auml;chsten Seite siehst du oben eine <strong>Beschreibung</strong>&nbsp;und darunter&nbsp;<strong>drei K&auml;stchen</strong>.</p>\n<p>Versuche herauszufinden,&nbsp;<strong>welches</strong>&nbsp;der drei K&auml;stchen&nbsp;<strong>zur obenstehenden Beschreibung passt</strong>!</p>\n<p><strong>Klicke</strong>&nbsp;dann auf das K&auml;stchen, von dem du denkst, dass es zur obenstehenden Beschreibung passt!</p>	2022-09-03 17:05:40.655264	2022-09-03 17:05:40.662796	9	36	false	false
189	<h3 class="text-center">Beschreibung:</h3>	2022-09-03 17:06:38.717153	2022-09-03 17:06:38.728112	9	37	false	false
190	<p><strong>&Uuml;berlege dir</strong>, wie eine tugendhafte Person hier handeln w&uuml;rde!</p>	2022-09-03 17:08:01.997908	2022-09-03 17:08:02.00655	9	38	false	false
192	<h3 class="text-center">Mehr Literatur</h3>\n<p>&nbsp;</p>\n<div class="list-group"><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/andreas-lotz/aristoteles-fuer-einsteiger/id/9783945219119" target="_blank" rel="noopener"><strong>"Aristoteles f&uuml;r Einsteiger"</strong>&nbsp;- von Andreas Lotz</a><a class="list-group-item list-group-item-action" href="https://www.amazon.de/Aristoteles-zur-Einf%C3%BChrung-Christof-Rapp/dp/3885066904/ref=sr_1_1?ie=UTF8&amp;qid=1553023976&amp;sr=8-1&amp;keywords=Aristoteles+Einf%C3%BChrung" target="_blank" rel="noopener"><strong>"Aristoteles zur Einf&uuml;hrung"</strong>&nbsp;- von Christof Rapp</a></div>\n<p>&nbsp;</p>\n<h3 class="text-center">Quellen</h3>\n<p>&nbsp;</p>\n<div class="list-group"><a class="list-group-item list-group-item-action" href="http://www.utb-shop.de/autoren/hubner-dietmar/einfuhrung-in-die-philosophische-ethik-7843.html" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die philosophische Ethik"</strong>&nbsp;- von H&uuml;bner, Dietmar</a><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/annemarie-pieper/einfuehrung-in-die-ethik/id/9783825246969" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die Ethik"</strong>&nbsp;- von Annemarie Pieper</a><a class="list-group-item list-group-item-action" href="https://www.exlibris.ch/de/buecher-buch/deutschsprachige-buecher/herlinde-pauer-studer/einfuehrung-in-die-ethik/id/9783825223502" target="_blank" rel="noopener"><strong>"Einf&uuml;hrung in die Ethik"</strong>&nbsp;- von Herlinde Pauer-Studer</a></div>\n<p>&nbsp;</p>	2022-09-03 17:09:55.45006	2022-09-03 17:09:55.459964	9	40	false	false
191	<h1 class="text-center">Kurs abgeschlossen!</h1>	2022-09-03 17:09:27.188728	2022-09-03 17:09:37.563129	9	39	false	true
16	<p><img class="img-fluid rounded\ntext-center" style="display: block; margin-left: auto; margin-right: auto;" src="../../rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f1ebbbde967edae81b47cd9fff45e6bd7844e38d/markus-spiske-dYZumbs8f_E-unsplash.webp?disposition=attachment"></p>\n<p style="text-align: justify;">Der Klimawandel bringt viele Herausforderungen f&uuml;r die Menschheit mit sich. Viele Menschen gehen auf die Strasse und fordern die Politik auf, mehr gegen den Klimawandel zu tun.</p>\n<p style="text-align: justify;">Auf Demos und Streiks findet man Schilder mit diversen Spr&uuml;chen und Slogans. Wie man im Bild oben sehen kann, ist einer dieser Spr&uuml;che "<strong>Climate Justice Now</strong>". Zu deutsch: "<strong>Klima-Gerechtigkeit jetzt!</strong>"</p>\n<p style="text-align: justify;">Aber was hat der Klimawandel eigentlich mit Gerechtigkeit zu tun? In diesem Kurs erf&auml;hrst du warum.</p>\n<p style="text-align: justify;">&nbsp;</p>	2022-07-08 06:42:00.427434	2022-09-03 18:32:11.764438	2	0	false	false
19	<p><strong>Gerechtigkeit als die richtige Verteilung von G&uuml;tern</strong></p>\n<p>Wenn es eine begrenzte Menge an G&uuml;ter gibt, dann stellt sich die Frage, wie diese G&uuml;ter verteilt werden sollen.</p>\n<p>Begrenzte G&uuml;ter, wie zum Beispiel Nahrungsmittel, k&ouml;nnen auf verschiedene Wege verteilt werden:</p>\n<ul>\n<li>Alle bekommen gleich viel Nahrungsmittel.</li>\n<li>Die Menschen, die bei der Herstellung der Nahrungsmittel mitgeholfen haben, bekommen mehr Nahrungsmittel als die, die nicht mitgeholfen haben.</li>\n<li>Die kranken und hungernden Menschen bekommen mehr Nahrungsmittel, als die gesunden und wohlern&auml;hrten Menschen.</li>\n</ul>\n<p>Wir sprechen von Gerechtigkeit, wenn die G&uuml;ter richtig verteilt werden und von Ungerechtigkeit, wenn die G&uuml;ter falsch verteilt werden.</p>\n<p>Wie eine gerechte Verteilung von G&uuml;tern aussieht oder wie G&uuml;ter am besten verteilt werden sollen, ist meist Gegenstand von gesellschaftlichen Debatten und Diskursen.</p>	2022-07-22 07:58:20.173948	2022-09-03 18:33:34.4392	2	3	false	false
22	<p><strong>Gerechtigkeit als eine bewusste und absichtliche Handlung&nbsp;</strong></p>\n<p>F&uuml;r die Verteilung von G&uuml;tern ist meistens eine Person, eine Gruppe von Personen, eine Organisation oder eine Regierung zust&auml;ndig.</p>\n<p>Wenn G&uuml;ter auf diese oder auf eine andere Weise verteilt werden, dann deshalb, weil jemand das so entschieden hat.</p>\n<p>Doch nicht alle Verteilungen sind die Folge einer bewussten und absichtlichen Handlung. Manche Verteilungen ergeben sich nat&uuml;rlich, ungewollt oder unbeabsichtigt.</p>\n<p>Wir sagen zum Beispiel nicht, dass es ungerecht ist, dass gewisse L&auml;nder mehr Bodensch&auml;tze wie Gold und Silber&nbsp; als andere haben, weil niemand sich daf&uuml;r entschieden hat, die Bodensch&auml;tze so zu verteilen.</p>	2022-07-22 09:01:28.288622	2022-09-03 18:36:25.121114	2	7	false	false
27	<h1>Intergenerationelle Gerechtigkeit?</h1>\n<p>Treibhausgase wie CO2 erw&auml;rmen die Luft. Je mehr CO2 in der Luft ist, umso st&auml;rker ist die Erw&auml;rmung.&nbsp;</p>\n<p>Wenn wir heute CO2 austossen, dann bleibt das CO2 f&uuml;r lange Zeit in der Luft enthalten.</p>\n<p>Hier ergibt sich ein besonderes Problem der Klimaproblematik:</p>\n<p><strong>Unsere Handlungen und Entscheidungen heute haben nicht nur Auswirkungen auf das Leben&nbsp; anderer im Jetzt, sondern auch Auswirkungen auf das Leben unserer Kinder und Kindeskinder.&nbsp;</strong></p>\n<p>Haben wir Pflichten gegen&uuml;ber sp&auml;teren Generationen? Haben wir die Pflicht, die Welt so zu hinterlassen, wie wir sie betreten haben?&nbsp;</p>\n<p>&nbsp;</p>	2022-07-23 08:29:47.745274	2022-09-09 10:05:42.312979	2	17	false	false
23	<h1>Was hat Klimawandel mit Gerechtigkeit zu tun?</h1>\n<p>Da der Klimawandel sch&auml;dliche Folgen f&uuml;r uns Menschen hat, stellt sich die Frage, wer welche Pflichten hat, etwas gegen den Klimawandel zu tun.&nbsp;</p>\n<p>In anderen Worten: <strong>Wie sollen die Pflichten im Umgang mit dem Klimawandel verteilt werden?&nbsp;</strong></p>\n<p>Und die Frage, wie etwas richtig verteilt werden soll, ist <strong>eine Frage der Gerechtigkeit</strong>.</p>\n<p>Weitere Fragen bez&uuml;glich Klimagerechtigkeit lauten:</p>\n<ul>\n<li>Welche Pflichten haben heutige Generationen gegen&uuml;ber kommende Generationen?</li>\n<li>D&uuml;rfen Individuen Pflichten auferlegt werden oder nur Staaten oder Regierungen?</li>\n<li>Welche Hilfe oder Wiedergutmachungen sollten diejenigen erhalten, die bereits vom Klimawandel betroffen sind?</li>\n<li>Ist der Klimawandel ein Problem f&uuml;r sich oder muss es im Zusammenhang von anderen Bereichen betrachtet werden, wie zum Beispiel Armut, Menschenrechte oder &ouml;konomisches Wachstum?</li>\n</ul>	2022-07-22 09:13:30.151685	2022-09-09 09:24:01.293644	2	12	false	false
193	<h1>Ursache und Wirkung</h1>\n<p>Im Alltag k&ouml;nnen wir meistens gut Ursachen und Wirkungen erkennen.</p>\n<ul>\n<li>Ein Zimmer wird warm, weil wir die Heizung aufgedreht haben.</li>\n<li>Das Fenster zerbricht, weil jemand einen Stein dagegen geworfen hat.</li>\n<li>Ein Produkt wird mehr verkauft, weil Tage zuvor Werbungen f&uuml;r das Produkt ausgestrahlt worden sind.</li>\n</ul>\n<p>Bei diesen Beispielen ist es einfach, Ursachen und Wirkungen zu erkennen, weil sie <strong>r&auml;umlich</strong> und <strong>zeitlich</strong> nahe beieinander sind.&nbsp;</p>\n<p>Das Aufdrehen der Heizung hat die Wirkung, dass das Zimmer warm wird. Die Heizung ist <strong>am gleichen Ort</strong> wie das Zimmer und die Wirkung, das warme Zimmer,&nbsp; liegt <strong>nur wenige Stunden von der Ursache</strong> entfernt.</p>\n<p>Beim Klimawandel ist es aber nicht immer einfach, Ursachen und Wirkungen festzumachen, weil Ursachen und Wirkungen r&auml;umlich und zeitlich weit auseinander liegen k&ouml;nnen.</p>	2022-09-03 18:55:52.020142	2022-09-09 10:05:42.28537	2	14	false	false
198	<h1>Wie viel Risiko d&uuml;rfen wir eingehen?</h1>\n<p>Der Anstieg des Meeresspiegel betrifft das Leben von Menschen, insbesondere die, die an der K&uuml;ste leben. Viele Menschen werden als Folge ihre Wohnungen verlieren.</p>\n<p>Um diese kommende Krise abzuwehren, k&ouml;nnte man im Vorfeld bereits anfangen, neue Wohnungen f&uuml;r die Menschen zu bauen, die ihre Wohnungen verlieren werden. Doch wie viele Wohnungen sollte man bauen?&nbsp;</p>\n<p>Je nach dem, ob der Meeresspiegel um 30 cm oder um 1 m ansteigt, werden weniger oder mehr Wohnungen gebraucht.&nbsp;</p>\n<p>Sollten wir auf Nummer sicher gehen und mit einem Anstieg von 1 m rechnen? Oder k&ouml;nnen wir risikofreudig sein und hoffen, dass der Meeresspiegel nur um 30 cm ansteigt?</p>	2022-09-09 13:47:44.411445	2022-09-09 13:47:44.441855	2	20	false	false
194	<h1>Wer hat den Schaden verursacht?</h1>\n<p>Die Frage nach der Ursache und Wirkung ist dann wichtig, wenn es darum geht, den Schuldigen f&uuml;r einen Schaden zu finden.</p>\n<p>Betrachte das folgende Beispiel:</p>\n<p><em>Es ist Nacht. Sie sitzen auf Ihrem Fahrrad und um schneller nach Hause zu kommen, nehmen Sie eine Abk&uuml;rzung, fahren querfeldein &uuml;ber den Acker einer benachbarten B&auml;uerin und schaden so ihrer Ernte.&nbsp;</em></p>\n<p>In diesem Beispiel ist einfach zu sehen, wer den Schaden verursacht hat, n&auml;mlich der <strong>Fahrrad-Fahrer, der querfeldein &uuml;ber den Acker gefahren ist</strong>.</p>\n<p>&nbsp;</p>	2022-09-09 09:41:03.51373	2022-09-09 10:05:42.290907	2	15	false	false
195	<h1>Wer hat den Schaden verursacht?</h1>\n<p>Wenn es aber um Klimawandel geht, dann ist es nicht mehr so einfach, Ursachen, Wirkungen und die Schuldigen zu erkennen.</p>\n<p>Betrachte das folgende Beispiel:</p>\n<p><em>Es ist Nacht und um schneller nach Hause zu kommen, nehmen Sie anstelle des Fahrrads das Auto. Dabei stossen Sie CO2 aus; zusammen mit den Emissionen vieler anderer Menschen ver&auml;ndert dies langsam das Klima. Diese Ver&auml;nderung f&uuml;hrt nach Jahrzehnten zu Ernteeinbu&szlig;en bei Bauern in fernen L&auml;ndern des Globalen S&uuml;dens.</em></p>\n<p>Wer ist hier der Schuldige f&uuml;r den Schaden? Wen k&ouml;nnen die Bauern anklagen?&nbsp;</p>\n<p>Anhand von diesem Beispiel kann man gleich zwei Probleme von Klima-Gerechtigkeit sehen:</p>\n<ol>\n<li><strong>Problem: </strong>Ursachen und Wirkungen des Klimawandels liegen <strong>zeitlich</strong> weit auseinander.</li>\n<li><strong>Problem:</strong>&nbsp;Ursachen und Wirkungen des Klimawandels liegen <strong>r&auml;umlich</strong> weit auseinander.</li>\n</ol>	2022-09-09 09:58:14.817407	2022-09-09 10:05:42.300827	2	16	false	false
197	<h1>Unsicherheiten</h1>\n<p>Das <strong>4. Problem</strong> besteht darin, dass die Auswirkungen unserer Handlungen mit Unsicherheiten behaftet ist.&nbsp;</p>\n<p>Es gibt keinen Zweifel dar&uuml;ber, dass ein Klimawandel stattfindet, aber es gibt Unsicherheiten dar&uuml;ber, <strong>wie viel Klimawandel</strong> verursacht wird.&nbsp;</p>\n<p>Der Meeresspiegel ist zwischen dem Jahr 1901 und 2015 um 19.5 cm angestiegen. Das sind im Durchschnitt 1.7 mm pro Jahr.</p>\n<p>Um wie viel mehr wird der Meeresspiegel in der Zukunft ansteigen? Eine Sch&auml;tzung ist, dass der Meeresspiegel bis 2100 zwischen 30 cm und 1 m steigen wird. (<a href="https://klimasimulationen.de/weltklimarat/">https://klimasimulationen.de/weltklimarat/</a>)</p>\n<p>An dieser Sch&auml;tzung sieht man das Problem der Unsicherheit: Es kann sein, dass der Meeresspiegel "nur" um 30 cm steigt, es kann aber auch sein, dass der Meeresspiegel um 1 m steigt.&nbsp;</p>\n<p>&nbsp;</p>\n<p>zwischen 1901 und 2015 um 19,5 cm angestiegen, d.h. um 1,7 mm/Jahr</p>	2022-09-09 13:37:48.685253	2022-09-09 13:37:48.728714	2	19	false	false
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.user_roles (id, role_id, user_id, created_at, updated_at) FROM stdin;
1	1	1	2022-05-18 07:15:31.257342	2022-05-18 07:15:31.257342
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sandro
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
2	s.raess@me.com2	$2a$12$YK2YgKkvYuxC3w8OBNWluOU/kMSsYZyiLY5rouQrrItQo1vaUoxUy	\N	\N	\N	2022-05-21 09:04:58.50545	2022-05-21 09:04:58.50545
1	sandro.raess@philosophie.ch	$2a$12$IQCen4DW9Y36bRPq9PyZ7OrbkGDue8pbxiAu7AEfiMtZhYv1AXRVG	\N	\N	2022-05-21 11:06:21.146893	2022-05-18 07:15:31.218764	2022-05-21 11:06:21.147407
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.accounts_id_seq', 49, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 18, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 18, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: checkbox_exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.checkbox_exercises_id_seq', 6, true);


--
-- Name: checkboxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.checkboxes_id_seq', 28, true);


--
-- Name: clozes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.clozes_id_seq', 1, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, true);


--
-- Name: cost_benefit_analyses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.cost_benefit_analyses_id_seq', 1, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.courses_id_seq', 9, true);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.media_id_seq', 1, true);


--
-- Name: open_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.open_questions_id_seq', 2, true);


--
-- Name: point_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.point_systems_id_seq', 60, true);


--
-- Name: quiz_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.quiz_questions_id_seq', 148, true);


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.quizzes_id_seq', 52, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.roles_id_seq', 6, true);


--
-- Name: slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.slides_id_seq', 198, true);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sandro
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: checkbox_exercises checkbox_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.checkbox_exercises
    ADD CONSTRAINT checkbox_exercises_pkey PRIMARY KEY (id);


--
-- Name: checkboxes checkboxes_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.checkboxes
    ADD CONSTRAINT checkboxes_pkey PRIMARY KEY (id);


--
-- Name: clozes clozes_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.clozes
    ADD CONSTRAINT clozes_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: cost_benefit_analyses cost_benefit_analyses_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.cost_benefit_analyses
    ADD CONSTRAINT cost_benefit_analyses_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: open_questions open_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.open_questions
    ADD CONSTRAINT open_questions_pkey PRIMARY KEY (id);


--
-- Name: point_systems point_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.point_systems
    ADD CONSTRAINT point_systems_pkey PRIMARY KEY (id);


--
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: slides slides_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.slides
    ADD CONSTRAINT slides_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_user_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_accounts_on_user_id ON public.accounts USING btree (user_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: sandro
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: sandro
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: sandro
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_checkbox_exercises_on_slide_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_checkbox_exercises_on_slide_id ON public.checkbox_exercises USING btree (slide_id);


--
-- Name: index_checkboxes_on_checkbox_exercise_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_checkboxes_on_checkbox_exercise_id ON public.checkboxes USING btree (checkbox_exercise_id);


--
-- Name: index_clozes_on_slide_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_clozes_on_slide_id ON public.clozes USING btree (slide_id);


--
-- Name: index_comments_on_commentable; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_comments_on_commentable ON public.comments USING btree (commentable_type, commentable_id);


--
-- Name: index_cost_benefit_analyses_on_slide_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_cost_benefit_analyses_on_slide_id ON public.cost_benefit_analyses USING btree (slide_id);


--
-- Name: index_courses_on_slug; Type: INDEX; Schema: public; Owner: sandro
--

CREATE UNIQUE INDEX index_courses_on_slug ON public.courses USING btree (slug);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: sandro
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_open_questions_on_slide_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_open_questions_on_slide_id ON public.open_questions USING btree (slide_id);


--
-- Name: index_point_systems_on_pointsystemable; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_point_systems_on_pointsystemable ON public.point_systems USING btree (pointsystemable_type, pointsystemable_id);


--
-- Name: index_quiz_questions_on_quiz_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_quiz_questions_on_quiz_id ON public.quiz_questions USING btree (quiz_id);


--
-- Name: index_quizzes_on_slide_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_quizzes_on_slide_id ON public.quizzes USING btree (slide_id);


--
-- Name: index_slides_on_course_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_slides_on_course_id ON public.slides USING btree (course_id);


--
-- Name: index_user_roles_on_role_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_user_roles_on_role_id ON public.user_roles USING btree (role_id);


--
-- Name: index_user_roles_on_user_id; Type: INDEX; Schema: public; Owner: sandro
--

CREATE INDEX index_user_roles_on_user_id ON public.user_roles USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: sandro
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: sandro
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: checkbox_exercises fk_rails_00d23a9652; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.checkbox_exercises
    ADD CONSTRAINT fk_rails_00d23a9652 FOREIGN KEY (slide_id) REFERENCES public.slides(id);


--
-- Name: slides fk_rails_1dc5db41e1; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.slides
    ADD CONSTRAINT fk_rails_1dc5db41e1 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: quizzes fk_rails_375fb795e1; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fk_rails_375fb795e1 FOREIGN KEY (slide_id) REFERENCES public.slides(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: clozes fk_rails_9ae7481451; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.clozes
    ADD CONSTRAINT fk_rails_9ae7481451 FOREIGN KEY (slide_id) REFERENCES public.slides(id);


--
-- Name: accounts fk_rails_b1e30bebc8; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_rails_b1e30bebc8 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: quiz_questions fk_rails_c723d3feef; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fk_rails_c723d3feef FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id);


--
-- Name: cost_benefit_analyses fk_rails_d98c04537f; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.cost_benefit_analyses
    ADD CONSTRAINT fk_rails_d98c04537f FOREIGN KEY (slide_id) REFERENCES public.slides(id);


--
-- Name: open_questions fk_rails_e759b5ac4b; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.open_questions
    ADD CONSTRAINT fk_rails_e759b5ac4b FOREIGN KEY (slide_id) REFERENCES public.slides(id);


--
-- Name: checkboxes fk_rails_f30cba0366; Type: FK CONSTRAINT; Schema: public; Owner: sandro
--

ALTER TABLE ONLY public.checkboxes
    ADD CONSTRAINT fk_rails_f30cba0366 FOREIGN KEY (checkbox_exercise_id) REFERENCES public.checkbox_exercises(id);


--
-- PostgreSQL database dump complete
--

