CREATE TABLE class (
    Class_ID integer PRIMARY KEY ,
    Name text
);

CREATE TABLE item (
    Item_ID integer PRIMARY KEY ,
    Name text
);

CREATE TABLE character (
    Character_ID integer PRIMARY KEY,
    Class_ID integer REFERENCES class (Class_ID),
    Name text
);

CREATE TABLE effect (
    Effect_ID integer PRIMARY KEY ,
    Name text
);

CREATE TABLE organ (
    Organ_ID integer PRIMARY KEY ,
    Character_ID integer REFERENCES character (Character_ID),
    Name text
);

CREATE TABLE action (
    Action_ID integer PRIMARY KEY,
    Character_ID integer REFERENCES character (Character_ID),
    GlobalTarget_ID integer REFERENCES character (Character_ID),
    Target_ID integer REFERENCES organ (Organ_ID),
    Effect_ID integer REFERENCES effect (Effect_ID),
    Name text
);

INSERT INTO class VALUES (1, 'Человек');
INSERT INTO class VALUES (2, 'Зверек');

INSERT INTO item VALUES (1, 'Ветка');

INSERT INTO character VALUES (1, 1, 'Хэммонд');
INSERT INTO character VALUES (2, 2, 'Компи1');
INSERT INTO character VALUES (3, 2, 'Компи2');

INSERT INTO effect VALUES (1, 'Боль');
INSERT INTO effect VALUES (2, 'Дикость');
INSERT INTO effect VALUES (3, 'Равновесие');
INSERT INTO effect VALUES (4, 'Кровотечение');

INSERT INTO organ VALUES (1, 1, 'Нога');
INSERT INTO organ VALUES (2, 1, 'Бедро');
INSERT INTO organ VALUES (3, 1, 'Спина');
INSERT INTO organ VALUES (4, 1, 'Рука');

INSERT INTO action VALUES (1 , 1, null, null, null, 'Повернулся');
INSERT INTO action VALUES (2 , 1, null, null, null, 'Карабкался');
INSERT INTO action VALUES (3 , 1, null, 1   , null, 'Скакал');
INSERT INTO action VALUES (4 , 1, null, 2   , 1   , 'Страдал');
INSERT INTO action VALUES (5 , 2, 1   , 3   , null, 'Запрыгнул');
INSERT INTO action VALUES (6 , 1, null, 4   , 2   , 'Замахал');
INSERT INTO action VALUES (7 , 1, null, null, 3   , 'Потерял');
INSERT INTO action VALUES (8 , 1, null, null, null, 'Покатился');
INSERT INTO action VALUES (9 , 1, null, null, null, 'Остановился');
INSERT INTO action VALUES (10, 3, 1   , null, null, 'Подскочил');
INSERT INTO action VALUES (11, 3, 1   , 4   , 4   , 'Откусил');
INSERT INTO action VALUES (12, 1, null, null, null, 'Увидел');
