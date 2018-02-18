
DROP TABLE IF EXISTS "Aux0" CASCADE;
CREATE TABLE IF NOT EXISTS "Aux0"
(
  id serial NOT NULL,
  "Aux0Aux0Id" INTEGER NOT NULL,
  msg TEXT,
  CONSTRAINT "Aux0_pkey" PRIMARY KEY (id),
  CONSTRAINT "Maestra_Aux0Aux0Id_fkey" FOREIGN KEY ("Aux0Aux0Id")
      REFERENCES "Aux0Aux0" (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);

CREATE OR REPLACE FUNCTION aux0_delete_before()
  RETURNS TRIGGER AS
$$
BEGIN
  RAISE NOTICE 'aux0_delete_before %', OLD;
  RAISE NOTICE 'PERFORM showtables() <';
  PERFORM showtables();
  RAISE NOTICE 'PERFORM showtables() >';
  RETURN OLD;
END
$$ LANGUAGE plpgsql STABLE;

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
  RAISE NOTICE 'PERFORM showtables() <';
  PERFORM showtables();
  RAISE NOTICE 'PERFORM showtables() >';
  RETURN OLD;
END
$$ LANGUAGE plpgsql STABLE;

CREATE TRIGGER "Aux0_delete_after"
  AFTER DELETE
  ON "Aux0"
  FOR EACH ROW
  EXECUTE PROCEDURE aux0_delete_after();

INSERT INTO "Aux0" (msg, "Aux0Aux0Id") VALUES
  ('Aux0 1', 1),
  ('Aux0 2', 2),
  ('Aux0 3', 3),
  ('Aux0 4', 4),
  ('Aux0 5', 5);
