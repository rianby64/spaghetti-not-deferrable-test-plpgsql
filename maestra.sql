
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
  RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER "Maestra_delete_after"
  AFTER DELETE
  ON "Maestra"
  FOR EACH ROW
  EXECUTE PROCEDURE maestra_delete_after();

