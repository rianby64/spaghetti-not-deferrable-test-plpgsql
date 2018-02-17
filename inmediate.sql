\set QUIET 1

\ir ./aux.sql
\ir ./maestra.sql

INSERT INTO "Aux" (msg) VALUES
  ('Aux 1'),
  ('Aux 2'),
  ('Aux 3'),
  ('Aux 4'),
  ('Aux 5');

INSERT INTO "Maestra" ("AuxId", msg) VALUES
  (1, 'Maestra 1'),
  (2, 'Maestra 2'),
  (3, 'Maestra 3');

DELETE FROM "Aux" WHERE id=3;
