package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/DeleteProductServlet"})
public class DeleteProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productId = request.getParameter("productId");

        try {
            DBConnection db = new DBConnection();
            Connection con = db.setConnection();
            String query = "DELETE FROM tblProduct WHERE product_id = ?";
            try {
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, Integer.parseInt(productId));
                int rowsAffected = pst.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect("admin.jsp?success=true"); // Redirect back to product admin page with success parameter
                } else {
                    response.getWriter().println("No product found with the given ID.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Database error: " + e.getMessage());
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid product ID.");
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
        return "Delete Product Servlet";
    }
}
