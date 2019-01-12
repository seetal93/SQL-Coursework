-- The comment lines starting -- ! are used by the automatic testing tool to
-- help mark your coursework. You must not modify them or add further lines
-- starting with -- !. Of course you can create comments of your own, just use
-- the normal -- to start them.

-- !elections

-- !question0
-- This is an example question and answer.

SELECT Party.name FROM Party
JOIN Candidate ON Candidate.party = Party.id
WHERE Candidate.name = 'Mark Bradshaw';

-- !question1

SELECT * FROM Party ORDER BY name ASC;

-- !question2

SELECT SUM(votes) AS "Total Votes For Bristol" FROM Candidate;

-- !question3

SELECT Candidate.name, votes FROM Candidate INNER JOIN Ward ON Candidate.ward = Ward.id WHERE Ward.name = 'Southville';

-- !question4

SELECT SUM(votes) AS "Total Liberal Democrat votes in Bedminster" FROM Candidate
INNER JOIN Party ON Candidate.party = Party.id
INNER JOIN Ward ON Candidate.ward = Ward.id
WHERE Party.name = 'Liberal Democrat' AND Ward.name = 'Bedminster';

-- !question5

SELECT Candidate.name AS name, Party.name AS party, Candidate.votes AS votes FROM Candidate
INNER JOIN Party ON Candidate.party = Party.id
INNER JOIN Ward ON Candidate.ward = Ward.id WHERE Ward.name = 'Bedminster' ORDER BY votes DESC;

-- !question6

SELECT 1 + COUNT(1) AS "Ranking" FROM (SELECT Party.name AS party, Candidate.votes AS votes FROM Candidate  INNER JOIN Party ON Candidate.party = Party.id INNER JOIN Ward ON Candidate.ward = Ward.id WHERE Ward.name = 'Southville' ORDER BY votes DESC) AS t
INNER JOIN (SELECT Party.name AS party, Candidate.votes AS votes FROM Candidate  INNER JOIN Party ON Candidate.party = Party.id INNER JOIN Ward ON Candidate.ward = Ward.id WHERE Ward.name = 'Southville' ORDER BY votes DESC)
AS p ON t.party = p.party AND t.votes >= p.votes WHERE t.party = 'Labour';

-- !question7

SELECT x.name, x.votes*100/y.votes AS percent FROM (SELECT Ward.name, Candidate.votes FROM Candidate
INNER JOIN Ward ON Candidate.ward = Ward.id INNER JOIN Party ON Candidate.party = Party.id WHERE Party.name = 'Green') AS x
INNER JOIN (SELECT Ward.name, SUM(Candidate.votes) AS votes FROM Candidate INNER JOIN Ward ON Candidate.ward = Ward.id
INNER JOIN Party ON Candidate.party = Party.id GROUP BY Ward.name) AS y ON x.name = y.name ;

-- !question8

SELECT g.name, g.votes - l.votes AS abs, (g.votes - l.votes)*100/g.electorate AS rel FROM
(SELECT Ward.name, Candidate.votes AS votes, Ward.electorate FROM Candidate INNER JOIN Ward ON Candidate.ward = Ward.id INNER JOIN Party ON Candidate.party = Party.id WHERE Party.name = 'Green') AS g
INNER JOIN (SELECT Ward.name, Candidate.votes AS votes, Ward.electorate FROM Candidate INNER JOIN Ward ON Candidate.ward = Ward.id INNER JOIN Party ON Candidate.party = Party.id WHERE Party.name = 'Labour') AS l
ON g.name = l.name WHERE g.votes > l.votes;


-- !end
