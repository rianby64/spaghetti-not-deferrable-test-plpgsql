
\set QUIET 1

\ir ./aux0.sql
\ir ./aux1.sql
\ir ./maestra.sql

DO $$BEGIN
RAISE NOTICE 'DELETE FROM "Aux0" WHERE id=3;';
END$$;
DELETE FROM "Aux0" WHERE id=3;

DO $$BEGIN
RAISE NOTICE 'DELETE FROM "Aux1" WHERE id=3;';
END$$;
DELETE FROM "Aux1" WHERE id=3;
