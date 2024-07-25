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

    <%@ include file="headerSuccess.jsp" %>
    <%@ include file="navSuccess.jsp" %>

    

    <div id="slider">
        <ul>
            <li style="background-image: url(images/0.jpg)">
                <h3>Make your life better</h3>
                <h2>Genuine diamonds</h2>
                <a href="readMoreSuccess.jsp" class="btn-more">Read more</a>
            </li>
            
        </ul>
    </div>

    <div id="body">
        <div class="container">
            <div class="last-products">
                <h2>Last added products</h2>
                <section class="products">
                 <!-- Product 6: Diana 1837 Circle Necklaces -->
                <article>
                    <a href="clickedProduct.jsp?product_id=14"><img src="images/necklaces6.png" alt="Diana 1837 Circle Necklaces"></a>
                    <h3><a href="clickedProduct.jsp?product_id=14">Diana 1837 Circle Necklaces</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=14">IDR 9.903.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=14" class="btn-add">View Product</a>
                </article>
                    <!-- Product 8: Mirage Gold Necklace -->
                <article>
                    <a href="clickedProduct.jsp?product_id=16"><img src="images/necklaces8.jpg" alt="Mirage Gold Necklace"></a>
                    <h3><a href="clickedProduct.jsp?product_id=16">Mirage Gold Necklace</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=16">IDR 5.352.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=16" class="btn-add">View Product</a>
                </article>
                    <!-- Product 4: Diamond Letter Bracelet -->
                <article >
                    <a href="clickedProduct.jsp?product_id=33"><img src="images/bracelet4.png" alt="Diamond Letter Bracelet"></a>
                    <h3><a href="clickedProduct.jsp?product_id=33">Diamond Letter Bracelet</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=33">IDR 9,000,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=33" class="btn-add">View Product</a>
                </article>
                    <article>
                    <a href="clickedProduct.jsp?product_id=30"><img src="images/bracelet1.jpg" alt="Elsa Peretti Bracelet"></a>
                    <h3><a href="clickedProduct.jsp?product_id=30">Elsa Peretti Bracelet</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=30">IDR 8,500,000.00</a></h4>
                    <a href="clickedProduct.jsp?product_id=30" class="btn-add">View Product</a>
                </article>
                    <!-- Product 8: Mirage Gold Necklace -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=16"><img src="images/necklaces8.jpg" alt="Mirage Gold Necklace"></a>
                    <h3><a href="clickedProduct.jsp?product_id=16">Mirage Gold Necklace</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=16">IDR 5.352.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=16" class="btn-add">View Product</a>
                </article>
                </section>
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
