package Servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Database.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cartIdStr = request.getParameter("cart_id");

        if (cartIdStr == null || cartIdStr.isEmpty()) {
            response.sendRedirect("cart.jsp"); // Redirect to cart page if cart_id is missing
            return;
        }

        int cartId = Integer.parseInt(cartIdStr);

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DBConnection().setConnection();

            String sql = "DELETE FROM tblcart WHERE cart_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cartId);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Redirect back to cart page after successful deletion
                response.sendRedirect("cart.jsp");
            } else {
                // Handle deletion failure (optional)
                response.sendRedirect("cart.jsp"); // Redirect to cart page
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or query error
            response.sendRedirect("cart.jsp"); // Redirect to cart page
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
