\set QUIET 1
\ir ./fns.sql
\ir ./aux0aux0.sql
\ir ./aux0.sql
\ir ./aux1.sql
\ir ./maestra.sql

DO $$BEGIN
RAISE NOTICE 'DELETE FROM "Aux0" WHERE id=3;';
END$$;

INSERT INTO "Maestra" ("Aux0Id", "Aux1Id", msg) VALUES
  (3, 2, 'Maestra 11'),
  (3, 3, 'Maestra 12'),
  (3, 4, 'Maestra 13'),
  (3, 5, 'Maestra 13');

DELETE FROM "Aux0" WHERE id=3;
