\set QUIET 1

\ir ./aux.sql
\ir ./maestra.sql

DELETE FROM "Aux" WHERE id=3;
