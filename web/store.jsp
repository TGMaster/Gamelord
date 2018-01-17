<%@page import="java.util.*, Product.*, Category.*, User.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <link rel="icon" href=" ">
        <title>Gamelord Store Page | Game Developer Company</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/shopping.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">

        <!-- Helper Styles -->
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/animation.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <style>
            #avatar img {
                max-width: 125%;
                height: auto;
            }
        </style>

    </head>
    <body>
        <!-- Header based on cookie -->
        <%
            User user = null;
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductDAO productDAO = new ProductDAO();
            UserDAO userDAO = new UserDAO();

            int total = productDAO.countProduct();
            List<Product> listOfProduct = (ArrayList<Product>) session.getAttribute("listOfProduct");

            // Get cart session
            Cart cart = (Cart) session.getAttribute("cart");

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        user = userDAO.login(cookie.getValue());
                    }
                }
            }

            if (session.getAttribute("user") != null) {
                user = (User) session.getAttribute("user");
            }

            String message;
            if (request.getAttribute("message") != null) {
                message = (String) request.getAttribute("message");
            }
        %>
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
                                <%if (user != null && user.isAdmin()) {%>
                            <li class="nav-item"> <a class="nav-link" href="/editProduct.jsp"><strong>SETTINGS</strong></a> </li>
                                <%}%>
                            <li class="nav-item"> <a class="nav-link" href="/contact"><strong>CONTACT</strong></a> </li>
                                <%if (user != null) {%>
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
                            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><strong><%=user.getName()%> </strong><i class="fa fa-user" aria-hidden="true"></i></a>
                                <!-- Dropdown -->
                                <ul class="dropdown-menu" style="right: 0; left: auto;">
                                    <li>
                                        <div class="navbar-login">
                                            <div class="row">
                                                <div class="col-lg-4" id="avatar">
                                                    <img src="img/user/<%=user.getImage()%>" class="img-responsive">
                                                </div>
                                                <div class="col-lg-8">
                                                    <p class="text-left"><strong><%=user.getName()%></strong></p>
                                                    <p class="text-left small"><%=user.getEmail()%></p>
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

        <!-- Body -->
        <section class="service-sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading text-md-center text-xs-center">
                            <h2>STORE</h2>
                        </div>
                    </div>
                </div>

                <form id="menu" method="POST" action="store">
                    <div class="form-inline">
                        <div class="form-group mb-4 mr-sm-2 mb-sm-0">
                            <select id="category" name="category" class="form-control custom-select dropup" onchange="this.form.submit()">
                                <optgroup label="Select game type">
                                    <option value="0" selected hidden>Genres</option>
                                    <%
                                        List<Category> listCategory = (ArrayList<Category>) categoryDAO.getCategory();
                                        for (Category c : listCategory) {
                                    %>
                                    <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                    <%}%>
                                </optgroup>
                            </select>
                        </div>

                        <div class="input-group mb-4 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" placeholder="Search..." name="searchProduct">
                        </div>
                        <input type="hidden" name="action" value="search"/>
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-white-blue" name="action" value="search">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>

                <div class="row">
                    <%
                        if (listOfProduct.size() > 0) {
                            for (Product p : listOfProduct) {
                    %>
                    <div class="block">

                        <div class="top">
                            <img src="img/products/<%=p.getImage()%>" alt="pic" />
                            <a href="store?action=view&productID=<%=p.getPid()%>" class="heading converse"><%=p.getName()%></a>
                        </div>

                        <div class="middle">
                            <div class="info"><%=p.getContent()%></div>
                            <div class="style"><%=categoryDAO.getName(p.getCid())%></div>
                            <div class="price">£<%=p.getPrice()%></div>
                        </div>

                        <%if (user != null) {%>
                        <div class="bottom">
                            <form action="store" method="POST">
                                <input type="hidden" name="productID" value="<%=p.getPid()%>"/>
                                <button type="submit" name="action" value="add" class="btn btn-success">Add to cart <i class="fa fa-shopping-cart" style="color: #fff"></i></button>
                            </form>
                        </div>
                        <%}%>

                    </div>
                    <%
                            }
                        }
                    %>
                </div>

                <div class="row">
                    <ul class="pagination">
                        <%for (int i = 1; i <= (total / 6) + 1; i++) {%>
                        <li class="arrow"><a href="/store?pages=<%=i%>"><%=i%></a></li>
                            <%}%>
                    </ul>
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
