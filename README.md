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

🚀 How to Run
Prerequisites:
Java JDK 11+

Apache Tomcat 10+

MySQL Server running

IDE (Eclipse or IntelliJ)

Steps:
Clone this repo:

bash
Αντιγραφή
Επεξεργασία
git clone https://github.com/yourusername/medical-appointments.git
Import the project into Eclipse or IntelliJ as a Dynamic Web Project.

Ensure MySQL is running and the schema is imported.

Deploy the app on Apache Tomcat (configured in Eclipse/IntelliJ).

Open in browser:

bash
Αντιγραφή
Επεξεργασία
http://localhost:8080/MedicalAppointments/login.jsp
🧪 Test Accounts
Patient:
Username: john

Password: 1234

Doctor:
Username: drsmith

Password: abcd

Admin:
Username: admin

Password: admin123

(Can be updated in the SQL dump)

📸 Screenshots
(Optional: Add screenshots for login, booking, calendar view, etc.)

📄 License
This project is open-source and licensed under the MIT License.

🤝 Contributing
Pull requests are welcome! Please follow standard GitHub flow and keep the code clean and documented.

📬 Contact
For questions, contact me at youremail@example.com or open an issue.

yaml
Αντιγραφή
Επεξεργασία

---

### ✅ Want this generated as an actual `README.md` file for you?
I can also include:
- a `schema.sql` example
- directory tree in actual file
- auto-detected GitHub badge headers

Let me know and I’ll prepare the full `.md` file as a download or zipped package!
