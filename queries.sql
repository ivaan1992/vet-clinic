
SELECT * FROM Animals WHERE name LIKE '%mon';
SELECT name FROM Animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM Animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM Animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM Animals WHERE weight_kg > 10.5;
SELECT * FROM Animals WHERE neutered = TRUE;
SELECT * FROM Animals WHERE name <> 'Gabumon';
SELECT * FROM Animals WHERE weight_kg BETWEEN 10.4 AND 17.3;