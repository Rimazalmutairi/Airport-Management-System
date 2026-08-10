-- 1. إنشاء قاعدة البيانات
CREATE DATABASE IF NOT EXISTS airport_management_system;
USE airport_management_system;

-- 2. جدول المطارات (Airports)
CREATE TABLE Airports (
    airport_code VARCHAR(10) PRIMARY KEY,
    airport_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- 3. جدول شركات الطيران (Airlines)
CREATE TABLE Airlines (
    airline_id INT AUTO_INCREMENT PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE
);

-- 4. جدول الرحلات (Flights)
CREATE TABLE Flights (
    flight_number VARCHAR(20) PRIMARY KEY,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    airport_code VARCHAR(10),
    airline_id INT,
    FOREIGN KEY (airport_code) REFERENCES Airports(airport_code) ON DELETE SET NULL,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id) ON DELETE SET NULL
);

-- 5. جدول المسافرين (Passengers)
CREATE TABLE Passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    passport_number VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100)
);

-- 6. جدول الحجوزات (Bookings)
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_date DATE NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    flight_number VARCHAR(20),
    passenger_id INT,
    FOREIGN KEY (flight_number) REFERENCES Flights(flight_number) ON DELETE CASCADE,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id) ON DELETE CASCADE
);

-- 7. إضافة بيانات تجريبية (Sample Data)
INSERT INTO Airports (airport_code, airport_name, city, country) VALUES
('JED', 'King Abdulaziz International Airport', 'Jeddah', 'Saudi Arabia'),
('RUH', 'King Khalid International Airport', 'Riyadh', 'Saudi Arabia'),
('DXB', 'Dubai International Airport', 'Dubai', 'UAE');

INSERT INTO Airlines (airline_name, code) VALUES
('Saudia', 'SV'),
('Flynas', 'XY'),
('Emirates', 'EK');

INSERT INTO Flights (flight_number, departure_time, arrival_time, airport_code, airline_id) VALUES
('SV101', '2026-09-01 08:00:00', '2026-09-01 09:30:00', 'JED', 1),
('XY202', '2026-09-01 12:00:00', '2026-09-01 13:45:00', 'RUH', 2),
('EK303', '2026-09-02 15:30:00', '2026-09-02 18:00:00', 'DXB', 3);

INSERT INTO Passengers (first_name, last_name, passport_number, email) VALUES
('Rimaz', 'Al-Mutairi', 'A12345678', 'rimaz@example.com'),
('Ahmed', 'Ali', 'B98765432', 'ahmed@example.com');

INSERT INTO Bookings (booking_date, seat_number, flight_number, passenger_id) VALUES
('2026-08-10', '12A', 'SV101', 1),
('2026-08-11', '15B', 'XY202', 2);
