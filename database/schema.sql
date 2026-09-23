CREATE TABLE specializations (
    specialization_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY
    first_name VARCHAR(100) NOT NULL
    last_name VARCHAR(100) NOT NULL
    specialization_id NUM FOREIGN KEY
);

CREATE TABLE patients (
    ...
);

CREATE TABLE appointments (
    ...
);
