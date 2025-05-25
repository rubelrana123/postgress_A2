CREATE DATABASE conservation_db;

CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(100)
);
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

CREATE table species(
    species_id SERIAL PRIMARY KEY,
    common_name  VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);


INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes TEXT
);

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


SELECT * FROM rangers;
--task 1 : 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers(name, region)
VALUES('Derek Fox','Coastal Plains' );

--task 2️⃣ Count unique species ever sighted.
SELECT * FROM species;

SELECT count(*) as unique_species_count FROM species
WHERE conservation_status = 'Endangered';

--3️⃣ Find all sightings where the location includes "Pass". ok
SELECT *  FROM sightings
WHERE location LIKE '%Pass';

--5️⃣ List species that have never been sighted.
-- | common_name      |
-- |------------------|
-- | Asiatic Elephant |
SELECT common_name from species WHERE species.species_id = ( 
 SELECT sighting_id from sightings
 WHERE notes IS NULL);
  SELECT sighting_id from sightings
 WHERE notes IS NULL

 --Show the most recent 2 sightings.
 SELECT * from sightings
 ORDER BY sighting_time DESC
 LIMIT 2;