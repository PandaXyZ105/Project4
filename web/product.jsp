<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Diana?s Jewelry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" media="all" href="Css/style.css">
    <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

    <%@ include file="header.jsp" %>

    <nav id="menu">
		<div class="container">
			<div class="trigger"></div>
			<ul>
				<li><a href="products.jsp">New collection</a></li>
				<li><a href="products.jsp">necklaces</a></li>
				<li><a href="products.jsp">earrings</a></li>
				<li><a href="products.jsp">Rings</a></li>
				<li><a href="products.jsp">Gift cards</a></li>
				<li><a href="products.jsp">Promotions</a></li>
			</ul>
		</div>
		<!-- / container -->
	</nav>
	<!-- / navigation -->

	<div id="breadcrumbs">
		<div class="container">
			<ul>
				<li><a href="#">Home</a></li>
				<li>Product page</li>
			</ul>
		</div>
		<!-- / container -->
	</div>
	<!-- / body -->

	<div id="body">
		<div class="container">
			<div id="content" class="full">
				<div class="product">
					<div class="image">
						<img src="images/5.jpg" alt="">
					</div>
					<div class="details">
						<h1>Lorem ipsum dolor</h1>
						<h4>$990.00</h4>
						<div class="entry">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							<div class="tabs">
								<div class="nav">
									<ul>
										<li class="active"><a href="#desc">Description</a></li>
										<li><a href="#spec">Specification</a></li>
										<li><a href="#ret">Returns</a></li>
									</ul>
								</div>
								<div class="tab-content active" id="desc">
									<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
								</div>
								<div class="tab-content" id="spec">
									<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
								</div>
								<div class="tab-content" id="ret">
									<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
								</div>
							</div>
						</div>
						<div class="actions">
							<label>Quantity:</label>
							<select><option>1</option></select>
							<a href="#" class="btn-grey">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
			<!-- / content -->
		</div>
		<!-- / container -->
	</div>
	<!-- / body -->

    <%@ include file="footer.jsp" %>

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script>window.jQuery || document.write("<script src='js/jquery-1.11.1.min.js'>\x3C/script>")</script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
