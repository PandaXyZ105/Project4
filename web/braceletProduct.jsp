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
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=30"><img src="images/bracelet1.jpg" alt="Elsa Peretti Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=30">Elsa Peretti Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=30">IDR 8,500,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=30" class="btn-add">View Product</a>
</article>

<!-- Product 2: Tiffany Solitaire Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=31"><img src="images/bracelet2.jpg" alt="Tiffany Solitaire Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=31">Tiffany Solitaire Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=31">IDR 25,000,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=31" class="btn-add">View Product</a>
</article>

<!-- Product 3: Tiny Pearl Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=32"><img src="images/bracelet3.jpg" alt="Tiny Pearl Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=32">Tiny Pearl Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=32">IDR 7,500,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=32" class="btn-add">View Product</a>
</article>

<!-- Product 4: Diamond Letter Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=33"><img src="images/bracelet4.png" alt="Diamond Letter Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=33">Diamond Letter Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=33">IDR 9,000,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=33" class="btn-add">View Product</a>
</article>

<!-- Product 5: Bezel Ground Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=34"><img src="images/bracelet5.jpg" alt="Bezel Ground Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=34">Bezel Ground Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=34">IDR 20,000,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=34" class="btn-add">View Product</a>
</article>

<!-- Product 6: Multi Gemstone Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=35"><img src="images/bracelet6.png" alt="Multi Gemstone Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=35">Multi Gemstone Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=35">IDR 10,000,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=35" class="btn-add">View Product</a>
</article>

<!-- Product 7: Engravable Bar Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=36"><img src="images/bracelet7.png" alt="Engravable Bar Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=36">Engravable Bar Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=36">IDR 6,000,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=36" class="btn-add">View Product</a>
</article>

<!-- Product 8: Round Topaz Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=37"><img src="images/bracelet8.jpg" alt="Round Topaz Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=37">Round Topaz Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=37">IDR 12,000,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=37" class="btn-add">View Product</a>
</article>

<!-- Product 9: Spheres Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=38"><img src="images/bracelet9.jpg" alt="Spheres Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=38">Spheres Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=38">IDR 15,000,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=38" class="btn-add">View Product</a>
</article>

<!-- Product 10: Listring Diamond Bracelet -->
<article class="article-item col-md-4">
    <a href="clickedProduct.jsp?product_id=39"><img src="images/bracelet10.jpg" alt="Listring Diamond Bracelet"></a>
    <h3><a href="clickedProduct.jsp?product_id=39">Listring Diamond Bracelet</a></h3>
    <h4><a href="clickedProduct.jsp?product_id=39">IDR 18,500,000.00</a></h4>
    <a href="clickedProduct.jsp?product_id=39" class="btn-add">View Product</a>
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
