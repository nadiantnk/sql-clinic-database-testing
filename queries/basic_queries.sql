--Получить данные всех пациентов
SELECT * FROM patients;

--Получить имя и фамилию всех пациентов
SELECT first_name, last_name
FROM patients;

--Найти всех пациентов с фамилией «Соколова»
SELECT last_name
FROM patients
WHERE last_name = 'Соколова';

--Получить всех пациентов женского пола
SELECT first_name, last_name
FROM patients
WHERE gender = 'Ж';

--Получить пациентов которые родились после 1990 года
SELECT first_name, last_name, date_of_birth
FROM patients
WHERE date_of_birth > 1990;
