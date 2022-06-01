
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

/*What animals belong to Melody Pond?*/
SELECT full_name, name FROM owners JOIN animals on animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

/*List of all animals that are pokemon (their type is Pokemon).*/
SELECT species.name as type, animals.name FROM species JOIN animals on animals.species_id = species.id WHERE species.name = 'Pokemon';

/*List all owners and their animals, remember to include those that don't own any animal.*/
SELECT full_name as owner, animals.name FROM owners LEFT JOIN animals on owners.id = animals.owner_id;

/*How many animals are there per species?*/
SELECT species.name as type, COUNT(animals.species_id) FROM species JOIN animals on species.id = animals.species_id GROUP BY species.name;

/*List all Digimon owned by Jennifer Orwell.*/
SELECT name from animals JOIN owners on animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND animals.species_id = 2;

/*List all animals owned by Dean Winchester that haven't tried to escape.*/
SELECT animals.name, escape_attempts FROM animals JOIN owners on animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/*Who owns the most animals?*/
SELECT *
FROM (SELECT full_name as winner, COUNT(animals.name) as pets 
FROM animals JOIN owners on animals.owner_id = owners.id 
GROUP BY full_name ORDER BY pets DESC) as T LIMIT 1;