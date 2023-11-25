CREATE TABLE people (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE phones (
    id INT PRIMARY KEY,
    user_id INT,
    number VARCHAR(20)
);

INSERT INTO people (id, first_name, last_name)
VALUES
    (1, 'John', 'Smith'),
    (2, 'Mary', 'Jones'),
    (3, 'Gerhard', 'Feuerhaufen'),
    (4, 'Rami', 'Pitkäniemi'),
    (5, 'Anna', 'Kråkström');

INSERT INTO phones (id, user_id, number)
VALUES
    (1, 2, '+1 213 621 0002'),
    (2, 2, '+1 800 444 4444'),
    (3, 1, '+1 604 444 4444'),
    (4, 1, '+44 20 8759 9036'),
    (5, 4, '+358 50 333 3333'),
    (6, 5, '+46 771 793 336');

SELECT p.first_name || ' ' || p.last_name AS name, GROUP_CONCAT(phones.number) AS numbers
FROM people AS p
LEFT JOIN phones ON p.id = phones.user_id
GROUP BY p.id, name