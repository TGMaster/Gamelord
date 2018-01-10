<%@page import="Product.*, Category.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Gamelord Store Page | Game Developer Company</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/shopping.css" rel="stylesheet">

        <!-- Helper Styles -->
        <link rel="stylesheet" href="css1/animate.min.css">
        <link rel="stylesheet" href="css1/animation.css">
        <link rel="stylesheet" href="css1/nivo-lightbox.css">
        <link rel="stylesheet" href="css1/nivo_themes/default/default.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11&appId=351542721934248';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

</head><!--/head-->

<body>
    <%
        Product product = (Product) session.getAttribute("product");
        CategoryDAO categoryDAO = new CategoryDAO();
    %>

    <!-- Header
    ================================================== -->
    <header>
        <!-- Top Navigation -->
        <nav class="navbar navbar-toggleable-md mb-4 top-bar navbar-static-top menu">
            <div class="container">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse1" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mx-auto logo" href="/index.jsp">GAME<span>LORD</span></a>
                <div class="collapse navbar-collapse" id="navbarCollapse1">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"> <a class="nav-link" href="/index.jsp"><strong>HOME</strong></a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="/store"><strong>STORE</strong> <span class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/news"><strong>NEWS</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/about.html"><strong>ABOUT</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/contact"><strong>CONTACT</strong></a> </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>


    <section>
        <div class="container">
            <div class="row">

                <div class="col-sm-12">
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-3">
                            <div class="view-product">
                                <img src="<%=product.getImage()%>" alt="" />

                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="product-information"><!--/product-information-->
                                <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                <h2><%=product.getName()%></h2>
                                <p>Product ID: <%=product.getPid()%></p>
                                <img src="images/product-details/rating.png" alt="" />
                                <span>
                                    <span>£<%=product.getPrice()%></span>

                                    <button type="button" class="btn btn-default btn-aqua">
                                        <i class="fa fa-shopping-cart"></i>
                                        Add to cart
                                    </button>
                                </span>
                                <p><b>Genre:</b> <%=categoryDAO.getName(product.getCid())%> </p>
                                <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt=""/></a>
                            </div><!--/product-information-->
                        </div>
                    </div><!--/product-details-->

                    <div class="category-tab shop-details-tab"><!--category-tab-->

                        <div class="col-sm-12">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item"><a href="#details" data-toggle="tab" class="nav-link">Details</a></li>
                                <li class="nav-item"><a href="#requirement" data-toggle="tab" class="nav-link">Requirements</a></li>
                            </ul>
                        </div>

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="details" role="tabpanels">
                                <div class="col-sm-12">
                                    <p><%=product.getContent()%></p>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="requirement" role="tabpanels">
                                <div class="col-sm-12">
                                    <h4> Minimum: </h4>
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-9">
                                        <ul style="border-bottom: none">
                                            <li>CPU: Intel Core i5-2500 @3.3 GHz / AMD FX-8320 @3.5 GHz</li>
                                            <li>CPU SPEED: Info</li>
                                            <li>RAM: 4 GB</li>
                                            <li>OS: Windows 7 64-bit / Windows 8 64-bit / Windows 8.1 64-bit</li>
                                            <li>VIDEO CARD: NVIDIA GeForce GTX 560 / AMD Radeon HD 6870 (1GB VRAM)</li>
                                            <li>SOUND CARD: Yes</li>
                                            <li>FREE DISK SPACE: 40 GB</li>
                                        </ul>
                                    </div>
                                    <h4> Recommend: </h4>
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-9">
                                        <ul style="border-bottom: none">
                                            <li>CPU: Intel Core i5-4670K @3.4 GHz / AMD FX-8350 @4.0 GHz</li>
                                            <li>CPU SPEED: Info</li>
                                            <li>RAM: 8 GB</li>
                                            <li>OS: Windows 7 64-bit / Windows 8 64-bit / Windows 8.1 64-bit</li>
                                            <li>VIDEO CARD: NVIDIA GeForce GTX 780 / AMD Radeon R9 290 (2GB VRAM)</li>
                                            <li>SOUND CARD: Yes</li>
                                            <li>FREE DISK SPACE: 40 GB</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div>
                            <div class="fb-comments" data-href="http://localhost:8084/store?action=view&productID=<%=product.getPid()%>" data-numposts="5"></div
                        </div>
                        
                    </div><!--/category-tab-->

                </div>

            </div>

        </div>
    </section>

    <!-- Footer
            ================================================== -->
    <jsp:include page="footer.jsp"/>

    <!-- Bootstrap core JavaScript
      ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js" ></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/nivo-lightbox.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/swiper.min.js"></script>
    <script src="js/core.js"></script>
    <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
    <script src="js/effects.js"></script>
</body>
</html>