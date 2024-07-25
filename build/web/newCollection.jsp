<%-- 
    Document   : braceletProduct
    Created on : 8 Jul 2024, 15.21.07
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Gentle Sparkle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" media="all" href="Css/style.css">
    <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body>

    <%@ include file="header.jsp" %>
    <%@ include file="navSuccess.jsp" %>

    <div id="breadcrumbs">
        <div class="container">
            <ul>
                <li><a href="#">Home</a></li>
                <li>Bracelets Collection</li>
            </ul>
        </div>
        <!-- / container -->
    </div>
    <!-- / body -->

    <div id="body">

        <div id="content">
            <section class="products">
                <!-- Product 1: Elsa Peretti Bracelet -->
                <article>
                    <a href="clickedProduct.jsp?product_id=30"><img src="images/bracelet1.jpg" alt="Elsa Peretti Bracelet"></a>
                    <h3><a href="clickedProduct.jsp?product_id=30">Elsa Peretti Bracelet</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=30">IDR 8,500,000.00</a></h4>
                    <a href="cart.jsp" class="btn-add">Add to cart</a>
                </article>

                <!-- Product 2: Bezel Ground Bracelet -->
                <article>
                    <a href="clickedProduct.jsp?product_id=34"><img src="images/bracelet5.jpg" alt="Bezel Ground Bracelet"></a>
                    <h3><a href="clickedProduct.jsp?product_id=34">Bezel Ground Bracelet</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=34">IDR 20,000,000.00</a></h4>
                    <a href="cart.jsp" class="btn-add">Add to cart</a>
                </article>

                <!-- Product 3: Multi Gemstone Bracelet -->
                <article>
                    <a href="clickedProduct.jsp?product_id=35"><img src="images/bracelet6.png" alt="Multi Gemstone Bracelet"></a>
                    <h3><a href="clickedProduct.jsp?product_id=35">Multi Gemstone Bracelet</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=35">IDR 10,000,000.00</a></h4>
                    <a href="cart.jsp" class="btn-add">Add to cart</a>
                </article>

                <!-- Product 4: Engravable Bar Bracelet -->
                <article>
                    <a href="clickedProduct.jsp?product_id=36"><img src="images/bracelet7.png" alt="Engravable Bar Bracelet"></a>
                    <h3><a href="clickedProduct.jsp?product_id=36">Engravable Bar Bracelet</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=36">IDR 6,000,000.00</a></h4>
                    <a href="cart.jsp" class="btn-add">Add to cart</a>
                </article>

                <!-- Product 5: Primrose Diamond Ring -->
                <article>
                    <a href="clickedProduct.jsp?product_id=22"><img src="images/ring3.jpg" alt="Primrose Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=22">Primrose Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=22">IDR 10,500,000.00</a></h4>
                    <a href="cart.jsp" class="btn-add">Add to cart</a>
                </article>

                <!-- Product 6: Illusion Lotus Diamond Ring -->
                <article>
                    <a href="clickedProduct.jsp?product_id=23"><img src="images/ring4.jpg" alt="Illusion Lotus Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=23">Illusion Lotus Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=23">IDR 13,500,000.00</a></h4>
                    <a href="cart.jsp" class="btn-add">Add to cart</a>
                </article>

                <!-- Product 7: Heart Diamond Ring -->
                <article>
                    <a href="clickedProduct.jsp?product_id=24"><img src="images/ring5.jpg" alt="Heart Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=24">Heart Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=24">IDR 18,000,000.00</a></h4>
                    <a href="cart.jsp" class="btn-add">Add to cart</a>
                </article>
            </section>
        </div>
        <!-- / content -->
    </div>

    <%@ include file="footer.jsp" %>

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script>window.jQuery || document.write("<script src='js/jquery-1.11.1.min.js'>\x3C/script>")</script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>
</body>

</html>
