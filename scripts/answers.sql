/*SELECT am.yearid, teamid, m.lgid, am.playerid
FROM awardsmanagers AS am
JOIN managers AS m
ON am.yearid = m.yearid
GROUP BY teamid, am.yearid, m.lgid, am.playerid
ORDER BY am.yearid DESC, am.playerid */ --pieces of 9, everything else still on paper