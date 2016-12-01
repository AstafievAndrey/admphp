CREATE TABLE auth.organizations
(
  id serial NOT NULL,
  name text,
  CONSTRAINT organizations_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE auth.organizations
  OWNER TO postgres;

CREATE TABLE auth.roles
(
  id serial NOT NULL,
  name text,
  CONSTRAINT roles_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE auth.roles
  OWNER TO postgres;

CREATE TABLE auth.users_roles
(
  role_id integer NOT NULL,
  user_id integer NOT NULL,
  CONSTRAINT users_roles_pkey PRIMARY KEY (role_id, user_id),
  CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id)
      REFERENCES auth.roles (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id)
      REFERENCES auth.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE auth.users_roles
  OWNER TO postgres;

CREATE TABLE auth.users
(
  id serial NOT NULL,
  email text,
  password text,
  enabled boolean DEFAULT true,
  session text,
  token text,
  organization_id integer,
  CONSTRAINT users_pkey PRIMARY KEY (id),
  CONSTRAINT users_organization_id_fkey FOREIGN KEY (organization_id)
      REFERENCES auth.organizations (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE auth.users
  OWNER TO postgres;



