package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserAdminServlet", urlPatterns = {"/userAdminServlet"})
public class userAdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DBConnection db = new DBConnection();
            Connection con = db.setConnection();
            String query = "SELECT * FROM tblUser";
            try {
                PreparedStatement pst = con.prepareStatement(query);
                ResultSet rs = pst.executeQuery();
                
                out.println("<table class='table table-bordered'>");
                out.println("<thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Password</th></tr></thead>");
                out.println("<tbody>");
                while (rs.next()) {
                    int userId = rs.getInt("idUser");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String password = rs.getString("password");
                    
                    out.println("<tr>");
                    out.println("<td>" + userId + "</td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + phone + "</td>");
                    out.println("<td>" + password + "</td>");
                    out.println("</tr>");
                }
                out.println("</tbody>");
                out.println("</table>");
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Database error: " + e.getMessage());
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "User Admin Servlet";
    }
}
