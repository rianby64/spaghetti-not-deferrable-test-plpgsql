\set QUIET 1

\ir ./aux0.sql
\ir ./aux1.sql
\ir ./maestra.sql

DELETE FROM "Aux0" WHERE id=3;
