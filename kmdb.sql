-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS mpaa_ratings;
DROP TABLE IF EXISTS castings;


-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  release_year TEXT,
  mpaa_rating_id INTEGER,
  director_person_id INTEGER
  );

CREATE TABLE mpaa_ratings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rating TEXT,
  description TEXT,
  );

CREATE TABLE people (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
  );

  CREATE TABLE castings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_person_id INTEGER,
  movie_id INTEGER,
  role TEXT
  );


-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO mpaa_ratings
VALUES ("G", "General Audiences");
VALUES ("PG", "Parental Guidance Suggested");
VALUES ("PG-13", "Parents Strongly Cautioned");
VALUES ("R", "Restricted");
VALUES ("NC-17", "Adults Only");

INSERT INTO people
VALUES ("Christopher Nolan"); -- 1
VALUES ("Christian Bale"); -- 2
VALUES ("Michael Caine"); -- 3
VALUES ("Liam Neeson"); -- 4
VALUES ("Katie Holmes"); -- 5
VALUES ("Gary Oldman"); -- 6
VALUES ("Heath Ledger"); -- 7
VALUES ("Aaron Eckhart"); -- 8
VALUES ("Maggie Gyllenhaal"); -- 9
VALUES ("Tom Hardy"); -- 10
VALUES ("Joseph Gordon-Levitt"); -- 11
VALUES ("Anne Hathaway"); -- 12

INSERT INTO movies
VALUES ("Batman Begins", "2005", 3, 1);
VALUES ("The Dark Knight", "2008", 3, 1);
VALUES ("The Dark Knight Risess", "2012", 3, 1);

INSERT INTO castings
VALUES (1, 2, "Bruce Wayne");
VALUES (1, 3, "Alfred");
VALUES (1, 4, "Ra's Al Ghul");
VALUES (1, 5, "Rachel Dawes");
VALUES (1, 6, "Commissioner Gordon");
VALUES (2, 2, "Bruce Wayne");
VALUES (2, 7, "Joker");
VALUES (2, 8, "Harvey Dent");
VALUES (2, 3, "Alfred");
VALUES (2, 9, "Rachel Dawes");
VALUES (3, 2, "Bruce Wayne");
VALUES (3, 6, "Commissioner Gordon");
VALUES (3, 10, "Bane");
VALUES (3, 11, "John Blake");
VALUES (3, 12, "Selina Kyle");


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!