/*SELECT MAX(yearid), MIN(yearid)
FROM teams*/ --1

/*SELECT CONCAT(namefirst, ' ', namelast) AS name, height, teamid
FROM people
JOIN appearances
ON people.playerid = appearances.playerid
ORDER BY height*/ --2

/*WITH vandy_players (name, schoolid) AS
				(SELECT CONCAT(namefirst,namelast) AS name, schoolid
				   FROM people 
				   JOIN collegeplaying
				   ON people.playerid = collegeplaying.playerid
				   WHERE schoolid ILIKE '%vandy%'
				   ORDER BY name),
				vandy_players_salary (name, salary) AS
				(SELECT CONCAT(namefirst, namelast) AS name, salary
					FROM people 
					JOIN salaries  
					ON people.playerid = salaries.playerid
					ORDER BY name)
				SELECT vandy_players.name, salary, schoolid
				FROM vandy_players
				INNER JOIN vandy_players_salary
				ON vandy_players.name = vandy_players_salary.name
				ORDER BY salary DESC*/ --3
				
				
/*SELECT SUM(po) AS total_putout, playerid, pos, yearid,
	CASE WHEN pos = 'OF' THEN 'Outfield'
		 WHEN pos IN ('SS','1B','2B','3B') THEN 'Infield'
		 ELSE 'Battery' END AS positions
		 FROM fielding
		 WHERE yearid = '2016'
		 GROUP BY playerid, pos, yearid
		 ORDER BY pos, total_putout DESC*/--4
		 
/*SELECT ROUND(AVG(SO),2) AS avg_so, ROUND(AVG(HR),2) AS avg_hr, G, EXTRACT('decade' FROM yearid) AS decade
	FROM batting
	WHERE decade > 1920
	GROUP BY G, decade
	ORDER BY decade --this poop, need to make case when*/
	
/*SELECT ROUND(AVG(so),2) AS avg_so, ROUND(AVG(hr),2) AS avg_hr,  
	CASE WHEN yearid >= 1920 AND yearid <= 1929 THEN '1920s'
	 	WHEN yearid >= 1930 AND yearid <= 1939 THEN '1930s'
	 	WHEN yearid >= 1940 AND yearid <= 1949 THEN '1940s'
	 	WHEN yearid >= 1950 AND yearid <= 1959 THEN '1950s'
	 	WHEN yearid >= 1960 AND yearid <= 1969 THEN '1960s'
	 	WHEN yearid >= 1970 AND yearid <= 1979 THEN '1970s'
	 	WHEN yearid >= 1980 AND yearid <= 1989 THEN '1980s'
	 	WHEN yearid >= 1990 AND yearid <= 1999 THEN '1990s'
	 	WHEN yearid >= 2000 AND yearid <= 2009 THEN '2000s'
	 	WHEN yearid >= 2010 AND yearid <= 2020 THEN '2010s'
	 	ELSE 'other' END AS decades
	 	FROM batting
		GROUP BY decades
		ORDER BY decades*/ --5 that works
		
	 
	 
	 
/*WITH winners as	(	SELECT teamid as champ, 
				           yearid, w as champ_w
	  				FROM teams
	  				WHERE 	(wswin = 'Y')
				 			AND (yearid BETWEEN 1970 AND 2016) ),
max_wins as (	SELECT yearid, 
			           max(w) as maxw
	  			FROM teams
	  			WHERE yearid BETWEEN 1970 AND 2016
				GROUP BY yearid)
SELECT 	COUNT(*) AS all_years,
		COUNT(CASE WHEN champ_w = maxw THEN 'Yes' end) as max_wins_by_champ,
		to_char((COUNT(CASE WHEN champ_w = maxw THEN 'Yes' end)/(COUNT(*))::real)*100,'99.99%') as Percent
FROM 	winners LEFT JOIN max_wins
		USING(yearid)   --7 need to test*/
	
		 
				
				
/*SELECT team, park, sum(attendance/games) AS avg_attendance
FROM homegames
WHERE year = '2016'
AND games > 10
GROUP BY team, park
Order by avg_attendance
LIMIT 5*/ --8a

/*SELECT team, park, sum(attendance/games) AS avg_attendance
FROM homegames
WHERE year = '2016'
AND games > 10
GROUP BY team, park
Order by avg_attendance DESC
LIMIT 5*/ --8b






/*SELECT am.yearid, teamid, m.lgid, am.playerid
FROM awardsmanagers AS am
JOIN managers AS m
ON am.yearid = m.yearid
GROUP BY teamid, am.yearid, m.lgid, am.playerid
ORDER BY am.yearid DESC, am.playerid*/ ---???don't know what this is

SELECT cs
FROM battingpost



