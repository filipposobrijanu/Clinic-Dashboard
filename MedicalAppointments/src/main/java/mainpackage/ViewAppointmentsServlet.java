package mainpackage;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ViewAppointmentsServlet")
public class ViewAppointmentsServlet extends HttpServlet {
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
            PreparedStatement ps1 = conn.prepareStatement("SELECT id FROM patients WHERE user_id = ?");
            ps1.setInt(1, userId);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                int patientId = rs1.getInt("id");

                PreparedStatement ps2 = conn.prepareStatement(
                        "SELECT a.id, a.date_time, a.status, d.specialty " +
                                "FROM appointments a JOIN doctors d ON a.doctor_id = d.id " +
                		"WHERE a.patient_id = ? AND a.status != 'cancelled'"); 
                ps2.setInt(1, patientId);
                ResultSet rs2 = ps2.executeQuery();

                StringBuilder htmlResponse = new StringBuilder();
                while (rs2.next()) {
                    htmlResponse.append("<li class=\"list-group-item rounded-4 shadow mb-3\">");
                    htmlResponse.append("ID: ").append(rs2.getInt("id"));
                    htmlResponse.append(", Ειδικότητα: ").append(rs2.getString("specialty"));
                    htmlResponse.append(", Ημερομηνία/Ώρα: ").append(rs2.getString("date_time"));
                    htmlResponse.append(", Κατάσταση: ").append(rs2.getString("status"));
                    htmlResponse.append("</li>");
                }

                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write(htmlResponse.toString());
                return; // Σημαντικό: μην κάνετε forward αν στέλνετε απευθείας την απάντηση
            } else {
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write("<li class=\"list-group-item rounded-4 shadow mb-2\">Δεν βρέθηκε ασθενής για αυτόν τον χρήστη.</li>");
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<li class=\"list-group-item rounded-4 shadow mb-2 text-danger\">Σφάλμα κατά την ανάκτηση των ραντεβού: " + e.getMessage() + "</li>");
        }
    }
}