\set QUIET 1

\ir ./aux0aux0.sql
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

DO $$BEGIN
RAISE NOTICE 'DELETE FROM "Aux0Aux0" WHERE id=1;';
END$$;
DELETE FROM "Aux0Aux0" WHERE id=1;

DO $$BEGIN
RAISE NOTICE 'version = %', (SELECT version());
END$$;
/*
Este es el resultado que veo en este commit

psql:inmediate.sql:10: NOTICE:  DELETE FROM "Aux0" WHERE id=3;
psql:inmediate.sql:11: NOTICE:  aux0_delete_before (3,3,"Aux0 3")
psql:inmediate.sql:11: NOTICE:  aux0_delete_before Aux0.len = 5
psql:inmediate.sql:11: NOTICE:  aux0_delete_after (3,3,"Aux0 3")
psql:inmediate.sql:11: NOTICE:  aux0_delete_after Aux0.len = 4
psql:inmediate.sql:11: NOTICE:  maestra_delete_before (3,3,4,"Maestra 3")
psql:inmediate.sql:11: NOTICE:  maestra_delete_before Aux0.len = 4 Aux1.len = 5
psql:inmediate.sql:11: NOTICE:  maestra_delete_after (3,3,4,"Maestra 3")
psql:inmediate.sql:11: NOTICE:  maestra_delete_after Aux0.len = 4 Aux1.len = 5
psql:inmediate.sql:15: NOTICE:  DELETE FROM "Aux1" WHERE id=3;
psql:inmediate.sql:16: NOTICE:  aux1_delete_before (3,"Aux1 3")
psql:inmediate.sql:16: NOTICE:  aux0_delete_before Aux1.len = 5
psql:inmediate.sql:16: NOTICE:  aux1_delete_after (3,"Aux1 3")
psql:inmediate.sql:16: NOTICE:  aux0_delete_after Aux1.len = 4
psql:inmediate.sql:16: NOTICE:  maestra_delete_before (2,2,3,"Maestra 2")
psql:inmediate.sql:16: NOTICE:  maestra_delete_before Aux0.len = 4 Aux1.len = 4
psql:inmediate.sql:16: NOTICE:  maestra_delete_after (2,2,3,"Maestra 2")
psql:inmediate.sql:16: NOTICE:  maestra_delete_after Aux0.len = 4 Aux1.len = 4
psql:inmediate.sql:20: NOTICE:  DELETE FROM "Aux0Aux0" WHERE id=1;
psql:inmediate.sql:21: NOTICE:  aux0aux0_delete_before (1,"Aux0Aux0 1")
psql:inmediate.sql:21: NOTICE:  aux0aux0_delete_before Aux0Aux0.len = 5
psql:inmediate.sql:21: NOTICE:  aux0aux0_delete_after (1,"Aux0Aux0 1")
psql:inmediate.sql:21: NOTICE:  aux0aux0_delete_after Aux0Aux0.len = 4
psql:inmediate.sql:21: NOTICE:  aux0_delete_before (1,1,"Aux0 1")
psql:inmediate.sql:21: NOTICE:  aux0_delete_before Aux0.len = 4
psql:inmediate.sql:21: NOTICE:  aux0_delete_after (1,1,"Aux0 1")
psql:inmediate.sql:21: NOTICE:  aux0_delete_after Aux0.len = 3
psql:inmediate.sql:21: NOTICE:  maestra_delete_before (1,1,2,"Maestra 1")
psql:inmediate.sql:21: NOTICE:  maestra_delete_before Aux0.len = 3 Aux1.len = 4
psql:inmediate.sql:21: NOTICE:  maestra_delete_after (1,1,2,"Maestra 1")
psql:inmediate.sql:21: NOTICE:  maestra_delete_after Aux0.len = 3 Aux1.len = 4
psql:inmediate.sql:25: NOTICE:  version = PostgreSQL 9.6.7 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-16), 64-bit

*/
