-- Problem: The Blunder (HackerRank)

-- Q1: Difference between total number of CITY entries and distinct CITY entries in STATION
SELECT COUNT(*) - COUNT(DISTINCT CITY) AS Difference
FROM STATION;

-- Q2: Error between actual and miscalculated average salary
SELECT CEILING(AVG(salary) - AVG(REPLACE(salary, '0', '')))
FROM EMPLOYEES;


-- Q3: Manhattan Distance between min/max LAT_N and LONG_W in STATION
SELECT
    ROUND(
        ABS(MIN(LAT_N) - MAX(LAT_N)) +
        ABS(MIN(LONG_W) - MAX(LONG_W)),
        4
    ) AS Manhattan_Distance
FROM STATION;

-- Q4: Euclidean Distance between min/max LAT_N and LONG_W in STATION
SELECT
    ROUND(
        SQRT(
            POW(MAX(LAT_N) - MIN(LAT_N), 2) +
            POW(MAX(LONG_W) - MIN(LONG_W), 2)
        ),
        4
    )
FROM STATION;

-- Q5: Names of all cities where Continent is Africa
SELECT CITY.Name
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Africa';

-- Q6: Continent and average city population (rounded down)
SELECT
    COUNTRY.Continent,
    FLOOR(AVG(CITY.Population))
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

-- Q7: The Report (Students & Grades join with conditional ordering)
SELECT
    IF(g.Grade < 8, NULL, s.Name) AS Name,
    g.Grade,
    s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY
    g.Grade DESC,
    IF(g.Grade >= 8, s.Name, s.Marks) ASC;

-- Q8: Hackers with full score in more than one challenge (Leaderboard)
SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s ON h.hacker_id = s.hacker_id
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(DISTINCT s.challenge_id) > 1
ORDER BY COUNT(DISTINCT s.challenge_id) DESC, h.hacker_id ASC;

-- Q9: Ollivander's Inventory (non-evil, min coins per power & age)
SELECT w.id, p.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property p ON w.code = p.code
WHERE p.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w2.coins_needed)
    FROM Wands w2
    JOIN Wands_Property p2 ON w2.code = p2.code
    WHERE p2.is_evil = 0
      AND w2.power = w.power
      AND p2.age = p.age
)
ORDER BY w.power DESC, p.age DESC;

-- Q10: Challenges created by hackers (with special filtering rule)
SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS total_challenges
FROM Hackers h
JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING
    COUNT(c.challenge_id) = (
        SELECT MAX(cnt)
        FROM (SELECT COUNT(*) cnt FROM Challenges GROUP BY hacker_id) t
    )
    OR
    COUNT(c.challenge_id) IN (
        SELECT cnt
        FROM (SELECT COUNT(*) cnt FROM Challenges GROUP BY hacker_id) t
        GROUP BY cnt
        HAVING COUNT(cnt) = 1
    )
ORDER BY total_challenges DESC, h.hacker_id ASC;


