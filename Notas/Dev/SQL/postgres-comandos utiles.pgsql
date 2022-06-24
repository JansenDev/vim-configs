-- *encontrar un registro aleatorio
-- select * from tren
-- ORDER by random()  LIMIT 1

-- *Ver info d euna tabla
-- select column_name,data_type, column_default, is_nullable from information_schema.columns where table_name = 'estacion'
-- select * from trayecto;
-- alter table if exists trayecto
-- ADD COLUMN nombre varchar(100);

-- *consultar pasajeros unidos a un viaje
SELECT *
FROM pasajero
    JOIN viaje
    ON (pasajero.id_pasajero = viaje.id_pasajero);

-- *misma  consulta de3l anterior pero usando using
-- SELECT *
-- FROM pasajero
--     JOIN viaje USING (id_pasajero);

-- *consultar pasajeros que no hicieron un viaje
-- select * from pasajero pa
-- LEFT JOIN viaje vi  ON (pa.id_pasajero = vi.id_pasajero )
-- WHERE vi.id_viaje is NULL
-- DO $$
-- DECLARE
-- rec record := null;
-- BEGIN
-- FOR rec in select * from pasajero loop
-- RAISE NOTICE 'algo esta pasado';
-- end loop;
-- END
-- $$