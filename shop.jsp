<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Shop | E-Shopper</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
      <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">

        <!-- Helper Styles -->
        <link href="css/loaders.css" rel="stylesheet">
        <link href="css/swiper.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/animation.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">
        <link rel="stylesheet prefetch" href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css">

        <!-- Font Awesome Style Icon -->
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

</head><!--/head-->

<body>
	<!-- Loading screen -->
       <%
           CategoryDAO categoryDAO = new CategoryDAO();
         ProductDAO productDAO = new ProductDAO();
            long categoryID = 0;
            if (request.getParameter("categoryID") != null) {
                categoryID = (long) Long.parseLong(request.getParameter("categoryID"));
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            int pages = 0, firstResult = 0, maxResult = 0, total = 0;
            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }

            total = productDAO.countProductByCategory(categoryID);
            if (total <= 6) {
                firstResult = 1;
                maxResult = total;
            }else{
                firstResult = (pages - 1) * 6;
                maxResult = 6;
            }

            ArrayList<Product> listProduct = productDAO.getListProductByNav(
                    categoryID, firstResult, maxResult);
        
        
    %>

        <header>
        <!-- Top Navigation -->
        <nav class="navbar navbar-toggleable-md mb-4 top-bar navbar-static-top sps sps--abv">
            <div class="container">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse1" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mx-auto logo" href="#">GAME<span>LOST</span></a>
                <div class="collapse navbar-collapse" id="navbarCollapse1">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"> <a class="nav-link" href="#myCarousel"><strong>HOME</strong> <span class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="#benefits"><strong>STORE</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/news"><strong>NEWS</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="#blog"><strong>GALLERY</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="#contact"><strong>CONTACT</strong></a> </li>
                    </ul>
                </div>
            </div>
        </nav>
        </header>
	
	<section id="advertisement">
		<div class="container">
			<img src="images/shop/advertisement.jpg" alt="" />
		</div>
	</section>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
                                            
						<h2>Category</h2>
                                                
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
                                                                    <%
                                                                                        for(Category c : categoryDAO.getListCategory()){
                                                                                    %>
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											
											<a href="shop.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><%=c.getCategoryName()%> </a>
										</a>
									</h4>
                                                                                <%}%>
								</div>
                                                                
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="">Nike </a></li>
											<li><a href="">Under Armour </a></li>
											<li><a href="">Adidas </a></li>
											<li><a href="">Puma</a></li>
											<li><a href="">ASICS </a></li>
										</ul>
									</div>
								</div>
							</div>
							
							
							
							
						</div><!--/category-productsr-->
					
						
						
						
						
					</div>
                                                                
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
                                                <%      
                                        for (Product p : listProduct) {
                                   %>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
                                                                            <a href="product-details.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="" /></a>
										<h2><%=p.getProductPrice()%>$</h2>
                                                                                <p><a href="product-details.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></p>
										<a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									
								</div>
								
							</div>
						</div>
						
						<%}%>
						
												
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<ul class="pagination">
							<li><a href="#"><i></i></a></li>
                    <%for(int i=1;i<=(total/6)+1;i++){%>
                        <li class="arrow"><a href="shop.jsp?categoryID=<%=categoryID%>&pages=<%=i%>"><%=i%></a></li>
                    <%}%>
                    <li><a href="#"><i class="next"> </i></a></li>
						</ul>
					</div><!--features_items-->
				</div>
                                             
                                        
                                            </div>
<script src="http://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script src="dist/js/jquery.prettydropdowns.js"></script>
<script>
$('select').prettyDropdown();
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>        
			</div>
		</div>
	</section>
	
	
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    
    <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                        <a class="logo">GAMELOST</a>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <ul>
                            <li><a href="/index.jsp">Home</a></li>
                            <li><a href="#">Store</a></li>
                            <li><a href="#">About</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <ul>
                            <li><a href="/news">News</a></li>
                            <li><a href="#">Gallery</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row copy-footer">
                    <div class="col-sm-6 col-md-3"> &copy;<script type="text/javascript">document.write(new Date().getFullYear());</script> Gamelost.co </div>
                    <div class="col-sm-6 col-md-4 pull-right text-xs-right">Designed by TGMaster</div>
                </div>
            </div>
        </footer>
</body>
</html>