CREATE TABLE animals(id INTEGER PRIMARY KEY,
                     name TEXT,
                     species TEXT);

CREATE TABLE notes(id INTEGER PRIMARY KEY,
                   animal_id INTEGER,
                   subject TEXT);

CREATE TABLE todos(id INTEGER PRIMARY KEY,
                   description TEXT,
                   complete INTEGER,
                   belongs_to_id INTEGER,
                   belongs_to_type TEXT);


-- Todos can belong to either a note or an animal.


INSERT INTO animals(name, species) VALUES ('Fluffy', 'cat');
INSERT INTO animals(name, species) VALUES ('Sparky', 'dog');
INSERT INTO animals(name, species) VALUES ('Spot', 'cat');
INSERT INTO animals(name, species) VALUES ('Mittens', 'cat');
INSERT INTO animals(name, species) VALUES ('Rover', 'dog');

INSERT INTO notes(animal_id, subject)
            SELECT id, 'Routine Visit' FROM animals where name = 'Fluffy';
INSERT INTO notes(animal_id, subject)
            SELECT id, 'Dry Skin' FROM animals where name = 'Fluffy';
INSERT INTO notes(animal_id, subject)
            SELECT id, 'Sprained Foot' FROM animals where name = 'Spot';
INSERT INTO notes(animal_id, subject)
            SELECT id, 'Routine Visit' FROM animals where name = 'Mittens';

INSERT INTO todos(description, belongs_to_type, belongs_to_id)
            SELECT 'cuddle', 'Animal', id FROM animals where name = 'Mittens';
INSERT INTO todos(description, belongs_to_type, belongs_to_id)
            SELECT 'cuddle', 'Animal', id FROM animals where name = 'Rover';
INSERT INTO todos(description, belongs_to_type, belongs_to_id)
            SELECT 'pet', 'Animal', id FROM animals where name = 'Rover';


INSERT INTO todos(description, belongs_to_type, belongs_to_id)
            SELECT 'immunize', 'Note', id FROM notes;

INSERT INTO todos(description, belongs_to_type, belongs_to_id)
            SELECT 'wash', 'Note', id FROM notes LIMIT 1;


INSERT INTO todos(description, belongs_to_type, belongs_to_id)
            SELECT 'snuggle', 'Animal', id FROM animals where name = 'Rover';


-- Questions

-- 1. List the subject of each note with the name of the animal the
-- note belongs to.

-- 2. List all the Todo's that belong to an Animal.

-- 3. List all the Todo's that belong to a note; include the name of
-- the animal that note belongs to.

-- 4. List the todo count for each animal by name.
