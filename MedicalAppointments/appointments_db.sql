-- Δημιουργία βάσης δεδομένων
CREATE DATABASE IF NOT EXISTS appointments_db;
USE appointments_db;

-- Δημιουργία πίνακα users
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  surname VARCHAR(100) NOT NULL,
  role ENUM('patient', 'doctor', 'admin') NOT NULL
);

-- Δημιουργία πίνακα patients
CREATE TABLE patients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  amka VARCHAR(15) NOT NULL UNIQUE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Δημιουργία πίνακα doctors
CREATE TABLE doctors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  specialty ENUM('Pathologist', 'Ophthalmologist', 'Orthopedic') NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Δημιουργία πίνακα appointments
CREATE TABLE appointments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  date_time DATETIME NOT NULL,
  status ENUM('scheduled', 'cancelled') DEFAULT 'scheduled',
  FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
  FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE
);

-- ---------------------
-- Εισαγωγή δειγμάτων για δοκιμή
-- ---------------------

-- Προσθήκη Χρηστών
INSERT INTO users (username, password, name, surname, role) VALUES
('puser1', 'pass123', 'Nikos', 'Papadopoulos', 'patient'),
('duser1', 'doc123', 'Maria', 'Ioannidou', 'doctor'),
('admin1', 'adminpass', 'Admin', 'User', 'admin');

-- Προσθήκη Ασθενών
INSERT INTO patients (user_id, amka) VALUES
(1, '12345678901');

-- Προσθήκη Ιατρών
INSERT INTO doctors (user_id, specialty) VALUES
(2, 'Pathologist');

-- Προσθήκη Ραντεβού (παράδειγμα)
INSERT INTO appointments (patient_id, doctor_id, date_time, status) VALUES
(1, 1, '2025-05-15 10:00:00', 'scheduled');
