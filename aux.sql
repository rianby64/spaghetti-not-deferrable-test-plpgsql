
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
  RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Aux_delete_after"
  AFTER DELETE
  ON "Aux"
  FOR EACH ROW
  EXECUTE PROCEDURE aux_delete_after();


