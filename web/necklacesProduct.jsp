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
                <li>Necklaces Collection</li>
            </ul>
        </div>
        <!-- / container -->
    </div>
    <!-- / body -->

    <div id="body">

        <div id="content">
            <section class="products">
                <!-- Product 1: Diana Solitaire Necklaces -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=9"><img src="images/necklaces1.png" alt="Diana Solitaire Necklaces"></a>
                    <h3><a href="clickedProduct.jsp?product_id=9">Diana Solitaire Necklaces</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=9">IDR 6.167.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=9" class="btn-add">View Product</a>
                </article>

                <!-- Product 2: Illusion Listring Necklaces -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=10"><img src="images/necklaces2.jpg" alt="Illusion Listring Necklaces"></a>
                    <h3><a href="clickedProduct.jsp?product_id=10">Illusion Listring Necklaces</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=10">IDR 8.623.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=10" class="btn-add">View Product</a>
                </article>

                <!-- Product 3: Elflor Gold Necklace -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=11"><img src="images/necklaces3.jpg" alt="Elflor Gold Necklace"></a>
                    <h3><a href="clickedProduct.jsp?product_id=11">Elflor Gold Necklace</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=11">IDR 6.517.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=11" class="btn-add">View Product</a>
                </article>

                <!-- Product 4: Elegant Flora Silver Necklace -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=12"><img src="images/necklaces4.jpg" alt="Elegant Flora Silver Necklace"></a>
                    <h3><a href="clickedProduct.jsp?product_id=12">Elegant Flora Silver Necklace</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=12">IDR 6.517.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=12" class="btn-add">View Product</a>
                </article>

                <!-- Product 5: Diana Victoria Necklaces -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=13"><img src="images/necklaces5.jpg" alt="Diana Victoria Necklaces"></a>
                    <h3><a href="clickedProduct.jsp?product_id=13">Diana Victoria Necklaces</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=13">IDR 12.036.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=13" class="btn-add">View Product</a>
                </article>

                <!-- Product 6: Diana 1837 Circle Necklaces -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=14"><img src="images/necklaces6.png" alt="Diana 1837 Circle Necklaces"></a>
                    <h3><a href="clickedProduct.jsp?product_id=14">Diana 1837 Circle Necklaces</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=14">IDR 9.903.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=14" class="btn-add">View Product</a>
                </article>

                <!-- Product 7: Cherry Blossom Necklaces -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=15"><img src="images/necklaces7.png" alt="Cherry Blossom Necklaces"></a>
                    <h3><a href="clickedProduct.jsp?product_id=15">Cherry Blossom Necklaces</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=15">IDR 10.405.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=15" class="btn-add">View Product</a>
                </article>

                <!-- Product 8: Mirage Gold Necklace -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=16"><img src="images/necklaces8.jpg" alt="Mirage Gold Necklace"></a>
                    <h3><a href="clickedProduct.jsp?product_id=16">Mirage Gold Necklace</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=16">IDR 5.352.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=16" class="btn-add">View Product</a>
                </article>

                <!-- Product 9: Mirage Silver Necklace -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=17"><img src="images/necklaces9.jpg" alt="Mirage Silver Necklace"></a>
                    <h3><a href="clickedProduct.jsp?product_id=17">Mirage Silver Necklace</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=17">IDR 5.352.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=17" class="btn-add">View Product</a>
                </article>

                <!-- Product 10: Diamond Disney Necklace -->
                <article class="article-item col-md-4">
                    <a href="clickedProduct.jsp?product_id=18"><img src="images/necklaces10.jpg" alt="Diamond Disney Necklace"></a>
                    <h3><a href="clickedProduct.jsp?product_id=18">Diamond Disney Necklace</a></h3>
                    <h4><a href="clickedProduct.jsp?product_id=18">IDR 14.699.000</a></h4>
                    <a href="clickedProduct.jsp?product_id=18" class="btn-add">View Product</a>
                </article>
            </section>
        </div>
        <!-- / content -->
    </div>

    <%@ include file="footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Optional: Add your own script for any specific functionality -->
</body>

</html>
