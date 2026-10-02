CREATE TABLE specializations (
    specialization_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    patronymic VARCHAR(100) NOT NULL,
    specialization_id INT NOT NULL,
    FOREIGN KEY (specialization_id)
        REFERENCES specializations(specialization_id)
        ON DELETE RESTRICT
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    patronymic VARCHAR(100),
    date_of_birth DATE NOT NULL,
    phone VARCHAR(20),
    gender CHAR(1)
        CHECK (gender IN ('М', 'Ж')),
    policy_number VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('Запланирован', 'Завершен', 'Отменен', 'Не явился')),
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE RESTRICT
);

CREATE TABLE wards (
    ward_id SERIAL PRIMARY KEY,
    ward_number VARCHAR(10) NOT NULL UNIQUE,
    specialization_id INT NOT NULL,
    category VARCHAR(20) NOT NULL
        CHECK (category IN ('Одноместная', 'Двухместная', 'Общая')),
    capacity INT NOT NULL
        CHECK (capacity > 0),
    price_per_day NUMERIC(10, 2) NOT NULL
        CHECK (price_per_day > 0),
    FOREIGN KEY (specialization_id)
        REFERENCES specializations(specialization_id)
        ON DELETE RESTRICT
);

CREATE TABLE hospitalizations (
    hospitalization_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE,
    days_in_hospital INT,
    diagnosis VARCHAR(200),
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT
);
