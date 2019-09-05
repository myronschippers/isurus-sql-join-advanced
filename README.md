# SQL Advanced, Many-to-Many & Aggregates

[Code from Lecture](lesson-queries.sql)

## The Scenario

We want people to be able to track the hobbies they are interested in. We'll need to maintain a list of people and be able to add people to it but we also need a list of hobbies that we can add more hobbies to. Unlike our one to many tables this situation could have many people sharing the same hobby or a single person with multiple hobbies. Our database is going to need a table for our people and on for our hobbies but with a Many-to-Many relationship we create a third table that we refer to as a Junction Table that stores the "id" for the person and their hobby from our other tables. This junction table holds the relationship between a person and their hobbies.

```
 .------.              "people"                       "people_hobby"                         "hobby"
(        )       |-----------------|       |---------------------------------|       |----------------------|
|~------~|       | _id_ | __name__ |       | _id_ | _people_id_ | _hobby_id_ |       | _id_ | _description_ |
|~------~|       | ____ | ________ | ====> | ____ | ___________ | __________ | <==== | ____ | _____________ |
|~------~|       | ____ | ________ |       | ____ | ___________ | __________ |       | ____ | _____________ |
`.______.'       |______| ________ |       | ____ | ___________ | __________ |       | ____ | _____________ |
 DATABASE               TABLE                         JUNCTION TABLE                          TABLE
```

## Resources

* [SQL Min and Max](https://beginnersbook.com/2018/12/sql-min-max-functions/)
* [SQL Count](https://beginnersbook.com/2018/11/sql-count/)
* [SQL Avg](https://beginnersbook.com/2018/12/sql-avg-function/)
* [SQL Sum](https://beginnersbook.com/2018/12/sql-sum-function/)
* [SQL Aliases](https://beginnersbook.com/2018/12/sql-select-as-alias/)
* [SQL Group By](https://www.geeksforgeeks.org/sql-group-by/)

## JOINS

Creating our tables.

```
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
```

Joining the people and hobby table using the relationships stored in the junction table.

```
-- SELECTs all peeps and related hobbies
SELECT * FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id;
```
