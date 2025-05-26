CREATE DATABASE conservation_db;

CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
)


INSERT INTO rangers (name, region)
VALUES ('Alice Green','Northern Hills'),
       ('Bob White', 'River Delta'),
       ( 'Carol King','Mountain Range');
    
CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL UNIQUE,
    discovery_date DATE NOT NULL,
    conservation_status TEXT
)

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL REFERENCES rangers (ranger_id) ON DELETE CASCADE,
    species_id INTEGER NOT NULL REFERENCES species (species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    location TEXT NOT NULL,
    notes TEXT
);

INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
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
SELECT count(DISTINCT species_id) as unique_species_count
FROM sightings;

--3️⃣ Find all sightings where the location includes "Pass". ok
SELECT * FROM sightings WHERE location LIKE '%Pass%';

--4️⃣ List each ranger's name and their total number of sightings.ok
SELECT name , count(ranger_id) as total_sightings  FROM rangers
JOIN sightings USING(ranger_id)
GROUP BY (ranger_id,name) 
ORDER BY name;

--5️⃣ List species that have never been sighted. ok
select common_name   FROM species
LEFT JOIN sightings USING(species_id)
WHERE sightings.species_id IS NULL;

--6️⃣ Show the most recent 2 sightings. ok
SELECT common_name,sighting_time,name FROM sightings
JOIN species USING(species_id)
JOIN rangers USING (ranger_id)
ORDER BY(sighting_time) DESC
LIMIT 2;

--7️⃣ Update all species discovered before year 1800 to have status 'Historic'.ok
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    extract(
        YEAR
        FROM discovery_date
    ) < 1800;

--8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'. ok
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- 9️⃣ Delete rangers who have never sighted any species ok
DELETE FROM rangers WHERE rangers.ranger_id IN (
 SELECT rangers.ranger_id FROM rangers
 LEFT JOIN sightings 
 ON rangers.ranger_id = sightings.ranger_id
 WHERE  sightings.ranger_id IS NULL
); 
