
DROP TABLE IF EXISTS "Aux0Aux0" CASCADE;
CREATE TABLE IF NOT EXISTS "Aux0Aux0"
(
  id serial NOT NULL,
  msg TEXT,
  CONSTRAINT "Aux0Aux0_pkey" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

CREATE OR REPLACE FUNCTION aux0aux0_delete_before()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux0aux0_delete_before %', OLD;
  RAISE NOTICE 'PERFORM showtables() <';
  PERFORM showtables();
  RAISE NOTICE 'PERFORM showtables() >';
  RETURN OLD;
END
$$ LANGUAGE plpgsql STABLE;

CREATE TRIGGER "Aux0Aux0_delete_before"
  BEFORE DELETE
  ON "Aux0Aux0"
  FOR EACH ROW
  EXECUTE PROCEDURE aux0aux0_delete_before();

CREATE OR REPLACE FUNCTION aux0aux0_delete_after()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux0aux0_delete_after %', OLD;
  RAISE NOTICE 'PERFORM showtables() <';
  PERFORM showtables();
  RAISE NOTICE 'PERFORM showtables() >';
  RETURN OLD;
END
$$ LANGUAGE plpgsql STABLE;

CREATE TRIGGER "Aux0Aux0_delete_after"
  AFTER DELETE
  ON "Aux0Aux0"
  FOR EACH ROW
  EXECUTE PROCEDURE aux0aux0_delete_after();

INSERT INTO "Aux0Aux0" (msg) VALUES
  ('Aux0Aux0 1'),
  ('Aux0Aux0 2'),
  ('Aux0Aux0 3'),
  ('Aux0Aux0 4'),
  ('Aux0Aux0 5');
