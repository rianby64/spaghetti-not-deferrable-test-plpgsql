
DROP TABLE IF EXISTS "Maestra" CASCADE;
CREATE TABLE IF NOT EXISTS "Maestra"
(
  id serial NOT NULL,
  "Aux0Id" INTEGER NOT NULL,
  "Aux1Id" INTEGER NOT NULL,
  msg TEXT,
  CONSTRAINT "Maestra_pkey" PRIMARY KEY (id),
  CONSTRAINT "Maestra_Aux0Id_fkey" FOREIGN KEY ("Aux0Id")
      REFERENCES "Aux0" (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT "Maestra_Aux1Id_fkey" FOREIGN KEY ("Aux1Id")
      REFERENCES "Aux1" (id) MATCH SIMPLE
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
  RAISE NOTICE 'PERFORM showtables() <';
  PERFORM showtables();
  RAISE NOTICE 'PERFORM showtables() >';
  RETURN OLD;
END
$$ LANGUAGE plpgsql PARALLEL SAFE;

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
  RAISE NOTICE 'PERFORM showtables() <';
  PERFORM showtables();
  RAISE NOTICE 'PERFORM showtables() >';
  RETURN OLD;
END
$$ LANGUAGE plpgsql PARALLEL SAFE;

CREATE TRIGGER "Maestra_delete_after"
  AFTER DELETE
  ON "Maestra"
  FOR EACH ROW
  EXECUTE PROCEDURE maestra_delete_after();

INSERT INTO "Maestra" ("Aux0Id", "Aux1Id", msg) VALUES
  (1, 2, 'Maestra 1'),
  (2, 3, 'Maestra 2'),
  (3, 4, 'Maestra 3'),
  (4, 5, 'Maestra 3');
