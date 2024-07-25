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

@WebServlet(name = "updateStockServlet", urlPatterns = {"/updateStockServlet"})
public class updateStockServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productId = request.getParameter("productId");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String category_id = request.getParameter("category_id");
        String stock = request.getParameter("stock");
        String description = request.getParameter("description");
        String short_description = request.getParameter("short_description");
        String spec = request.getParameter("spec");
        String image_url = request.getParameter("image_url");
        
        DBConnection db = new DBConnection();
        Connection con = db.setConnection();
        
        String query = "UPDATE tblProduct SET name = ?, price = ?, category_id = ?, stock = ?, description = ?, short_description = ?, spec = ?, image_url = ? WHERE product_id = ?";
        try {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setDouble(2, Double.parseDouble(price));
            pst.setInt(3, Integer.parseInt(category_id));
            pst.setInt(4, Integer.parseInt(stock));
            pst.setString(5, description);
            pst.setString(6, short_description);
            pst.setString(7, spec);
            pst.setString(8, image_url);
            pst.setInt(9, Integer.parseInt(productId));
            
            pst.executeUpdate();
            response.sendRedirect("editStock.jsp?productId=" + productId + "&success=true");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("editStock.jsp?productId=" + productId + "&error=Database error: " + e.getMessage());
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
        return "Update Product Servlet";
    }
}
