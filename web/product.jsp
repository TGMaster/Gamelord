<%@page import="java.util.Map"%>
<%@page import="Product.*, Category.*, User.*"%>
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
        <link href="css/login.css" rel="stylesheet">

        <!-- Helper Styles -->
        <link rel="stylesheet" href="css1/animate.min.css">
        <link rel="stylesheet" href="css1/animation.css">
        <link rel="stylesheet" href="css1/nivo-lightbox.css">
        <link rel="stylesheet" href="css1/nivo_themes/default/default.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

    </head><!--/head-->

    <body>

        <%
            UserDAO userDAO = new UserDAO();
            User u = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        u = userDAO.login(cookie.getValue());
                    }
                }
            }

            if (session.getAttribute("user") != null) {
                u = (User) session.getAttribute("user");
            }

            Product product = (Product) session.getAttribute("product");
            CategoryDAO categoryDAO = new CategoryDAO();

            // Get cart session
            Cart cart = (Cart) session.getAttribute("cart");
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
                                <%if (u != null) {%>
                            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-shopping-cart"></i> <span class="badge"><%=cart.countItem()%></span></a>

                                <!-- Dropdown -->
                                <% if (cart.countItem() > 0) {%>
                                <ul class="dropdown-menu" style="right: 0; left: auto;">
                                    <li>
                                        <div class="shopping_cart">
                                            <div class="shopping_cart-header">
                                                <div class="col-md-12">
                                                    <span class="lighter-text">Total:</span>
                                                    <span class="main-color-text float-right">£<%=cart.totalCart()%></span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>

                                    <ul class ="shopping_cart-items">

                                        <%for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {%>
                                        <li class="clearfix">
                                            <div class="col-md-3 float-left">
                                                <img src="img/products/<%=list.getValue().getProduct().getImage()%>" alt="item<%=list.getKey()%>" style="max-width: 100%;height: auto;" />
                                            </div>
                                            <div class="col-md-9 float-right">
                                                <span class="item-name"><a href="store?action=view&productID=<%=list.getValue().getProduct().getPid()%>"><%=list.getValue().getProduct().getName()%></a></span>
                                                <span class="item-price">£<%=list.getValue().getProduct().getPrice()%></span>
                                                <span class="item-quantity">Quantity: <%=list.getValue().getQuantity()%></span>
                                            </div>
                                        </li>
                                        <%}%>

                                    </ul>
                                    <li>
                                        <div class="row">
                                            <div class="col-md-4"></div>
                                            <div class="col-md-4" id="button">
                                                <a href="#" class="btn btn-white-blue btn-capsul" data-toggle="modal" data-target="#checkout-modal">View Cart</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <%}%>

                            </li>
                            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><strong><%=u.getName()%> </strong><i class="fa fa-user" aria-hidden="true"></i></a>
                                <!-- Dropdown -->
                                <ul class="dropdown-menu" style="right: 0; left: auto;">
                                    <li>
                                        <div class="navbar-login">
                                            <div class="row">
                                                <div class="col-lg-4" id="avatar">
                                                    <img src="img/user/<%=u.getImage()%>" class="img-responsive">
                                                </div>
                                                <div class="col-lg-8">
                                                    <p class="text-left"><strong><%=u.getName()%></strong></p>
                                                    <p class="text-left small"><%=u.getEmail()%></p>
                                                    <p class="text-left">
                                                        <a href="/edit" class="btn btn-primary btn-block btn-sm">Edit Profile</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="navbar-login navbar-login-session">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <p>
                                                        <a href="/logout" class="btn btn-danger btn-block">Logout</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>

                            </li>
                            <%
                            } else {
                            %>
                            <li class="nav-item"> <a class="nav-link" href="#" data-toggle="modal" data-target="#login-modal"><strong>LOG IN</strong></a> </li>
                                <%}%>
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
                                    <img src="img/products/<%=product.getImage()%>" alt="" />

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

                                        <%if (u != null) {%>
                                        <form action="store" method="POST">
                                            <input type="hidden" name="productID" value="<%=product.getPid()%>"/>
                                            <button type="submit" class="btn btn-default btn-aqua" name="action" value="add">
                                                <i class="fa fa-shopping-cart"></i>
                                                Add to cart
                                            </button>
                                        </form>
                                        <%}%>
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



                            <div class="fb-comments" data-href="http://localhost:8080/store?action=view&productID=<%=product.getPid()%>" data-numposts="5"></div>


                        </div><!--/category-tab-->

                    </div>

                </div>

            </div>
        </section>




        <!-- Login -->
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="loginmodal-container">
                    <h1>Login</h1><br>
                    <form class="form-horizontal" role="form" action="login" method="POST">
                        <label for="username"><i class="fa fa-user" aria-hidden="true"></i></label>
                        <input type="text" class="form-control" name="username" placeholder="Username" autofocus>
                        <label for="password"><i class="fa fa-key" aria-hidden="true"></i></label>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                        <label class="form-check-label">
                            <input class="form-check-input" name="remember" type="checkbox" value="yes">
                            <span style="padding-bottom: .15rem">Remember me</span>
                        </label>
                        <div style="padding-top: 10px">
                            <input type="submit" name="action" class="btn btn-capsul btn-aqua" value="Login">
                        </div>
                    </form>

                    <div class="login-help">
                        <a href="register" style="color: blue">Register</a> - <a href="reset">Forgot Password</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Checkout -->
        <div class="modal hide fade" id="checkout-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">Your Cart</div>
                    <div class="modal-body">
                        <table class="table table-striped table-hover table-bordered">
                            <tbody>
                                <tr>
                                    <th></th>
                                    <th style="text-align:center">Item</th>
                                    <th style="text-align:center">QTY</th>
                                    <th style="text-align:center">Price</th>
                                    <th style="text-align:center">Total Price</th>
                                </tr>
                                <%for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {%>
                                <tr>
                                    <td align="center"><a href="store?action=remove&productID=<%=list.getValue().getProduct().getPid()%>"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                    <td><%=list.getValue().getProduct().getName()%></td>
                                    <td style="text-align:right"><%=list.getValue().getQuantity()%></td>
                                    <td style="text-align:right">£<%=list.getValue().getProduct().getPrice()%></td>
                                    <td style="text-align:right">£<%=list.getValue().getProduct().getPrice() * list.getValue().getQuantity()%></td>
                                </tr>
                                <%}%>
                                <tr>
                                    <th colspan="4"><span class="float-right">Total</span></th>
                                    <th style="text-align:right">£<%=cart.totalCart()%></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="modal-footer">
                        <a href="#" class="float-left btn btn-info" data-dismiss="modal">Continue Shopping</a>
                        <a href="/checkout" class="float-right btn btn-success">Checkout</a>
                    </div>
                </div>
            </div>
        </div>

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


        <script type = "text/javascript">
            window._sbzq || function (e) {
                e._sbzq = [];
                var t = e._sbzq;
                t.push(["_setAccount", 75192]);
                var n = e.location.protocol === "https:" ? "https:" : "http:";
                var r = document.createElement("script");
                r.type = "text/javascript";
                r.async = true;
                r.src = n + "//static.subiz.com/public/js/loader.js";
                var i = document.getElementsByTagName("script")[0];
                i.parentNode.insertBefore(r, i);
            }(window);

            $(document).ready(function () {

                $(".dropdown").hover(
                        function () {
                            $(".dropdown-menu", this).stop().slideDown();
                        },
                        function () {
                            $(".dropdown-menu", this).stop().slideUp();
                        }
                );

            <%if (request.getAttribute("remove-modal") != null) { %>

                $('#checkout-modal').modal('show');

            <%}%>
            });

        </script>
    </body>
</html>