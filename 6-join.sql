-- Modify it to show the matchid and player name for all goals
-- scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal WHERE teamid = 'GER';

-- Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2 FROM game WHERE id = 1012;

-- Show the player, teamid, stadium and mdate for every German goal.
SELECT goal.player, goal.teamid, game.stadium, game.mdate FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid = 'GER';

-- Show the team1, team2 and player for every goal scored by a player
-- called Mario player LIKE 'Mario%'
SELECT game.team1, game.team2, goal.player FROM goal
JOIN game ON goal.matchid = game.id
WHERE player LIKE 'Mario%';

-- Show player, teamid, coach, gtime for all goals scored in the first
-- 10 minutes gtime<=10
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10;

-- List the dates of the matches and the name of the team in which
-- 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname FROM game
JOIN eteam ON game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';

-- List the player for every goal scored in a game where the
-- stadium was 'National Stadium, Warsaw'
SELECT goal.player FROM goal
JOIN game ON goal.matchid = game.id
WHERE game.stadium = 'National Stadium, Warsaw';

-- Show the name of all players who scored a goal against Germany.
SELECT DISTINCT goal.player FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid != 'Ger' AND (game.team1 = 'GER' OR game.team2 = 'GER');

-- Show teamname and the total number of goals scored.
select eteam.teamname, count(*) from eteam
join goal on eteam.id = goal.teamid
group by eteam.teamname;

-- Show the stadium and the number of goals scored in each stadium.
select game.stadium, count(*) from game
join goal on game.id = goal.matchid
group by game.stadium;

-- For every match involving 'POL', show the matchid, date and
-- the number of goals scored.
select game.id, game.mdate, count(goal.matchid) from game
join goal on game.id = goal.matchid
where game.team1 = 'POL' or game.team2 = 'POL'
group by game.id, game.mdate;

-- For every match where 'GER' scored, show matchid, match date
-- and the number of goals scored by 'GER'
select game.id, game.mdate, count(goal.teamid) from game
join goal on game.id = goal.matchid
where goal.teamid = 'GER'
group by game.id, game.mdate;

-- List every match with the goals scored by each team as shown. This
-- will use "CASE WHEN" which has not been explained in any previous exercises.
select game.mdate,
  game.team1, sum(case when goal.teamid = game.team1 then 1 else 0 end) score1,
  game.team2, sum(case when goal.teamid = game.team2 then 1 else 0 end) score2
from game join goal on game.id = goal.matchid
group by game.mdate, game.team1, game.team2
