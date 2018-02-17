
\set QUIET 1

\ir ./aux0.sql
\ir ./aux1.sql
\ir ./maestra.sql

DO $$BEGIN
RAISE NOTICE 'DELETE FROM "Aux0" WHERE id=3;';
END$$;
DELETE FROM "Aux0" WHERE id=3;

DO $$BEGIN
RAISE NOTICE 'DELETE FROM "Aux1" WHERE id=3;';
END$$;
DELETE FROM "Aux1" WHERE id=3;

/*
Este es el resultado que veo en este commit
Version 10.2

psql:inmediate.sql:10: NOTICE:  DELETE FROM "Aux0" WHERE id=3;
psql:inmediate.sql:11: NOTICE:  aux0_delete_before (3,"Aux0 3")
psql:inmediate.sql:11: NOTICE:  aux0_delete_after (3,"Aux0 3")
psql:inmediate.sql:11: NOTICE:  maestra_delete_before (3,3,4,"Maestra 3")
psql:inmediate.sql:11: NOTICE:  maestra_delete_after (3,3,4,"Maestra 3")
psql:inmediate.sql:15: NOTICE:  DELETE FROM "Aux1" WHERE id=3;
psql:inmediate.sql:16: NOTICE:  aux1_delete_before (3,"Aux1 3")
psql:inmediate.sql:16: NOTICE:  aux1_delete_after (3,"Aux1 3")
psql:inmediate.sql:16: NOTICE:  maestra_delete_before (2,2,3,"Maestra 2")
psql:inmediate.sql:16: NOTICE:  maestra_delete_after (2,2,3,"Maestra 2")
*/
