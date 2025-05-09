package mainpackage;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/TestConnectionServlet")
public class TestConnectionServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                response.getWriter().println("Σύνδεση με βάση δεδομένων: ΕΠΙΤΥΧΗΣ!");
            } else {
                response.getWriter().println("Fail.");
            }
        } catch (SQLException e) {
            response.getWriter().println("Σφάλμα σύνδεσης: " + e.getMessage());
        }
    }
}