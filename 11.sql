DROP TABLE IF EXISTS reviews01;

CREATE TABLE reviews01 (
    id INTEGER PRIMARY KEY,
    dish_id INTEGER NOT NULL,
    review_date TEXT NOT NULL,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_status TEXT DEFAULT 'опубліковано',
    FOREIGN KEY (dish_id) REFERENCES dishes01(id)
);
INSERT INTO reviews01
(id, dish_id, review_date, rating, comment, review_status)
VALUES
(1, 1, '2024-03-05', 5, 'Дуже смачні панкейки', 'опубліковано'),
(2, 1, '2024-03-06', 4, 'Сподобалися', 'опубліковано'),
(3, 3, '2024-03-07', 5, 'Смачна страва', 'опубліковано'),
(4, 3, '2024-03-08', 4, 'Все добре', 'опубліковано'),
(5, 3, '2024-03-09', 3, 'Можна краще', 'опубліковано'),
(6, 5, '2024-03-10', 5, 'Чудовий круасан', 'опубліковано'),
(7, 8, '2024-03-11', 2, 'Не дуже сподобалося', 'приховано'),
(8, 8, '2024-03-12', 4, 'Смачний бургер', 'опубліковано');
--2
SELECT d.id, d.name, AVG(r.rating) AS average_rating
FROM dishes01 d
JOIN reviews01 r ON d.id = r.dish_id
GROUP BY d.id;
--3
SELECT d.id, d.name, AVG(r.rating) AS average_rating
FROM dishes01 d
JOIN reviews01 r ON d.id = r.dish_id
GROUP BY d.id
HAVING AVG(r.rating) > 4;
--4
SELECT d.id, d.name, AVG(r.rating) AS average_rating
FROM dishes01 d
JOIN reviews01 r ON d.id = r.dish_id
WHERE r.review_status = 'опубліковано'
AND r.review_date > '2024-03-05'
GROUP BY d.id
HAVING AVG(r.rating) > 3;
--5 при групуванняі айді однакові назви страв залишаються окремими групами через різні ідентифікатори
--6 
SELECT d.id, d.name, AVG(r.rating) AS avg_rating
FROM dishes01 d
LEFT JOIN reviews01 r ON d.id = r.dish_id
WHERE r.review_status = 'опубліковано'
AND r.review_date > '2024-03-05'
GROUP BY d.id
HAVING AVG(r.rating) > 3;