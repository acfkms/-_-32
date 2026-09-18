CREATE TABLE medi_new (
    id                 INTEGER PRIMARY KEY,
    name               TEXT NOT NULL,
    price              REAL NOT NULL,
    manufactuer        TEXT NOT NULL,
    stock_quantity     INTEGER NOT NULL,
    status             TEXT
);

INSERT INTO medi_new SELECT * FROM medi;
DROP TABLE medi;
ALTER TABLE medi_new RENAME TO medi;
INSERT INTO medi (name, price,  manufactuer, stock_quantity, status) 
VALUES ('Супрастин', 42000.0,'Фармацевтичний завод ЕГІС', 3, NULL);

SELECT name, status FROM weapons WHERE status IS NULL;
