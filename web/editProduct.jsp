<%-- 
    Document   : editProduct
    Created on : Jan 10, 2018, 7:58:43 PM
    Author     : TGMaster
--%>

<%@page import="java.util.*, Product.*, Category.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="icon" href=" ">
        <title>Gamelord Products Settings | Game Developer Company</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">

        <!-- Helper Styles -->
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/animation.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">
        <link rel="stylesheet prefetch" href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <style>
            .price {
                color: #419641;
                font-weight: bold;
                text-align: center;
            }
            .info {
                font-size: 14px;
                color: #969696;
                margin-bottom: 10px;
                text-align: justify;
            }
            .blog-title {
                text-align: center;
            }
            .blog-image-block img {
                margin: 0 auto;
                padding-left: 12%;
            }
        </style>
    </head>
    <body>
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
                            <li class="nav-item"> <a class="nav-link" href="/news"><strong>NEWS</strong> </a> </li>
                            <li class="nav-item"> <a class="nav-link" href="/about.html"><strong>ABOUT</strong></a> </li>
                            <li class="nav-item"> <a class="nav-link" href="/contact"><strong>CONTACT</strong></a> </li>
                            <li class="nav-item"> <a class="nav-link" href="/logout"><strong>LOGOUT</strong></a> </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Body
         ================================================== -->
        <section class="service-sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading text-md-center text-xs-center">
                            <h2>PRODUCTS SETTINGS</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <form action="store" method="POST" name="form" id="form" accept-charset="UTF-8" enctype="multipart/form-data">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th class="col-md-2 text-center vcenter">Name</th>
                                    <th class="col-md-3 text-center vcenter">Content</th>
                                    <th class="col-md-2 text-center vcenter">Price (£)</th>
                                    <th class="col-md-2 text-center vcenter">Genre</th>
                                    <th class="col-md-3 text-center vcenter">Image</th>
                                    <th></th>
                                </tr>
                            </thead>

                            <tbody class="container-items tableForm">
                                <tr class="controls" >
                                    <td>
                                        <textarea class="form-control" placeholder="Name (maximum 32 characters)" name="name" id="name" maxlength="32" required></textarea>
                                    </td>
                                    <td>
                                        <textarea class="form-control" placeholder="Description" name="content" required></textarea>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="price" id="price" required>
                                    </td>
                                    <td class="vcenter">
                                        <div class="form-group">
                                            <select class="form-control" name="category" required>
                                                <optgroup label="Select game type">
                                                    <option value="0" selected hidden>Genres</option>
                                                    <%
                                                        CategoryDAO categoryDAO = new CategoryDAO();
                                                        List<Category> listCategory = (ArrayList<Category>) categoryDAO.getCategory();
                                                        for (Category c : listCategory) {
                                                    %>
                                                    <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                                    <%}%>
                                                </optgroup>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <input type="file" class="form-control" name="image" required>
                                    </td>
                                    <td class="text-center vcenter">
                                        <button type="success" class="btn btn-success btn-xs" name="action" value="addproduct" id="submit">
                                            <i id="btn_i" class="fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                        <button type="reset" class="btn btn-danger btn-xs">
                                            <i id="btn_i" class="fa fa-refresh" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </section>


        <!--Show Products-->
        <%
            ProductDAO productDAO = new ProductDAO();
            int pages = 1, firstResult, maxResult, total;
            if (request.getParameter("pages") != null) {
                pages = (Integer) Integer.parseInt(request.getParameter("pages"));
            }
            total = productDAO.countProduct();

            if (total <= 6) {
                firstResult = 1;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 6;
                maxResult = 6;
            }

            List<Product> listOfProduct = productDAO.getAllProducts(firstResult, maxResult);
        %>

        <!-- Products
          ================================================== -->
        <section class="service-sec">
            <div class="container">
                <div class="row">

                    <!--Start loop to show products-->
                    <%
                        if (listOfProduct.size() > 0) {
                            for (Product p : listOfProduct) {
                    %>

                    <div class="col-md-4 blog-box" data-aos="fade-down">
                        <h3 class="blog-title"><a href="store?action=view&productID=<%=p.getPid()%>"><%=p.getName()%></a></h3>
                        <div class="blog-image-block"> <img src="img/products/<%=p.getImage()%>" alt="" class="img-fluid"> </div>
                        <p class="blog-content info"><%=p.getContent()%></p>
                        <p class="blog-content price">£<%=p.getPrice()%></p>
                        <p class="blog-content">
                            <a class="btn btn-info col-sm-3 col-md-5 float-left" href="store?action=view&productID=<%=p.getPid()%>">Read more</a>
                            <a class="btn btn-danger col-sm-3 col-md-5 float-right" href="store?action=delete&productID=<%=p.getPid()%>">Remove <i id="btn_i" class="fa fa-trash" aria-hidden="true"></i></a>
                        </p>
                    </div>
                    <% }
                        }%>
                    <!--End loop-->

                </div>
                <!-- /.row -->
            </div>

            <div class="container">
                <div class="row">
                    <ul class="pagination">
                        <%for (int i = 1;
                                    i <= (total / 6) + 1; i++) {%>
                        <li class="arrow"><a href="/editProduct.jsp?pages=<%=i%>"><%=i%></a></li>
                            <%}%>
                    </ul>
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
        <script src="js/tether.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/nivo-lightbox.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/core.js"></script>
        <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
        <script src="js/effects.js"></script>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>


        <script>
            document.getElementById("submit").onclick = function () {
                var inputtxt = document.getElementById("title");
                var letters = /<("[^"]*"|'[^']*'|[^'">])*>/;
                if (!inputtxt.value.match(letters)) {
                    return true;
                } else {
                    alert('Please remove HTML tag');
                    return false;
                }
            }
        </script>
    </body>
</html>
