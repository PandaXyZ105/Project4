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

@WebServlet(name = "SignupServlet", urlPatterns = {"/signupServlet"})
public class SignupServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            
            if (!password.equals(confirmPassword)) {
                response.sendRedirect("signup.jsp?error=Passwords do not match.");
                return;
            }
            
            DBConnection db = new DBConnection();
            Connection con = db.setConnection();
            
            // Check if email already exists
            String checkEmailQuery = "SELECT email FROM tblUser WHERE email = ?";
            try (PreparedStatement pst = con.prepareStatement(checkEmailQuery)) {
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    response.sendRedirect("signup.jsp?error=Email already registered.");
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Database error: " + e.getMessage());
                return;
            }
            
            String query = "INSERT INTO tblUser (name, email, phone, password) VALUES (?, ?, ?, ?)";
            try {
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, phone);
                pst.setString(4, password);
                int rowCount = pst.executeUpdate();
                
                if (rowCount > 0) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("signup.jsp?error=Sign up failed, please try again.");
                }
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
        return "Signup Servlet";
    }
}
