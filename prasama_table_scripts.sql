

CREATE SEQUENCE profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profile_id_seq OWNER TO prasarma;

SET default_tablespace = '';

SET default_with_oids = false;



CREATE TABLE user_profile (
    first_name text,
    last_name text,
    create_date date,
    profile_id integer DEFAULT nextval('profile_id_seq'::regclass) NOT NULL,
    age integer
);


ALTER TABLE user_profile OWNER TO prasarma;

------------------------------------------------------
CREATE SEQUENCE profile_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profile_profile_id_seq OWNER TO prasarma;

ALTER SEQUENCE profile_profile_id_seq OWNED BY user_profile.profile_id;

-------------------------------------------------------------
CREATE TABLE user_answers (
    profile_id integer NOT NULL,
    question_id integer,
    user_answer_json json
);


ALTER TABLE user_answers OWNER TO prasarma;


CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questions_id_seq OWNER TO prasarma;

ALTER SEQUENCE questions_id_seq OWNED BY user_answers.profile_id;



ALTER TABLE ONLY user_answers ALTER COLUMN profile_id SET DEFAULT nextval('questions_id_seq'::regclass);




SELECT pg_catalog.setval('profile_id_seq', 1, false);

SELECT pg_catalog.setval('profile_profile_id_seq', 1, false);

SELECT pg_catalog.setval('questions_id_seq', 1, false);


ALTER TABLE ONLY user_profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (profile_id);




ALTER TABLE ONLY user_answers
    ADD CONSTRAINT questions_pkey PRIMARY KEY (profile_id);



REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO prasarma;
GRANT ALL ON SCHEMA public TO PUBLIC;




