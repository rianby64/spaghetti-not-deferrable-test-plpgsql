\set QUIET 1

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

CREATE OR REPLACE FUNCTION aux_delete_before()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux_delete_before %', OLD;
  RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Aux_delete_before"
  BEFORE DELETE
  ON "Aux"
  FOR EACH ROW
  EXECUTE PROCEDURE aux_delete_before();

CREATE OR REPLACE FUNCTION aux_delete_after()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux_delete_after %', OLD;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Aux_delete_after"
  AFTER DELETE
  ON "Aux"
  FOR EACH ROW
  EXECUTE PROCEDURE aux_delete_after();


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

CREATE OR REPLACE FUNCTION maestra_delete_before()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'maestra_delete_before %', OLD;
  RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Maestra_delete_before"
  BEFORE DELETE
  ON "Maestra"
  FOR EACH ROW
  EXECUTE PROCEDURE maestra_delete_before();

CREATE OR REPLACE FUNCTION maestra_delete_after()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'maestra_delete_after %', OLD;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Maestra_delete_after"
  AFTER DELETE
  ON "Maestra"
  FOR EACH ROW
  EXECUTE PROCEDURE maestra_delete_after();

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
