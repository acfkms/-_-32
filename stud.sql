CREATE TABLE iiiistudent1 (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    grade INTEGER NOT NULL,
    score_math INTEGER NOT NULL,
    score_ukr_lang INTEGER NOT NULL,
    score_eng_lang INTEGER NOT NULL,
    score_history INTEGER NOT NULL,
    skipped_classes INTEGER
);

INSERT INTO iiiistudent1 
(id, name, grade, score_math, score_ukr_lang, score_eng_lang, score_history, skipped_classes) 
VALUES
(1, 'Andriy Petrenko', 6, 6, 6, 6, 6, 0),
(2, 'Tetyana Shevchenko', 6, 6, 6, 6, 6, 0),
(3, 'Vlad Denysyuk', 6, 6, 6, 6, 6, 0),
(4, 'Paraska Vovk', 6, 6, 6, 6, 6, 0),
(5, 'Dmytro Franko', 6, 6, 6, 6, 6, 0),
(6, 'Anna Kostenko', 6, 6, 6, 6, 6, 0),
(7, 'Yana Susura', 6, 6, 6, 6, 6, 0),
(8, 'Mykola Konoplynkiy', 6, 6, 6, 6, 6, 0);

SELECT name, grade, score_math
FROM iiiistudent
WHERE score_math > 4
LIMIT 5;

SELECT name, grade
FROM iiiistudent
WHERE skipped_classes IS NOT NULL;

SELECT name, grade, score_ukr_lang, score_eng_lang
FROM iiiistudent
WHERE score_ukr_lang > 9 OR score_eng_lang > 9;
