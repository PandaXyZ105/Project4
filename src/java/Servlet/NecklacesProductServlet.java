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

@WebServlet(name = "NecklacesProductServlet", urlPatterns = {"/necklacesProductServlet"})
public class NecklacesProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("product_id");

        if (productId != null && !productId.isEmpty()) {
            DBConnection db = new DBConnection();
            Connection con = db.setConnection();
            String query = "SELECT * FROM tblProduct WHERE product_id = ?";

            try {
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, Integer.parseInt(productId));
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    // Ambil data produk dari result set
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    String shortDescription = rs.getString("short_description");
                    String description = rs.getString("description");
                    int stock = rs.getInt("stock");
                    String imageUrl = rs.getString("image_url");
                    int categoryId = rs.getInt("category_id");

                    // Set atribut-atribut ke request untuk digunakan di JSP
                    request.setAttribute("name", name);
                    request.setAttribute("price", price);
                    request.setAttribute("short_description", shortDescription);
                    request.setAttribute("description", description);
                    request.setAttribute("stock", stock);
                    request.setAttribute("image_url", imageUrl);
                    request.setAttribute("category_id", categoryId);

                    // Forward ke halaman JSP untuk menampilkan detail produk
                    request.getRequestDispatcher("necklacesShowProduct.jsp").forward(request, response);
                } else {
                    // Handle jika produk tidak ditemukan
                    response.getWriter().println("Product not found");
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
        } else {
            // Handle jika parameter product_id tidak diberikan
            response.getWriter().println("Product ID is required.");
        }
    }
}
