
DROP TABLE IF EXISTS "Aux1" CASCADE;
CREATE TABLE IF NOT EXISTS "Aux1"
(
  id serial NOT NULL,
  msg TEXT,
  CONSTRAINT "Aux1_pkey" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

CREATE OR REPLACE FUNCTION aux1_delete_before()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux1_delete_before %', OLD;
  PERFORM showtables();
  RETURN OLD;
END
$$ LANGUAGE plpgsql IMMUTABLE;

CREATE TRIGGER "Aux1_delete_before"
  BEFORE DELETE
  ON "Aux1"
  FOR EACH ROW
  EXECUTE PROCEDURE aux1_delete_before();

CREATE OR REPLACE FUNCTION aux1_delete_after()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux1_delete_after %', OLD;
  PERFORM showtables();
  RETURN OLD;
END
$$ LANGUAGE plpgsql IMMUTABLE;

CREATE TRIGGER "Aux1_delete_after"
  AFTER DELETE
  ON "Aux1"
  FOR EACH ROW
  EXECUTE PROCEDURE aux1_delete_after();

INSERT INTO "Aux1" (msg) VALUES
  ('Aux1 1'),
  ('Aux1 2'),
  ('Aux1 3'),
  ('Aux1 4'),
  ('Aux1 5');
