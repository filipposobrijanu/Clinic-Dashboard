package mainpackage;


import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DoctorViewServlet")
public class DoctorViewServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> doctorAppointments = new ArrayList<>();
        String username = (String) request.getSession().getAttribute("user");

        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT a.id, a.date_time, a.status " +
                "FROM appointments a " +
                "JOIN doctors d ON a.doctor_id = d.id " +
                "JOIN users u ON d.user_id = u.id " +
                "WHERE u.username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String info = "ID: " + rs.getInt("id") +
                        ", Date: " + rs.getString("date_time") +
                        ", Status: " + rs.getString("status");
                doctorAppointments.add(info);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("doctorAppointments", doctorAppointments);
        request.getRequestDispatcher("doctorViewAppointments.jsp").forward(request, response);
    }
}
