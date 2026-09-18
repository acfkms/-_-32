CREATE TABLE medi (
    id                  INTEGER PRIMARY KEY,
    name                TEXT NOT NULL,
    price               REAL NOT NULL,
    manufactuer         TEXT NOT NULL,
    stock_quantity      INTEGER NOT NULL,
    status              TEXT NOT NULL
);

INSERT INTO medi (name, price, manufactuer, stock_quantity, status) VALUES
    ('Парацетамол', 45.50, 'Дарниця', 120, 'в наявності'),
    ('Аспірин', 60.00, 'Bayer', 85, 'в наявності'),
    ('Амоксицилін', 180.00, 'Caндоз', 40, 'рецептурний'),
    ('Ібупрофен', 95.50, 'Фармак', 0, 'немає'),
    ('Вітамін C', 120.00, 'Монфарм', 200, 'в наявності'),
    ('Анальгін', 35.00, 'Лубнифарм', 15, 'на перевірці');