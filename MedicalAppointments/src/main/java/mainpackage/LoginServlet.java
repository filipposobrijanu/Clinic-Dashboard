package mainpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Φέρνουμε τον χρήστη από τη βάση
            PreparedStatement ps = conn.prepareStatement(
                "SELECT id, name, role FROM users WHERE username= ? AND password= ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");
                String name = rs.getString("name");
                String role = rs.getString("role");

                // Δημιουργία session
                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                session.setAttribute("user_id", userId);     // 🔑 ΧΡΗΣΙΜΟ για patient_id lookup
                session.setAttribute("name", name);
                session.setAttribute("role", role);

                // Ανακατεύθυνση ανάλογα με ρόλο
                if ("patient".equals(role)) {
                    response.sendRedirect("dashboard.jsp");
                } else if ("doctor".equals(role)) {
                    response.sendRedirect("doctorDashboard.jsp");
                } else if ("admin".equals(role)) {
                    response.sendRedirect("adminDashboard.jsp");
                } else {
                    response.getWriter().println("Ρόλος χρήστη άγνωστος.");
                }

            } else {
                response.sendRedirect("login.jsp?error=true");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Σφάλμα σύνδεσης: " + e.getMessage());
        }
    }
}
