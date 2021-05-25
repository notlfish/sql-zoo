-- List the films where the yr is 1962 [Show id, title]
SELECT id, title FROM movie WHERE yr=1962;

-- Give year of 'Citizen Kane'.
SELECT yr FROM movie WHERE title = 'Citizen Kane';

-- List all of the Star Trek movies, include the id, title and yr
-- (all of these movies include the words Star Trek in the title).
-- Order results by year.
select id, title, yr from movie where title like 'Star Trek%' order by yr;

-- What id number does the actor 'Glenn Close' have?
select id from actor where name = 'Glenn Close';

-- What is the id of the film 'Casablanca'
select id from movie where title = 'Casablanca';

-- Obtain the cast list from Casablanca
select actor.name from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where movie.title = 'Casablanca';

-- Obtain the cast list from Alien
select actor.name from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where movie.title = 'Alien';

-- List the films in which 'Harrison Ford' has appeared
select movie.title from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where actor.name = 'Harrison Ford';

-- List the films where 'Harrison Ford' has appeared - but not in the
-- starring role. [Note: the ord field of casting gives the position
-- of the actor. If ord=1 then this actor is in the starring role]
select movie.title from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where actor.name = 'Harrison Ford' and casting.ord > 1;
