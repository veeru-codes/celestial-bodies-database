-- CREATE DATABASE universe;

CREATE TABLE galaxy(
	galaxy_id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	age_in_millions_of_years INT,
	description TEXT,
	some_variable NUMERIC(4, 1)
);

ALTER TABLE galaxy ADD UNIQUE(galaxy_id);

CREATE TABLE star(
	star_id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	has_life BOOLEAN,
	age_in_millions_of_years INT,
	galaxy_id INT REFERENCES galaxy(galaxy_id)
);

ALTER TABLE star ADD UNIQUE(star_id);

CREATE TABLE planet(
	planet_id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	has_life BOOLEAN,
	is_spherical BOOLEAN,
	age_in_millions_of_years INT,
	star_id INT REFERENCES star(star_id)
);

ALTER TABLE planet ADD UNIQUE(planet_id);

CREATE TABLE moon(
	moon_id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	has_life BOOLEAN,
	is_spherical BOOLEAN,
	planet_id INT REFERENCES planet(planet_id)
);

ALTER TABLE moon ADD UNIQUE(moon_id);

CREATE TABLE galaxy_type(
	galaxy_type_id SERIAL PRIMARY KEY,
	name VARCHAR(35),
	description TEXT
);

ALTER TABLE galaxy_type ADD UNIQUE(galaxy_type_id);

INSERT INTO galaxy (name, age_in_millions_of_years, description, some_variable)
VALUES 
	('galaxy-1', 10, 'Some random text', 44.5),
	('galaxy-2', 32, 'Some random text', 33.5),
	('galaxy-3', 49, 'Some random text', 22.1),
	('galaxy-4', 72, 'Some random text', 10.1),
	('galaxy-5', 19, 'Some random text', 11.1),
	('galaxy-6', 23, 'Some random text', 22.1);
	
INSERT INTO star (name, has_life, age_in_millions_of_years, galaxy_id)
VALUES
	('star-1', TRUE, 22, 1),
	('star-2', TRUE, 33, 1),
	('star-3', FALSE, 21, 2),
	('star-4', TRUE, 23, 3),
	('star-5', FALSE, 11, 2),
	('star-6', FALSE, 19, 2);
	
INSERT INTO planet (name, has_life, is_spherical, age_in_millions_of_years, star_id)
VALUES 
	('planet-1', TRUE, TRUE, 22, 1),
	('planet-2', TRUE, FALSE, 22, 1),
	('planet-3', FALSE, TRUE, 22, 2),
	('planet-4', TRUE, FALSE, 22, 3),
	('planet-5', FALSE, TRUE, 22, 2),
	('planet-6', FALSE, TRUE, 22, 2),
	('planet-7', TRUE, TRUE, 22, 3),
	('planet-8', TRUE, TRUE, 22, 3),
	('planet-9', TRUE, TRUE, 22, 1),
	('planet-10', FALSE, FALSE, 22, 1),
	('planet-11', FALSE, TRUE, 22, 4),
	('planet-12', TRUE, TRUE, 22, 5);
	
INSERT INTO moon (name, has_life, is_spherical, planet_id)
VALUES
	('moon-1', FALSE, FALSE, 1),
	('moon-2', TRUE, FALSE, 1),
	('moon-3', FALSE, TRUE, 2),
	('moon-4', TRUE, FALSE, 2),
	('moon-5', FALSE, FALSE, 3),
	('moon-6', FALSE, TRUE, 3),
	('moon-7', FALSE, TRUE, 4),
	('moon-8', TRUE, FALSE, 4),
	('moon-9', TRUE, FALSE, 5),
	('moon-10', FALSE, FALSE, 5),
	('moon-11', FALSE, FALSE, 6),
	('moon-12', TRUE, TRUE, 6),
	('moon-13', TRUE, TRUE, 7),
	('moon-14', FALSE, FALSE, 7),
	('moon-15', FALSE, FALSE, 8),
	('moon-16', FALSE, TRUE, 8),
	('moon-17', TRUE, FALSE, 9),
	('moon-18', FALSE, FALSE, 9),
	('moon-19', FALSE, TRUE, 10),
	('moon-20', TRUE, FALSE, 10);
	
INSERT INTO galaxy_type (name, description)
VALUES
	('galaxy-type-1', 'Some random text'),
	('galaxy-type-2', 'Some random text'),
	('galaxy-type-3', 'Some random text');

SELECT * FROM galaxy_type;
