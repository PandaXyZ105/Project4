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
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            DBConnection db = new DBConnection();
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                con = db.setConnection();
                String query = "SELECT * FROM tblUser WHERE email = ?";
                pst = con.prepareStatement(query);
                pst.setString(1, email);
                rs = pst.executeQuery();

                if (rs.next()) {
                    String dbPassword = rs.getString("password");
                    if (dbPassword.equals(password)) {
                        // Check if the email and password match admin credentials
                        if (email.equals("admin@gmail.com") && password.equals("admin")) {
                            HttpSession session = request.getSession();
                            session.setAttribute("email", email);
                            session.setAttribute("login", true);
                            response.sendRedirect("admin.jsp");
                        } else {
                            HttpSession session = request.getSession();
                            session.setAttribute("email", email);
                            session.setAttribute("login", true);
                            response.sendRedirect("indexSuccess.jsp");
                        }
                    } else {
                        request.setAttribute("error", "Invalid email or password.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "Invalid email or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Database error: " + e.getMessage());
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (pst != null) {
                        pst.close();
                    }
                    if (con != null) {
                        con.close();
                    }
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
        return "Login Servlet";
    }
}
