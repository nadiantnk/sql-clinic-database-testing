CREATE TABLE specializations (
    specialization_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialization_id INT,
    FOREIGN KEY (specialization_id)
        REFERENCES specializations(specialization_id)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    patronymic VARCHAR(100),
    date_of_birth DATE,
    phone VARCHAR(20),
    gender CHAR(1) CHECK (gender IN ('М', 'Ж')),
    policy_number VARCHAR(50) UNIQUE
);

CREATE TABLE appointments (
    appointment_id INT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id)
       REFERENCES patients(patient_id)
);
