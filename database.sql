-- Creating a person table
-- this table currently has no relationship
CREATE TABLE "person" (
	id serial primary key,
	name VARCHAR(25)
);

-- Creating a hobby table
-- this table currently has no relationship
CREATE TABLE "hobby" (
	id serial primary key,
	description VARCHAR(100)
);

-- Creating a person_hobby table
-- this will be the thing that creates a relationship between the person and hobby tables
-- a pure relational table like this is referred to as a Junction Table
CREATE TABLE "person_hobby" (
	id serial primary key,
	person_id INT REFERENCES "person",
	hobby_id INT REFERENCES "hobby"
);

-- Adding people to our person table
INSERT INTO "person" ("name") 
VALUES ('Luke'),
('James'),
('Shanice'),
('Macy'),
('Ellen'),
('Myron'),
('Scott');

-- Adding hobbies to our hobby table
INSERT INTO "hobby" ("description")
VALUES ('watching movies'),
('hiking'),
('dancing'),
('fencing'),
('playing piano'),
('reading neuro science'),
('cooking'),
('skiing'),
('biking'),
('programming'),
('napping'),
('gaming till eyes bleed'),
('knitting');

-- We added all of our relationships to the person_hobby table in the Postico GUI

-- Demonstrating that we can add a relationship with an insert
INSERT INTO "person_hobby" ("person_id", "hobby_id")
VALUES (3, 11);

-- custom column names
SELECT "id" as "person_id" FROM "person_hobby";

-- SELECTs all peeps and related hobbies
SELECT * FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id;

-- Joins our person, hobby, and person_hobby tables but also sorts the results by name in ascending order
SELECT * FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id
ORDER BY "person".name ASC;

-- We are looking for the number of hobbies each person has
SELECT "person"."name", count("hobby"."description") FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id
GROUP BY "person".name;

SELECT "person"."name", "description", "person_hobby"."person_id", "person_hobby"."hobby_id", "person_hobby"."id" as "person_hobby_id" FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id;

-- AGGREGATES

-- total number of people
SELECT count(*) FROM "person";

-- minimum skill value
SELECT MIN("skill") FROM "person_hobby";

-- maximum skill value
SELECT MAX("skill") FROM "person_hobby";

-- add together all skill values and give us the total
SELECT SUM("skill") FROM "person_hobby";

-- gives us the actual average of all the skill values
SELECT AVG("skill") FROM "person_hobby";

-- minimun skill value labeled as "min_skill" with maximum skill value labeled as "max_skill" and the average skill value labeled as "avg_skill"
SELECT MIN("skill") as min_skill, MAX("skill") as max_skill, AVG("skill") as avg_skill FROM "person_hobby";




