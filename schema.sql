

CREATE TABLE Animals (
    id INT PRIMARY KEY (id),
    name VARCHAR(30),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
);

ALTER TABLE Animals ADD species VARCHAR(30);