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

SELECT DISTINCT "make_title" FROM "car_models" WHERE "make_code" = 'LAM'; --30.152 ms
SELECT DISTINCT "model_title" FROM "car_models" WHERE "make_code" = 'NISSAN' AND "model_code" = 'GT-R'; --23.142 ms

SELECT "make_code", "model_code", "model_title", "year" FROM "car_models" WHERE "make_code" = 'LAM'; --25.225 ms

SELECT * FROM "car_models" WHERE "year" BETWEEN 2010 and 2015; --78.109 ms

SELECT * FROM "car_models" WHERE "year" = 2010; --37.975 ms

--CREATE INDEX
CREATE INDEX "make_code_index" --240.583 ms
ON "car_models" ("make_code");

CREATE INDEX "model_code_index" --325.264 ms
ON "car_models" ("model_code");

CREATE INDEX "year_index" --201.326 ms
ON "car_models" ("year");

--RUN QUERIES AFTER INDEX
SELECT DISTINCT "make_title" FROM "car_models" WHERE "make_code" = 'LAM'; --1.003 ms
SELECT DISTINCT "model_title" FROM "car_models" WHERE "make_code" = 'NISSAN' AND "model_code" = 'GT-R'; --0.743 ms

SELECT "make_code", "model_code", "model_title", "year" FROM "car_models" WHERE "make_code" = 'LAM'; --1.127 ms

SELECT * FROM "car_models" WHERE "year" BETWEEN 2010 and 2015; --74.614 ms

SELECT * FROM "car_models" WHERE "year" = 2010; --16.324 ms