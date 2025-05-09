package mainpackage;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ViewDoctorAppointmentsServlet")
public class ViewDoctorAppointmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement ps1 = conn.prepareStatement("SELECT id FROM doctors WHERE user_id = ?");
            ps1.setInt(1, userId);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                int doctorId = rs1.getInt("id");

                PreparedStatement ps2 = conn.prepareStatement(
                        "SELECT a.id, a.date_time, a.status, p.first_name, p.last_name " +
                        "FROM appointments a JOIN patients p ON a.patient_id = p.id " +
                        "WHERE a.doctor_id = ? AND a.status != 'cancelled'");
                ps2.setInt(1, doctorId);
                ResultSet rs2 = ps2.executeQuery();

                StringBuilder htmlResponse = new StringBuilder();
                while (rs2.next()) {
                    htmlResponse.append("<li class=\"list-group-item rounded-4 shadow mb-3\">");
                    htmlResponse.append("<b>ID: </b>").append(rs2.getInt("id"));
                    htmlResponse.append(",<b> Ασθενής: </b>").append(rs2.getString("first_name")).append(" ").append(rs2.getString("last_name"));
                    htmlResponse.append(",<b> Ημερομηνία/Ώρα: </b>").append(rs2.getString("date_time"));
                    htmlResponse.append(",<b> Κατάσταση: </b>").append(rs2.getString("status"));
                    htmlResponse.append("</li>");
                }

                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write(htmlResponse.toString());
                return;
            } else {
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write("<li class=\"list-group-item rounded-4 shadow mb-2\"><b>Δεν βρέθηκε</b> γιατρός για αυτόν τον χρήστη.</li>");
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<li class=\"list-group-item rounded-4 shadow mb-2 text-danger\">Σφάλμα κατά την ανάκτηση των ραντεβού: " + e.getMessage() + "</li>");
        }
    }
}