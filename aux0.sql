
DROP TABLE IF EXISTS "Aux0" CASCADE;
CREATE TABLE IF NOT EXISTS "Aux0"
(
  id serial NOT NULL,
  msg TEXT,
  CONSTRAINT "Aux0_pkey" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

CREATE OR REPLACE FUNCTION aux0_delete_before()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux0_delete_before %', OLD;
  RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Aux0_delete_before"
  BEFORE DELETE
  ON "Aux0"
  FOR EACH ROW
  EXECUTE PROCEDURE aux0_delete_before();

CREATE OR REPLACE FUNCTION aux0_delete_after()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux0_delete_after %', OLD;
  RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Aux0_delete_after"
  AFTER DELETE
  ON "Aux0"
  FOR EACH ROW
  EXECUTE PROCEDURE aux0_delete_after();

INSERT INTO "Aux0" (msg) VALUES
  ('Aux0 1'),
  ('Aux0 2'),
  ('Aux0 3'),
  ('Aux0 4'),
  ('Aux0 5');
