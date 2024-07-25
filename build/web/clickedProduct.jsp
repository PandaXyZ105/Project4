<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <link rel="stylesheet" href="Css/style.css">
    <style>
        .actions {
            margin-top: 20px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .actions label {
            display: block;
            margin-bottom: 5px;
        }
        .actions input[type="number"] {
            padding: 8px;
            width: 60px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
            font-size: 14px;
        }
        .actions .btn-grey {
            padding: 10px 20px;
            background-color: #808080;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            text-align: center;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .actions .btn-grey:hover {
            background-color: #666666;
        }
        .actions .btn-grey.success {
            background-color: #28a745;
        }
        .actions .btn-grey span {
            transition: opacity 0.3s;
        }
        .actions .btn-grey.success span {
            opacity: 0;
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
                <li>Product page</li>
            </ul>
        </div>
    </div>

    <div id="body">
        <div class="container">
            <div id="content" class="full">
                <div class="product">
                    <%@ page import="java.sql.*" %>
                    <%@ page import="java.text.NumberFormat" %>
                    <%@ page import="Database.DBConnection" %>

                    <%
                        String productId = request.getParameter("product_id");
                        if (productId != null && !productId.isEmpty()) {
                            DBConnection db = new DBConnection();
                            Connection con = db.setConnection();
                            String query = "SELECT * FROM tblproduct WHERE product_id = ?";

                            try {
                                PreparedStatement pst = con.prepareStatement(query);
                                pst.setInt(1, Integer.parseInt(productId));
                                ResultSet rs = pst.executeQuery();

                                if (rs.next()) {
                                    String name = rs.getString("name");
                                    double price = rs.getDouble("price");
                                    String shortDescription = rs.getString("short_description");
                                    String description = rs.getString("description");
                                    int stock = rs.getInt("stock");
                                    String imageUrl = rs.getString("image_url");
                                    String spesifikasi = rs.getString("spec");

                                    NumberFormat format = NumberFormat.getCurrencyInstance();
                                    String formattedPrice = format.format(price);
                    %>
                    <div class="image">
                        <img src="<%= imageUrl%>" alt="Product Image">
                    </div>
                    <div class="details">
                        <h1><%= name%></h1>
                        <h4><%= formattedPrice%></h4>
                        <div class="entry">
                            <p><%= shortDescription%></p>
                            <div class="tabs">
                                <div class="nav">
                                    <ul>
                                        <li class="active"><a href="#desc">Description</a></li>
                                        <li><a href="#spec">Specification</a></li>
                                        <li><a href="#re">Returns</a></li>
                                    </ul>
                                </div>
                                <div class="tab-content active" id="desc">
                                    <p><%= description%></p>
                                </div>
                                <div class="tab-content" id="spec">
                                    <p><%= spesifikasi%></p>
                                </div>
                                <div class="tab-content" id="re">
                                    <p>Kebijakan Pengembalian Perhiasan Emas: Pengembalian dalam 30 hari dari tanggal pembelian dengan kondisi asli, tidak rusak, dan disertai kemasan serta sertifikat asli. Sertakan bukti pembelian. Pengembalian bisa di toko atau melalui pengiriman (biaya ditanggung pembeli). Dana dikembalikan dalam 7 hari kerja. Hubungi layanan pelanggan untuk info lebih lanjut.</p>
                                </div>
                                <div class="tab-content" id="info">
                                    <p>Product ID: <%= productId%></p>
                                    <p>Stock: <%= stock%></p>
                                </div>
                            </div>
                        </div>
                        <form id="addToCartForm" action="AddToCartServlet" method="POST" class="actions">
                            <div style="display: flex; align-items: center;">
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min="1" max="<%= stock%>" value="1" style="margin-right: 10px;">
                            </div>
                            <input type="hidden" name="product_id" value="<%= productId%>">
                            <button type="submit" class="btn-grey" id="addToCartButton"><span>Add to cart</span></button>
                            <% if (stock <= 5) { %>
                            <p class="low-stock">Stock yang tersisa kurang dari 5</p>
                            <% } %>
                        </form>
                    </div>
                    <%
                                } else {
                                    out.println("<p>Product not found</p>");
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                                out.println("<p>Database error: " + e.getMessage() + "</p>");
                            } finally {
                                try {
                                    con.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        } else {
                            out.println("<p>Product ID is required.</p>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script>
    $(document).ready(function () {
        $('#addToCartForm').on('submit', function (e) {
            e.preventDefault(); // Menghentikan pengiriman form default

            var formData = $(this).serialize(); // Mengambil data form

            $.post('AddToCartServlet', formData, function (response) {
                if (response.trim() === 'success') {
                    var addButton = $('#addToCartButton');
                    addButton.addClass('success');
                    addButton.find('span').text('Successfully added');

                    // Reset button after 3 seconds
                    setTimeout(function () {
                        addButton.removeClass('success');
                        addButton.find('span').text('Add to cart');
                    }, 2000); // 3 seconds
                } else {
                    alert('Failed to add item to cart. Please try again.');
                }
            });
        });
    });
</script>



    <%@ include file="footer.jsp" %>
</body>
</html>
