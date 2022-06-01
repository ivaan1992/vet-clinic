

CREATE TABLE Animals (
    id INT PRIMARY KEY (id),
    name VARCHAR(30),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
);

ALTER TABLE Animals ADD species VARCHAR(30);

CREATE TABLE owners(
  id INT PRIMARY KEY(id),
  full_name VARCHAR(30),
  age INT,
);

CREATE TABLE species(
  id INT PRIMARY KEY(id),
  name VARCHAR(30),
);

ALTER TABLE Animals DROP COLUMN species;
ALTER TABLE Animals ADD species_id INT;
ALTER TABLE Animals ADD owners_id INT;
ALTER TABLE Animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE Animals ADD FOREIGN KEY (owners_id) REFERENCES owners (id);
