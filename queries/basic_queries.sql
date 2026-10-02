--Получить данные всех пациентов
SELECT * FROM patients;

--Получить имя и фамилию всех пациентов
SELECT first_name, last_name
FROM patients;

--Найти всех пациентов с фамилией «Соколова»
SELECT first_name, last_name
FROM patients
WHERE last_name = 'Соколова';

--Получить всех пациентов женского пола
SELECT first_name, last_name
FROM patients
WHERE gender = 'Ж';

--Получить пациентов, которые родились после 1990 года
SELECT first_name, last_name, date_of_birth
FROM patients
WHERE date_of_birth > '1990-01-01';

--Получить пациентов женского пола, рожденных после 1990 г.
SELECT first_name, last_name, date_of_birth
FROM patients
WHERE gender = 'Ж' AND date_of_birth > '1990-01-01';

--Получить пациентов, которые либо женщины, либо родились после 2000 г.
SELECT first_name, last_name, date_of_birth, gender
FROM patients
WHERE gender = 'Ж' OR date_of_birth > '2000-01-01';

--Получить женщин, родившихся после 1990 года, ИЛИ мужчин, родившихся после 2000 года
SELECT first_name, last_name, gender, date_of_birth
FROM patients
WHERE (gender = 'Ж' AND date_of_birth > '1990-01-01')
   OR (gender = 'М' AND date_of_birth > '2000-01-01');

--Получить пациентов, у которых фамилия Соколова, Иванова или Петрова
SELECT first_name, last_name, date_of_birth
FROM patients
WHERE last_name IN ('Соколова', 'Иванова', 'Петрова');

--Получить пациентов, у которых фамилия начинается на «С»
SELECT first_name, last_name
FROM patients
WHERE last_name LIKE 'С%';

--Получить пациентов, у которых фамилия заканчивается на «ова»
SELECT first_name, last_name
FROM patients
WHERE last_name LIKE '%ова';

--Получить пациентов, у которых имя состоит из 4 букв
SELECT first_name, last_name
FROM patients
WHERE first_name LIKE '____';

-- ============================================
-- Запросы к базе clinic (PostgreSQL, DBeaver)
-- Таблицы: patients, hospitalizations, wards
-- ============================================


-- ---------- 1. Подсчёт ----------

-- Получить количество пациентов, родившихся после 1990-01-01
SELECT COUNT(*)
FROM patients
WHERE date_of_birth > '1990-01-01';

-- Получить количество пациентов женского пола
SELECT COUNT(*)
FROM patients
WHERE gender = 'Ж';

-- Получить общее количество пациентов
SELECT COUNT(*)
FROM patients;

-- Получить уникальные значения пола
SELECT DISTINCT gender
FROM patients;


-- ---------- 2. Сортировка и LIMIT ----------

-- Получить имя, фамилию и дату рождения, отсортировав по фамилии, затем по имени (А-Я)
SELECT first_name, last_name, date_of_birth
FROM patients
ORDER BY last_name ASC, first_name ASC;

-- Получить двух самых старших пациентов
SELECT first_name, last_name, date_of_birth
FROM patients
ORDER BY date_of_birth ASC
LIMIT 2;

-- Получить двух самых молодых пациентов
SELECT first_name, last_name, date_of_birth
FROM patients
ORDER BY date_of_birth DESC
LIMIT 2;

-- Получить трёх самых молодых пациентов
SELECT first_name, last_name, date_of_birth
FROM patients
ORDER BY date_of_birth DESC
LIMIT 3;

-- Получить всех пациентов от самого молодого к самому старшему
SELECT first_name, last_name, date_of_birth
FROM patients
ORDER BY date_of_birth DESC;

-- Получить всех пациентов от самого старшего к самому молодому
SELECT first_name, last_name, date_of_birth
FROM patients
ORDER BY date_of_birth;

-- Получить номер, имя и фамилию пациентов, отсортировав по номеру
SELECT patient_id, first_name, last_name
FROM patients
ORDER BY patient_id;


-- ---------- 3. Пустые значения (NULL) ----------

-- Получить пациентов, у которых указано отчество
SELECT first_name, last_name, patronymic
FROM patients
WHERE patronymic IS NOT NULL;

-- Получить пациентов, у которых отчество не указано
SELECT first_name, last_name, patronymic
FROM patients
WHERE patronymic IS NULL;


-- ---------- 4. Поиск по шаблону (LIKE) ----------

-- Получить пациентов, у которых фамилия заканчивается на «ова»
SELECT first_name, last_name
FROM patients
WHERE last_name LIKE '%ова';

-- Получить пациентов, у которых фамилия начинается на «С»
SELECT first_name, last_name
FROM patients
WHERE last_name LIKE 'С%';

-- Получить пациентов, у которых имя состоит из 4 букв
SELECT first_name, last_name
FROM patients
WHERE first_name LIKE '____';


-- ---------- 5. Фильтрация (WHERE, AND, OR, IN) ----------

-- Получить имя и фамилию всех пациентов
SELECT first_name, last_name
FROM patients;

-- Найти всех пациентов с фамилией «Соколова»
SELECT first_name, last_name
FROM patients
WHERE last_name = 'Соколова';

-- Получить всех пациентов женского пола
SELECT first_name, last_name
FROM patients
WHERE gender = 'Ж';

-- Получить пациентов, которые родились после 1990 года
SELECT first_name, last_name, date_of_birth
FROM patients
WHERE date_of_birth > '1990-01-01';

-- Получить пациентов женского пола, рождённых после 1990 г.
SELECT first_name, last_name, date_of_birth
FROM patients
WHERE gender = 'Ж' AND date_of_birth > '1990-01-01';

-- Получить пациентов, которые либо женщины, либо родились после 2000 г.
SELECT first_name, last_name, date_of_birth, gender
FROM patients
WHERE gender = 'Ж' OR date_of_birth > '2000-01-01';

-- Получить женщин, родившихся после 1990 года, ИЛИ мужчин, родившихся после 2000 года
SELECT first_name, last_name, gender, date_of_birth
FROM patients
WHERE (gender = 'Ж' AND date_of_birth > '1990-01-01')
   OR (gender = 'М' AND date_of_birth > '2000-01-01');

-- Получить пациентов, у которых фамилия Соколова, Иванова или Петрова
SELECT first_name, last_name, date_of_birth
FROM patients
WHERE last_name IN ('Соколова', 'Иванова', 'Петрова');

-- Добавить в госпитализации столбец «количество дней в больнице»
ALTER TABLE hospitalizations
ADD COLUMN days_in_hospital INT;

-- Посчитать количество дней в больнице (дата выписки минус дата поступления)
UPDATE hospitalizations
SET days_in_hospital = discharge_date - admission_date
WHERE discharge_date IS NOT NULL;

-- Проверить результат расчёта дней в больнице
SELECT hospitalization_id, admission_date, discharge_date, days_in_hospital
FROM hospitalizations;

-- Добавить в госпитализации столбец «диагноз»
ALTER TABLE hospitalizations
ADD COLUMN diagnosis VARCHAR(200);

-- Заполнить диагнозы для каждой госпитализации
UPDATE hospitalizations
SET diagnosis = CASE hospitalization_id
    WHEN 1 THEN 'Гипертония'
    WHEN 2 THEN 'Пневмония'
    WHEN 3 THEN 'Гастрит'
    WHEN 4 THEN 'Перелом руки'
    WHEN 5 THEN 'Аритмия'
    WHEN 6 THEN 'Пневмония'
END;

-- Получить фамилию каждого пациента и его диагноз
SELECT patients.last_name, hospitalizations.diagnosis
FROM hospitalizations
JOIN patients ON patients.patient_id = hospitalizations.patient_id;
