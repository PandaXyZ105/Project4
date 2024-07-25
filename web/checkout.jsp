<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat, java.util.Locale, Database.DBConnection, Database.ProductDAO, Model.Cart, Model.Product" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    String email = (String) session.getAttribute("email");

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Cart> cartList = new ArrayList<>();
    Map<Integer, Product> productMap = new HashMap<>();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String[] cartIds = (String[]) session.getAttribute("cartIds");
    String subtotalStr = (String) session.getAttribute("subtotal");
    double subtotal = subtotalStr != null ? Double.parseDouble(subtotalStr) : 0.0;

    if (cartIds == null || cartIds.length == 0) {
        response.sendRedirect("cart.jsp");
        return;
    }

    try {
        conn = new DBConnection().setConnection();

        StringBuilder sqlCart = new StringBuilder("SELECT * FROM tblcart WHERE cart_id IN (");
        for (int i = 0; i < cartIds.length; i++) {
            sqlCart.append("?");
            if (i < cartIds.length - 1) {
                sqlCart.append(", ");
            }
        }
        sqlCart.append(")");

        ps = conn.prepareStatement(sqlCart.toString());
        for (int i = 0; i < cartIds.length; i++) {
            ps.setInt(i + 1, Integer.parseInt(cartIds[i]));
        }
        rs = ps.executeQuery();

        while (rs.next()) {
            Cart cart = new Cart(
                rs.getInt("cart_id"),
                rs.getInt("product_id"),
                rs.getString("email"),
                rs.getInt("quantity"),
                rs.getDouble("tempTotal")
            );
            cartList.add(cart);
        }

        rs.close();
        ps.close();

        ProductDAO productDAO = new ProductDAO();

        for (Cart cart : cartList) {
            Product product = productDAO.getProductById(cart.getProduct_id());
            if (product != null) {
                productMap.put(cart.getProduct_id(), product);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    NumberFormat format = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - Diana’s Jewelry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" media="all" href="css/style.css">
    <style>
        .checkout-form {
            margin-top: 20px;
        }
        .checkout-form h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-row {
            display: flex;
            margin-bottom: 15px;
        }
        .form-row .form-group {
            flex: 1;
            margin-right: 10px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .total-count {
            margin-top: 20px;
            text-align: right;
        }
        .total-count h4 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .btn-grey {
            background-color: #ccc;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-grey:hover {
            background-color: #666;
        }
    </style>
</head>
<body>
<%@ include file="headerSuccess.jsp" %>
<%@ include file="navSuccess.jsp" %>
<div id="breadcrumbs">
    <div class="container">
        <ul>
            <li><a href="#">Home</a></li>
            <li>Checkout</li>
        </ul>
    </div>
</div>
<div id="body">
    <div class="container">
        <div id="content" class="full">
            <div class="checkout-form">
                <h2>Checkout</h2>
                <form id="checkoutForm" action="ProcessOrderServlet" method="post">
                    <% 
                    for (String cartId : cartIds) {
                        out.print("<input type='hidden' name='cart_id' value='" + cartId + "' />");
                    }
                    %>
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="4" required></textarea>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="province">Province</label>
                            <input type="text" id="province" name="province" required>
                        </div>
                        <div class="form-group">
                            <label for="city">City / Regency</label>
                            <input type="text" id="city" name="city" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="district">District / Subdistrict</label>
                            <input type="text" id="district" name="district" required>
                        </div>
                        <div class="form-group">
                            <label for="postcode">Postal Code</label>
                            <input type="text" id="postcode" name="postcode" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="text" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="payment-method">Payment Method</label>
                        <select id="payment-method" name="paymentMethod" required>
                            <option value="Cash on Delivery">Cash on Delivery</option>
                            <option value="Bank Transfer">Bank Transfer</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="notes">Additional Notes</label>
                        <textarea id="notes" name="notes" rows="4"></textarea>
                    </div>
                    <div class="total-count">
                        <h4>Subtotal: <%= format.format(subtotal) %></h4>
                        <button type="submit" class="btn-grey">Finalize and Pay</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>window.jQuery || document.write("<script src='js/jquery-1.11.1.min.js'>\x3C/script>")</script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
</body>
</html>
