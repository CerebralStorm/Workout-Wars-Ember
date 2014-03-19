--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    exercise_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "values" hstore
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: challenge_attempts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE challenge_attempts (
    id integer NOT NULL,
    user_id integer,
    challenge_id integer,
    result double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    activity_id integer
);


--
-- Name: challenge_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE challenge_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenge_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE challenge_attempts_id_seq OWNED BY challenge_attempts.id;


--
-- Name: challenges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE challenges (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    challenge_win_condition_id integer,
    difficulty_id integer,
    exercise_id integer,
    reward integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE challenges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE challenges_id_seq OWNED BY challenges.id;


--
-- Name: competition_activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE competition_activities (
    id integer NOT NULL,
    user_id integer,
    activity_id integer,
    competition_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: competition_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE competition_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: competition_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE competition_activities_id_seq OWNED BY competition_activities.id;


--
-- Name: competition_exercises; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE competition_exercises (
    id integer NOT NULL,
    exercise_id integer,
    competition_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: competition_exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE competition_exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: competition_exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE competition_exercises_id_seq OWNED BY competition_exercises.id;


--
-- Name: competition_joins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE competition_joins (
    id integer NOT NULL,
    user_id integer,
    competition_id integer,
    total integer DEFAULT 0,
    rank integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: competition_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE competition_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: competition_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE competition_joins_id_seq OWNED BY competition_joins.id;


--
-- Name: competition_win_conditions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE competition_win_conditions (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: competition_win_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE competition_win_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: competition_win_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE competition_win_conditions_id_seq OWNED BY competition_win_conditions.id;


--
-- Name: competitions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE competitions (
    id integer NOT NULL,
    name character varying(255),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    max_participants integer,
    lower_level_restriction integer,
    upper_level_restriction character varying(255),
    competition_win_condition_id integer,
    win_condition_id integer,
    description character varying(255),
    difficulty_id integer,
    is_private boolean,
    finished boolean DEFAULT false,
    user_id integer,
    winner_id integer,
    reward integer,
    started boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: competitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE competitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: competitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE competitions_id_seq OWNED BY competitions.id;


--
-- Name: exercise_metrics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE exercise_metrics (
    id integer NOT NULL,
    exercise_id integer,
    metric_id integer,
    experience_multiplier double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: exercise_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exercise_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exercise_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exercise_metrics_id_seq OWNED BY exercise_metrics.id;


--
-- Name: exercises; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE exercises (
    id integer NOT NULL,
    name character varying(255),
    experience_multiplier double precision,
    metric_id integer,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    approved boolean
);


--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exercises_id_seq OWNED BY exercises.id;


--
-- Name: experience_sources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE experience_sources (
    id integer NOT NULL,
    amount integer,
    user_id integer,
    experienceable_id integer,
    experienceable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: experience_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE experience_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: experience_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE experience_sources_id_seq OWNED BY experience_sources.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE feedbacks (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    subject character varying(255),
    content character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE feedbacks_id_seq OWNED BY feedbacks.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE metrics (
    id integer NOT NULL,
    name character varying(255),
    measurement character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE metrics_id_seq OWNED BY metrics.id;


--
-- Name: rails_admin_histories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rails_admin_histories (
    id integer NOT NULL,
    message text,
    username character varying(255),
    item integer,
    "table" character varying(255),
    month smallint,
    year bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rails_admin_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rails_admin_histories_id_seq OWNED BY rails_admin_histories.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    authentication_token character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    nickname character varying(255),
    gender character varying(255),
    address character varying(255),
    phone character varying(255),
    weight double precision,
    height double precision,
    age integer,
    admin boolean DEFAULT false,
    provider character varying(255),
    uid character varying(255),
    level integer DEFAULT 1,
    experience_level integer DEFAULT 1,
    experience_multiplier integer DEFAULT 500,
    agree_to_terms boolean,
    avatar_url character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY challenge_attempts ALTER COLUMN id SET DEFAULT nextval('challenge_attempts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY challenges ALTER COLUMN id SET DEFAULT nextval('challenges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY competition_activities ALTER COLUMN id SET DEFAULT nextval('competition_activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY competition_exercises ALTER COLUMN id SET DEFAULT nextval('competition_exercises_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY competition_joins ALTER COLUMN id SET DEFAULT nextval('competition_joins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY competition_win_conditions ALTER COLUMN id SET DEFAULT nextval('competition_win_conditions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY competitions ALTER COLUMN id SET DEFAULT nextval('competitions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exercise_metrics ALTER COLUMN id SET DEFAULT nextval('exercise_metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exercises ALTER COLUMN id SET DEFAULT nextval('exercises_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY experience_sources ALTER COLUMN id SET DEFAULT nextval('experience_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY feedbacks ALTER COLUMN id SET DEFAULT nextval('feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY metrics ALTER COLUMN id SET DEFAULT nextval('metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rails_admin_histories ALTER COLUMN id SET DEFAULT nextval('rails_admin_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: challenge_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY challenge_attempts
    ADD CONSTRAINT challenge_attempts_pkey PRIMARY KEY (id);


--
-- Name: challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: competition_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY competition_activities
    ADD CONSTRAINT competition_activities_pkey PRIMARY KEY (id);


--
-- Name: competition_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY competition_exercises
    ADD CONSTRAINT competition_exercises_pkey PRIMARY KEY (id);


--
-- Name: competition_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY competition_joins
    ADD CONSTRAINT competition_joins_pkey PRIMARY KEY (id);


--
-- Name: competition_win_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY competition_win_conditions
    ADD CONSTRAINT competition_win_conditions_pkey PRIMARY KEY (id);


--
-- Name: competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (id);


--
-- Name: exercise_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY exercise_metrics
    ADD CONSTRAINT exercise_metrics_pkey PRIMARY KEY (id);


--
-- Name: exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: experience_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY experience_sources
    ADD CONSTRAINT experience_sources_pkey PRIMARY KEY (id);


--
-- Name: feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: rails_admin_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rails_admin_histories
    ADD CONSTRAINT rails_admin_histories_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: competition_activities_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX competition_activities_index ON competition_activities USING btree (user_id, activity_id, competition_id);


--
-- Name: experience_sources_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX experience_sources_index ON experience_sources USING btree (experienceable_id, experienceable_type, user_id);


--
-- Name: index_activities_on_exercise_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_exercise_id_and_user_id ON activities USING btree (exercise_id, user_id);


--
-- Name: index_challenge_attempts_on_user_id_and_challenge_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_challenge_attempts_on_user_id_and_challenge_id ON challenge_attempts USING btree (user_id, challenge_id);


--
-- Name: index_competition_exercises_on_exercise_id_and_competition_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_competition_exercises_on_exercise_id_and_competition_id ON competition_exercises USING btree (exercise_id, competition_id);


--
-- Name: index_competition_joins_on_user_id_and_competition_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_competition_joins_on_user_id_and_competition_id ON competition_joins USING btree (user_id, competition_id);


--
-- Name: index_exercise_metrics_on_exercise_id_and_metric_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_exercise_metrics_on_exercise_id_and_metric_id ON exercise_metrics USING btree (exercise_id, metric_id);


--
-- Name: index_rails_admin_histories; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rails_admin_histories ON rails_admin_histories USING btree (item, "table", month, year);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20131123013124');

INSERT INTO schema_migrations (version) VALUES ('20131123161224');

INSERT INTO schema_migrations (version) VALUES ('20131123170302');

INSERT INTO schema_migrations (version) VALUES ('20131123170432');

INSERT INTO schema_migrations (version) VALUES ('20131125001342');

INSERT INTO schema_migrations (version) VALUES ('20131125001454');

INSERT INTO schema_migrations (version) VALUES ('20131127065634');

INSERT INTO schema_migrations (version) VALUES ('20131209194240');

INSERT INTO schema_migrations (version) VALUES ('20131213001405');

INSERT INTO schema_migrations (version) VALUES ('20131219063020');

INSERT INTO schema_migrations (version) VALUES ('20140128030427');

INSERT INTO schema_migrations (version) VALUES ('20140201194723');

INSERT INTO schema_migrations (version) VALUES ('20140207053042');

INSERT INTO schema_migrations (version) VALUES ('20140207074501');

INSERT INTO schema_migrations (version) VALUES ('20140208215701');

INSERT INTO schema_migrations (version) VALUES ('20140219004042');

INSERT INTO schema_migrations (version) VALUES ('20140225163207');

INSERT INTO schema_migrations (version) VALUES ('20140305054247');

INSERT INTO schema_migrations (version) VALUES ('20140318185828');

INSERT INTO schema_migrations (version) VALUES ('20140319231947');

INSERT INTO schema_migrations (version) VALUES ('20140319232031');
