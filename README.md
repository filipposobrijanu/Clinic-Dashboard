
# 🏥 Medical Appointment Management System

A web-based system for managing medical appointments, built using **Java Servlets**, **JSP**, and **MySQL**, and deployed on **Apache Tomcat**. The system supports three user roles: **Patients**, **Doctors**, and **Administrators**, each with specific functionality and access rights.

---

## 📌 Features

### 👤 Patient
- Register and log in to the system
- Search available doctors by specialty
- Book an appointment at a selected date and time
- View upcoming and past appointments
- Cancel appointments (if at least 3 days in the future)

### 🩺 Doctor
- Log in securely
- Submit availability (dates & times)
- View scheduled appointments by day or week
- Cancel future appointments (if at least 3 days ahead)

### 🛠️ Admin
- Register new doctors into the system
- View all registered doctors and specialties

---

## 🛠️ Technologies Used

- **Java EE (Servlets, JSP)**
- **MySQL** for relational database
- **Apache Tomcat** as the application server
- **JDBC** for database interaction
- **Bootstrap 5** for responsive UI
- **Eclipse / IntelliJ** (development IDE)

---

## 🔧 Project Structure

```
MedicalAppointments/
│
├── src/
│   └── mainpackage/
│       ├── DatabaseConnection.java
│       ├── LoginServlet.java
│       ├── ViewAppointmentsServlet.java
│       ├── DoctorViewAppointmentsServlet.java
│       ├── AdminRegisterDoctorServlet.java
│       └── ...
│
├── WebContent/
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── viewAppointments.jsp
│   ├── doctorViewAppointments.jsp
│   ├── adminViewDoctors.jsp
│   └── ...
│
├── WEB-INF/
│   ├── web.xml
│
├── sql/
│   └── schema.sql
│
└── README.md
```

---

## 💾 Database Setup

1. Create a new MySQL database:

```sql
CREATE DATABASE appointments_db;
```

2. Import the schema and test data from `/sql/schema.sql`.

3. Update your `DatabaseConnection.java` with the correct credentials:

```java
private static final String URL = "jdbc:mysql://localhost:3306/appointments_db?useSSL=false&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "yourpassword";
```

---

## 🚀 How to Run

### Prerequisites:
- Java JDK 11+
- Apache Tomcat 10+
- MySQL Server running
- IDE (Eclipse or IntelliJ)

### Steps:
1. Clone this repo:
```bash
git clone https://github.com/yourusername/medical-appointments.git
```

2. Import the project into Eclipse or IntelliJ as a Dynamic Web Project.

3. Ensure MySQL is running and the schema is imported.

4. Deploy the app on Apache Tomcat (configured in Eclipse/IntelliJ).

5. Open in browser:
```
http://localhost:8080/MedicalAppointments/login.jsp
```

---

## 🧪 Test Accounts

### Patient:
- Username: `john`
- Password: `1234`

### Doctor:
- Username: `drsmith`
- Password: `abcd`

### Admin:
- Username: `admin`
- Password: `admin123`

> (Can be updated in the SQL dump)

---

## 📄 License

This project is open-source and licensed under the [MIT License](LICENSE).

---

## 🤝 Contributing

Pull requests are welcome! Please follow standard GitHub flow and keep the code clean and documented.

---

## 📬 Contact

For questions, contact me at [youremail@example.com](mailto:youremail@example.com) or open an issue.
