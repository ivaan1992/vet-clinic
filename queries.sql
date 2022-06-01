
SELECT * FROM Animals WHERE name LIKE '%mon';
SELECT name FROM Animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM Animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM Animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM Animals WHERE weight_kg > 10.5;
SELECT * FROM Animals WHERE neutered = TRUE;
SELECT * FROM Animals WHERE name <> 'Gabumon';
SELECT * FROM Animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE Animals SET species = 'unspecified';
SELECT name, species FROM Animals;
ROLLBACK;
SELECT name, species FROM Animals;

BEGIN;
UPDATE Animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE Animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM Animals;
COMMIT;
SELECT * FROM Animals;

BEGIN;
DELETE FROM Animals;
SELECT * FROM Animals;
ROLLBACK;
SELECT * FROM Animals;

BEGIN;
DELETE FROM Animals WHERE date_of_birth > '2022-01-01';
SAVE TRANSACTION SP1;
UPDATE Animals SET weight_kg = weight_kg * -1;
ROLLBACK SP1;
UPDATE Animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM Animals;
COMMIT;
SELECT * FROM Animals;

SELECT COUNT(*) FROM Animals;

SELECT COUNT(escape_attempts) FROM Animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM Animals;

SELECT neutered, SUM(escape_attempts), AVG(escape_attempts) FROM Animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM Animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM Animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
