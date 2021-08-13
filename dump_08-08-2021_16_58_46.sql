--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE db_name;




--
-- Drop roles
--

DROP ROLE db_user;


--
-- Roles
--

CREATE ROLE db_user;
ALTER ROLE db_user WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5a3f26bd91cbeb154b0f764cb3cd53620';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: db_user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO db_user;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: db_user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: db_user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: db_user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "db_name" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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

--
-- Name: db_name; Type: DATABASE; Schema: -; Owner: db_user
--

CREATE DATABASE db_name WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE db_name OWNER TO db_user;

\connect db_name

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
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    image character varying(100),
    bio text,
    gender boolean NOT NULL,
    number integer
);


ALTER TABLE public.accounts_user OWNER TO db_user;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO db_user;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO db_user;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO db_user;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO db_user;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO db_user;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO db_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO db_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO db_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO db_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO db_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO db_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO db_user;

--
-- Name: blog_blog; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.blog_blog (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(300),
    cover_image character varying(100) NOT NULL,
    description text NOT NULL,
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    author_id bigint
);


ALTER TABLE public.blog_blog OWNER TO db_user;

--
-- Name: blog_blog_category; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.blog_blog_category (
    id bigint NOT NULL,
    blog_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.blog_blog_category OWNER TO db_user;

--
-- Name: blog_blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.blog_blog_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_category_id_seq OWNER TO db_user;

--
-- Name: blog_blog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.blog_blog_category_id_seq OWNED BY public.blog_blog_category.id;


--
-- Name: blog_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.blog_blog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_id_seq OWNER TO db_user;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.blog_blog_id_seq OWNED BY public.blog_blog.id;


--
-- Name: blog_blog_tags; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.blog_blog_tags (
    id bigint NOT NULL,
    blog_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.blog_blog_tags OWNER TO db_user;

--
-- Name: blog_blog_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.blog_blog_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_tags_id_seq OWNER TO db_user;

--
-- Name: blog_blog_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.blog_blog_tags_id_seq OWNED BY public.blog_blog_tags.id;


--
-- Name: blog_category; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.blog_category (
    id bigint NOT NULL,
    category character varying(50) NOT NULL
);


ALTER TABLE public.blog_category OWNER TO db_user;

--
-- Name: blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.blog_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_category_id_seq OWNER TO db_user;

--
-- Name: blog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.blog_category_id_seq OWNED BY public.blog_category.id;


--
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.blog_comment (
    id bigint NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(80) NOT NULL,
    message text NOT NULL,
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    blog_id bigint,
    parent_id bigint
);


ALTER TABLE public.blog_comment OWNER TO db_user;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.blog_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comment_id_seq OWNER TO db_user;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.blog_comment_id_seq OWNED BY public.blog_comment.id;


--
-- Name: blog_tag; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.blog_tag (
    id bigint NOT NULL,
    tag character varying(50) NOT NULL
);


ALTER TABLE public.blog_tag OWNER TO db_user;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tag_id_seq OWNER TO db_user;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.blog_tag_id_seq OWNED BY public.blog_tag.id;


--
-- Name: core_contact; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.core_contact (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(80) NOT NULL,
    subject character varying(80) NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.core_contact OWNER TO db_user;

--
-- Name: core_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.core_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_contact_id_seq OWNER TO db_user;

--
-- Name: core_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.core_contact_id_seq OWNED BY public.core_contact.id;


--
-- Name: core_subscriber; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.core_subscriber (
    id bigint NOT NULL,
    email character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.core_subscriber OWNER TO db_user;

--
-- Name: core_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.core_subscriber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_subscriber_id_seq OWNER TO db_user;

--
-- Name: core_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.core_subscriber_id_seq OWNED BY public.core_subscriber.id;


--
-- Name: core_team; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.core_team (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    full_name character varying(100) NOT NULL
);


ALTER TABLE public.core_team OWNER TO db_user;

--
-- Name: core_team_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.core_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_team_id_seq OWNER TO db_user;

--
-- Name: core_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.core_team_id_seq OWNED BY public.core_team.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO db_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO db_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO db_user;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO db_user;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO db_user;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO db_user;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO db_user;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO db_user;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO db_user;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO db_user;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO db_user;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO db_user;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO db_user;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO db_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO db_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO db_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO db_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO db_user;

--
-- Name: jet_bookmark; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.jet_bookmark (
    id bigint NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_bookmark OWNER TO db_user;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.jet_bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_bookmark_id_seq OWNER TO db_user;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;


--
-- Name: jet_pinnedapplication; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.jet_pinnedapplication (
    id bigint NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_pinnedapplication OWNER TO db_user;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.jet_pinnedapplication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_pinnedapplication_id_seq OWNER TO db_user;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.order_order (
    id bigint NOT NULL,
    date_ordered timestamp with time zone NOT NULL,
    complete boolean NOT NULL,
    transaction_id character varying(100),
    customer_id bigint
);


ALTER TABLE public.order_order OWNER TO db_user;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO db_user;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;


--
-- Name: order_orderitem; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.order_orderitem (
    id bigint NOT NULL,
    quantity integer,
    date_added timestamp with time zone NOT NULL,
    order_id bigint,
    product_id bigint
);


ALTER TABLE public.order_orderitem OWNER TO db_user;

--
-- Name: order_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.order_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderitem_id_seq OWNER TO db_user;

--
-- Name: order_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.order_orderitem_id_seq OWNED BY public.order_orderitem.id;


--
-- Name: order_shippingaddress; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.order_shippingaddress (
    id bigint NOT NULL,
    address character varying(200) NOT NULL,
    city character varying(200) NOT NULL,
    state character varying(200),
    zipcode character varying(200) NOT NULL,
    companyname character varying(100),
    date_added timestamp with time zone NOT NULL,
    customer_id bigint,
    order_id bigint
);


ALTER TABLE public.order_shippingaddress OWNER TO db_user;

--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.order_shippingaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_shippingaddress_id_seq OWNER TO db_user;

--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.order_shippingaddress_id_seq OWNED BY public.order_shippingaddress.id;


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_category (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    title_en character varying(50),
    title_az character varying(50),
    title_tr character varying(50),
    image character varying(100),
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id bigint
);


ALTER TABLE public.products_category OWNER TO db_user;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO db_user;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_category_products; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_category_products (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.products_category_products OWNER TO db_user;

--
-- Name: products_category_products_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_category_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_products_id_seq OWNER TO db_user;

--
-- Name: products_category_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_category_products_id_seq OWNED BY public.products_category_products.id;


--
-- Name: products_city; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_city (
    id bigint NOT NULL,
    city character varying(100) NOT NULL
);


ALTER TABLE public.products_city OWNER TO db_user;

--
-- Name: products_city_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_city_id_seq OWNER TO db_user;

--
-- Name: products_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_city_id_seq OWNED BY public.products_city.id;


--
-- Name: products_color; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_color (
    id bigint NOT NULL,
    color character varying(50) NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.products_color OWNER TO db_user;

--
-- Name: products_color_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_color_id_seq OWNER TO db_user;

--
-- Name: products_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_color_id_seq OWNED BY public.products_color.id;


--
-- Name: products_image; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_image (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    product_id bigint
);


ALTER TABLE public.products_image OWNER TO db_user;

--
-- Name: products_image_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_image_id_seq OWNER TO db_user;

--
-- Name: products_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_image_id_seq OWNED BY public.products_image.id;


--
-- Name: products_price; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_price (
    id bigint NOT NULL,
    price character varying(50) NOT NULL
);


ALTER TABLE public.products_price OWNER TO db_user;

--
-- Name: products_price_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_price_id_seq OWNER TO db_user;

--
-- Name: products_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_price_id_seq OWNED BY public.products_price.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    slug character varying(300),
    price numeric(7,2) NOT NULL,
    quantity integer,
    discount_price numeric(7,2),
    winter boolean NOT NULL,
    spring boolean NOT NULL,
    autumn boolean NOT NULL,
    summer boolean NOT NULL,
    cover_image character varying(100) NOT NULL,
    description text NOT NULL,
    stock boolean NOT NULL,
    digital boolean,
    video text NOT NULL,
    sale integer,
    sale_time date,
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.products_product OWNER TO db_user;

--
-- Name: products_product_colors; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_product_colors (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    color_id bigint NOT NULL
);


ALTER TABLE public.products_product_colors OWNER TO db_user;

--
-- Name: products_product_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_product_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_colors_id_seq OWNER TO db_user;

--
-- Name: products_product_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_product_colors_id_seq OWNED BY public.products_product_colors.id;


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO db_user;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: products_product_prices_range; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_product_prices_range (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    price_id bigint NOT NULL
);


ALTER TABLE public.products_product_prices_range OWNER TO db_user;

--
-- Name: products_product_prices_range_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_product_prices_range_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_prices_range_id_seq OWNER TO db_user;

--
-- Name: products_product_prices_range_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_product_prices_range_id_seq OWNED BY public.products_product_prices_range.id;


--
-- Name: products_product_sizes; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_product_sizes (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    size_id bigint NOT NULL
);


ALTER TABLE public.products_product_sizes OWNER TO db_user;

--
-- Name: products_product_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_product_sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_sizes_id_seq OWNER TO db_user;

--
-- Name: products_product_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_product_sizes_id_seq OWNED BY public.products_product_sizes.id;


--
-- Name: products_product_sortsby; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_product_sortsby (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    sortby_id bigint NOT NULL
);


ALTER TABLE public.products_product_sortsby OWNER TO db_user;

--
-- Name: products_product_sortsby_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_product_sortsby_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_sortsby_id_seq OWNER TO db_user;

--
-- Name: products_product_sortsby_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_product_sortsby_id_seq OWNED BY public.products_product_sortsby.id;


--
-- Name: products_review; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_review (
    id bigint NOT NULL,
    rate integer,
    name character varying(50) NOT NULL,
    email character varying(80) NOT NULL,
    message text NOT NULL,
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    comment_id bigint,
    product_id bigint
);


ALTER TABLE public.products_review OWNER TO db_user;

--
-- Name: products_review_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_review_id_seq OWNER TO db_user;

--
-- Name: products_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_review_id_seq OWNED BY public.products_review.id;


--
-- Name: products_size; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_size (
    id bigint NOT NULL,
    size text NOT NULL
);


ALTER TABLE public.products_size OWNER TO db_user;

--
-- Name: products_size_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_size_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_size_id_seq OWNER TO db_user;

--
-- Name: products_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_size_id_seq OWNED BY public.products_size.id;


--
-- Name: products_sortby; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.products_sortby (
    id bigint NOT NULL,
    sortby character varying(70) NOT NULL
);


ALTER TABLE public.products_sortby OWNER TO db_user;

--
-- Name: products_sortby_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.products_sortby_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_sortby_id_seq OWNER TO db_user;

--
-- Name: products_sortby_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.products_sortby_id_seq OWNED BY public.products_sortby.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.social_auth_association (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO db_user;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO db_user;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.social_auth_code (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO db_user;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO db_user;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.social_auth_nonce (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO db_user;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO db_user;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.social_auth_partial (
    id bigint NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO db_user;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO db_user;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.social_auth_usersocialauth (
    id bigint NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO db_user;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: db_user
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO db_user;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db_user
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO db_user;

--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: blog_blog id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog ALTER COLUMN id SET DEFAULT nextval('public.blog_blog_id_seq'::regclass);


--
-- Name: blog_blog_category id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_category ALTER COLUMN id SET DEFAULT nextval('public.blog_blog_category_id_seq'::regclass);


--
-- Name: blog_blog_tags id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_tags ALTER COLUMN id SET DEFAULT nextval('public.blog_blog_tags_id_seq'::regclass);


--
-- Name: blog_category id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_category ALTER COLUMN id SET DEFAULT nextval('public.blog_category_id_seq'::regclass);


--
-- Name: blog_comment id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_comment ALTER COLUMN id SET DEFAULT nextval('public.blog_comment_id_seq'::regclass);


--
-- Name: blog_tag id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_tag ALTER COLUMN id SET DEFAULT nextval('public.blog_tag_id_seq'::regclass);


--
-- Name: core_contact id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.core_contact ALTER COLUMN id SET DEFAULT nextval('public.core_contact_id_seq'::regclass);


--
-- Name: core_subscriber id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.core_subscriber ALTER COLUMN id SET DEFAULT nextval('public.core_subscriber_id_seq'::regclass);


--
-- Name: core_team id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.core_team ALTER COLUMN id SET DEFAULT nextval('public.core_team_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: jet_bookmark id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);


--
-- Name: jet_pinnedapplication id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);


--
-- Name: order_order id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order_orderitem id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_orderitem ALTER COLUMN id SET DEFAULT nextval('public.order_orderitem_id_seq'::regclass);


--
-- Name: order_shippingaddress id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_shippingaddress ALTER COLUMN id SET DEFAULT nextval('public.order_shippingaddress_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_category_products id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category_products ALTER COLUMN id SET DEFAULT nextval('public.products_category_products_id_seq'::regclass);


--
-- Name: products_city id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_city ALTER COLUMN id SET DEFAULT nextval('public.products_city_id_seq'::regclass);


--
-- Name: products_color id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_color ALTER COLUMN id SET DEFAULT nextval('public.products_color_id_seq'::regclass);


--
-- Name: products_image id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_image ALTER COLUMN id SET DEFAULT nextval('public.products_image_id_seq'::regclass);


--
-- Name: products_price id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_price ALTER COLUMN id SET DEFAULT nextval('public.products_price_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_product_colors id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_colors ALTER COLUMN id SET DEFAULT nextval('public.products_product_colors_id_seq'::regclass);


--
-- Name: products_product_prices_range id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_prices_range ALTER COLUMN id SET DEFAULT nextval('public.products_product_prices_range_id_seq'::regclass);


--
-- Name: products_product_sizes id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sizes ALTER COLUMN id SET DEFAULT nextval('public.products_product_sizes_id_seq'::regclass);


--
-- Name: products_product_sortsby id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sortsby ALTER COLUMN id SET DEFAULT nextval('public.products_product_sortsby_id_seq'::regclass);


--
-- Name: products_review id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_review ALTER COLUMN id SET DEFAULT nextval('public.products_review_id_seq'::regclass);


--
-- Name: products_size id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_size ALTER COLUMN id SET DEFAULT nextval('public.products_size_id_seq'::regclass);


--
-- Name: products_sortby id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_sortby ALTER COLUMN id SET DEFAULT nextval('public.products_sortby_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, image, bio, gender, number) FROM stdin;
9	pbkdf2_sha256$260000$12HBLxBOMK9HNQi8dpTN5r$M7n67h3bT+6fUv1GsRgXdpCI0LlRJyAn+2imMWaViY4=	2021-08-08 11:41:07.355002+00	f	Kamal	Kamal	Abdullayev	f	t	2021-08-07 13:35:24.579895+00	kamalabdu2layev@gmail.com	https://lh3.googleusercontent.com/a-/AOh14GiKpwiSPWrGgV7xHXUu2aVe93ceSxA7zW8yHfWa=s96-c	\N	f	\N
1	pbkdf2_sha256$260000$mRB24d95MPF6Dbb6C8CwDN$is7HB1ihVNnWWL8h8tvLiXOWpt/XnxIlJ0deG48wylo=	2021-08-08 11:45:42.559383+00	t	admin			t	t	2021-08-06 22:35:19.711496+00	admin@gmil.com		\N	f	\N
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add bookmark	1	add_bookmark
2	Can change bookmark	1	change_bookmark
3	Can delete bookmark	1	delete_bookmark
4	Can view bookmark	1	view_bookmark
5	Can add pinned application	2	add_pinnedapplication
6	Can change pinned application	2	change_pinnedapplication
7	Can delete pinned application	2	delete_pinnedapplication
8	Can view pinned application	2	view_pinnedapplication
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add Token	8	add_token
30	Can change Token	8	change_token
31	Can delete Token	8	delete_token
32	Can view Token	8	view_token
33	Can add token	9	add_tokenproxy
34	Can change token	9	change_tokenproxy
35	Can delete token	9	delete_tokenproxy
36	Can view token	9	view_tokenproxy
37	Can add association	10	add_association
38	Can change association	10	change_association
39	Can delete association	10	delete_association
40	Can view association	10	view_association
41	Can add code	11	add_code
42	Can change code	11	change_code
43	Can delete code	11	delete_code
44	Can view code	11	view_code
45	Can add nonce	12	add_nonce
46	Can change nonce	12	change_nonce
47	Can delete nonce	12	delete_nonce
48	Can view nonce	12	view_nonce
49	Can add user social auth	13	add_usersocialauth
50	Can change user social auth	13	change_usersocialauth
51	Can delete user social auth	13	delete_usersocialauth
52	Can view user social auth	13	view_usersocialauth
53	Can add partial	14	add_partial
54	Can change partial	14	change_partial
55	Can delete partial	14	delete_partial
56	Can view partial	14	view_partial
57	Can add crontab	15	add_crontabschedule
58	Can change crontab	15	change_crontabschedule
59	Can delete crontab	15	delete_crontabschedule
60	Can view crontab	15	view_crontabschedule
61	Can add interval	16	add_intervalschedule
62	Can change interval	16	change_intervalschedule
63	Can delete interval	16	delete_intervalschedule
64	Can view interval	16	view_intervalschedule
65	Can add periodic task	17	add_periodictask
66	Can change periodic task	17	change_periodictask
67	Can delete periodic task	17	delete_periodictask
68	Can view periodic task	17	view_periodictask
69	Can add periodic tasks	18	add_periodictasks
70	Can change periodic tasks	18	change_periodictasks
71	Can delete periodic tasks	18	delete_periodictasks
72	Can view periodic tasks	18	view_periodictasks
73	Can add solar event	19	add_solarschedule
74	Can change solar event	19	change_solarschedule
75	Can delete solar event	19	delete_solarschedule
76	Can view solar event	19	view_solarschedule
77	Can add clocked	20	add_clockedschedule
78	Can change clocked	20	change_clockedschedule
79	Can delete clocked	20	delete_clockedschedule
80	Can view clocked	20	view_clockedschedule
81	Can add kv store	21	add_kvstore
82	Can change kv store	21	change_kvstore
83	Can delete kv store	21	delete_kvstore
84	Can view kv store	21	view_kvstore
85	Can add contact	22	add_contact
86	Can change contact	22	change_contact
87	Can delete contact	22	delete_contact
88	Can view contact	22	view_contact
89	Can add subscriber	23	add_subscriber
90	Can change subscriber	23	change_subscriber
91	Can delete subscriber	23	delete_subscriber
92	Can view subscriber	23	view_subscriber
93	Can add team	24	add_team
94	Can change team	24	change_team
95	Can delete team	24	delete_team
96	Can view team	24	view_team
97	Can add blog	25	add_blog
98	Can change blog	25	change_blog
99	Can delete blog	25	delete_blog
100	Can view blog	25	view_blog
101	Can add Category	26	add_category
102	Can change Category	26	change_category
103	Can delete Category	26	delete_category
104	Can view Category	26	view_category
105	Can add tag	27	add_tag
106	Can change tag	27	change_tag
107	Can delete tag	27	delete_tag
108	Can view tag	27	view_tag
109	Can add comment	28	add_comment
110	Can change comment	28	change_comment
111	Can delete comment	28	delete_comment
112	Can view comment	28	view_comment
113	Can add user	29	add_user
114	Can change user	29	change_user
115	Can delete user	29	delete_user
116	Can view user	29	view_user
117	Can add order	30	add_order
118	Can change order	30	change_order
119	Can delete order	30	delete_order
120	Can view order	30	view_order
121	Can add shipping address	31	add_shippingaddress
122	Can change shipping address	31	change_shippingaddress
123	Can delete shipping address	31	delete_shippingaddress
124	Can view shipping address	31	view_shippingaddress
125	Can add order item	32	add_orderitem
126	Can change order item	32	change_orderitem
127	Can delete order item	32	delete_orderitem
128	Can view order item	32	view_orderitem
129	Can add city	33	add_city
130	Can change city	33	change_city
131	Can delete city	33	delete_city
132	Can view city	33	view_city
133	Can add color	34	add_color
134	Can change color	34	change_color
135	Can delete color	34	delete_color
136	Can view color	34	view_color
137	Can add price	35	add_price
138	Can change price	35	change_price
139	Can delete price	35	delete_price
140	Can view price	35	view_price
141	Can add product	36	add_product
142	Can change product	36	change_product
143	Can delete product	36	delete_product
144	Can view product	36	view_product
145	Can add size	37	add_size
146	Can change size	37	change_size
147	Can delete size	37	delete_size
148	Can view size	37	view_size
149	Can add SortBy	38	add_sortby
150	Can change SortBy	38	change_sortby
151	Can delete SortBy	38	delete_sortby
152	Can view SortBy	38	view_sortby
153	Can add review	39	add_review
154	Can change review	39	change_review
155	Can delete review	39	delete_review
156	Can view review	39	view_review
157	Can add image	40	add_image
158	Can change image	40	change_image
159	Can delete image	40	delete_image
160	Can view image	40	view_image
161	Can add Category	41	add_category
162	Can change Category	41	change_category
163	Can delete Category	41	delete_category
164	Can view Category	41	view_category
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: blog_blog; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.blog_blog (id, title, slug, cover_image, description, is_published, created_at, update_at, author_id) FROM stdin;
3	Test Article 3	test-article-3-3	media/category_images/6_2mgmJPD.png	imply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing softwa	t	2021-08-07 12:24:09+00	2021-08-07 16:50:50.954401+00	1
5	dsandkjas	dsandkjas-5	media/category_images/5.jpg	adsadsadasbdkjsabjdbsajdba	t	2021-08-07 14:16:57+00	2021-08-07 16:59:17.89309+00	1
6	asda	asda-6	media/category_images/15_3qMkERX.png	dasdsa	t	2021-08-07 17:08:36+00	2021-08-07 17:17:36.584396+00	\N
\.


--
-- Data for Name: blog_blog_category; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.blog_blog_category (id, blog_id, category_id) FROM stdin;
5	3	2
10	5	2
11	6	2
12	6	4
\.


--
-- Data for Name: blog_blog_tags; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.blog_blog_tags (id, blog_id, tag_id) FROM stdin;
6	3	1
7	3	2
8	3	3
9	3	4
14	5	1
18	6	3
\.


--
-- Data for Name: blog_category; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.blog_category (id, category) FROM stdin;
2	BUSINESS
4	TECH
\.


--
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.blog_comment (id, name, email, message, active, created_at, updated_at, blog_id, parent_id) FROM stdin;
9	dadsa	dada@fsdf.fsdfs	fsfds	t	2021-08-07 17:36:42.596647+00	2021-08-07 17:36:42.603331+00	3	\N
10	dadas	dada@daasc.jhgfd	dfbfdsfdbfd	t	2021-08-07 17:36:56.369579+00	2021-08-07 17:36:56.389359+00	3	9
11	Kamal	kamal@gmail.com	Bravo!!!	t	2021-08-08 11:15:24.862502+00	2021-08-08 11:15:24.871539+00	3	\N
12	Kamal	kamal@gmail.com	Awesome!	t	2021-08-08 11:16:02.576943+00	2021-08-08 11:16:02.591473+00	3	9
\.


--
-- Data for Name: blog_tag; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.blog_tag (id, tag) FROM stdin;
1	1 Tag
2	2 Tag
3	3 Tag
4	4 Tag
\.


--
-- Data for Name: core_contact; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.core_contact (id, name, email, subject, message, created_at) FROM stdin;
1	Kamal Abdullayev	abdullayevk890@gmail.com	dan	dkasdnkjas	2021-08-06 22:36:43.40309+00
2	Kamal Abdullayev	abdullayevk890@gmail.com	dan	dkasdnkjas	2021-08-06 22:37:27.146733+00
3	Kamal Abdullayev	abdullayevk890@gmail.com	dan	dkasdnkjas	2021-08-06 22:37:31.307681+00
4	Kamal Abdullayev	abdullayevk890@gmail.com	dan	dkasdnkjas	2021-08-06 22:38:29.165592+00
5	Kamal Abdullayev	abdullayevk890@gmail.com	asdad	adnjksdjan	2021-08-07 11:56:36.613854+00
6	kamal	kamal@gmail.com	Help me	Hi	2021-08-08 11:45:21.018422+00
\.


--
-- Data for Name: core_subscriber; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.core_subscriber (id, email, is_active, created_at, updated_at) FROM stdin;
1	kamalabdu2layev@gmail.com	t	2021-08-08 11:31:55.861592+00	2021-08-08 11:31:55.86161+00
\.


--
-- Data for Name: core_team; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.core_team (id, image, full_name) FROM stdin;
1	product_image/team_1_orPM0Zx.jpg	Jenny Walter
3	product_image/team_3_IjVUTzi.jpg	Alexandra Watson
2	product_image/team_2_aFHX6bu.jpg	Jack Nicos
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-08-06 22:35:36.592967+00	1	Baku	1	[{"added": {}}]	33	1
2	2021-08-06 22:35:45.183308+00	1	Red	1	[{"added": {}}]	34	1
3	2021-08-06 22:36:10.695281+00	1	T-shirt	1	[{"added": {}}]	36	1
4	2021-08-06 22:36:24.737141+00	1	Men Fashion	1	[{"added": {}}]	41	1
5	2021-08-06 23:41:24.281899+00	1	Kamal Abdullayev	2	[{"changed": {"fields": ["Product"]}}]	39	1
6	2021-08-07 00:05:27.2794+00	1	Kamal Abdullayev	3		39	1
7	2021-08-07 00:05:27.284834+00	2	Kamal Abdullayev	3		39	1
8	2021-08-07 00:05:27.287924+00	3	Kamal Abdullayev	3		39	1
9	2021-08-07 00:05:27.291161+00	4	Kamal Abdullayev	3		39	1
10	2021-08-07 00:05:27.294509+00	5	Kamal Abdullayev	3		39	1
11	2021-08-07 00:05:27.297268+00	6	Kamal Abdullayev	3		39	1
12	2021-08-07 00:05:27.299826+00	7	Kamal Abdullayev	3		39	1
13	2021-08-07 00:05:27.302093+00	8	Kamal Abdullayev	3		39	1
14	2021-08-07 00:05:27.304502+00	9	Kamal Abdullayev	3		39	1
15	2021-08-07 00:06:10.06737+00	10	Kamal Abdullayev	2	[{"changed": {"fields": ["Product"]}}]	39	1
16	2021-08-07 00:08:04.569112+00	1	T-shirt	2	[{"changed": {"fields": ["Sale"]}}]	36	1
17	2021-08-07 00:08:50.976465+00	1	T-shirt	2	[{"changed": {"fields": ["Discount price", "Sale"]}}]	36	1
18	2021-08-07 12:00:59.557158+00	2	Jeans	1	[{"added": {}}]	36	1
19	2021-08-07 12:01:20.738217+00	3	T-shirt 2	1	[{"added": {}}]	36	1
20	2021-08-07 12:18:18.191146+00	2	T-shirt 2 sum	2	[{"changed": {"fields": ["Title", "Winter", "Summer"]}}]	36	1
21	2021-08-07 12:18:51.438568+00	4	T-shirt 4 win	1	[{"added": {}}]	36	1
22	2021-08-07 12:19:28.352933+00	5	T-shirt 6 spr	1	[{"added": {}}]	36	1
23	2021-08-07 12:19:38.465051+00	1	T-shirt	2	[{"changed": {"fields": ["Winter", "Spring", "Autumn", "Summer"]}}]	36	1
24	2021-08-07 12:19:53.906711+00	1	1 Tag	1	[{"added": {}}]	27	1
25	2021-08-07 12:19:59.167938+00	2	2 Tag	1	[{"added": {}}]	27	1
26	2021-08-07 12:20:01.577619+00	3	3 Tag	1	[{"added": {}}]	27	1
27	2021-08-07 12:20:04.475812+00	4	4 Tag	1	[{"added": {}}]	27	1
28	2021-08-07 12:20:17.14401+00	1	All	1	[{"added": {}}]	26	1
29	2021-08-07 12:20:23.789329+00	2	Tech	1	[{"added": {}}]	26	1
30	2021-08-07 12:23:53.475056+00	1	T-shirt	1	[{"added": {}}]	25	1
31	2021-08-07 12:24:09.320952+00	2	Test Article 2	1	[{"added": {}}]	25	1
32	2021-08-07 12:24:23.666866+00	3	Test Article 3	1	[{"added": {}}]	25	1
33	2021-08-07 12:24:38.435576+00	4	Test Article	1	[{"added": {}}]	25	1
34	2021-08-07 12:25:24.682203+00	2	Baku	1	[{"added": {}}]	33	1
35	2021-08-07 12:26:13.133613+00	1	Jenny Walter	1	[{"added": {}}]	24	1
36	2021-08-07 12:26:20.677934+00	2	Alexandra Runi	1	[{"added": {}}]	24	1
37	2021-08-07 12:26:45.076739+00	3	Alexandra Watson	1	[{"added": {}}]	24	1
38	2021-08-07 12:27:00.965626+00	2	Jack Nicos	2	[{"changed": {"fields": ["Image", "Full name"]}}]	24	1
39	2021-08-07 12:27:22.099957+00	2	Men Fashion > Sale	1	[{"added": {}}]	41	1
40	2021-08-07 12:27:30.95055+00	3	Men Fashion > Sale > t-shirt	1	[{"added": {}}]	41	1
41	2021-08-07 12:27:46.511546+00	1	Men Fashion	2	[{"changed": {"fields": ["Image"]}}]	41	1
42	2021-08-07 12:28:21.53931+00	1	Men Fashion	2	[{"changed": {"fields": ["Image"]}}]	41	1
43	2021-08-07 12:34:16.186468+00	1	NEW COLLECTION	1	[{"added": {}}]	38	1
44	2021-08-07 12:34:21.445196+00	2	SPECIAL FOR TMART	1	[{"added": {}}]	38	1
45	2021-08-07 12:34:38.675048+00	1	T-shirt	2	[{"changed": {"fields": ["Sortsby"]}}]	36	1
46	2021-08-07 12:34:44.341149+00	3	T-shirt 2	2	[{"changed": {"fields": ["Sortsby"]}}]	36	1
47	2021-08-07 12:34:52.127771+00	2	T-shirt 2 sum	2	[{"changed": {"fields": ["Sortsby"]}}]	36	1
48	2021-08-07 12:34:57.8343+00	4	T-shirt 4 win	2	[{"changed": {"fields": ["Sortsby"]}}]	36	1
49	2021-08-07 12:35:04.991309+00	5	T-shirt 6 spr	2	[{"changed": {"fields": ["Sortsby"]}}]	36	1
50	2021-08-07 12:54:49.919298+00	3	Antarctica	1	[{"added": {}}]	33	1
51	2021-08-07 13:16:17.21051+00	3	Antarctica	3		33	1
52	2021-08-07 13:16:17.217114+00	2	Baku	3		33	1
53	2021-08-07 13:26:49.37224+00	3	kamal	3		29	1
54	2021-08-07 13:26:49.375842+00	2	kamalabdu2layev	3		29	1
55	2021-08-07 13:29:24.490024+00	4	kamal	3		29	1
56	2021-08-07 13:30:17.662323+00	5	kamal	3		29	1
57	2021-08-07 13:33:36.077458+00	6	Kamal	3		29	1
58	2021-08-07 13:33:36.0815+00	7	SUbhanRzayev	3		29	1
59	2021-08-07 13:34:49.462153+00	8	Kamal	3		29	1
60	2021-08-07 14:16:29.192331+00	3	Test Article 3	2	[{"changed": {"fields": ["Is published"]}}]	25	1
61	2021-08-07 14:17:11.830714+00	5	dsandkjas	1	[{"added": {}}]	25	1
62	2021-08-07 14:35:06.254197+00	3	Test Article 3	2	[{"changed": {"fields": ["Is published"]}}]	25	1
63	2021-08-07 14:40:17.550653+00	1	T-shirt	2	[{"changed": {"fields": ["Is published"]}}]	36	1
64	2021-08-07 14:40:45.532468+00	1	T-shirt	2	[{"changed": {"fields": ["Is published"]}}]	36	1
65	2021-08-07 14:47:42.53693+00	1	T-shirt	2	[{"changed": {"fields": ["Is published"]}}]	36	1
66	2021-08-07 14:48:37.363543+00	3	T-shirt 2	2	[{"changed": {"fields": ["Is published"]}}]	36	1
67	2021-08-07 14:48:41.38765+00	2	T-shirt 2 sum	2	[{"changed": {"fields": ["Is published"]}}]	36	1
68	2021-08-07 15:02:04.819535+00	4	Women Fashion	1	[{"added": {}}]	41	1
69	2021-08-07 16:16:39.973054+00	5	dsandkjas	2	[{"changed": {"fields": ["Is published"]}}]	25	1
70	2021-08-07 16:21:49.693852+00	3	dasd	3		28	1
71	2021-08-07 16:50:19.142882+00	5	dsandkjas	2	[{"changed": {"fields": ["Category"]}}]	25	1
72	2021-08-07 16:50:34.363955+00	3	Test Article 3	2	[]	25	1
73	2021-08-07 16:50:38.425093+00	5	dsandkjas	2	[]	25	1
74	2021-08-07 16:50:50.957716+00	3	Test Article 3	2	[{"changed": {"fields": ["Is published"]}}]	25	1
75	2021-08-07 16:54:03.772003+00	1	All	3		26	1
76	2021-08-07 16:59:01.282741+00	5	dsandkjas	2	[{"changed": {"fields": ["Category", "Tags"]}}]	25	1
77	2021-08-07 16:59:17.896557+00	5	dsandkjas	2	[]	25	1
78	2021-08-07 17:08:52.934047+00	6	asda	1	[{"added": {}}]	25	1
79	2021-08-07 17:10:45.789293+00	3	All	1	[{"added": {}}]	26	1
80	2021-08-07 17:12:43.285136+00	3	All	3		26	1
81	2021-08-07 17:16:50.863471+00	2	BUSINESS	2	[{"changed": {"fields": ["Category"]}}]	26	1
82	2021-08-07 17:17:16.039659+00	4	TECH	1	[{"added": {}}]	26	1
83	2021-08-07 17:17:36.589591+00	6	asda	2	[{"changed": {"fields": ["Category"]}}]	25	1
84	2021-08-07 17:28:15.426446+00	6	dasd	3		28	1
85	2021-08-07 17:28:15.430256+00	5	adsa	3		28	1
86	2021-08-07 17:28:15.432171+00	4	adsad	3		28	1
87	2021-08-07 17:32:25.653215+00	7	dasd	3		28	1
88	2021-08-07 17:33:09.480538+00	8	dad	3		28	1
89	2021-08-07 21:02:45.636707+00	2	red	1	[{"added": {}}]	34	1
90	2021-08-07 21:02:49.354209+00	3	blue	1	[{"added": {}}]	34	1
91	2021-08-07 21:02:51.886958+00	4	orange	1	[{"added": {}}]	34	1
92	2021-08-07 21:03:02.15378+00	1	Red	3		34	1
93	2021-08-07 21:03:10.166051+00	5	yellow	1	[{"added": {}}]	34	1
94	2021-08-07 21:03:14.075126+00	6	brown	1	[{"added": {}}]	34	1
95	2021-08-07 21:03:34.734136+00	1	0.00$ - 50.00$	1	[{"added": {}}]	35	1
96	2021-08-07 21:03:44.079993+00	2	50.00$ - 100.00$	1	[{"added": {}}]	35	1
97	2021-08-07 21:03:50.501943+00	3	100.00$ - 200.00$	1	[{"added": {}}]	35	1
98	2021-08-07 21:04:00.52688+00	4	200.00$ - 500.00$	1	[{"added": {}}]	35	1
99	2021-08-07 21:04:10.110484+00	5	500.00$ - 1000.00$	1	[{"added": {}}]	35	1
100	2021-08-07 21:04:21.81397+00	1	S	1	[{"added": {}}]	37	1
101	2021-08-07 21:04:21.883792+00	2	S	1	[{"added": {}}]	37	1
102	2021-08-07 21:04:23.925884+00	3	M	1	[{"added": {}}]	37	1
103	2021-08-07 21:04:25.755946+00	4	L	1	[{"added": {}}]	37	1
104	2021-08-07 21:04:28.979464+00	5	XL	1	[{"added": {}}]	37	1
105	2021-08-07 21:04:30.943949+00	6	XXL	1	[{"added": {}}]	37	1
106	2021-08-07 21:04:37.165851+00	7	XXXL	1	[{"added": {}}]	37	1
107	2021-08-07 21:04:45.098721+00	8	39	1	[{"added": {}}]	37	1
108	2021-08-07 21:04:48.789539+00	9	40	1	[{"added": {}}]	37	1
109	2021-08-07 21:04:51.651474+00	10	41	1	[{"added": {}}]	37	1
110	2021-08-07 21:04:53.522946+00	11	42	1	[{"added": {}}]	37	1
111	2021-08-07 21:04:55.788012+00	12	43	1	[{"added": {}}]	37	1
112	2021-08-07 21:04:56.893783+00	13	44	1	[{"added": {}}]	37	1
113	2021-08-07 21:04:59.490656+00	14	45	1	[{"added": {}}]	37	1
114	2021-08-07 21:05:19.647587+00	3	NEW COLLECTION	1	[{"added": {}}]	38	1
115	2021-08-07 21:05:19.724286+00	4	NEW COLLECTION	1	[{"added": {}}]	38	1
116	2021-08-07 21:05:37.737059+00	4	NEW COLLECTION	3		38	1
117	2021-08-07 21:05:37.740338+00	3	NEW COLLECTION	3		38	1
118	2021-08-07 21:06:40.411668+00	6	Air Jordan 1 Mid	1	[{"added": {}}]	36	1
119	2021-08-07 21:06:59.461806+00	6	Air Jordan 1 Mid	2	[{"changed": {"fields": ["Sizes"]}}]	36	1
120	2021-08-07 21:07:23.196325+00	1	Image object (1)	1	[{"added": {}}]	40	1
121	2021-08-07 21:07:30.668266+00	2	Image object (2)	1	[{"added": {}}]	40	1
122	2021-08-07 21:07:40.308057+00	3	Image object (3)	1	[{"added": {}}]	40	1
123	2021-08-07 21:08:03.739118+00	4	Image object (4)	1	[{"added": {}}]	40	1
124	2021-08-07 21:09:10.725604+00	6	Air Jordan 1 Mid	2	[{"changed": {"fields": ["Is published"]}}]	36	1
151	2021-08-07 21:17:02.934278+00	4	Image object (4)	2	[{"changed": {"fields": ["Image"]}}]	40	1
152	2021-08-07 21:17:26.163293+00	1	Image object (1)	2	[]	40	1
153	2021-08-07 21:17:30.95816+00	4	Image object (4)	2	[{"changed": {"fields": ["Image"]}}]	40	1
154	2021-08-07 21:17:35.894068+00	1	Image object (1)	2	[{"changed": {"fields": ["Image"]}}]	40	1
155	2021-08-07 21:17:47.928979+00	4	Image object (4)	2	[{"changed": {"fields": ["Image"]}}]	40	1
156	2021-08-07 21:17:53.533247+00	1	Image object (1)	2	[{"changed": {"fields": ["Image"]}}]	40	1
157	2021-08-07 21:19:26.368905+00	1	T-shirt	3		36	1
158	2021-08-07 21:19:26.372125+00	3	T-shirt 2	3		36	1
159	2021-08-07 21:19:26.373878+00	2	T-shirt 2 sum	3		36	1
160	2021-08-07 21:19:26.375584+00	4	T-shirt 4 win	3		36	1
161	2021-08-07 21:19:26.377264+00	5	T-shirt 6 spr	3		36	1
162	2021-08-07 21:24:57.630523+00	39	Nike ACG Mountain Fly Low	1	[{"added": {}}]	36	1
163	2021-08-07 21:25:13.645695+00	34	Image object (34)	1	[{"added": {}}]	40	1
164	2021-08-07 21:25:25.696852+00	35	Image object (35)	1	[{"added": {}}]	40	1
165	2021-08-07 21:25:41.501948+00	36	Image object (36)	1	[{"added": {}}]	40	1
166	2021-08-07 21:26:20.578981+00	37	Image object (37)	1	[{"added": {}}]	40	1
167	2021-08-07 21:27:36.303788+00	39	Nike ACG Mountain Fly Low	2	[{"changed": {"fields": ["Is published"]}}]	36	1
168	2021-08-07 21:28:48.699187+00	39	Nike ACG Mountain Fly Low	2	[]	36	1
169	2021-08-07 21:31:31.467392+00	19	OrderItem object (19)	3		32	1
170	2021-08-07 21:31:31.471861+00	9	OrderItem object (9)	3		32	1
171	2021-08-07 21:31:31.474276+00	7	OrderItem object (7)	3		32	1
172	2021-08-07 21:39:11.071482+00	15	M 4 / W 5.5	1	[{"added": {}}]	37	1
173	2021-08-07 21:39:17.530051+00	16	M 5 / W 6.5	1	[{"added": {}}]	37	1
174	2021-08-07 21:39:23.804292+00	17	M 6 / W 7.5	1	[{"added": {}}]	37	1
175	2021-08-07 21:39:34.096792+00	18	M 7 / W 8.5	1	[{"added": {}}]	37	1
176	2021-08-07 21:39:39.102799+00	19	M 8 / W 9.5	1	[{"added": {}}]	37	1
177	2021-08-07 21:39:47.833819+00	20	M 9 / W 10.5	1	[{"added": {}}]	37	1
178	2021-08-07 21:39:53.601569+00	21	M 10 / W 11.5	1	[{"added": {}}]	37	1
179	2021-08-07 21:39:57.976186+00	22	M 11 / W 12.5	1	[{"added": {}}]	37	1
180	2021-08-07 21:40:02.502525+00	23	M 12 / W 13.5	1	[{"added": {}}]	37	1
181	2021-08-07 21:40:13.640706+00	24	M 13 / W 14.5	1	[{"added": {}}]	37	1
182	2021-08-07 21:40:20.837106+00	25	M 14 / W 15.5	1	[{"added": {}}]	37	1
183	2021-08-07 21:40:32.114747+00	1	XS	2	[{"changed": {"fields": ["Size"]}}]	37	1
184	2021-08-07 21:40:49.293564+00	26	36	1	[{"added": {}}]	37	1
185	2021-08-07 21:40:53.641602+00	27	37	1	[{"added": {}}]	37	1
186	2021-08-07 21:40:56.75158+00	28	38	1	[{"added": {}}]	37	1
187	2021-08-07 21:41:31.531636+00	29	M 15 / W 16.5	1	[{"added": {}}]	37	1
188	2021-08-07 21:44:10.591507+00	7	black	1	[{"added": {}}]	34	1
189	2021-08-07 21:44:15.029864+00	8	white	1	[{"added": {}}]	34	1
190	2021-08-07 21:45:40.958577+00	40	Nike ACG Air Deschütz +	1	[{"added": {}}]	36	1
191	2021-08-07 21:46:59.473085+00	30	6	1	[{"added": {}}]	37	1
192	2021-08-07 21:47:02.513044+00	31	6.5	1	[{"added": {}}]	37	1
193	2021-08-07 21:47:12.75425+00	32	7	1	[{"added": {}}]	37	1
194	2021-08-07 21:47:17.987747+00	33	7.5	1	[{"added": {}}]	37	1
195	2021-08-07 21:47:20.106395+00	34	8	1	[{"added": {}}]	37	1
196	2021-08-07 21:47:24.355683+00	35	8.5	1	[{"added": {}}]	37	1
197	2021-08-07 21:47:26.318093+00	36	9	1	[{"added": {}}]	37	1
198	2021-08-07 21:47:29.103043+00	37	9.5	1	[{"added": {}}]	37	1
199	2021-08-07 21:47:32.403871+00	38	10	1	[{"added": {}}]	37	1
200	2021-08-07 21:47:37.133805+00	39	10.5	1	[{"added": {}}]	37	1
201	2021-08-07 21:47:43.461813+00	40	11	1	[{"added": {}}]	37	1
202	2021-08-07 21:47:47.132412+00	41	11.5	1	[{"added": {}}]	37	1
203	2021-08-07 21:47:49.648352+00	42	12	1	[{"added": {}}]	37	1
204	2021-08-07 21:47:52.844128+00	43	12.5	1	[{"added": {}}]	37	1
205	2021-08-07 21:47:55.599323+00	44	13	1	[{"added": {}}]	37	1
206	2021-08-07 21:47:57.907371+00	45	14	1	[{"added": {}}]	37	1
207	2021-08-07 21:48:07.937504+00	46	15	1	[{"added": {}}]	37	1
208	2021-08-07 21:48:10.163121+00	47	16	1	[{"added": {}}]	37	1
209	2021-08-07 21:50:24.248472+00	41	Nike Air Force 1 Crater FlyKnit	1	[{"added": {}}]	36	1
210	2021-08-07 21:51:43.404628+00	40	Nike ACG Air Deschütz +	2	[{"changed": {"fields": ["Sizes"]}}]	36	1
211	2021-08-07 21:51:50.831412+00	39	Nike ACG Mountain Fly Low	2	[]	36	1
212	2021-08-07 21:52:05.73958+00	41	Nike Air Force 1 Crater FlyKnit	2	[{"changed": {"fields": ["Sizes"]}}]	36	1
213	2021-08-07 21:52:50.719604+00	40	Nike ACG Air Deschütz +	2	[{"changed": {"fields": ["Sizes"]}}]	36	1
214	2021-08-07 21:54:20.800664+00	5	Men Fashion > Shoes	1	[{"added": {}}]	41	1
215	2021-08-07 21:54:50.503344+00	6	Men Fashion > Shoes > Lifestyle	1	[{"added": {}}]	41	1
216	2021-08-07 21:55:14.818746+00	6	Men Fashion > Shoes > Lifestyle	2	[{"changed": {"fields": ["Products", "Is published"]}}]	41	1
217	2021-08-07 21:55:33.074636+00	1	Men Fashion	2	[{"changed": {"fields": ["Is published"]}}]	41	1
218	2021-08-07 21:56:04.109257+00	6	Men Fashion > Shoes > Lifestyle	2	[]	41	1
219	2021-08-07 21:56:07.950722+00	5	Men Fashion > Shoes	2	[{"changed": {"fields": ["Is published"]}}]	41	1
220	2021-08-07 21:56:11.375273+00	1	Men Fashion	2	[]	41	1
221	2021-08-07 21:57:17.024055+00	3	Men Fashion > Sale > t-shirt	3		41	1
222	2021-08-07 21:57:17.029252+00	2	Men Fashion > Sale	3		41	1
223	2021-08-07 21:59:34.821564+00	7	Women Fashion > Shoes	1	[{"added": {}}]	41	1
224	2021-08-07 21:59:49.055971+00	8	Men Fashion > Shoes > Lifestyle	1	[{"added": {}}]	41	1
225	2021-08-07 21:59:55.655616+00	4	Women Fashion	2	[{"changed": {"fields": ["Is published"]}}]	41	1
226	2021-08-07 21:59:59.712118+00	7	Women Fashion > Shoes	2	[{"changed": {"fields": ["Is published"]}}]	41	1
227	2021-08-07 22:00:02.231928+00	8	Men Fashion > Shoes > Lifestyle	2	[]	41	1
228	2021-08-07 22:00:53.034678+00	8	Women Fashion > Shoes > Lifestyle	2	[{"changed": {"fields": ["Category"]}}]	41	1
229	2021-08-07 22:11:10.546473+00	42	Nike AF 1/1	1	[{"added": {}}]	36	1
230	2021-08-07 22:12:51.153549+00	43	Nike Air Force 1 Crater FlyKnit	1	[{"added": {}}]	36	1
231	2021-08-07 22:13:31.736514+00	43	Nike Air Force 1 Crater FlyKnit	3		36	1
232	2021-08-07 22:15:52.546689+00	9	pink	1	[{"added": {}}]	34	1
233	2021-08-07 22:15:56.908211+00	8	white	2	[{"changed": {"fields": ["Is published"]}}]	34	1
234	2021-08-07 22:15:59.02791+00	7	black	2	[{"changed": {"fields": ["Is published"]}}]	34	1
235	2021-08-07 22:16:01.372379+00	6	brown	2	[{"changed": {"fields": ["Is published"]}}]	34	1
236	2021-08-07 22:16:03.885302+00	5	yellow	2	[{"changed": {"fields": ["Is published"]}}]	34	1
237	2021-08-07 22:16:07.129143+00	4	orange	2	[{"changed": {"fields": ["Is published"]}}]	34	1
238	2021-08-07 22:16:09.897115+00	3	blue	2	[{"changed": {"fields": ["Is published"]}}]	34	1
239	2021-08-07 22:16:13.470874+00	2	red	2	[{"changed": {"fields": ["Is published"]}}]	34	1
240	2021-08-07 22:19:49.761477+00	44	Nike Air VaporMax 2021 FK	1	[{"added": {}}]	36	1
241	2021-08-07 22:21:22.432148+00	45	Nike Air VaporMax Plus	1	[{"added": {}}]	36	1
242	2021-08-07 22:22:23.172836+00	44	Nike Air VaporMax 2021 FK	2	[{"changed": {"fields": ["Is published"]}}]	36	1
243	2021-08-07 22:25:25.877785+00	38	Image object (38)	1	[{"added": {}}]	40	1
244	2021-08-07 22:25:34.595966+00	39	Image object (39)	1	[{"added": {}}]	40	1
245	2021-08-07 22:25:41.479346+00	40	Image object (40)	1	[{"added": {}}]	40	1
246	2021-08-07 22:25:49.046727+00	41	Image object (41)	1	[{"added": {}}]	40	1
247	2021-08-07 22:26:11.674361+00	42	Image object (42)	1	[{"added": {}}]	40	1
248	2021-08-07 22:26:19.32924+00	43	Image object (43)	1	[{"added": {}}]	40	1
249	2021-08-07 22:26:28.372308+00	44	Image object (44)	1	[{"added": {}}]	40	1
250	2021-08-07 22:26:35.358405+00	45	Image object (45)	1	[{"added": {}}]	40	1
251	2021-08-07 22:27:52.162845+00	37	Image object (37)	3		40	1
252	2021-08-07 22:27:52.16733+00	36	Image object (36)	3		40	1
253	2021-08-07 22:27:52.169604+00	35	Image object (35)	3		40	1
254	2021-08-07 22:27:52.171458+00	34	Image object (34)	3		40	1
255	2021-08-07 22:28:39.254652+00	46	Image object (46)	1	[{"added": {}}]	40	1
256	2021-08-07 22:28:44.992241+00	47	Image object (47)	1	[{"added": {}}]	40	1
257	2021-08-07 22:28:50.956581+00	48	Image object (48)	1	[{"added": {}}]	40	1
258	2021-08-07 22:28:55.344249+00	49	Image object (49)	1	[{"added": {}}]	40	1
259	2021-08-07 22:29:53.485976+00	50	Image object (50)	1	[{"added": {}}]	40	1
260	2021-08-07 22:30:00.210935+00	51	Image object (51)	1	[{"added": {}}]	40	1
261	2021-08-07 22:30:08.583203+00	52	Image object (52)	1	[{"added": {}}]	40	1
262	2021-08-07 22:30:15.423551+00	53	Image object (53)	1	[{"added": {}}]	40	1
263	2021-08-07 22:30:45.109446+00	54	Image object (54)	1	[{"added": {}}]	40	1
264	2021-08-07 22:30:56.629377+00	55	Image object (55)	1	[{"added": {}}]	40	1
265	2021-08-07 22:31:03.410605+00	56	Image object (56)	1	[{"added": {}}]	40	1
266	2021-08-07 22:31:09.649458+00	57	Image object (57)	1	[{"added": {}}]	40	1
267	2021-08-07 22:32:15.45784+00	55	Image object (55)	2	[{"changed": {"fields": ["Product"]}}]	40	1
268	2021-08-07 22:32:20.870743+00	56	Image object (56)	2	[{"changed": {"fields": ["Product"]}}]	40	1
269	2021-08-07 22:32:24.758754+00	57	Image object (57)	2	[{"changed": {"fields": ["Product"]}}]	40	1
270	2021-08-07 22:33:39.058799+00	58	Image object (58)	1	[{"added": {}}]	40	1
271	2021-08-07 22:33:53.453348+00	59	Image object (59)	1	[{"added": {}}]	40	1
272	2021-08-07 22:34:03.287345+00	60	Image object (60)	1	[{"added": {}}]	40	1
273	2021-08-07 22:34:10.658144+00	61	Image object (61)	1	[{"added": {}}]	40	1
274	2021-08-07 22:35:25.74951+00	8	Women Fashion > Shoes > Lifestyle	2	[{"changed": {"fields": ["Products"]}}]	41	1
275	2021-08-07 22:52:08.776844+00	6	Men Fashion > Shoes > Lifestyle	2	[{"changed": {"fields": ["Products"]}}]	41	1
276	2021-08-08 09:11:17.479683+00	46	Nike Sportswear Club	1	[{"added": {}}]	36	1
277	2021-08-08 09:11:29.352408+00	46	Nike Sportswear Club	2	[{"changed": {"fields": ["Is published"]}}]	36	1
278	2021-08-08 09:12:01.754948+00	10	grey	1	[{"added": {}}]	34	1
279	2021-08-08 09:13:54.185533+00	47	Nike Therma-FIT	1	[{"added": {}}]	36	1
280	2021-08-08 09:16:31.073485+00	48	Nike Air	1	[{"added": {}}]	36	1
281	2021-08-08 09:18:36.369753+00	49	Nike Hayward 2.0	1	[{"added": {}}]	36	1
282	2021-08-08 09:18:47.209519+00	48	ONE SIZE	1	[{"added": {}}]	37	1
283	2021-08-08 09:19:19.896657+00	49	Nike Hayward 2.0	2	[{"changed": {"fields": ["Sizes"]}}]	36	1
284	2021-08-08 09:21:15.147801+00	50	Jordan	1	[{"added": {}}]	36	1
285	2021-08-08 09:23:18.721078+00	51	Liverpool FC	1	[{"added": {}}]	36	1
286	2021-08-08 09:25:34.690022+00	9	Men Fashion > Clothing	1	[{"added": {}}]	41	1
287	2021-08-08 09:26:12.672355+00	10	Men Fashion > Clothing > Shorts	1	[{"added": {}}]	41	1
288	2021-08-08 09:26:34.291407+00	11	Men Fashion > Clothing > Hoodies	1	[{"added": {}}]	41	1
289	2021-08-08 09:26:46.51139+00	12	Jackets	1	[{"added": {}}]	41	1
290	2021-08-08 09:27:13.621278+00	13	Men Fashion > Accessories	1	[{"added": {}}]	41	1
291	2021-08-08 09:27:22.269025+00	14	Men Fashion > Accessories > Bags	1	[{"added": {}}]	41	1
292	2021-08-08 09:27:27.999435+00	14	Men Fashion > Accessories > Bags	2	[{"changed": {"fields": ["Is published"]}}]	41	1
293	2021-08-08 09:27:31.189096+00	13	Men Fashion > Accessories	2	[{"changed": {"fields": ["Is published"]}}]	41	1
294	2021-08-08 09:27:47.234699+00	12	Men Fashion > Clothing > Jackets	2	[{"changed": {"fields": ["Category"]}}]	41	1
295	2021-08-08 09:27:53.354133+00	12	Men Fashion > Clothing > Jackets	2	[{"changed": {"fields": ["Is published"]}}]	41	1
296	2021-08-08 09:27:56.712539+00	11	Men Fashion > Clothing > Hoodies	2	[{"changed": {"fields": ["Is published"]}}]	41	1
297	2021-08-08 09:28:01.208061+00	10	Men Fashion > Clothing > Shorts	2	[{"changed": {"fields": ["Is published"]}}]	41	1
298	2021-08-08 09:28:05.523427+00	9	Men Fashion > Clothing	2	[{"changed": {"fields": ["Is published"]}}]	41	1
299	2021-08-08 09:28:08.717689+00	8	Women Fashion > Shoes > Lifestyle	2	[]	41	1
300	2021-08-08 09:28:50.161658+00	14	Men Fashion > Accessories > Bags	2	[{"changed": {"fields": ["Products"]}}]	41	1
301	2021-08-08 09:30:13.866564+00	10	Men Fashion > Clothing > Shorts	2	[{"changed": {"fields": ["Products"]}}]	41	1
302	2021-08-08 09:30:38.596602+00	11	Men Fashion > Clothing > Hoodies	2	[{"changed": {"fields": ["Products"]}}]	41	1
303	2021-08-08 09:31:07.459704+00	12	Men Fashion > Clothing > Jackets	2	[{"changed": {"fields": ["Products"]}}]	41	1
304	2021-08-08 09:44:51.224516+00	6	Men Fashion > Clothing > Lifestyle	2	[{"changed": {"fields": ["Category"]}}]	41	1
305	2021-08-08 09:45:12.801352+00	14	Men Fashion > Clothing > Bags	2	[{"changed": {"fields": ["Category"]}}]	41	1
306	2021-08-08 09:45:21.46616+00	13	Men Fashion > Accessories	3		41	1
307	2021-08-08 09:45:42.776065+00	5	Men Fashion > Shoes	3		41	1
308	2021-08-08 09:46:17.880653+00	7	Women Fashion > Clothing	2	[{"changed": {"fields": ["Title [en]"]}}]	41	1
309	2021-08-08 10:11:11.287635+00	52	Nike Sportswear Essential	1	[{"added": {}}]	36	1
310	2021-08-08 10:13:06.324497+00	53	Nike Sportswear Essential	1	[{"added": {}}]	36	1
311	2021-08-08 10:14:55.393178+00	54	Nike Sportswear	1	[{"added": {}}]	36	1
312	2021-08-08 10:16:12.723619+00	55	Nike Sportswear	1	[{"added": {}}]	36	1
313	2021-08-08 10:17:33.638308+00	56	Nike Air	1	[{"added": {}}]	36	1
314	2021-08-08 10:19:00.857843+00	57	Nike Sportswear Swoosh	1	[{"added": {}}]	36	1
315	2021-08-08 10:19:57.763506+00	58	Nike Heritage	1	[{"added": {}}]	36	1
316	2021-08-08 10:21:00.533389+00	59	Nike Fuel Pack	1	[{"added": {}}]	36	1
317	2021-08-08 10:21:50.243323+00	15	Men Fashion > Clothing > Pants	1	[{"added": {}}]	41	1
318	2021-08-08 10:22:52.125856+00	16	Women Fashion > Clothing > T-Shirts	1	[{"added": {}}]	41	1
319	2021-08-08 10:23:39.228232+00	17	Women Fashion > Clothing > Shorts	1	[{"added": {}}]	41	1
320	2021-08-08 10:24:41.11354+00	18	Women Fashion > Clothing > Sweatshirts	1	[{"added": {}}]	41	1
321	2021-08-08 10:24:52.11644+00	11	Men Fashion > Clothing > Sweatshirts	2	[{"changed": {"fields": ["Title [en]"]}}]	41	1
322	2021-08-08 10:25:49.768227+00	19	Women Fashion > Clothing > Bags	1	[{"added": {}}]	41	1
323	2021-08-08 10:25:59.655317+00	50	Jordan	2	[{"changed": {"fields": ["Is published"]}}]	36	1
324	2021-08-08 10:26:14.550358+00	56	Nike Air	2	[{"changed": {"fields": ["Is published"]}}]	36	1
325	2021-08-08 10:26:20.547424+00	59	Nike Fuel Pack	2	[{"changed": {"fields": ["Is published"]}}]	36	1
326	2021-08-08 10:26:26.051037+00	58	Nike Heritage	2	[{"changed": {"fields": ["Is published"]}}]	36	1
327	2021-08-08 10:26:31.575557+00	55	Nike Sportswear	2	[{"changed": {"fields": ["Is published"]}}]	36	1
328	2021-08-08 10:26:36.693032+00	54	Nike Sportswear	2	[{"changed": {"fields": ["Is published"]}}]	36	1
329	2021-08-08 10:26:41.052103+00	53	Nike Sportswear Essential	2	[{"changed": {"fields": ["Is published"]}}]	36	1
330	2021-08-08 10:26:45.379038+00	52	Nike Sportswear Essential	2	[{"changed": {"fields": ["Is published"]}}]	36	1
331	2021-08-08 10:26:49.290738+00	57	Nike Sportswear Swoosh	2	[{"changed": {"fields": ["Is published"]}}]	36	1
332	2021-08-08 10:27:59.175628+00	1	Stockholm	2	[{"changed": {"fields": ["City"]}}]	33	1
333	2021-08-08 10:28:12.605267+00	1	a	2	[{"changed": {"fields": ["City"]}}]	33	1
334	2021-08-08 10:28:20.422156+00	1	Stockholm	2	[{"changed": {"fields": ["City"]}}]	33	1
335	2021-08-08 10:29:08.049851+00	47	Nike Therma-FIT	2	[]	36	1
336	2021-08-08 10:29:20.72072+00	57	Nike Sportswear Swoosh	2	[]	36	1
337	2021-08-08 10:29:41.814535+00	4	Antarctica	1	[{"added": {}}]	33	1
338	2021-08-08 10:30:03.029203+00	5	Baku	1	[{"added": {}}]	33	1
339	2021-08-08 10:30:15.730596+00	4	Antarctica	3		33	1
340	2021-08-08 10:30:15.734689+00	1	Stockholm	3		33	1
341	2021-08-08 10:33:05.65466+00	64	Image object (64)	1	[{"added": {}}]	40	1
342	2021-08-08 10:34:26.969386+00	64	Image object (64)	2	[{"changed": {"fields": ["Image"]}}]	40	1
343	2021-08-08 10:34:36.671458+00	65	Image object (65)	1	[{"added": {}}]	40	1
344	2021-08-08 10:34:51.587029+00	66	Image object (66)	1	[{"added": {}}]	40	1
345	2021-08-08 10:34:58.796777+00	67	Image object (67)	1	[{"added": {}}]	40	1
346	2021-08-08 10:36:49.942114+00	68	Image object (68)	1	[{"added": {}}]	40	1
347	2021-08-08 10:37:09.993512+00	69	Image object (69)	1	[{"added": {}}]	40	1
348	2021-08-08 10:37:24.437806+00	70	Image object (70)	1	[{"added": {}}]	40	1
349	2021-08-08 10:37:36.608171+00	71	Image object (71)	1	[{"added": {}}]	40	1
350	2021-08-08 11:17:39.847034+00	5	Antartica	2	[{"changed": {"fields": ["City"]}}]	33	1
351	2021-08-08 11:17:58.684196+00	5	Antarctica	2	[{"changed": {"fields": ["City"]}}]	33	1
352	2021-08-08 12:02:27.560502+00	1	every 10 seconds	1	[{"added": {}}]	16	1
353	2021-08-08 12:03:31.438311+00	2	Tmart: every 10 seconds	1	[{"added": {}}]	17	1
354	2021-08-08 12:29:21.042587+00	14	Kamal	2	[{"changed": {"fields": ["Product"]}}]	39	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
1	0	4	*	*	*	Asia/Baku
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
1	10	seconds
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
1	celery.backend_cleanup	celery.backend_cleanup	[]	{}	\N	\N	\N	\N	t	\N	0	2021-08-08 11:48:22.651333+00		1	\N	\N	f	\N	\N	{}	\N	43200
2	Tmart	core.tasks.send_mail_to_subscribers	[]	{}	\N	\N	\N	\N	f	\N	0	2021-08-08 12:03:49.10936+00		\N	1	\N	t	\N	\N	{}	\N	\N
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
1	2021-08-08 12:03:49.103621+00
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	jet	bookmark
2	jet	pinnedapplication
3	admin	logentry
4	auth	permission
5	auth	group
6	contenttypes	contenttype
7	sessions	session
8	authtoken	token
9	authtoken	tokenproxy
10	social_django	association
11	social_django	code
12	social_django	nonce
13	social_django	usersocialauth
14	social_django	partial
15	django_celery_beat	crontabschedule
16	django_celery_beat	intervalschedule
17	django_celery_beat	periodictask
18	django_celery_beat	periodictasks
19	django_celery_beat	solarschedule
20	django_celery_beat	clockedschedule
21	thumbnail	kvstore
22	core	contact
23	core	subscriber
24	core	team
25	blog	blog
26	blog	category
27	blog	tag
28	blog	comment
29	accounts	user
30	order	order
31	order	shippingaddress
32	order	orderitem
33	products	city
34	products	color
35	products	price
36	products	product
37	products	size
38	products	sortby
39	products	review
40	products	image
41	products	category
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-06 22:33:34.935153+00
2	contenttypes	0002_remove_content_type_name	2021-08-06 22:33:34.944094+00
3	auth	0001_initial	2021-08-06 22:33:35.003882+00
4	auth	0002_alter_permission_name_max_length	2021-08-06 22:33:35.010969+00
5	auth	0003_alter_user_email_max_length	2021-08-06 22:33:35.054096+00
6	auth	0004_alter_user_username_opts	2021-08-06 22:33:35.062536+00
7	auth	0005_alter_user_last_login_null	2021-08-06 22:33:35.069998+00
8	auth	0006_require_contenttypes_0002	2021-08-06 22:33:35.073132+00
9	auth	0007_alter_validators_add_error_messages	2021-08-06 22:33:35.081228+00
10	auth	0008_alter_user_username_max_length	2021-08-06 22:33:35.088253+00
11	auth	0009_alter_user_last_name_max_length	2021-08-06 22:33:35.095999+00
12	auth	0010_alter_group_name_max_length	2021-08-06 22:33:35.104038+00
13	auth	0011_update_proxy_permissions	2021-08-06 22:33:35.110662+00
14	auth	0012_alter_user_first_name_max_length	2021-08-06 22:33:35.118007+00
15	accounts	0001_initial	2021-08-06 22:33:35.189767+00
16	admin	0001_initial	2021-08-06 22:33:35.235888+00
17	admin	0002_logentry_remove_auto_add	2021-08-06 22:33:35.257258+00
18	admin	0003_logentry_add_action_flag_choices	2021-08-06 22:33:35.270436+00
19	authtoken	0001_initial	2021-08-06 22:33:35.294382+00
20	authtoken	0002_auto_20160226_1747	2021-08-06 22:33:35.321133+00
21	authtoken	0003_tokenproxy	2021-08-06 22:33:35.326625+00
22	blog	0001_initial	2021-08-06 22:33:35.496482+00
23	core	0001_initial	2021-08-06 22:33:35.54013+00
24	django_celery_beat	0001_initial	2021-08-06 22:33:35.607554+00
25	django_celery_beat	0002_auto_20161118_0346	2021-08-06 22:33:35.640565+00
26	django_celery_beat	0003_auto_20161209_0049	2021-08-06 22:33:35.656511+00
27	django_celery_beat	0004_auto_20170221_0000	2021-08-06 22:33:35.662527+00
28	django_celery_beat	0005_add_solarschedule_events_choices	2021-08-06 22:33:35.668192+00
29	django_celery_beat	0006_auto_20180322_0932	2021-08-06 22:33:35.694005+00
30	django_celery_beat	0007_auto_20180521_0826	2021-08-06 22:33:35.707152+00
31	django_celery_beat	0008_auto_20180914_1922	2021-08-06 22:33:35.739343+00
32	django_celery_beat	0006_auto_20180210_1226	2021-08-06 22:33:35.751836+00
33	django_celery_beat	0006_periodictask_priority	2021-08-06 22:33:35.760514+00
34	django_celery_beat	0009_periodictask_headers	2021-08-06 22:33:35.769024+00
35	django_celery_beat	0010_auto_20190429_0326	2021-08-06 22:33:35.892386+00
36	django_celery_beat	0011_auto_20190508_0153	2021-08-06 22:33:35.920584+00
37	django_celery_beat	0012_periodictask_expire_seconds	2021-08-06 22:33:35.928207+00
38	django_celery_beat	0013_auto_20200609_0727	2021-08-06 22:33:35.935453+00
39	django_celery_beat	0014_remove_clockedschedule_enabled	2021-08-06 22:33:35.94214+00
40	django_celery_beat	0015_edit_solarschedule_events_choices	2021-08-06 22:33:35.95658+00
41	jet	0001_initial	2021-08-06 22:33:35.984201+00
42	jet	0002_delete_userdashboardmodule	2021-08-06 22:33:35.990073+00
43	jet	0003_auto_20210612_1127	2021-08-06 22:33:36.014221+00
44	products	0001_initial	2021-08-06 22:33:36.30657+00
45	order	0001_initial	2021-08-06 22:33:36.424073+00
46	sessions	0001_initial	2021-08-06 22:33:36.443221+00
47	default	0001_initial	2021-08-06 22:33:36.538056+00
48	social_auth	0001_initial	2021-08-06 22:33:36.5413+00
49	default	0002_add_related_name	2021-08-06 22:33:36.613971+00
50	social_auth	0002_add_related_name	2021-08-06 22:33:36.61542+00
51	default	0003_alter_email_max_length	2021-08-06 22:33:36.621656+00
52	social_auth	0003_alter_email_max_length	2021-08-06 22:33:36.623026+00
53	default	0004_auto_20160423_0400	2021-08-06 22:33:36.637802+00
54	social_auth	0004_auto_20160423_0400	2021-08-06 22:33:36.6392+00
55	social_auth	0005_auto_20160727_2333	2021-08-06 22:33:36.649043+00
56	social_django	0006_partial	2021-08-06 22:33:36.675994+00
57	social_django	0007_code_timestamp	2021-08-06 22:33:36.698513+00
58	social_django	0008_partial_timestamp	2021-08-06 22:33:36.714852+00
59	social_django	0009_auto_20191118_0520	2021-08-06 22:33:36.74938+00
60	social_django	0010_uid_db_index	2021-08-06 22:33:36.770411+00
61	social_django	0011_auto_20210702_0923	2021-08-06 22:33:36.931814+00
62	thumbnail	0001_initial	2021-08-06 22:33:36.965794+00
63	social_django	0002_add_related_name	2021-08-06 22:33:36.975375+00
64	social_django	0004_auto_20160423_0400	2021-08-06 22:33:36.979231+00
65	social_django	0001_initial	2021-08-06 22:33:36.981936+00
66	social_django	0005_auto_20160727_2333	2021-08-06 22:33:36.985973+00
67	social_django	0003_alter_email_max_length	2021-08-06 22:33:36.989422+00
68	order	0002_alter_shippingaddress_state	2021-08-08 11:51:43.267682+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
hkmv3glcefyj8uuvgss55pxfstvwg4ja	.eJxVjEEOwiAQRe_C2pCBgqBL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzMurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL9_akcnuaH0OwaEF59gQZEpRSMDkIQMlSI4QB0EPIYToIRrLYNlyOKn3B-lGN-I:1mChFO:1PYuRn9YlUlcilp81sfD0YeBKjQP-i_aiwyHUcD2BzI	2021-08-22 11:45:42.561991+00
ani6cjrjwb75cbzyehmuoudzoqbrmmxj	.eJxVjEEOwiAQRe_C2pCBgqBL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzMurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL9_akcnuaH0OwaEF59gQZEpRSMDkIQMlSI4QB0EPIYToIRrLYNlyOKn3B-lGN-I:1mCMO3:iwUvurgBVIcb3r9npPXJuL3OBLMVwOGsxyueuM2ydbY	2021-08-21 13:29:15.340777+00
22si6d8qpggm3pxvakvqz3z2jd7mr93h	.eJxVjEEOwiAQRe_C2hBKmcK4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWKE6_W6D44LqDdKd6azK2ui5zkLsiD9rltSV-Xg7376BQL99a55hJYQagwWFABMugSAWHGDTYkQfjFOXRTuCU5ZSZFAGPkyE0rMX7A-QuN7w:1mCMUg:Q5o-IPzKt_G9nVsnBJYDWUl5jXBXhctcvQ_pVnf9TtE	2021-08-21 13:36:06.687394+00
nptl03ktfttog9mvfpv4jyxneiqyb417	.eJxVjDsOwjAQBe_iGlnexLY2lPScwdqPQwLIlvKpIu6OLKWA9s3MO0yifZvSvuYlzWquZjCX341JXrk0oE8qj2qllm2Z2TbFnnS196r5fTvdv4OJ1qnVPcRIo0NAh15Ix27w0SMGhh4c8uhYMPjOEfSRKYROAJVRQYIKm88XyYs3kg:1mCMW9:alSdgejPA68HiNfHd1vwWoMBbWhFiyJQlQL04vTFV8c	2021-08-21 13:37:37.529781+00
\.


--
-- Data for Name: jet_bookmark; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
\.


--
-- Data for Name: jet_pinnedapplication; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.order_order (id, date_ordered, complete, transaction_id, customer_id) FROM stdin;
1	2021-08-06 22:36:13.498292+00	t	1628334445.094529	1
3	2021-08-07 11:07:34.50696+00	t	1628335440.936215	1
4	2021-08-07 11:24:06.140325+00	f	\N	1
2	2021-08-06 23:15:33.667395+00	f	\N	\N
5	2021-08-07 13:34:30.3901+00	f	\N	\N
6	2021-08-07 13:35:50.918619+00	f	\N	9
\.


--
-- Data for Name: order_orderitem; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.order_orderitem (id, quantity, date_added, order_id, product_id) FROM stdin;
20	2	2021-08-08 11:18:58.32894+00	4	59
22	2	2021-08-08 11:23:28.133453+00	4	49
23	3	2021-08-08 11:41:54.382731+00	6	48
\.


--
-- Data for Name: order_shippingaddress; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.order_shippingaddress (id, address, city, state, zipcode, companyname, date_added, customer_id, order_id) FROM stdin;
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_category (id, title, title_en, title_az, title_tr, image, is_published, created_at, updated_at, category_id) FROM stdin;
1	Men Fashion	Men Fashion	\N	\N	home_category_images/home_category_image3_IK3jzok.jpg	t	2021-08-06 22:36:24.730247+00	2021-08-07 21:56:11.369914+00	\N
4	Women Fashion	Women Fashion	\N	\N	IMG.JPG	t	2021-08-07 15:02:04.806566+00	2021-08-07 21:59:55.651696+00	\N
9	Clothing	Clothing	\N	\N	IMG.JPG	t	2021-08-08 09:25:34.684813+00	2021-08-08 09:28:05.519458+00	1
8	Lifestyle	Lifestyle	\N	\N	IMG.JPG	t	2021-08-07 21:59:49.050043+00	2021-08-08 09:28:08.714298+00	7
10	Shorts	Shorts	\N	\N	IMG.JPG	t	2021-08-08 09:26:12.665609+00	2021-08-08 09:30:13.862964+00	9
12	Jackets	Jackets	\N	\N	IMG.JPG	t	2021-08-08 09:26:46.507525+00	2021-08-08 09:31:07.45602+00	9
6	Lifestyle	Lifestyle	\N	\N	IMG.JPG	t	2021-08-07 21:54:50.498843+00	2021-08-08 09:44:51.219984+00	9
14	Bags	Bags	\N	\N	IMG.JPG	t	2021-08-08 09:27:22.262098+00	2021-08-08 09:45:12.7929+00	9
7	Clothing	Clothing	\N	\N	IMG.JPG	t	2021-08-07 21:59:34.815344+00	2021-08-08 09:46:17.877802+00	4
15	Pants	Pants	\N	\N	IMG.JPG	t	2021-08-08 10:21:50.237374+00	2021-08-08 10:21:50.237399+00	9
16	T-Shirts	T-Shirts	\N	\N	IMG.JPG	t	2021-08-08 10:22:52.120943+00	2021-08-08 10:22:52.120963+00	7
17	Shorts	Shorts	\N	\N	IMG.JPG	t	2021-08-08 10:23:39.224172+00	2021-08-08 10:23:39.224189+00	7
18	Sweatshirts	Sweatshirts	\N	\N	IMG.JPG	t	2021-08-08 10:24:41.104426+00	2021-08-08 10:24:41.104465+00	7
11	Sweatshirts	Sweatshirts	\N	\N	IMG.JPG	t	2021-08-08 09:26:34.286376+00	2021-08-08 10:24:52.108732+00	9
19	Bags	Bags	\N	\N	IMG.JPG	t	2021-08-08 10:25:49.764435+00	2021-08-08 10:25:49.764453+00	7
\.


--
-- Data for Name: products_category_products; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_category_products (id, category_id, product_id) FROM stdin;
6	6	40
7	6	41
8	6	6
10	8	42
11	8	44
12	8	45
13	8	39
14	14	49
15	14	50
16	10	46
17	11	47
18	12	48
19	15	53
20	16	52
21	16	54
22	16	55
23	17	56
24	17	48
25	18	57
26	19	58
27	19	59
\.


--
-- Data for Name: products_city; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_city (id, city) FROM stdin;
5	Antarctica
\.


--
-- Data for Name: products_color; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_color (id, color, is_published) FROM stdin;
9	pink	t
8	white	t
7	black	t
6	brown	t
5	yellow	t
4	orange	t
3	blue	t
2	red	t
10	grey	f
\.


--
-- Data for Name: products_image; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_image (id, image, product_id) FROM stdin;
2	product_image/shoes_1_2.png	6
3	product_image/shoes_1_3.png	6
4	product_image/shoes_1_1_G0JouyE.png	6
1	product_image/shoes_1_5_xSAVtLn.png	6
38	product_image/shoes_2_1_78dtPSg.png	39
39	product_image/shoes_2_3_mDXsfaZ.png	39
40	product_image/shoes_2_4_TBd8las.png	39
41	product_image/2_2_4ljPHJ7.png	39
42	product_image/af-1-1-mens-shoes-wr9kNq_2.png	42
43	product_image/af-1-1-mens-shoes-wr9kNq.png	42
44	product_image/af-1-1-mens-shoes-wr9kNq_1.png	42
45	product_image/af-1-1-mens-shoes-wr9kNq_3.png	42
46	product_image/acg-air-deschütz-sandals-Khb2Xc.png	40
47	product_image/acg-air-deschütz-sandals-Khb2Xc_1.png	40
48	product_image/acg-air-deschütz-sandals-Khb2Xc_2.png	40
49	product_image/acg-air-deschütz-sandals-Khb2Xc_3.png	40
50	product_image/air-force-1-crater-flyknit-mens-shoes-k3Jwmd.png	41
51	product_image/air-force-1-crater-flyknit-mens-shoes-k3Jwmd_1.png	41
52	product_image/air-force-1-crater-flyknit-mens-shoes-k3Jwmd_2.png	41
53	product_image/air-force-1-crater-flyknit-mens-shoes-k3Jwmd_3.png	41
54	product_image/air-vapormax-2021-fk-womens-shoe-1WB8SL.png	44
55	product_image/air-vapormax-plus-womens-shoe-xbt7zf_1.png	45
56	product_image/air-vapormax-plus-womens-shoe-xbt7zf_2.png	45
57	product_image/air-vapormax-plus-womens-shoe-xbt7zf_3.png	45
58	product_image/air-vapormax-plus-womens-shoe-xbt7zf.png	45
59	product_image/air-vapormax-2021-fk-womens-shoe-1WB8SL_1.png	44
60	product_image/air-vapormax-2021-fk-womens-shoe-1WB8SL_2.png	44
61	product_image/air-vapormax-2021-fk-womens-shoe-1WB8SL_3.png	44
64	product_image/air-womens-woven-high-rise-shorts-DVdqQl.png	56
65	product_image/air-womens-woven-high-rise-shorts-DVdqQl_1.png	56
66	product_image/air-womens-woven-high-rise-shorts-DVdqQl_2.png	56
67	product_image/air-womens-woven-high-rise-shorts-DVdqQl_3.png	56
68	product_image/fuel-pack-lunch-bag-JqCmcz.png	59
69	product_image/fuel-pack-lunch-bag-JqCmcz_1.png	59
70	product_image/fuel-pack-lunch-bag-JqCmcz_2.png	59
71	product_image/fuel-pack-lunch-bag-JqCmcz_3.png	59
\.


--
-- Data for Name: products_price; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_price (id, price) FROM stdin;
1	0.00$ - 50.00$
2	50.00$ - 100.00$
3	100.00$ - 200.00$
4	200.00$ - 500.00$
5	500.00$ - 1000.00$
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_product (id, title, slug, price, quantity, discount_price, winter, spring, autumn, summer, cover_image, description, stock, digital, video, sale, sale_time, is_published, created_at, updated_at) FROM stdin;
41	Nike Air Force 1 Crater FlyKnit	nike-air-force-1-crater-flyknit-41	110.00	1	0.00	f	f	t	f	product_cover_image/air-force-1-crater-flyknit-mens-shoes-k3Jwmd.jpeg	Your modern take on the hoops icon, the Nike Air Force 1 Crater FlyKnit updates classic b-ball style with at least 20% recycled materials by weight. The super-airy FlyKnit upper features a linen-like texture while the speckled Crater foam midsole adds a modern twist. It's legendary style that's on-point and lets you give a little back with every step.\r\n\r\nShown: Black/Anthracite/White/Black\r\nStyle: DC4831-003	f	f	https:something/something/...	0	\N	t	2021-08-07 21:50:24.236168+00	2021-08-07 21:52:05.732463+00
40	Nike ACG Air Deschütz +	nike-acg-air-deschutz-40	75.00	1	0.00	f	f	f	t	product_cover_image/acg-air-deschütz-sandals-Khb2Xc.jpeg	From city hikes to canyon trails to long walks on the beach, the Nike ACG Air Deschütz + is built to feel comfortable. Featuring a classic '90s look and rugged outdoor inspired design, its plush padding around the ankle, heavy-duty webbing strap and easily adjustable hook-and-loop closure keep you focused on the journey ahead.\r\n\r\nShown: Black/Iron Grey\r\nStyle: DC9093-001	f	f	https:something/something/...	0	\N	t	2021-08-07 21:45:40.944537+00	2021-08-07 21:52:50.709573+00
39	Nike ACG Mountain Fly Low	nike-acg-mountain-fly-low-39	180.00	1	0.00	f	t	f	t	product_cover_image/shoes_2.jpeg	Fast, rugged and just as at home in the city as it is in deserts, canyons and mountains, the Nike ACG Mountain Fly Low is ready for whatever you throw at it. The lightweight ripstop and synthetic upper is durable and airy while the easy-to-cinch lacing system adds on-the-go personalization. The sticky rubber outsole brings crag-inspired traction as the soft Nike React foam sole delivers undisputed comfort whether you're pounding pavement in the city wilds or leaping rock to rock in Joshua Tree.\r\n\r\nShown: Light Mulberry/Flash Crimson\r\nStyle: DC9045-500	f	f	https:something/something/...	0	\N	t	2021-08-07 21:24:57.61845+00	2021-08-07 21:51:50.825429+00
42	Nike AF 1/1	nike-af-11-42	140.00	1	120.00	t	f	t	f	product_cover_image/af-1-1-mens-shoes-wr9kNq.jpeg	The radiance lives on in the Nike AF 1/1, the b-ball classic that puts a tailored spin on what you know best: crisp leather, bold colors, and the perfect amount of flash to make you shine. The customizable design uses hook-and-loop details with removable overlays so you change up your look to match the day.\r\n\r\nShown: Black/Lethal Fuchsia/Orange Chalk/Barely Grey\r\nStyle: DB2576-001	f	f	https:something/something/...	0	\N	t	2021-08-07 22:11:10.536122+00	2021-08-07 22:11:10.53744+00
45	Nike Air VaporMax Plus	nike-air-vapormax-plus-45	200.00	1	0.00	f	t	f	f	product_cover_image/air-vapormax-plus-womens-shoe-xbt7zf.jpeg	The Nike Air VaporMax Plus looks to the past to propel you into the future. With a design that nods to the futuristic '98 Nike Air Max Plus, it adds revolutionary VaporMax Air technology to ramp up the comfort. Here's to a little more Air underfoot.\r\n\r\nShown: Pink Oxford/White/Metallic Silver\r\nStyle: DM8327-600	f	f	https:something/something/...	0	\N	t	2021-08-07 22:21:22.42062+00	2021-08-07 22:21:22.421578+00
6	Air Jordan 1 Mid	air-jordan-1-mid-6	120.00	1	0.00	t	f	t	f	product_cover_image/shoes_1.jpeg	The Air Jordan 1 Mid Shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of greatness. Fresh color trims the clean, classic materials, injecting some newness into the familiar design.\r\n\r\nShown: White/Black/Racer Blue\r\nStyle: 554724-140	f	f	https:something/something/...	0	\N	t	2021-08-07 21:06:40.390743+00	2021-08-07 21:09:10.719526+00
44	Nike Air VaporMax 2021 FK	nike-air-vapormax-2021-fk-44	200.00	1	0.00	t	f	t	f	product_cover_image/air-vapormax-2021-fk-womens-shoe-1WB8SL_aOHxuAX.jpeg	Made from at least 40% recycled materials by weight, the Nike Air VaporMax 2021 FK is airy and easy to wear with superstretchy, recycled Flyknit fabric (plus a soft collar that sculpts your ankle). The stitched-on Swoosh and recycled TPU heel clip add a splash of intrigue as you float down the streets on incredibly soft VaporMax cushioning.\r\n\r\nShown: Light Arctic Pink/Summit White/Metallic Silver/Iced Lilac\r\nStyle: DH4088-600	f	f	https:something/something/...	20	\N	t	2021-08-07 22:19:49.750368+00	2021-08-07 22:22:23.164186+00
46	Nike Sportswear Club	nike-sportswear-club-46	30.00	1	0.00	f	f	f	t	product_cover_image/sportswear-club-mens-shorts-3T0Vmz.jpeg	Made from soft cotton jersey, the Nike Sportswear Shorts are perfect for all-day wear. And with an adjusted rise and a shorter inseam than previous versions, they're more comfortable than ever.\r\n\r\nShown: Charcoal Heather/White\r\nStyle: BV2772-071	f	f	https:something/something/...	0	\N	t	2021-08-08 09:11:17.463585+00	2021-08-08 09:11:29.344454+00
48	Nike Air	nike-air-48	135.00	1	0.00	t	f	t	f	product_cover_image/air-mens-unlined-anorak-0Xl7Fl.jpeg	The Nike Air Anorak is a styling staple with details inspired by an '80s Air Force campaign. Retro details come in the form of a headline from the campaign embroidered on the back panel, color blocking details and a Futura Air graphic embroidered on the front pocket.\r\n\r\nShown: Black/Anthracite/White\r\nStyle: DD6406-010	f	f	https:something/something/...	10	\N	t	2021-08-08 09:16:31.06326+00	2021-08-08 09:16:31.064321+00
49	Nike Hayward 2.0	nike-hayward-20-49	65.00	1	0.00	t	t	t	t	product_cover_image/hayward-2-backpack-x1mPSt.jpeg	The Nike Hayward 2.0 Backpack combines simplicity and functionality with its sleek design and easy-to-access compartments. Its ripstop fabric adds durability that won't weigh you down. Bungee cord detailing on the exterior provides quick storage for a shell or sneakers.\r\n\r\nShown: Black/Black/Black\r\nStyle: CV1412-010	f	f	https:something/something/...	20	\N	t	2021-08-08 09:18:36.361629+00	2021-08-08 09:19:19.889179+00
51	Liverpool FC	liverpool-fc-51	32.00	1	0.00	f	f	f	t	product_cover_image/liverpool-fc-dri-fit-reversible-soccer-bucket-hat-3v1p2N.jpeg	The Liverpool FC Bucket Hat features soft, lightweight fabric with sweat-wicking technology to help keep you dry and comfortable. The reversible design lets you switch up your look at a moment's notice. This product is made with at least 50% recycled polyester fibers.\r\n\r\nShown: Black\r\nStyle: DJ6287-010	f	f	https:something/something/...	0	\N	t	2021-08-08 09:23:18.709605+00	2021-08-08 09:23:18.710513+00
50	Jordan	jordan-50	75.00	1	0.00	t	t	t	t	product_cover_image/jordan-backpack-large-nMPjn1.jpeg	The Jordan Backpack highlights the GOAT's jersey on the front for gear that reps DNA. It gives you a laptop sleeve, organizer pockets and a place for your drinks.\r\n\r\nShown: Gym Red\r\nStyle: 9A0419-R78	f	f	https:something/something/...	0	\N	t	2021-08-08 09:21:15.137861+00	2021-08-08 10:25:59.646503+00
47	Nike Therma-FIT	nike-therma-fit-47	55.00	1	0.00	t	f	f	f	product_cover_image/therma-fit-mens-baseball-hoodie-mWtpjl.jpeg	The Nike Therma-FIT Hoodie is made with comfortable fabric that's smooth on the front and fuzzed on the back for extra warmth and softness. Sweat-wicking technology, plus all the classic details of the beloved sweatshirt put this piece solidly in the running for your everyday go-to layer.\r\n\r\nShown: Black/White\r\nStyle: DC8383-010	f	f	https:something/something/...	0	\N	t	2021-08-08 09:13:54.170003+00	2021-08-08 10:29:08.044062+00
56	Nike Air	nike-air-56	50.00	1	0.00	f	f	f	t	product_cover_image/air-womens-woven-high-rise-shorts-DVdqQl.jpeg	The Nike Air Shorts offer are an easy fitting, elastic waist style perfect for everyday wear. Ready to pair with oversized and cropped styles alike, this updated favorite features an embroidered Futura Air graphic for a heritage Nike look.\r\n\r\nShown: Lime Ice/White\r\nStyle: DD5427-303	f	f	https:something/something/...	0	\N	t	2021-08-08 10:17:33.623118+00	2021-08-08 10:26:14.545024+00
59	Nike Fuel Pack	nike-fuel-pack-59	30.00	1	0.00	t	t	t	t	product_cover_image/fuel-pack-lunch-bag-JqCmcz.jpeg	Grab your gear and get going in style with the Nike Heritage Backpack. It features 2 zippered pockets to help keep your gear organized. An allover tie-dye print print provides fun, effortless style\r\n\r\nShown: Pink Glaze/Pink Glaze/Smoke Grey\r\nStyle: DM9863-630	f	f	https:something/something/...	10	\N	t	2021-08-08 10:21:00.518636+00	2021-08-08 10:26:20.541276+00
58	Nike Heritage	nike-heritage-58	35.00	1	0.00	t	t	t	t	product_cover_image/heritage-backpack-Km4CVJ.jpeg	Grab your gear and get going in style with the Nike Heritage Backpack. It features 2 zippered pockets to help keep your gear organized. An allover tie-dye print print provides fun, effortless style\r\n\r\nShown: Pink Glaze/Pink Glaze/Smoke Grey\r\nStyle: DM9863-630	f	f	https:something/something/...	0	\N	t	2021-08-08 10:19:57.754398+00	2021-08-08 10:26:26.04302+00
55	Nike Sportswear	nike-sportswear-55	30.00	1	0.00	f	f	f	t	product_cover_image/sportswear-womens-muscle-tank-QF3zD8.jpeg	Cool off or warm up in the Nike Sportswear Muscle Tank. Made from cotton jersey fabric with a soft feel, it's a great option for enjoying warm weather or your most challenging workouts.\r\n\r\nShown: Dark Grey Heather/Black\r\nStyle: CW2206-063	f	f	https:something/something/...	0	\N	t	2021-08-08 10:16:12.710713+00	2021-08-08 10:26:31.564916+00
54	Nike Sportswear	nike-sportswear-54	35.00	1	0.00	f	f	f	t	product_cover_image/sportswear-womens-t-shirt-2VkPMF.jpeg	The Nike Sportswear T-Shirt is made with our everyday cotton fabric and crew fit. The printed graphic offers a hand-drawn look inspired by retro tourist tees.\r\n\r\nShown: Black\r\nStyle: DJ1913-010	f	f	https:something/something/...	0	\N	t	2021-08-08 10:14:55.38136+00	2021-08-08 10:26:36.686862+00
53	Nike Sportswear Essential	nike-sportswear-essential-53	30.00	1	0.00	f	t	f	t	product_cover_image/sportswear-essential-womens-t-shirt-mzhbh0.jpeg	Made with our heavyweight cotton jersey, the Nike Sportswear Essential T-Shirt has a soft, premium feel. Its boxy, throwback fit and simple Swoosh graphic make it an easy pick to pair with your favorite leggings or shorts.\r\n\r\nShown: Lime Ice/Black\r\nStyle: DD1237-303	f	f	https:something/something/...	0	\N	t	2021-08-08 10:13:06.306852+00	2021-08-08 10:26:41.046943+00
52	Nike Sportswear Essential	nike-sportswear-essential-52	45.00	1	0.00	t	t	t	f	product_cover_image/sportswear-essential-womens-high-waisted-leggings-8H2nDD.jpeg	The perfect complement to your favorite tops and tees, the Nike Sportswear Leggings have a high-rise design and a stretchy waistband that sits above your navel. The soft, cotton blend wicks sweat, making these full-length leggings an easy choice for everyday wear.\r\n\r\nShown: Dark Grey Heather/White\r\nStyle: CZ8528-063	f	f	https:something/something/...	0	\N	t	2021-08-08 10:11:11.268609+00	2021-08-08 10:26:45.371435+00
57	Nike Sportswear Swoosh	nike-sportswear-swoosh-57	110.00	1	100.00	t	f	f	f	product_cover_image/sportswear-swoosh-womens-woven-jacket-1b4wg6.jpeg	The Nike Sportswear Swoosh Jacket is made with a smooth woven fabric. Utility pockets on the front provide a tactical look and offer quick, secure storage.\r\n\r\nShown: Canyon Rust\r\nStyle: CZ8898-691	f	f	https:something/something/...	0	\N	t	2021-08-08 10:19:00.83777+00	2021-08-08 10:29:20.714679+00
\.


--
-- Data for Name: products_product_colors; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_product_colors (id, product_id, color_id) FROM stdin;
6	6	2
7	6	3
8	6	4
9	6	5
10	6	6
39	39	2
40	40	8
41	40	7
42	41	8
43	41	7
44	42	2
46	44	8
47	44	9
48	44	2
49	44	7
50	45	8
51	45	9
52	45	7
53	46	8
54	46	7
55	47	8
56	47	10
57	47	7
58	48	8
59	48	7
60	49	8
61	49	9
62	49	7
63	50	2
64	51	5
65	51	7
66	52	10
67	52	4
68	52	7
69	53	2
70	53	4
71	53	5
72	53	7
73	53	8
74	53	9
75	54	8
76	54	3
77	54	7
78	55	2
79	55	3
80	55	7
81	55	8
82	55	10
83	56	8
84	56	9
85	56	2
86	56	3
87	57	2
88	57	4
89	57	5
90	57	7
91	57	8
92	57	9
93	58	9
94	59	9
95	59	7
\.


--
-- Data for Name: products_product_prices_range; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_product_prices_range (id, product_id, price_id) FROM stdin;
1	6	3
34	39	3
35	40	2
36	41	3
37	42	3
39	44	4
40	45	4
41	46	1
42	47	2
43	48	3
44	49	2
45	50	2
46	51	1
47	52	1
48	53	1
49	54	1
50	55	1
51	56	1
52	57	3
53	58	1
54	59	1
\.


--
-- Data for Name: products_product_sizes; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_product_sizes (id, product_id, size_id) FROM stdin;
1	6	10
2	6	14
3	6	11
4	6	12
5	6	13
34	39	9
35	39	10
36	39	11
37	39	12
38	39	13
39	39	14
40	40	15
41	40	16
53	41	34
54	41	35
55	41	36
56	41	37
57	41	38
58	41	39
59	41	40
60	41	41
61	41	42
69	40	17
70	40	18
71	42	32
72	42	33
73	42	34
74	42	35
75	42	36
76	42	37
77	42	38
78	42	30
79	42	31
86	44	32
87	44	34
88	44	35
89	44	37
90	44	30
91	45	33
92	45	34
93	45	35
94	45	36
95	45	37
96	45	30
97	46	2
98	46	3
99	46	4
100	46	5
101	47	2
102	47	3
103	47	4
104	47	5
105	47	6
106	47	7
107	48	1
108	48	2
109	48	3
110	48	4
111	48	5
112	48	6
113	48	7
114	49	48
115	50	48
116	51	2
117	51	3
118	51	4
119	51	5
120	51	6
121	51	7
122	52	1
123	52	2
124	52	3
125	52	4
126	52	5
127	52	6
128	53	1
129	53	2
130	53	3
131	53	4
132	53	5
133	53	6
134	53	7
135	54	1
136	54	2
137	54	3
138	54	4
139	54	5
140	55	2
141	55	3
142	55	4
143	55	5
144	55	6
145	55	7
146	56	2
147	56	3
148	56	4
149	56	5
150	57	2
151	57	3
152	57	4
153	57	5
154	58	48
155	59	48
\.


--
-- Data for Name: products_product_sortsby; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_product_sortsby (id, product_id, sortby_id) FROM stdin;
7	6	1
40	39	1
41	40	1
42	41	2
43	45	1
44	47	1
45	48	2
46	49	1
47	49	2
48	50	1
49	50	2
50	51	2
51	53	1
52	53	2
53	55	1
54	56	1
55	57	1
56	58	2
57	59	2
\.


--
-- Data for Name: products_review; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_review (id, rate, name, email, message, is_published, created_at, updated_at, comment_id, product_id) FROM stdin;
11	4	Kamal Abdullayev	abdullayevk890@gmail.com	dfghjkl;jhgfxvzcvvhbjkl;	f	2021-08-07 11:30:54.524194+00	2021-08-07 11:30:54.53797+00	\N	\N
12	4	dadasd	kamal@gmail.com	adsadknsadnklsndalnlsa dksa ld	f	2021-08-07 15:30:53.715129+00	2021-08-07 15:30:53.726183+00	\N	\N
13	3	adsa	dads@ccz.tfd	ghjgkhjfdsa	f	2021-08-08 11:35:53.498194+00	2021-08-08 11:35:53.502667+00	\N	\N
14	4	Kamal	kamal@gmail.com	aaaaaaaaaaaaaaaa	f	2021-08-08 12:27:22+00	2021-08-08 12:29:21.040733+00	\N	50
15	1	Amil	amil@gmail.com	bbbbbbbbbbbbbbbbbb	f	2021-08-08 12:29:51.682239+00	2021-08-08 12:29:51.686392+00	\N	\N
16	3	adsadsad	dsadbsab@ndadn.jjdaka	cccccccccccccccccccccccc	f	2021-08-08 12:30:51.784669+00	2021-08-08 12:30:51.808903+00	\N	\N
17	5	djsabdjsa	dbajdba@nsajds.sdknadksa	qqqqqqqqqqqqqqqqqqqqqqqqqqqq	f	2021-08-08 12:36:15.733376+00	2021-08-08 12:36:15.776593+00	\N	\N
18	4	adad	dabh@dbhjad.dasdsa	wwwwwwwwwwwwwwwwwwwww	f	2021-08-08 12:38:22.405602+00	2021-08-08 12:38:22.418196+00	\N	\N
19	4	dsadsa	dada@fsdfsdf.hfgd	here	f	2021-08-08 12:40:03.724665+00	2021-08-08 12:40:03.758399+00	\N	\N
20	4	dadsadasdasda	dsada@sdfafa.dhsdbjhasbd	ccccccccccccccccccccccccccccccccccccc	f	2021-08-08 12:41:03.944486+00	2021-08-08 12:41:03.958688+00	\N	50
\.


--
-- Data for Name: products_size; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_size (id, size) FROM stdin;
2	S
3	M
4	L
5	XL
6	XXL
7	XXXL
8	39
9	40
10	41
11	42
12	43
13	44
14	45
15	M 4 / W 5.5
16	M 5 / W 6.5
17	M 6 / W 7.5
18	M 7 / W 8.5
19	M 8 / W 9.5
20	M 9 / W 10.5
21	M 10 / W 11.5
22	M 11 / W 12.5
23	M 12 / W 13.5
24	M 13 / W 14.5
25	M 14 / W 15.5
1	XS
26	36
27	37
28	38
29	M 15 / W 16.5
30	6
31	6.5
32	7
33	7.5
34	8
35	8.5
36	9
37	9.5
38	10
39	10.5
40	11
41	11.5
42	12
43	12.5
44	13
45	14
46	15
47	16
48	ONE SIZE
\.


--
-- Data for Name: products_sortby; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.products_sortby (id, sortby) FROM stdin;
1	NEW COLLECTION
2	SPECIAL FOR TMART
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
3	facebook	212631520746112	{"auth_time": 1628422852, "id": "212631520746112", "expires": 5106674, "granted_scopes": ["user_friends", "email", "public_profile"], "denied_scopes": null, "access_token": "EAADKoRmyymgBAJJm75ZBd0HcrRKHCYYngSr662jtFAn0UCpltxN9jdUmD2UpTzOGVEP158CpBJwwyF9v8uBnliZCxssKwZClnH9EZCbli18OmBDXqWJ8dIYiqR0fqwJfp7RfkcnoloOm7EoZC5inLk07PWthTnShahmpNv9DpRgZDZD", "token_type": null}	9	2021-08-07 14:12:08.36272+00	2021-08-08 11:40:52.999304+00
2	google-oauth2	kamalabdu2layev@gmail.com	{"auth_time": 1628422867, "expires": 3599, "token_type": "Bearer", "access_token": "ya29.a0ARrdaM_rFu4QkN2c4CF38t6LJ1rLxv_PXyXd2D_-RPCRiv9Txm5gW_OBSMGwWj8p6iHeWkmlwe1bJt6nn0QsF1_9oa1jK5aX9sTPcZXijJqihe5BozDW8kMNeRr2iGYG0bn8aWT6HXUfP4aBDtD6J8JGlIK8"}	9	2021-08-07 13:40:27.284682+00	2021-08-08 11:41:07.32675+00
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||290b6d62bb081a15243e15a6c81bb0ac	{"name": "product_cover_image/8_15aEFWV.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||46864b26ae3bb04040e7359c5a3e1660	{"name": "cache/18/9b/189b5dc45caa2df1edf15883973b6191.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||290b6d62bb081a15243e15a6c81bb0ac	["46864b26ae3bb04040e7359c5a3e1660"]
sorl-thumbnail||image||d1c14f99726e36601e264ccc5ee8a877	{"name": "product_cover_image/15_9L7Iua2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||1e3eb7948a668a3a2b32e80379eea19e	{"name": "cache/7d/a8/7da8dc6fb2de92638737bf95d31eb112.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||d1c14f99726e36601e264ccc5ee8a877	["1e3eb7948a668a3a2b32e80379eea19e"]
sorl-thumbnail||image||d9d16c8cf182433dd840d247ac75fe89	{"name": "product_cover_image/about_background_4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 475]}
sorl-thumbnail||image||30066c3554ca6f086f5f9b198e40b004	{"name": "cache/2d/54/2d54f752b2797ce6e86428a388ccea96.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||d9d16c8cf182433dd840d247ac75fe89	["30066c3554ca6f086f5f9b198e40b004"]
sorl-thumbnail||image||516234626242bf41252419455dfcd164	{"name": "product_cover_image/4_IiONCZp.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 370]}
sorl-thumbnail||image||4f3f5bfe5225e76ba8ec0ef512ea74e2	{"name": "cache/ce/8a/ce8a5abbada2fc5b94425b0991630305.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||516234626242bf41252419455dfcd164	["4f3f5bfe5225e76ba8ec0ef512ea74e2"]
sorl-thumbnail||image||719d110a13f734744d48bb9c8f8909d1	{"name": "product_cover_image/13_02ulo1f.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||5230082719f2484c04b1f0d7afa01c72	{"name": "cache/94/7b/947b72bc9b8c6e4960a8145eb57d6be9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||719d110a13f734744d48bb9c8f8909d1	["5230082719f2484c04b1f0d7afa01c72"]
sorl-thumbnail||image||54e32a81dcb9934579907c1e3356c865	{"name": "media/category_images/8_aIspEeJ.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||c971af7652367536af7daa2504256268	{"name": "cache/6c/c4/6cc43528322bb6147d48898610ff37fb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||54e32a81dcb9934579907c1e3356c865	["c971af7652367536af7daa2504256268"]
sorl-thumbnail||image||9eee937c9f8ee61c53bd06758c7d10ae	{"name": "media/category_images/14.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||a967a65a5f302c5a9c80daa39022d0f4	{"name": "cache/ef/1e/ef1eca626d18f202f9e44a9dde8fb175.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||9eee937c9f8ee61c53bd06758c7d10ae	["a967a65a5f302c5a9c80daa39022d0f4"]
sorl-thumbnail||image||69c2cf0bb1d147c72b3eebc7deb05931	{"name": "media/category_images/6_2mgmJPD.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||6d542cee668e78a459e4a64b14b31402	{"name": "cache/cf/83/cf8355cb936516fec7d7a19a0ec0286c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||69c2cf0bb1d147c72b3eebc7deb05931	["6d542cee668e78a459e4a64b14b31402"]
sorl-thumbnail||image||9c8c4ddf1943e2d49a0632446ec164db	{"name": "home_category_images/index_corusel_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 800]}
sorl-thumbnail||image||a53cf189609a1eaa0ba4dbc789f1fe46	{"name": "cache/79/d4/79d4094a814a8caefed5146cb28dc91c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1171, 300]}
sorl-thumbnail||thumbnails||9c8c4ddf1943e2d49a0632446ec164db	["a53cf189609a1eaa0ba4dbc789f1fe46"]
sorl-thumbnail||image||51cd08fbe4895a3cfc25d27a7fbb4a7f	{"name": "home_category_images/home_category_image3_IK3jzok.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1170, 300]}
sorl-thumbnail||image||f0845f451828752ed7819b5c10d2f75b	{"name": "cache/6b/c6/6bc682feaa2335548179403528580925.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1171, 300]}
sorl-thumbnail||thumbnails||51cd08fbe4895a3cfc25d27a7fbb4a7f	["f0845f451828752ed7819b5c10d2f75b"]
sorl-thumbnail||image||29ef25e80a4c001aeda8909120197157	{"name": "media/category_images/15.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||045792c85da0836581b8accd10666160	{"name": "cache/ec/9e/ec9ef1f7d6fa567aaadac8857f0a218c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||29ef25e80a4c001aeda8909120197157	["045792c85da0836581b8accd10666160"]
sorl-thumbnail||image||712ec48cb6dad331d634e0ae0dfbc607	{"name": "product_image/team_1_orPM0Zx.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [390, 450]}
sorl-thumbnail||image||858d0cad4c36874d089dfac9fdefe635	{"name": "cache/27/3f/273fd8e8dce2c251cf374dec0604cbe2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||712ec48cb6dad331d634e0ae0dfbc607	["858d0cad4c36874d089dfac9fdefe635"]
sorl-thumbnail||image||75858fd2b930ed0e38512cca30603423	{"name": "product_image/team_3_IjVUTzi.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [390, 450]}
sorl-thumbnail||image||e6308ab51ef56fd0110061b485e3cb2b	{"name": "cache/7f/66/7f66bdef86190c35661e26b4cb4e7667.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||75858fd2b930ed0e38512cca30603423	["e6308ab51ef56fd0110061b485e3cb2b"]
sorl-thumbnail||image||eb6de76e26462929a3130263894e6e56	{"name": "product_image/team_2_aFHX6bu.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [390, 450]}
sorl-thumbnail||image||6f4ada9853a401faadd51c0f753295fc	{"name": "cache/10/9c/109c838d6f679d6520c67a20031653c8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||eb6de76e26462929a3130263894e6e56	["6f4ada9853a401faadd51c0f753295fc"]
sorl-thumbnail||image||8501be58c790e99f46f9fdc7f8d38703	{"name": "media/category_images/5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 370]}
sorl-thumbnail||image||724f5d6762e6cb99072a6df64e3c4f99	{"name": "cache/cb/78/cb78f6f496eb92737469a9b79f2d55c8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||8501be58c790e99f46f9fdc7f8d38703	["724f5d6762e6cb99072a6df64e3c4f99"]
sorl-thumbnail||image||7cce860d272e5586b43ee5746e75407e	{"name": "media/category_images/15_3qMkERX.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [270, 270]}
sorl-thumbnail||image||5220a1cbf575d7ec983807165a58ce6c	{"name": "cache/84/8d/848d9a4f3a555991a0ec22d9ebb9dc67.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||7cce860d272e5586b43ee5746e75407e	["5220a1cbf575d7ec983807165a58ce6c"]
sorl-thumbnail||image||5e964669bbc9b77f5001228ce955ac39	{"name": "product_cover_image/shoes_1.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||80dac4dc9c0e50ee3fe912cdaeafee65	{"name": "cache/b2/da/b2da56997910bae312ccda91d7d82fb0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||f882ba3a0424d4169a366c7cfd1611ed	{"name": "product_image/shoes_1_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||a6d85b52e23d52b8313315075004f731	{"name": "cache/e6/4e/e64ed7a9e190fa1b7d9dd23bdea68285.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||cbd1688a62951f5c2e957a98e68eb127	{"name": "product_image/shoes_1_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||e5e41f1207c0312e5635b85f6507098b	{"name": "cache/5c/d8/5cd89e683ee39e9aad0bbfffddf19e7e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||7781b2f51fcf0a388c9fedeefe625eff	{"name": "product_image/shoes_1_3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||2991f7b4876972d42388e067042b06c4	{"name": "cache/bc/44/bc44479cc797cc172425d041b344790d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||efa388dca22a18cb77cf99d5101f4684	{"name": "cache/03/e5/03e58f723b9c33da9735f060ad121017.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||f882ba3a0424d4169a366c7cfd1611ed	["efa388dca22a18cb77cf99d5101f4684", "a6d85b52e23d52b8313315075004f731"]
sorl-thumbnail||image||3f8f595476acd191d10965e0d93df4bd	{"name": "cache/e5/4e/e54e5956f086a4075937a79d914697f1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||cbd1688a62951f5c2e957a98e68eb127	["3f8f595476acd191d10965e0d93df4bd", "e5e41f1207c0312e5635b85f6507098b"]
sorl-thumbnail||image||196d7bf9995d91c5c5601ee3548b885c	{"name": "cache/00/11/0011ead5404215b971ad9fc9676106cb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||7781b2f51fcf0a388c9fedeefe625eff	["2991f7b4876972d42388e067042b06c4", "196d7bf9995d91c5c5601ee3548b885c"]
sorl-thumbnail||image||997ad67e02744ebd11be8ddb260939fa	{"name": "cache/84/f3/84f33de35eba2c7650a5b83803739c15.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||5e964669bbc9b77f5001228ce955ac39	["997ad67e02744ebd11be8ddb260939fa", "80dac4dc9c0e50ee3fe912cdaeafee65"]
sorl-thumbnail||image||91b0727be60beeaacfdfb78dce599897	{"name": "product_image/shoes_1_5.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||e4a3129d3e227b4bf440145a69eb296d	{"name": "cache/49/c3/49c315208d55d5865064a45b21f6736c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||91b0727be60beeaacfdfb78dce599897	["e4a3129d3e227b4bf440145a69eb296d"]
sorl-thumbnail||image||ae1fdf30295df47864d7f70fbef47572	{"name": "product_image/shoes_1_1_7fAbgD5.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||b5bc423b2e262e8832e6b5a2c1f412b8	{"name": "cache/b5/25/b525c3ea84a08c68fa1ed0d7c376a2be.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||ae1fdf30295df47864d7f70fbef47572	["b5bc423b2e262e8832e6b5a2c1f412b8"]
sorl-thumbnail||image||27467009e5e6e7cc1ae72697f32d5b5b	{"name": "product_image/shoes_1_5_ROiRlCs.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||58c80115ddd2d307bfa7962cb9d2431c	{"name": "cache/fc/fa/fcfaca7a44debe9b8e012378b5337e75.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||27467009e5e6e7cc1ae72697f32d5b5b	["58c80115ddd2d307bfa7962cb9d2431c"]
sorl-thumbnail||image||ab1cad5d06aafde0757850d7252c6cf3	{"name": "product_image/shoes_1_5_xSAVtLn.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||7c07974ccd2376987da8e6688332fa09	{"name": "cache/cd/a5/cda5c216e740b966d53c207bb161d703.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||ab1cad5d06aafde0757850d7252c6cf3	["7c07974ccd2376987da8e6688332fa09"]
sorl-thumbnail||image||75ef4277d22e122de480ab27a485aabe	{"name": "product_image/shoes_1_1_G0JouyE.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||8c143b7adcd044243ba655db15803cae	{"name": "cache/e2/dc/e2dc9ab01153b598f7bd96ae4b654215.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||75ef4277d22e122de480ab27a485aabe	["8c143b7adcd044243ba655db15803cae"]
sorl-thumbnail||image||16ec1d04a50fb18c62c8bfbc7348ea81	{"name": "product_cover_image/shoes_2.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||df9120816873dbb37402eb65a65842d4	{"name": "cache/05/91/0591d00e5cd156ba0157f8a64252b421.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||36d424ff74faa83f62f4868958d6c5c8	{"name": "product_image/shoes_2_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||e0070c70aeae7c388c61571c856063a3	{"name": "cache/f5/bf/f5bf97494a85b1ba23ee182d5095895c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||36d424ff74faa83f62f4868958d6c5c8	["e0070c70aeae7c388c61571c856063a3"]
sorl-thumbnail||image||6c444b0f2a4ea287c8c17aefbbf9201a	{"name": "product_image/shoes_2_4.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||79573bbd6fbf018b5ea8a326250b7cfc	{"name": "cache/6a/53/6a5382cd6d7c84ff4b2b15a43c0a3340.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||6c444b0f2a4ea287c8c17aefbbf9201a	["79573bbd6fbf018b5ea8a326250b7cfc"]
sorl-thumbnail||image||570706567b905587c554c6baa626fbf8	{"name": "product_image/shoes_2_3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||0bda5432d22b671a2acf223cee6989c1	{"name": "cache/69/25/6925c06d07f88068597c0127e3763745.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||570706567b905587c554c6baa626fbf8	["0bda5432d22b671a2acf223cee6989c1"]
sorl-thumbnail||image||2947c03fc830b88a46c9a139908c06dc	{"name": "product_image/2_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||505805d77ffd5f2d2100c22f148c1d57	{"name": "cache/b8/9d/b89dd64828d9e08dbf490123281d2ab2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||2947c03fc830b88a46c9a139908c06dc	["505805d77ffd5f2d2100c22f148c1d57"]
sorl-thumbnail||image||9a182323c6d03dc1b3366281e00a70f6	{"name": "cache/72/b4/72b41aed3c769cf8d2ae4f4cf183d7ee.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||16ec1d04a50fb18c62c8bfbc7348ea81	["df9120816873dbb37402eb65a65842d4", "9a182323c6d03dc1b3366281e00a70f6"]
sorl-thumbnail||image||808471dd26b5af054e36e21fee9b686b	{"name": "product_cover_image/acg-air-desch\\u00fctz-sandals-Khb2Xc.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||263a9a0cd769ada470bd6a7c7cd549f2	{"name": "cache/4e/ae/4eaed4aa81702e8946bf62a87b6bd514.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||7d6a218b91c8643e66ea8e376184a1be	{"name": "product_cover_image/air-force-1-crater-flyknit-mens-shoes-k3Jwmd.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||e5e0cef4f79cc2ca440f7ab1dcf5f82b	{"name": "cache/94/14/9414e97faa897c06ce78482454e46cfb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||a4045eff68a0a5bc745c4bac3d874b99	{"name": "cache/f8/2b/f82b3487eed3af15653a99db4a2c88dc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||808471dd26b5af054e36e21fee9b686b	["a4045eff68a0a5bc745c4bac3d874b99", "263a9a0cd769ada470bd6a7c7cd549f2"]
sorl-thumbnail||image||c6314a70e0e84ce8d04a93a1a521d64b	{"name": "cache/66/d1/66d15a8cae0e9163c8d174376f0b7c1d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||7d6a218b91c8643e66ea8e376184a1be	["e5e0cef4f79cc2ca440f7ab1dcf5f82b", "c6314a70e0e84ce8d04a93a1a521d64b"]
sorl-thumbnail||image||70493ee755b2feaf52c669392adf50b1	{"name": "product_cover_image/af-1-1-mens-shoes-wr9kNq.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||80766730dda00343b4659ddbc6e68067	{"name": "cache/9c/e9/9ce97b68d4f836be80014868022ad43d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||0af666fa4824ca71216c60c65e175180	{"name": "product_cover_image/air-vapormax-2021-fk-womens-shoe-1WB8SL.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||c84131fffb74f8f1c249891b2b74280d	{"name": "cache/e5/f5/e5f5b21696fad9bd092e003f7aeba288.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||0af666fa4824ca71216c60c65e175180	["c84131fffb74f8f1c249891b2b74280d"]
sorl-thumbnail||image||fbdb331555f978f46e6e3ed8d0ec7bd1	{"name": "product_cover_image/air-vapormax-2021-fk-womens-shoe-1WB8SL_aOHxuAX.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||0b8a778272e9153b82f64f8553365598	{"name": "cache/c0/e1/c0e10157935a15ebffe3014e294f98cd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||a6a36063a0bf5fdd87aa62cd42e02a11	{"name": "product_cover_image/air-vapormax-plus-womens-shoe-xbt7zf.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||8ea53108a29d5e05061c7a203199aee2	{"name": "cache/25/9a/259a697abcdd7e00d691ba072c6f1037.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||6539b49a8490a2c229ddde103b35d67c	{"name": "product_image/shoes_2_1_78dtPSg.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||b30551d2e10870909f41d4624a92d085	{"name": "cache/aa/67/aa67eddc25dfb728ce969d857f168cfd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||6539b49a8490a2c229ddde103b35d67c	["b30551d2e10870909f41d4624a92d085"]
sorl-thumbnail||image||a0efbe7ebea4f0912ed7c5df09990349	{"name": "product_image/shoes_2_3_mDXsfaZ.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||e513af3f66a5ff050b39e13da3174e26	{"name": "cache/86/1f/861fdb94483da4d527501b479e09294a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||a0efbe7ebea4f0912ed7c5df09990349	["e513af3f66a5ff050b39e13da3174e26"]
sorl-thumbnail||image||6a18c97f7f4f34c0ba6b3ab8aad912f5	{"name": "product_image/shoes_2_4_TBd8las.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||thumbnails||70493ee755b2feaf52c669392adf50b1	["80766730dda00343b4659ddbc6e68067", "5fab98ccdb11329b4c5e9be5da3b9c04"]
sorl-thumbnail||thumbnails||fbdb331555f978f46e6e3ed8d0ec7bd1	["0b8a778272e9153b82f64f8553365598", "62332e230ce136b0aeaefe41b5b8b01d"]
sorl-thumbnail||thumbnails||63ab6f05730262260827b5164a096d59	["153bb68a48255e9d4da5a5792d896cd8", "759921fd58c8b024af4e116ced833289"]
sorl-thumbnail||image||f3b3a89fcb076fba7a543d6ac5e51fc8	{"name": "cache/04/9e/049e129f950dc7c783d4ccbfbc914ab3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||6a18c97f7f4f34c0ba6b3ab8aad912f5	["f3b3a89fcb076fba7a543d6ac5e51fc8"]
sorl-thumbnail||image||391986ac2c575d353f8088b306855d72	{"name": "product_image/2_2_4ljPHJ7.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||bb4111b029da0b0d690aef391ede4eeb	{"name": "cache/7b/fc/7bfcafead4e8b0974e7bf5ed55370ce1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||391986ac2c575d353f8088b306855d72	["bb4111b029da0b0d690aef391ede4eeb"]
sorl-thumbnail||image||9ad6e2720671addab3c7b9770d73565a	{"name": "product_image/af-1-1-mens-shoes-wr9kNq_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||02011fd7568a6b27e54729e58fc68c25	{"name": "cache/af/80/af807b4fb1b6d9aed2dc553c5d89f034.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||9ad6e2720671addab3c7b9770d73565a	["02011fd7568a6b27e54729e58fc68c25"]
sorl-thumbnail||image||5bfe5b1708976688ccaab3c495f0ad49	{"name": "product_image/af-1-1-mens-shoes-wr9kNq.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||ae4bbe694876e570ded2525a06af9917	{"name": "cache/f0/aa/f0aa456f396baaeb90ca9709663d3ca6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||5bfe5b1708976688ccaab3c495f0ad49	["ae4bbe694876e570ded2525a06af9917"]
sorl-thumbnail||image||da6785530719f656543dbb8921d0512e	{"name": "product_image/af-1-1-mens-shoes-wr9kNq_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||9aba7b606c61508e4182b2046171bccb	{"name": "cache/df/0e/df0ebd2efc39aa785fd3d4901a9dbd89.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||da6785530719f656543dbb8921d0512e	["9aba7b606c61508e4182b2046171bccb"]
sorl-thumbnail||image||e131bd2cd4778a4efcb80edf780d2015	{"name": "product_image/af-1-1-mens-shoes-wr9kNq_3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||de01e794f717d203d3f940ef9199d9b9	{"name": "cache/09/79/09792faabc4b8c134c802be3ceffe6f4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||e131bd2cd4778a4efcb80edf780d2015	["de01e794f717d203d3f940ef9199d9b9"]
sorl-thumbnail||image||5fab98ccdb11329b4c5e9be5da3b9c04	{"name": "cache/93/a2/93a204a31c616771edb623ff800ddc79.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||image||62332e230ce136b0aeaefe41b5b8b01d	{"name": "cache/49/93/4993183ac844ca1e4a7c3e744416ce56.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||image||62190e1f4f067bb3b43452996d836fd3	{"name": "product_image/air-vapormax-2021-fk-womens-shoe-1WB8SL.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||c30b78806b58757f565a9b892e3b0fb8	{"name": "cache/7c/3f/7c3fe6c4179763be43ee3ba1ee3d3254.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||62190e1f4f067bb3b43452996d836fd3	["c30b78806b58757f565a9b892e3b0fb8"]
sorl-thumbnail||image||617ee83193644eebb07af00ca9d55e69	{"name": "product_image/air-vapormax-plus-womens-shoe-xbt7zf_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||f98b82a50ca615bd48d5a654c3afe25f	{"name": "cache/46/98/4698b696fc68e3cd48ba7726999d2f3f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||617ee83193644eebb07af00ca9d55e69	["f98b82a50ca615bd48d5a654c3afe25f"]
sorl-thumbnail||image||ffa108ba68895223046c4cf79c41835b	{"name": "product_image/air-vapormax-plus-womens-shoe-xbt7zf_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||ba5586d95c9e2a58b0fab8d8598a9560	{"name": "cache/79/8f/798f6286798d41eef963b94c3501e09a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||ffa108ba68895223046c4cf79c41835b	["ba5586d95c9e2a58b0fab8d8598a9560"]
sorl-thumbnail||image||1a3c93c32053ee4e4f157bfd38b494dd	{"name": "product_image/air-vapormax-plus-womens-shoe-xbt7zf_3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||8816e9af15b7d419f34f33ca71618092	{"name": "cache/3a/4a/3a4ab49d4125ede03ccdbf0dadf9b5c0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||1a3c93c32053ee4e4f157bfd38b494dd	["8816e9af15b7d419f34f33ca71618092"]
sorl-thumbnail||image||157992ea990f3c3a0f8c25791781a074	{"name": "cache/dc/c0/dcc0314c06ac67d1de2064be48431dac.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||a6a36063a0bf5fdd87aa62cd42e02a11	["157992ea990f3c3a0f8c25791781a074", "8ea53108a29d5e05061c7a203199aee2"]
sorl-thumbnail||image||940584eb0f7eb3718119120bc1b6d2fc	{"name": "product_image/air-vapormax-plus-womens-shoe-xbt7zf.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||9fa0ced4a3a26d345cc4549fc9f08e7b	{"name": "cache/16/75/16757161a9d12f70744348f433db679d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||940584eb0f7eb3718119120bc1b6d2fc	["9fa0ced4a3a26d345cc4549fc9f08e7b"]
sorl-thumbnail||image||88982a0708c206ce2833dee838cadf97	{"name": "product_cover_image/sportswear-club-mens-shorts-3T0Vmz.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||884267d16c0a43b1c0d33fbbf7d96f0e	{"name": "cache/f5/ba/f5bac9bf67d423a6d74aaa39b770ef3c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||88982a0708c206ce2833dee838cadf97	["884267d16c0a43b1c0d33fbbf7d96f0e"]
sorl-thumbnail||image||a509d6879a52fc68fe90fae9de3bafd3	{"name": "product_cover_image/hayward-2-backpack-x1mPSt.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||46fba0e6afa73eb78d81322505281afc	{"name": "cache/b3/13/b31322b41ecc4b54a47f9607e92b55b7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||6a30bd0c3fcd3dc8124000d51d6792f2	{"name": "product_cover_image/liverpool-fc-dri-fit-reversible-soccer-bucket-hat-3v1p2N.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||a435783398a5a4325af2f7e240ffca14	{"name": "cache/5a/52/5a520f1cd8ba1bd1a8001c0c3e139333.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||6a30bd0c3fcd3dc8124000d51d6792f2	["a435783398a5a4325af2f7e240ffca14"]
sorl-thumbnail||image||a2cb0aaeb63e1ce72a6c69ab9abc2861	{"name": "product_cover_image/air-mens-unlined-anorak-0Xl7Fl.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||1411593a7936fce70033dbd2b30ef16d	{"name": "cache/57/78/57788604a84f2535e6d48282fe231e51.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||eb38b3eee265eeeeb3086d74bde01eb8	{"name": "product_cover_image/therma-fit-mens-baseball-hoodie-mWtpjl.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||81be3d8109cdaa8a14a846032db1ea56	{"name": "cache/25/d1/25d1514a37e141e0918672dbbe7e70ce.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||2d273f9c5b5c876d1068d7db7ad9f022	{"name": "product_cover_image/jordan-backpack-large-nMPjn1.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||10324f926bd1e570df431300a4975e03	{"name": "cache/8a/23/8a23a9d1c6a220cd961b717ef2e9be36.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||c5598e9a9ec3dc9d788f86bfefbcabcc	{"name": "product_cover_image/air-womens-woven-high-rise-shorts-DVdqQl.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||cba172870c3c64515c954d31d5b08381	{"name": "cache/9a/e7/9ae777b4a69f9ee3266c7a0360f52bed.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||63ab6f05730262260827b5164a096d59	{"name": "product_cover_image/fuel-pack-lunch-bag-JqCmcz.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||153bb68a48255e9d4da5a5792d896cd8	{"name": "cache/0b/05/0b05e087fe5efb04f61533ac53f6963b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||90fe3f1105f5176716be91d8d13c686d	{"name": "product_cover_image/heritage-backpack-Km4CVJ.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||a7b8e5de06f15f2b7e50b9aeb4ed75e5	{"name": "cache/b5/c9/b5c9400e10beed547fb9fd7cc6612c6b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||90fe3f1105f5176716be91d8d13c686d	["a7b8e5de06f15f2b7e50b9aeb4ed75e5"]
sorl-thumbnail||image||c49cda55a92fee5e53b30fd03f9c9f80	{"name": "product_cover_image/sportswear-womens-muscle-tank-QF3zD8.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||6c64d4d3dceed121aa2e30e1da8af863	{"name": "cache/3f/06/3f06089ae840d2473807d6bd131662e6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||c49cda55a92fee5e53b30fd03f9c9f80	["6c64d4d3dceed121aa2e30e1da8af863"]
sorl-thumbnail||image||8140ec053afa373f9fa9ff7a5aefa350	{"name": "product_cover_image/sportswear-womens-t-shirt-2VkPMF.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||0d467be876cb3b9f647f37a2a33176b5	{"name": "cache/80/de/80de2f9c2d42546b5ce42a3339a81ed7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||8140ec053afa373f9fa9ff7a5aefa350	["0d467be876cb3b9f647f37a2a33176b5"]
sorl-thumbnail||image||071e982df963059ac968f8064b21c777	{"name": "product_cover_image/sportswear-essential-womens-t-shirt-mzhbh0.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||2c8f0c1c344ac39079aa213f248ed69e	{"name": "cache/14/30/14309eb80f6dc5f24110e3f87dafb74d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||image||24ed1be9bdc5e0c15529609b3f7b7c29	{"name": "product_cover_image/sportswear-swoosh-womens-woven-jacket-1b4wg6.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||47f8f0c20b3dc0fe7aa95ead45e7475a	{"name": "cache/35/8f/358ff0313cbf855f7a8006532688938f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||24ed1be9bdc5e0c15529609b3f7b7c29	["47f8f0c20b3dc0fe7aa95ead45e7475a"]
sorl-thumbnail||image||f72d495d82f81466d49d1d6f9d15f44a	{"name": "product_cover_image/sportswear-essential-womens-high-waisted-leggings-8H2nDD.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||39bb2abf9a144ad6fa78dc5a3b8dfa8d	{"name": "cache/a1/88/a18868e0accb21891a5131631b9d2ee5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [370, 347]}
sorl-thumbnail||thumbnails||f72d495d82f81466d49d1d6f9d15f44a	["39bb2abf9a144ad6fa78dc5a3b8dfa8d"]
sorl-thumbnail||image||d7faaaac6c8e39e7b9f365d77d511464	{"name": "cache/12/6f/126f4fb0524f51553c4f846bc5a5b752.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||c5598e9a9ec3dc9d788f86bfefbcabcc	["d7faaaac6c8e39e7b9f365d77d511464", "cba172870c3c64515c954d31d5b08381"]
sorl-thumbnail||image||759921fd58c8b024af4e116ced833289	{"name": "cache/32/92/329255229ddc1c24c117af6b5c11d066.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||071e982df963059ac968f8064b21c777	["407894f0154c48d4cc3bd1a963482ff0", "2c8f0c1c344ac39079aa213f248ed69e"]
sorl-thumbnail||thumbnails||a509d6879a52fc68fe90fae9de3bafd3	["df08dbdb3684f0775bd80b55b19f1489", "46fba0e6afa73eb78d81322505281afc"]
sorl-thumbnail||thumbnails||a2cb0aaeb63e1ce72a6c69ab9abc2861	["1411593a7936fce70033dbd2b30ef16d", "dea714160802f5ff887fa28ca4a0fa6b"]
sorl-thumbnail||thumbnails||2d273f9c5b5c876d1068d7db7ad9f022	["10324f926bd1e570df431300a4975e03", "2e98f26d101539c4de024e53a94c16e8"]
sorl-thumbnail||image||b639b9a092e1699138f70af1c7c6ef2c	{"name": "product_image/air-mens-unlined-anorak-0Xl7Fl_mo04bfK.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||bf3d2ea2aaa1d8af5f60561e7e14bca8	{"name": "cache/99/b5/99b5e14e9cf14ae50d61be9eb6a3cba2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||b639b9a092e1699138f70af1c7c6ef2c	["bf3d2ea2aaa1d8af5f60561e7e14bca8"]
sorl-thumbnail||image||74412a0539e68004995817dcd43d8729	{"name": "product_image/air-womens-woven-high-rise-shorts-DVdqQl.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||4dec2be2f69352af1fcb21ed1e99a432	{"name": "cache/b4/ee/b4ee6a30f798de69e1a7aec2a847457f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||74412a0539e68004995817dcd43d8729	["4dec2be2f69352af1fcb21ed1e99a432"]
sorl-thumbnail||image||8bc743c24a01e2c3f71344afdb799804	{"name": "product_image/air-womens-woven-high-rise-shorts-DVdqQl_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||40f4f06015ce0b796ac17d47b66080c5	{"name": "cache/91/f4/91f45472434390f19b919bd185fb0668.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||8bc743c24a01e2c3f71344afdb799804	["40f4f06015ce0b796ac17d47b66080c5"]
sorl-thumbnail||image||af90cc0ea8cf0944be105207008093c4	{"name": "product_image/air-womens-woven-high-rise-shorts-DVdqQl_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||5579dbe42faa035c67042468ac192bf0	{"name": "cache/00/ce/00ce4eeb1c58eaa5c6cb3f0e8ad8d944.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||af90cc0ea8cf0944be105207008093c4	["5579dbe42faa035c67042468ac192bf0"]
sorl-thumbnail||image||2d3e0017596336f2e9c40d4e85376176	{"name": "product_image/air-womens-woven-high-rise-shorts-DVdqQl_3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||42930f7f67e66d4b6bde998708f104cb	{"name": "cache/a6/83/a68330f688ae02503be3baf0a82823e8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||2d3e0017596336f2e9c40d4e85376176	["42930f7f67e66d4b6bde998708f104cb"]
sorl-thumbnail||image||3635eca12bae4e909cc06acba1822c19	{"name": "product_image/fuel-pack-lunch-bag-JqCmcz.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||17ae74326a7fad4f7ffc704d07cd5db3	{"name": "cache/f9/6b/f96b2a6ab6438452e27dbfbf87378079.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||3635eca12bae4e909cc06acba1822c19	["17ae74326a7fad4f7ffc704d07cd5db3"]
sorl-thumbnail||image||b2aef58b2c79424e49b6cb45b3c33b0d	{"name": "product_image/fuel-pack-lunch-bag-JqCmcz_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||44a6df335548a5346b4165c590cc2361	{"name": "cache/6d/44/6d44be2707204c7e622e271b3717f196.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||b2aef58b2c79424e49b6cb45b3c33b0d	["44a6df335548a5346b4165c590cc2361"]
sorl-thumbnail||image||6e5927b2a85279debdcad4a9a408e3f2	{"name": "product_image/fuel-pack-lunch-bag-JqCmcz_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||b9c8ce160de6a4b33a2640992e176dcf	{"name": "cache/5f/70/5f7080bd4f1436b06c9e8c840afe7de6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||6e5927b2a85279debdcad4a9a408e3f2	["b9c8ce160de6a4b33a2640992e176dcf"]
sorl-thumbnail||image||f058ff8aa5610adba4e9efedc86c452c	{"name": "product_image/fuel-pack-lunch-bag-JqCmcz_3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [864, 1080]}
sorl-thumbnail||image||d0398a75297a2ec092a30a93c2828a72	{"name": "cache/c9/78/c978af1f6b3f652dfb53dd5ca9b45c73.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||f058ff8aa5610adba4e9efedc86c452c	["d0398a75297a2ec092a30a93c2828a72"]
sorl-thumbnail||image||407894f0154c48d4cc3bd1a963482ff0	{"name": "cache/10/3f/103f87372aa72c294dc9656432e2e3c7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||image||7f5aa6f1865893924deaf3cb91f2e9b2	{"name": "cache/37/1e/371e9b001791d666004cb0d01c1bb5cd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||thumbnails||eb38b3eee265eeeeb3086d74bde01eb8	["7f5aa6f1865893924deaf3cb91f2e9b2", "81be3d8109cdaa8a14a846032db1ea56"]
sorl-thumbnail||image||df08dbdb3684f0775bd80b55b19f1489	{"name": "cache/26/d8/26d808bcdc07ef0946e65512531e5c98.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||image||dea714160802f5ff887fa28ca4a0fa6b	{"name": "cache/2c/1a/2c1ac39b78af6c318b88895c06abce7b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
sorl-thumbnail||image||2e98f26d101539c4de024e53a94c16e8	{"name": "cache/3a/66/3a6668c165bbdb93f0fc1bc6bb118b26.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [434, 542]}
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 9, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 164, true);


--
-- Name: blog_blog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.blog_blog_category_id_seq', 12, true);


--
-- Name: blog_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.blog_blog_id_seq', 6, true);


--
-- Name: blog_blog_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.blog_blog_tags_id_seq', 18, true);


--
-- Name: blog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.blog_category_id_seq', 4, true);


--
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.blog_comment_id_seq', 12, true);


--
-- Name: blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.blog_tag_id_seq', 4, true);


--
-- Name: core_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.core_contact_id_seq', 6, true);


--
-- Name: core_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.core_subscriber_id_seq', 1, true);


--
-- Name: core_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.core_team_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 354, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, true);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, true);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 2, true);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 41, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 68, true);


--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, false);


--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, false);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.order_order_id_seq', 6, true);


--
-- Name: order_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.order_orderitem_id_seq', 24, true);


--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.order_shippingaddress_id_seq', 1, false);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_category_id_seq', 19, true);


--
-- Name: products_category_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_category_products_id_seq', 27, true);


--
-- Name: products_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_city_id_seq', 5, true);


--
-- Name: products_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_color_id_seq', 10, true);


--
-- Name: products_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_image_id_seq', 71, true);


--
-- Name: products_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_price_id_seq', 5, true);


--
-- Name: products_product_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_product_colors_id_seq', 95, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_product_id_seq', 59, true);


--
-- Name: products_product_prices_range_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_product_prices_range_id_seq', 54, true);


--
-- Name: products_product_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_product_sizes_id_seq', 155, true);


--
-- Name: products_product_sortsby_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_product_sortsby_id_seq', 57, true);


--
-- Name: products_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_review_id_seq', 20, true);


--
-- Name: products_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_size_id_seq', 48, true);


--
-- Name: products_sortby_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.products_sortby_id_seq', 4, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db_user
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 3, true);


--
-- Name: accounts_user accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: blog_blog_category blog_blog_category_blog_id_category_id_09d1bbb8_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_category
    ADD CONSTRAINT blog_blog_category_blog_id_category_id_09d1bbb8_uniq UNIQUE (blog_id, category_id);


--
-- Name: blog_blog_category blog_blog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_category
    ADD CONSTRAINT blog_blog_category_pkey PRIMARY KEY (id);


--
-- Name: blog_blog blog_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog
    ADD CONSTRAINT blog_blog_pkey PRIMARY KEY (id);


--
-- Name: blog_blog blog_blog_slug_key; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog
    ADD CONSTRAINT blog_blog_slug_key UNIQUE (slug);


--
-- Name: blog_blog_tags blog_blog_tags_blog_id_tag_id_211c6be5_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_blog_id_tag_id_211c6be5_uniq UNIQUE (blog_id, tag_id);


--
-- Name: blog_blog_tags blog_blog_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_pkey PRIMARY KEY (id);


--
-- Name: blog_category blog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_category
    ADD CONSTRAINT blog_category_pkey PRIMARY KEY (id);


--
-- Name: blog_comment blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- Name: blog_tag blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_tag
    ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (id);


--
-- Name: core_contact core_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.core_contact
    ADD CONSTRAINT core_contact_pkey PRIMARY KEY (id);


--
-- Name: core_subscriber core_subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.core_subscriber
    ADD CONSTRAINT core_subscriber_pkey PRIMARY KEY (id);


--
-- Name: core_team core_team_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.core_team
    ADD CONSTRAINT core_team_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: jet_bookmark jet_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);


--
-- Name: jet_pinnedapplication jet_pinnedapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: order_orderitem order_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_orderitem
    ADD CONSTRAINT order_orderitem_pkey PRIMARY KEY (id);


--
-- Name: order_shippingaddress order_shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_shippingaddress
    ADD CONSTRAINT order_shippingaddress_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_category_products products_category_products_category_id_product_id_10ddb6d2_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category_products
    ADD CONSTRAINT products_category_products_category_id_product_id_10ddb6d2_uniq UNIQUE (category_id, product_id);


--
-- Name: products_category_products products_category_products_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category_products
    ADD CONSTRAINT products_category_products_pkey PRIMARY KEY (id);


--
-- Name: products_city products_city_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_city
    ADD CONSTRAINT products_city_pkey PRIMARY KEY (id);


--
-- Name: products_color products_color_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_color
    ADD CONSTRAINT products_color_pkey PRIMARY KEY (id);


--
-- Name: products_image products_image_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_image
    ADD CONSTRAINT products_image_pkey PRIMARY KEY (id);


--
-- Name: products_price products_price_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_price
    ADD CONSTRAINT products_price_pkey PRIMARY KEY (id);


--
-- Name: products_product_colors products_product_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_colors
    ADD CONSTRAINT products_product_colors_pkey PRIMARY KEY (id);


--
-- Name: products_product_colors products_product_colors_product_id_color_id_28f4cef1_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_colors
    ADD CONSTRAINT products_product_colors_product_id_color_id_28f4cef1_uniq UNIQUE (product_id, color_id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product_prices_range products_product_prices_range_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_prices_range
    ADD CONSTRAINT products_product_prices_range_pkey PRIMARY KEY (id);


--
-- Name: products_product_prices_range products_product_prices_range_product_id_price_id_a19d1857_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_prices_range
    ADD CONSTRAINT products_product_prices_range_product_id_price_id_a19d1857_uniq UNIQUE (product_id, price_id);


--
-- Name: products_product_sizes products_product_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sizes
    ADD CONSTRAINT products_product_sizes_pkey PRIMARY KEY (id);


--
-- Name: products_product_sizes products_product_sizes_product_id_size_id_1c8c3d5d_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sizes
    ADD CONSTRAINT products_product_sizes_product_id_size_id_1c8c3d5d_uniq UNIQUE (product_id, size_id);


--
-- Name: products_product products_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_slug_key UNIQUE (slug);


--
-- Name: products_product_sortsby products_product_sortsby_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sortsby
    ADD CONSTRAINT products_product_sortsby_pkey PRIMARY KEY (id);


--
-- Name: products_product_sortsby products_product_sortsby_product_id_sortby_id_5b050fa1_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sortsby
    ADD CONSTRAINT products_product_sortsby_product_id_sortby_id_5b050fa1_uniq UNIQUE (product_id, sortby_id);


--
-- Name: products_review products_review_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_pkey PRIMARY KEY (id);


--
-- Name: products_size products_size_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_size
    ADD CONSTRAINT products_size_pkey PRIMARY KEY (id);


--
-- Name: products_sortby products_sortby_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_sortby
    ADD CONSTRAINT products_sortby_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: blog_blog_author_id_8791af69; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_blog_author_id_8791af69 ON public.blog_blog USING btree (author_id);


--
-- Name: blog_blog_category_blog_id_32e697d6; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_blog_category_blog_id_32e697d6 ON public.blog_blog_category USING btree (blog_id);


--
-- Name: blog_blog_category_category_id_b75468f3; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_blog_category_category_id_b75468f3 ON public.blog_blog_category USING btree (category_id);


--
-- Name: blog_blog_slug_4812aa2c_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_blog_slug_4812aa2c_like ON public.blog_blog USING btree (slug varchar_pattern_ops);


--
-- Name: blog_blog_tags_blog_id_e4cd5f6a; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_blog_tags_blog_id_e4cd5f6a ON public.blog_blog_tags USING btree (blog_id);


--
-- Name: blog_blog_tags_tag_id_36a3abc6; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_blog_tags_tag_id_36a3abc6 ON public.blog_blog_tags USING btree (tag_id);


--
-- Name: blog_comment_blog_id_c664fb0d; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_comment_blog_id_c664fb0d ON public.blog_comment USING btree (blog_id);


--
-- Name: blog_comment_parent_id_f2a027bb; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX blog_comment_parent_id_f2a027bb ON public.blog_comment USING btree (parent_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: order_order_customer_id_5bbbd957; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX order_order_customer_id_5bbbd957 ON public.order_order USING btree (customer_id);


--
-- Name: order_orderitem_order_id_aba34f44; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX order_orderitem_order_id_aba34f44 ON public.order_orderitem USING btree (order_id);


--
-- Name: order_orderitem_product_id_c5c6b07a; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX order_orderitem_product_id_c5c6b07a ON public.order_orderitem USING btree (product_id);


--
-- Name: order_shippingaddress_customer_id_db31a874; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX order_shippingaddress_customer_id_db31a874 ON public.order_shippingaddress USING btree (customer_id);


--
-- Name: order_shippingaddress_order_id_2030a3eb; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX order_shippingaddress_order_id_2030a3eb ON public.order_shippingaddress USING btree (order_id);


--
-- Name: products_category_category_id_0ebb1529; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_category_category_id_0ebb1529 ON public.products_category USING btree (category_id);


--
-- Name: products_category_products_category_id_82be5cc1; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_category_products_category_id_82be5cc1 ON public.products_category_products USING btree (category_id);


--
-- Name: products_category_products_product_id_55d966f7; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_category_products_product_id_55d966f7 ON public.products_category_products USING btree (product_id);


--
-- Name: products_image_product_id_978188e9; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_image_product_id_978188e9 ON public.products_image USING btree (product_id);


--
-- Name: products_product_colors_color_id_27abec57; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_colors_color_id_27abec57 ON public.products_product_colors USING btree (color_id);


--
-- Name: products_product_colors_product_id_af745b3e; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_colors_product_id_af745b3e ON public.products_product_colors USING btree (product_id);


--
-- Name: products_product_prices_range_price_id_bb689c29; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_prices_range_price_id_bb689c29 ON public.products_product_prices_range USING btree (price_id);


--
-- Name: products_product_prices_range_product_id_64287928; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_prices_range_product_id_64287928 ON public.products_product_prices_range USING btree (product_id);


--
-- Name: products_product_sizes_product_id_7cf7aa08; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_sizes_product_id_7cf7aa08 ON public.products_product_sizes USING btree (product_id);


--
-- Name: products_product_sizes_size_id_e0cab160; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_sizes_size_id_e0cab160 ON public.products_product_sizes USING btree (size_id);


--
-- Name: products_product_slug_70d3148d_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_slug_70d3148d_like ON public.products_product USING btree (slug varchar_pattern_ops);


--
-- Name: products_product_sortsby_product_id_e9bf6751; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_sortsby_product_id_e9bf6751 ON public.products_product_sortsby USING btree (product_id);


--
-- Name: products_product_sortsby_sortby_id_ad93a695; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_product_sortsby_sortby_id_ad93a695 ON public.products_product_sortsby USING btree (sortby_id);


--
-- Name: products_review_comment_id_2807bd47; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_review_comment_id_2807bd47 ON public.products_review USING btree (comment_id);


--
-- Name: products_review_product_id_d933ffa7; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX products_review_product_id_d933ffa7 ON public.products_review USING btree (product_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: db_user
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog blog_blog_author_id_8791af69_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog
    ADD CONSTRAINT blog_blog_author_id_8791af69_fk_accounts_user_id FOREIGN KEY (author_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog_category blog_blog_category_blog_id_32e697d6_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_category
    ADD CONSTRAINT blog_blog_category_blog_id_32e697d6_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog_category blog_blog_category_category_id_b75468f3_fk_blog_category_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_category
    ADD CONSTRAINT blog_blog_category_category_id_b75468f3_fk_blog_category_id FOREIGN KEY (category_id) REFERENCES public.blog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog_tags blog_blog_tags_blog_id_e4cd5f6a_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_blog_id_e4cd5f6a_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog_tags blog_blog_tags_tag_id_36a3abc6_fk_blog_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_tag_id_36a3abc6_fk_blog_tag_id FOREIGN KEY (tag_id) REFERENCES public.blog_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_blog_id_c664fb0d_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_blog_id_c664fb0d_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_parent_id_f2a027bb_fk_blog_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_parent_id_f2a027bb_fk_blog_comment_id FOREIGN KEY (parent_id) REFERENCES public.blog_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_customer_id_5bbbd957_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_customer_id_5bbbd957_fk_accounts_user_id FOREIGN KEY (customer_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderitem order_orderitem_order_id_aba34f44_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_orderitem
    ADD CONSTRAINT order_orderitem_order_id_aba34f44_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderitem order_orderitem_product_id_c5c6b07a_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_orderitem
    ADD CONSTRAINT order_orderitem_product_id_c5c6b07a_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingaddress order_shippingaddress_customer_id_db31a874_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_shippingaddress
    ADD CONSTRAINT order_shippingaddress_customer_id_db31a874_fk_accounts_user_id FOREIGN KEY (customer_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingaddress order_shippingaddress_order_id_2030a3eb_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.order_shippingaddress
    ADD CONSTRAINT order_shippingaddress_order_id_2030a3eb_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category products_category_category_id_0ebb1529_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_category_id_0ebb1529_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_products products_category_pr_category_id_82be5cc1_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category_products
    ADD CONSTRAINT products_category_pr_category_id_82be5cc1_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_products products_category_pr_product_id_55d966f7_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_category_products
    ADD CONSTRAINT products_category_pr_product_id_55d966f7_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_image products_image_product_id_978188e9_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_image
    ADD CONSTRAINT products_image_product_id_978188e9_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_colors products_product_col_product_id_af745b3e_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_colors
    ADD CONSTRAINT products_product_col_product_id_af745b3e_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_colors products_product_colors_color_id_27abec57_fk_products_color_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_colors
    ADD CONSTRAINT products_product_colors_color_id_27abec57_fk_products_color_id FOREIGN KEY (color_id) REFERENCES public.products_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_prices_range products_product_pri_price_id_bb689c29_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_prices_range
    ADD CONSTRAINT products_product_pri_price_id_bb689c29_fk_products_ FOREIGN KEY (price_id) REFERENCES public.products_price(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_prices_range products_product_pri_product_id_64287928_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_prices_range
    ADD CONSTRAINT products_product_pri_product_id_64287928_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_sizes products_product_siz_product_id_7cf7aa08_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sizes
    ADD CONSTRAINT products_product_siz_product_id_7cf7aa08_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_sizes products_product_sizes_size_id_e0cab160_fk_products_size_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sizes
    ADD CONSTRAINT products_product_sizes_size_id_e0cab160_fk_products_size_id FOREIGN KEY (size_id) REFERENCES public.products_size(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_sortsby products_product_sor_product_id_e9bf6751_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sortsby
    ADD CONSTRAINT products_product_sor_product_id_e9bf6751_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_sortsby products_product_sor_sortby_id_ad93a695_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_product_sortsby
    ADD CONSTRAINT products_product_sor_sortby_id_ad93a695_fk_products_ FOREIGN KEY (sortby_id) REFERENCES public.products_sortby(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_review products_review_comment_id_2807bd47_fk_products_review_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_comment_id_2807bd47_fk_products_review_id FOREIGN KEY (comment_id) REFERENCES public.products_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_review products_review_product_id_d933ffa7_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_product_id_d933ffa7_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: db_user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO db_user;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: db_user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

