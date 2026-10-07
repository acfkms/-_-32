PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS orders01;
DROP TABLE IF EXISTS couriers01;
DROP TABLE IF EXISTS dishes01;

PRAGMA foreign_keys = ON;
CREATE TABLE dishes01 (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price REAL NOT NULL,
    restaurant TEXT
);

INSERT INTO dishes01
(id, name, category, price, restaurant)
VALUES
(1, 'Панкейки з нутелою', 'випічка', 330, 'pancake cafe'),
(2, 'Салат крабовий', 'українська кухня', 140, 'чілміл'),
(3, 'Котлети з м’яса індика', 'корисна їжа', 246, 'Mama Tato'),
(4, 'Біф мелт', 'сніданок', 501, 'HONEY'),
(5, 'Круасан з лососем', 'сніданок', 402, 'HONEY'),
(6, 'Локшина з креветками', 'азійська кухня', 369, 'chin chin'),
(7, 'Англійський сніданок', 'італійська кухня', 289, 'паштет'),
(8, 'THIS IS БІГ БІФ БУРГЕР', 'американська кухня', 625, 'THIS IS ПИВБАР');
CREATE TABLE couriers01 (
    id INTEGER PRIMARY KEY,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    phone TEXT NOT NULL,
    transport TEXT
);

INSERT INTO couriers01
(id, last_name, first_name, phone, transport)
VALUES
(1, 'Карпачов', 'Дмитро', '0998991391', NULL),
(2, 'Костенко', 'Ліна', '0958928938', 'Велосипед'),
(3, 'Мельник', 'Антон', '0671236941', 'Мотоцикл'),
(4, 'Іванчук', 'Петро', '09901040011', 'Велосипед'),
(5, 'Шевченко', 'Тарас', '0662206199', 'Велосипед'),
(6, 'Петренко', 'Іван', '0981103799', 'Мотоцикл');


CREATE TABLE orders01 (
    id INTEGER PRIMARY KEY,
    dish_id INTEGER NOT NULL,
    courier_id INTEGER NOT NULL,
    order_date TEXT NOT NULL,
    address TEXT NOT NULL,
    status TEXT,
    FOREIGN KEY (dish_id) REFERENCES dishes01(id),
    FOREIGN KEY (courier_id) REFERENCES couriers01(id)
);
SELECT 
    orders01.id,
    couriers01.last_name,
    dishes01.name,
    orders01.order_date,
    orders01.status
FROM orders01
JOIN dishes01 
    ON dishes01.id = orders01.dish_id
JOIN couriers01 
    ON couriers01.id = orders01.courier_id;

UPDATE dishes01 SET price = 67 WHERE name = 'Круасан з лососем';
SELECT id, name FROM dishes01 WHERE price < 200;
UPDATE couriers01 
SET last_name 
WHERE id = 3;
SELECT las_name, first_name, phone FROM couriers01;
SELECT COUNT(*) FROM dishes01;
DELETE FROM dishes01 WHERE id = 5;
SELECT COUNT(*) FROM couriers01;
DELETE FROM couriers01 WHERE id = 6;