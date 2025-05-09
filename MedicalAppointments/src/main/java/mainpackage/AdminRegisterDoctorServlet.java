package mainpackage;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AdminRegisterDoctorServlet")
public class AdminRegisterDoctorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String specialty = request.getParameter("specialty");

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Έλεγχος για υπάρχον username
            PreparedStatement checkUser = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
            checkUser.setString(1, username);
            ResultSet existing = checkUser.executeQuery();

            if (existing.next()) {
                response.getWriter().println("Το όνομα χρήστη υπάρχει ήδη.");
                return;
            }

            // 1. Εισαγωγή στον πίνακα users
            PreparedStatement userInsert = conn.prepareStatement(
                "INSERT INTO users (username, password, name, surname, role) VALUES (?, ?, ?, ?, 'doctor')",
                Statement.RETURN_GENERATED_KEYS
            );
            userInsert.setString(1, username);
            userInsert.setString(2, password);
            userInsert.setString(3, name);
            userInsert.setString(4, surname);
            userInsert.executeUpdate();

            ResultSet generatedKeys = userInsert.getGeneratedKeys();
            if (generatedKeys.next()) {
                int userId = generatedKeys.getInt(1);

                // 2. Εισαγωγή στον πίνακα doctors
                PreparedStatement doctorInsert = conn.prepareStatement(
                    "INSERT INTO doctors (user_id, specialty) VALUES (?, ?)"
                );
                doctorInsert.setInt(1, userId);
                doctorInsert.setString(2, specialty);
                doctorInsert.executeUpdate();

                response.sendRedirect("dashboard.jsp");

            } else {
                response.getWriter().println("Σφάλμα: Δεν δημιουργήθηκε ο γιατρός.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Σφάλμα βάσης: " + e.getMessage());
        }
    }
}
