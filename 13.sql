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

INSERT INTO dishes01 (id, name, category, price, restaurant) VALUES
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

INSERT INTO couriers01 (id, last_name, first_name, phone, transport) VALUES
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
INSERT INTO orders01 (id, dish_id, courier_id, order_date, address, status) VALUES
(1, 1, 2, '2024-03-01', 'вул. Хрещатик, 1', 'доставлено'),
(2, 3, 3, '2021-03-02', 'вул. Шевченка, 10', 'в дорозі'),
(3, 5, 5, '2014-03-03', 'вул. Лесі Українки, 5', 'доставлено'),
(4, 8, 6, '2011-03-04', 'вул. Сагайдачного, 22', 'скасовано'),
(5, 2, 4, '2001-03-05', 'вул. Франка, 7', 'доставлено');
--1
SELECT price, printf('%.2f грн', price) AS formatted
FROM dishes01;
--2 вирівнювання потрібне дя легшої читабельності
SELECT price, printf('[%-8.2f]', price) AS price_f
FROM dishes01;
--3 дата, в яку повторно мають доставити важливі для здоров'я таблетки, які треба вживати раз на місяць яяяя не знаюю
SELECT order_date, date(order_date, '+30 days') AS repeat_order
FROM orders01;
--4 за результатом воно групує саме за заданою умовою, прямо з колонки просто по порядку айді
SELECT strftime('%Y-%m', order_date) AS year_month,
COUNT(*) AS orders_count
FROM orders01
GROUP BY year_month;
--5 мовчки дало налл
