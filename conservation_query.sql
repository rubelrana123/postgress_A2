CREATE DATABASE conservation_db;

CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(100)
);

INSERT INTO
    rangers (name, region)
VALUES (
       
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
      
        'Carol King',
        'Mountain Range'
    ),
        (
      
        'Rubel Rana',
        'Road Area'
    );

CREATE table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

INSERT INTO
    species (
        species_id,
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        1,
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        2,
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        3,
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        4,
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers (ranger_id) ON DELETE CASCADE,
    species_id INT REFERENCES species (species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes TEXT
);

INSERT INTO
    sightings (
        sighting_id,
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        4,
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

--1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains' ok
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

--2️⃣ Count unique species ever sighted. ok
SELECT count(*) as unique_species_count
FROM species
WHERE
    conservation_status = 'Endangered';


--3️⃣ Find all sightings where the location includes "Pass". ok
SELECT * FROM sightings WHERE location LIKE '%Pass';

--5️⃣ List species that have never been sighted. 
--| common_name      
-- | Asiatic Elephant |
SELECT common_name
from species
WHERE
    species.species_id = (
        SELECT sighting_id
        from sightings
        WHERE
            notes IS NULL
    );

SELECT sighting_id from sightings WHERE notes IS NULL

--6️⃣ Show the most recent 2 sightings. ok
SELECT species.common_name, sightings.sighting_time, rangers.name
FROM sightings
INNER  JOIN species  ON species.species_id = sightings.species_id
INNER  JOIN rangers  ON rangers.ranger_id = sightings.ranger_id
ORDER BY sightings.sighting_time DESC LIMIT 2;

--7️⃣ Update all species discovered before year 1800 to have status 'Historic'.
-- AffectedRows : 3
--(No output needed - this is an UPDATE operation)
ALTER TABLE species ADD status VARCHAR(50);
UPDATE species
SET
    status = 'Historic'
WHERE
    extract(
        year
        from discovery_date
    ) <= 1800;

ALTER TABLE species DROP COLUMN status;

SELECT * from species;

--8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
-- Morning: before 12 PM
-- Afternoon: 12 PM–5 PM
-- Evening: after 5 PM
SELECT
    sighting_id,
    CASE
        WHEN TO_CHAR(sighting_time, 'HH24:MI') BETWEEN '06:01' AND '12:00' THEN 'Morning'
        WHEN TO_CHAR(sighting_time, 'HH24:MI') BETWEEN '12:01' AND '17:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;





SELECT 
    sighting_id, 
    TO_CHAR(sighting_time, 'HH12:MI AM') AS time 
FROM 
    sightings;

-- 9️⃣ Delete rangers who have never sighted any species
-- AffectedRows : 1
-- (No output needed - this is a DELETE operation)
DELETE FROM rangers WHERE rangers.ranger_id IN (
 SELECT rangers.ranger_id FROM rangers
 LEFT JOIN sightings 
 ON rangers.ranger_id = sightings.ranger_id
 WHERE  sightings.ranger_id IS NULL
); 
 SELECT * FROM rangers;
