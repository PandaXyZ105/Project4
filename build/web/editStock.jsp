<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Database.DBConnection, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product - Diana’s Jewelry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h3>Edit Product</h3>
        <%
            String productId = request.getParameter("productId");
            DBConnection db = new DBConnection();
            Connection con = db.setConnection();
            String query = "SELECT * FROM tblProduct WHERE product_id = ?";
            try {
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, Integer.parseInt(productId));
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int category_id = rs.getInt("category_id");
                    int stock = rs.getInt("stock");
                    String description = rs.getString("description");
                    String short_description = rs.getString("short_description");
                    String spec = rs.getString("spec");
                    String image_url = rs.getString("image_url");
        %>
        <form action="updateStockServlet" method="post">
            <input type="hidden" name="productId" value="<%= productId %>">
            <div class="form-group">
                <label for="name">Product Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= price %>" required>
            </div>
            <div class="form-group">
                <label for="category_id">Category</label>
                <select class="form-control" id="category_id" name="category_id" required>
                    <option value="1" <%= category_id == 1 ? "selected" : "" %>>Necklaces</option>
                    <option value="2" <%= category_id == 2 ? "selected" : "" %>>Earrings</option>
                    <option value="3" <%= category_id == 3 ? "selected" : "" %>>Ring</option>
                    <option value="4" <%= category_id == 4 ? "selected" : "" %>>Bracelets</option>
                </select>
            </div>
            <div class="form-group">
                <label for="stock">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" value="<%= stock %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="5" required><%= description %></textarea>
            </div>
            <div class="form-group">
                <label for="short_description">Short Description</label>
                <textarea class="form-control" id="short_description" name="short_description" rows="3" required><%= short_description %></textarea>
            </div>
            <div class="form-group">
                <label for="spec">Specification</label>
                <textarea class="form-control" id="spec" name="spec" rows="5" required><%= spec %></textarea>
            </div>
            <div class="form-group">
                <label for="image_url">Image URL</label>
                <input type="text" class="form-control" id="image_url" name="image_url" value="<%= image_url %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="admin.jsp" class="btn btn-secondary">Back</a>
        </form>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
    
    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Script untuk pop-up window -->
    <script>
        // Cek parameter URL untuk menampilkan pop-up
        var urlParams = new URLSearchParams(window.location.search);
        var successMessage = urlParams.get('success');
        if (successMessage === 'true') {
            alert('Product updated successfully!');
            window.history.replaceState({}, document.title, window.location.pathname);
        }
    </script>
</body>
</html>
