--iNSERT INTO test_vary_obj (data) VALUES ('[]'), ('[1,2,"a"]'), ('null'), ('1E7'), ('"abc"');
--iNSERT INTO test_vary_obj (data) VALUES ('{"MODEL":"LADA KALINA","POWER_LS":75}'),('{"MODEL":"MATIZ","POWER_LS":51}');
--iNSERT INTO test_vary_obj (data) VALUES ('{"MODEL":"LADA PRIORA","POWER_LS":102}'),('{"MODEL":"LADA KALINA","POWER_LS":85}');
--INSERT INTO test_vary_obj (data) VALUES ('{"OBJ_TYPE":1,"ADR_STREET":"Малый Афанасьевский пер.","ADR_BUILDING":7,"DIST":[{"DIST_OBJ":"м. Арабатская","DIST_VAL":5,"DIST_UNIT":"мин. пешком"},{"DIST_OBJ":"авт.ост. Арабатская пл.","DIST_VAL":200,"DIST_UNIT":"м."}]}');


--select data ->> 'MODEL', data ->> 'POWER_LS' from test_vary_obj where data @> '{"MODEL":"LADA KALINA"}'
--select data ->> 'MODEL', data ->> 'POWER_LS' from test_vary_obj where data ->> 'MODEL' like 'LADA%' and (data ->> 'POWER_LS')::int >= 85


--select data ->> 'ADR_STREET', data ->> 'ADR_BUILDING', data ->> 'DIST' from test_vary_obj  where data @> '{"OBJ_TYPE":1}'
--select data ->> 'ADR_STREET', data ->> 'ADR_BUILDING', jsonb_array_elements(data#>'{DIST}') from test_vary_obj where data @> '{"OBJ_TYPE":1}'
--select data ->> 'ADR_STREET', data ->> 'ADR_BUILDING', jsonb_array_elements(data#>'{DIST}') ->> 'DIST_OBJ', jsonb_array_elements(data#>'{DIST}') ->> 'DIST_VAL', jsonb_array_elements(data#>'{DIST}') ->> 'DIST_UNIT' from test_vary_obj where data @> '{"OBJ_TYPE":1}'
--select data ->> 'ADR_STREET', data ->> 'ADR_BUILDING', jsonb_each(data) from test_vary_obj where data @> '{"OBJ_TYPE":1}'
