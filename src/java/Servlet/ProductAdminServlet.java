package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductAdminServlet", urlPatterns = {"/productAdminServlet"})
public class ProductAdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DBConnection db = new DBConnection();
            Connection con = db.setConnection();
            
            // Get category filter parameter from request
            String categoryFilter = request.getParameter("categoryFilter");
            
            // Get search keyword parameter from request
            String searchKeyword = request.getParameter("searchKeyword");
            
            // Build query based on category filter and search keyword
            String query;
            if (categoryFilter == null || categoryFilter.isEmpty() || categoryFilter.equals("All")) {
                if (searchKeyword == null || searchKeyword.isEmpty()) {
                    query = "SELECT * FROM tblProduct";
                } else {
                    query = "SELECT * FROM tblProduct WHERE name LIKE ?";
                }
            } else {
                if (searchKeyword == null || searchKeyword.isEmpty()) {
                    query = "SELECT * FROM tblProduct WHERE category_id = ?";
                } else {
                    query = "SELECT * FROM tblProduct WHERE category_id = ? AND name LIKE ?";
                }
            }

            try {
                PreparedStatement pst = con.prepareStatement(query);
                if (categoryFilter != null && !categoryFilter.isEmpty() && !categoryFilter.equals("All")) {
                    pst.setInt(1, Integer.parseInt(categoryFilter));
                    if (searchKeyword != null && !searchKeyword.isEmpty()) {
                        pst.setString(2, "%" + searchKeyword + "%");
                    }
                } else {
                    if (searchKeyword != null && !searchKeyword.isEmpty()) {
                        pst.setString(1, "%" + searchKeyword + "%");
                    }
                }
                
                ResultSet rs = pst.executeQuery();
                
                out.println("<!DOCTYPE html>");
                out.println("<html lang='en'>");
                out.println("<head>");
                out.println("<meta charset='UTF-8'>");
                out.println("<title>Admin Dashboard - Gentle Sparkle</title>");
                out.println("<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>");
                out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>");
                out.println("<link rel='stylesheet' href='Css/admin.css'>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='container-fluid mt-4'>");

                // Back to Admin Dashboard button
                out.println("<div class='mb-3'>");
                out.println("<a href='admin.jsp' class='btn btn-secondary'>Back to Admin Dashboard</a>");
                out.println("</div>");

                out.println("<h3 class='mb-4'>Manage Products</h3>");
                
                // Add product button and filter/search form in one row
                out.println("<div class='row mb-3'>");
                
                // Add product button
                out.println("<div class='col-md-3 mb-2'>");
                out.println("<a href='addProduct.jsp' class='btn btn-success btn-block'>Add Product</a>");
                out.println("</div>"); // Close col-md-3
                
                // Filter/search form
                out.println("<div class='col-md-9'>");
                out.println("<form class='form-inline float-md-right mb-2' method='GET'>");
                
                // Filter by Category dropdown
                out.println("<div class='form-group mr-2'>");
                out.println("<label for='categoryFilter' class='mr-2'>Filter by Category:</label>");
                out.println("<select class='form-control' id='categoryFilter' name='categoryFilter'>");
                out.println("<option value='All'>All Categories</option>");
                out.println("<option value='1'>Necklaces</option>");
                out.println("<option value='2'>Earrings</option>");
                out.println("<option value='3'>Ring</option>");
                out.println("<option value='4'>Bracelets</option>");
                out.println("</select>");
                out.println("</div>"); // Close form-group
                
                // Search by Name input
                out.println("<div class='form-group mr-2'>");
                out.println("<label for='searchKeyword' class='mr-2'>Search by Name:</label>");
                out.println("<input type='text' class='form-control' id='searchKeyword' name='searchKeyword'>");
                out.println("</div>"); // Close form-group
                
                // Filter button
                out.println("<button type='submit' class='btn btn-primary'>Filter</button>");
                out.println("</form>");
                out.println("</div>"); // Close col-md-9
                
                out.println("</div>"); // Close row
                
                // Display product table
                out.println("<div id='productTable'>");
                out.println("<table class='table table-bordered'>");
                out.println("<thead><tr><th>ID</th><th>Name</th><th>Price</th><th>Stock</th><th>Category</th><th>Edit</th><th>Delete</th></tr></thead>");
                out.println("<tbody>");
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int stock = rs.getInt("stock");
                    String category = getCategoryName(rs.getInt("category_id")); // Assuming a method to get category name
                    
                    // Format price to Indonesian Rupiah
                    NumberFormat format = NumberFormat.getCurrencyInstance();
                    String formattedPrice = format.format(price);

                    out.println("<tr>");
                    out.println("<td>" + productId + "</td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + formattedPrice + "</td>");
                    out.println("<td>" + stock + "</td>");
                    out.println("<td>" + category + "</td>");
                    out.println("<td><a href='editStock.jsp?productId=" + productId + "' class='btn btn-warning btn-sm'>Edit Stock</a></td>");
                    out.println("<td><a href='#' class='btn btn-danger btn-sm' onclick='confirmDelete(" + productId + ")'>Delete</a></td>");
                    out.println("</tr>");
                }
                out.println("</tbody>");
                out.println("</table>");
                out.println("</div>");

                // Add JavaScript for confirmation dialog
                out.println("<script>");
                out.println("function confirmDelete(productId) {");
                out.println("if (confirm('Are you sure you want to delete this product?')) {");
                out.println("window.location.href = 'DeleteProductServlet?productId=' + productId;");
                out.println("}");
                out.println("}");
                out.println("</script>");
                
                out.println("</div>"); // Close container-fluid
                out.println("</body>");
                out.println("</html>");

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
        return "Product Admin Servlet";
    }
    
    // Method to get category name based on category_id
    private String getCategoryName(int categoryId) {
        switch (categoryId) {
            case 1:
                return "Necklaces";
            case 2:
                return "Earrings";
            case 3:
                return "Ring";
            case 4:
                return "Bracelets";
            default:
                return "Unknown";
        }
    }
}
