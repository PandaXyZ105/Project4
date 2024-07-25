<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat,java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Database.DBConnection,Database.ProductDAO,Model.Cart,Model.Product" %>
<%@ page import="java.sql.*" %>
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

    try {
        conn = new DBConnection().setConnection();
        
        String sqlCart = "SELECT * FROM tblcart WHERE email = ?";
        ps = conn.prepareStatement(sqlCart);
        ps.setString(1, email);
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
    
    // Number format for Indonesian Rupiah
    NumberFormat format = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Diana’s jewelry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" media="all" href="css/style.css">
</head>
<body>

<%@ include file="headerSuccess.jsp" %>
<%@ include file="navSuccess.jsp" %>

<div id="breadcrumbs">
    <div class="container">
        <ul>
            <li><a href="#">Home</a></li>
            <li>Cart</li>
        </ul>
    </div>
</div>

<div id="body">
    <div class="container">
        <div id="content" class="full">
            <div class="cart-table">
                <table>
                    <tr>
                        <th class="items">Items</th>
                        <th class="price">Price</th>
                        <th class="qnt">Quantity</th>
                        <th class="total">Total</th>
                        <th class="delete"></th>
                    </tr>
                    <% 
                    double subtotal = 0;
                    for (Cart cart : cartList) { 
                        Product product = productMap.get(cart.getProduct_id());
                        if (product != null) {
                            subtotal += cart.getTempTotal();
                    %>
                    <tr>
                        <td class="items">
                            <div class="image">
                                <img src="<%= product.getImage_url() %>" alt="">
                            </div>
                            <h3><a href="#"><%= product.getName() %></a></h3>
                            <p><%= product.getShort_description() %></p>
                        </td>
                        <td class="price"><%= format.format(product.getPrice()) %></td>
                        <td class="qnt">
                            <select>
                                <option><%= cart.getQuantity() %></option>
                            </select>
                        </td>
                        <td class="total"><%= format.format(cart.getTempTotal()) %></td>
                        <td class="delete"><a href="DeleteCartServlet?cart_id=<%= cart.getCart_id() %>" class="ico-del"></a></td>
                    </tr>
                    <% 
                        }
                    } 
                    %>
                </table>

                <div class="total-count">
                    <h4>Subtotal: <%= format.format(subtotal) %></h4>
                    <form action="CheckoutServlet" method="post">
                        <% for (Cart cart : cartList) { %>
                            <input type="hidden" name="cart_id" value="<%= cart.getCart_id() %>">
                        <% } %>
                        <input type="hidden" name="subtotal" value="<%= subtotal %>">
                        <button type="submit" class="btn-grey">Finalize and pay</button>
                    </form>
                </div>
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
