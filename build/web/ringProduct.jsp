<%-- 
    Document   : ringProduct
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <style>
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .article-item {
            margin: 20px;
            text-align: center;
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
                <li>Rings Collection</li>
            </ul>
        </div>
        <!-- / container -->
    </div>
    <!-- / body -->

    <div id="body">

        <div id="content">
            <section class="products">
                <!-- Product 1: Solitaire Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=20"><img src="images/ring1.png" alt="Solitaire Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=20">Solitaire Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=20">IDR 13,500,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=20" class="btn-add">View Product</a>
                </article>

                <!-- Product 2: Listring Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=21"><img src="images/ring2.png" alt="Listring Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=21">Listring Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=21">IDR 21,000,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=21" class="btn-add">View Product</a>
                </article>

                <!-- Product 3: Primrose Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=22"><img src="images/ring3.jpg" alt="Primrose Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=22">Primrose Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=22">IDR 10,500,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=22" class="btn-add">View Product</a>
                </article>

                <!-- Product 4: Illusion Lotus Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=23"><img src="images/ring4.jpg" alt="Illusion Lotus Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=23">Illusion Lotus Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=23">IDR 13,500,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=23" class="btn-add">View Product</a>
                </article>

                <!-- Product 5: Heart Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=24"><img src="images/ring5.jpg" alt="Heart Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=24">Heart Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=24">IDR 18,000,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=24" class="btn-add">View Product</a>
                </article>

                <!-- Product 6: Fuchsia Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=25"><img src="images/ring6.jpg" alt="Fuchsia Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=25">Fuchsia Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=25">IDR 16,500,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=25" class="btn-add">View Product</a>
                </article>

                <!-- Product 7: Trilogy Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=26"><img src="images/ring7.jpg" alt="Trilogy Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=26">Trilogy Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=26">IDR 19,500,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=26" class="btn-add">View Product</a>
                </article>

                <!-- Product 8: Fancy Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=27"><img src="images/ring8.jpg" alt="Fancy Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=27">Fancy Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=27">IDR 22,000,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=27" class="btn-add">View Product</a>
                </article>

                <!-- Product 9: Serenity Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=28"><img src="images/ring9.jpg" alt="Serenity Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=28">Serenity Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=28">IDR 23,500,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=28" class="btn-add">View Product</a>
                </article>

                <!-- Product 10: Pearl Diamond Ring -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=29"><img src="images/ring10.jpg" alt="Pearl Diamond Ring"></a>
                    <h3><a href="clickedProduct.jsp?product_id=29">Pearl Diamond Ring</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=29">IDR 28,000,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=29" class="btn-add">View Product</a>
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
