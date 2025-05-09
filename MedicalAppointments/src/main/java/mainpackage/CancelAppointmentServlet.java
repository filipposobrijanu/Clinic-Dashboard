package mainpackage;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CancelAppointmentServlet")
public class CancelAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action)) {
            listAppointments(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Έλεγχος αν είναι 3+ μέρες μετά
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT date_time FROM appointments WHERE id = ?");
            ps.setInt(1, appointmentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Timestamp appointmentTime = rs.getTimestamp("date_time");
                Timestamp now = new Timestamp(System.currentTimeMillis());
                long diff = appointmentTime.getTime() - now.getTime();
                long daysDiff = diff / (1000 * 60 * 60 * 24);

                if (daysDiff >= 3) {
                    PreparedStatement update = conn.prepareStatement(
                            "UPDATE appointments SET status = 'cancelled' WHERE id = ?");
                    update.setInt(1, appointmentId);
                    update.executeUpdate();
                    response.sendRedirect("ViewAppointmentsServlet"); // Ανακατεύθυνση για προβολή των ενημερωμένων ραντεβού
                } else {
                    response.setContentType("text/html; charset=UTF-8");
                    response.getWriter().write("<div class='alert alert-danger'>Δεν μπορείτε να ακυρώσετε το ραντεβού (λιγότερο από 3 μέρες).</div>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<div class='alert alert-danger'>Σφάλμα στη βάση: " + e.getMessage() + "</div>");
        }
    }

    private void listAppointments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                                "WHERE a.patient_id = ? AND a.status = 'scheduled'"); // Εμφάνιση μόνο προγραμματισμένων ραντεβού
                ps2.setInt(1, patientId);
                ResultSet rs2 = ps2.executeQuery();

                StringBuilder htmlResponse = new StringBuilder();
                while (rs2.next()) {
                    htmlResponse.append("<li class=\"list-group-item rounded-4 shadow mb-3 appointment-item\">");
                    htmlResponse.append("<div class=\"appointment-text\">");
                    htmlResponse.append("<b>ID: </b>").append(rs2.getInt("id"));
                    htmlResponse.append(",<b> Ειδικότητα: </b>").append(rs2.getString("specialty"));
                    htmlResponse.append(",<b> Ημερομηνία/Ώρα: </b>").append(rs2.getString("date_time"));
                    htmlResponse.append(",<b> Κατάσταση: </b>").append(rs2.getString("status")).append("</b>");
                    htmlResponse.append("</div>");
                    htmlResponse.append("<input type=\"radio\" name=\"appointment_id\" value=\"").append(rs2.getInt("id")).append("\">");
                    htmlResponse.append("</li>");
                }

                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write(htmlResponse.toString());
                return;
            } else {
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write("<li class=\"list-group-item rounded-4 shadow mb-2\"><b>Δεν βρέθηκε</b> ασθενής για αυτόν τον χρήστη.</li>");
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<li class=\"list-group-item rounded-4 shadow mb-2 text-danger\">Σφάλμα κατά την ανάκτηση των ραντεβού: " + e.getMessage() + "</li>");
        }
    }
}