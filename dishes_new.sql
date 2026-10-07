DROP TABLE IF EXISTS dishes_new;

PRAGMA foreign_keys = ON;

CREATE TABLE dishes_new (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price REAL NOT NULL,
    restaurant TEXT
);
INSERT INTO dishes_new
SELECT *
FROM dishes01;
SELECT *
FROM dishes_new;

SELECT sql
FROM sqlite_master
WHERE name = 'dishes_new';

INSERT INTO couriers01
(last_name, first_name, phone, transport)
VALUES
('test-c', 'Test', 'test', NULL);
INSERT INTO dishes01
(name, category, price, restaurant)
VALUES
('test-u', 'test', 0, 'test');
SELECT *
FROM couriers01
WHERE last_name = 'test-c';

SELECT *
FROM dishes01
WHERE name = 'test-u';
