package mainpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String datetime = request.getParameter("datetime");
        int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("user");

        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT p.id FROM patients p JOIN users u ON p.user_id = u.id WHERE u.username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int patientId = rs.getInt("id");

                PreparedStatement insert = conn.prepareStatement(
                    "INSERT INTO appointments (patient_id, doctor_id, date_time, status) VALUES (?, ?, ?, 'scheduled')");
                insert.setInt(1, patientId);
                insert.setInt(2, doctorId);
                insert.setString(3, datetime);
                insert.executeUpdate();

                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("error404_bookappointment.jsp");
            }
        } catch (SQLException e) {
            response.sendRedirect("error404_bookappointment.jsp");
        }
    }
}
