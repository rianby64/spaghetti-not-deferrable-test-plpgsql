
DROP TABLE IF EXISTS "Aux" CASCADE;
CREATE TABLE IF NOT EXISTS "Aux"
(
  id serial NOT NULL,
  msg TEXT,
  CONSTRAINT "Aux_pkey" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


DROP TABLE IF EXISTS "Maestra" CASCADE;
CREATE TABLE IF NOT EXISTS "Maestra"
(
  id serial NOT NULL,
  "AuxId" INTEGER NOT NULL,
  msg TEXT,
  CONSTRAINT "Maestra_pkey" PRIMARY KEY (id),
  CONSTRAINT "Maestra_AuxId_fkey" FOREIGN KEY ("AuxId")
      REFERENCES "Aux" (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);

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

LOAD 'auto_explain';
set auto_explain.log_analyze = on;
set auto_explain.log_min_duration = 0;
set auto_explain.log_triggers = on;

NOTIFY virtual, '{"action":"test-start-log"}';

DELETE FROM "Aux" WHERE id=3;
NOTIFY virtual, '{"action":"test-end-log"}';
