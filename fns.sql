
CREATE OR REPLACE FUNCTION showtables()
  RETURNS void AS
$$
BEGIN
  RAISE NOTICE 'Aux0Aux0 = % Aux0 = % Aux1 = % Maestra = %',
    (SELECT COUNT(id) FROM "Aux0Aux0"),
    (SELECT COUNT(id) FROM "Aux0"),
    (SELECT COUNT(id) FROM "Aux1"),
    (SELECT COUNT(id) FROM "Maestra");
END
$$ LANGUAGE plpgsql IMMUTABLE;
