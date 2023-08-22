-- Step 1: COUNT
SELECT COUNT(*) FROM cats;


-- Step 2: MIN/MAX
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


-- BONUS

-- Step 1: GROUP BY
SELECT cats.name, COUNT(*)
    FROM cats
    JOIN toys ON (cats.id = cat_id)
    GROUP BY cats.name;


-- Step 2: HAVING
-- Just names
SELECT cats.name
    FROM cats
    JOIN toys ON (cats.id = cat_id)
    GROUP BY cats.name
    HAVING COUNT(*) > 1;

-- With counts
SELECT cats.name, COUNT(*)
    FROM cats
    JOIN toys ON (cats.id = cat_id)
    GROUP BY cats.name
    HAVING COUNT(*) > 1;
