package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewProfileServlet", urlPatterns = {"/viewProfileServlet"})
public class viewProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        DBConnection db = new DBConnection();
        Connection con = db.setConnection();
        String query = "SELECT * FROM tblUser WHERE email = ?";
        try {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, userEmail);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone", rs.getString("phone"));
                request.setAttribute("password", rs.getString("password"));
                // Jangan masukkan alamat ke atribut request
            } else {
                request.setAttribute("error", "User not found.");
            }

            request.getRequestDispatcher("myProfile.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("myProfile.jsp").forward(request, response);
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
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
        return "View Profile Servlet";
    }
}
