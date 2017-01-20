DROP USER IF EXISTS "indexed_cars_user";

CREATE USER "indexed_cars_user";

DROP DATABASE IF EXISTS "indexed_cars";

CREATE DATABASE "indexed_cars" WITH OWNER "indexed_cars_user";

\c indexed_cars;
\i scripts/car_models.sql;

\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;

SELECT DISTINCT "make_title" FROM "car_models" WHERE "make_code" = 'LAM'; --37.992 ms
SELECT DISTINCT "model_title" FROM "car_models" WHERE "make_code" = 'NISSAN' AND "model_code" = 'GT-R'; --21.912 ms

SELECT "make_code", "model_code", "model_title", "year" FROM "car_models" WHERE "make_code" = 'LAM'; --24.081 ms

SELECT * FROM "car_models" WHERE "year" BETWEEN 2010 and 2015; --99.513 ms

SELECT * FROM "car_models" WHERE "year" = 2010; --56.835 ms