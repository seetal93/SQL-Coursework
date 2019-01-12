-- This file is for your solutions to the census question.
-- Lines starting with -- ! are recognised by a script that we will
-- use to automatically test your queries, so you must not change
-- these lines or create any new lines starting with this marker.
--
-- You may break your queries over several lines, include empty
-- lines and SQL comments wherever you wish.
--
-- Remember that the answer to each question goes after the -- !
-- marker for it and that the answer to each question must be
-- a single SQL query.
--
-- Upload this file to SAFE as part of your coursework.

-- !census

-- !question0

-- Sample solution to question 0.
SELECT data FROM Statistic WHERE wardId = 'E05001982' AND
occId = 2 AND gender = 0;

-- !question1

SELECT data FROM Statistic WHERE wardId = 'E05001979'
AND occId = 7 AND gender = 1;

-- !question2

SELECT sum(data) AS Data FROM Statistic WHERE wardId = 'E05000697'
AND occId = 4;

-- !question3

SELECT name AS occ, sum(data) AS num FROM Statistic INNER JOIN Occupation ON
Statistic.occId = Occupation.id WHERE wardId = 'E05003701' GROUP BY name;

-- !question4

SELECT SUM(data) AS "Working Population", Ward.code AS "Ward Code", Ward.name AS
"Ward Name", County.name AS "County Level Unit Code" FROM Statistic INNER JOIN
Ward ON Statistic.wardId = Ward.code INNER JOIN County ON Ward.parent = County.code
GROUP BY Ward.code, Ward.name, County.name ORDER BY SUM(data) DESC LIMIT 1;

-- !question5

SELECT COUNT(*) AS "Wards Over 10,000 Working Population" FROM (
SELECT Ward.code AS WardCode, SUM(data) AS WorkingPopulation FROM Statistic INNER JOIN Ward ON
Statistic.WardId = Ward.code GROUP BY Ward.code HAVING SUM(data) >= 10000
) AS t;

-- !question6

SELECT Region.name, AVG(WardWorkingPopulation.workingpopulation) AS average FROM ( SELECT wardId, SUM(data) as workingpopulation FROM Statistic
GROUP BY wardId) AS WardWorkingPopulation
INNER JOIN Ward ON WardWorkingPopulation.wardId = Ward.code INNER JOIN County ON Ward.parent = County.code
INNER JOIN Region ON County.parent = Region.code INNER JOIN Country ON County.country = Country.code WHERE Country.Name = 'England' GROUP BY Region.name;

-- !question7

SELECT County.name AS CLU, Occupation.name AS occupation, CASE Statistic.gender WHEN 1 THEN 'F' ELSE 'M' END AS gender, SUM(Statistic.data) AS count
FROM County INNER JOIN Region ON County.parent = Region.code INNER JOIN Ward ON Ward.parent = County.code INNER JOIN Statistic ON Ward.code = Statistic.wardId
INNER JOIN Occupation ON Statistic.occId = Occupation.id WHERE Region.code = 'E12000001'
GROUP BY County.name, Occupation.name, Statistic.gender HAVING count >= 10000 ORDER BY count;

-- !question8

-- Place your answer to question 8 here. Delete this comment.

-- !question9

-- Place your answer to question 9 here. Delete this comment.

-- !end
