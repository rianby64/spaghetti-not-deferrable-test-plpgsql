
LOAD 'auto_explain';
set auto_explain.log_analyze = on;
set auto_explain.log_min_duration = 0;
set auto_explain.log_triggers = on;

CREATE OR REPLACE FUNCTION showtables()
  RETURNS void AS
$$
BEGIN
  RAISE NOTICE 'Aux0Aux0 = % Aux0 = % Aux1 = % Maestra = %',
    (SELECT COUNT(id) FROM "Aux0Aux0"),
    (SELECT COUNT(id) FROM "Aux0"),
    (SELECT COUNT(id) FROM "Aux1"),
    (SELECT COUNT(id) FROM "Maestra");
  RAISE NOTICE '% % % %',
    (SELECT t::text FROM "Aux0Aux0" t WHERE id=5),
    (SELECT t::text FROM "Aux0" t WHERE id=5),
    (SELECT t::text FROM "Aux1" t WHERE id=5),
    (SELECT t::text FROM "Maestra" t WHERE id=4);
END
$$ LANGUAGE plpgsql STABLE;
