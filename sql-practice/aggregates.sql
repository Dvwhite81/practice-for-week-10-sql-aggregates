-- Step 1: Count
SELECT COUNT(*) FROM cats;


-- Step 2: Min/Max
SELECT name, MIN(birth_year) AS oldest
    FROM cats;

SELECT name, MAX(birth_year) AS youngest
    FROM cats;

-- Combined
SELECT name, birth_year
    FROM cats
    WHERE birth_year IN (
        (SELECT MIN(birth_year) FROM cats),
        (SELECT MAX(birth_year) FROM cats)
    )
    ORDER BY birth_year;
