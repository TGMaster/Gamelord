<%@page import="User.*"%>
<%@page import="java.util.*, News.*, Category.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="icon" href=" ">
        <title>Gamelord News Page | Game Developer Company</title>

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
    </head>
    <body>
        <%
            User user = null;
            UserDAO userDAO = new UserDAO();

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
                            <li class="nav-item"> <a class="nav-link" href="/store"><strong>STORE</strong></a> </li>
                            <li class="nav-item active"> <a class="nav-link" href="/news"><strong>NEWS</strong> <span class="sr-only">(current)</span></a> </li>
                            <li class="nav-item"> <a class="nav-link" href="/about.html"><strong>ABOUT</strong></a> </li>
                            <li class="nav-item"> <a class="nav-link" href="/contact"><strong>CONTACT</strong></a> </li>
                                <%
                                    if (user != null && user.isAdmin()) {
                                %>
                            <li class="nav-item"> <a class="nav-link" href="/editnews.jsp"><strong>SETTINGS</strong></a> </li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <%
            List<News> listOfNews = (ArrayList<News>) session.getAttribute("ln");
        %>
        <!-- News
          ================================================== -->
        <section class="service-sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading text-md-center text-xs-center">
                            <h2>NEWS</h2>
                        </div>
                    </div>
                </div>


                <form id="menu" method="POST" action="news">
                    <div class="form-inline">
                        <div class="form-group col-12 col-md-2">
                            <select id="category" name="category" class="form-control custom-select dropup" onchange="this.form.submit()">
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
                        <input type="hidden" name="action" value="search"/>
                        <div class="input-group col-md-4 col-12">
                            <input type="text" class="form-control" placeholder="Search..." name="searchNews" id="search">
                            <button type="submit" class="btn btn-white-blue" id="searchbtn" value="search">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                        
                    </div>
                </form>

                <div class="row">

                    <!--Start loop to show news-->
                    <%
                        for (News n : listOfNews) {
                            String content = n.getContent();
                            if (content.contains("<br>")) {
                                String[] temp = content.split("<br>");
                                content = temp[0] + " ...";
                            }
                    %>

                    <div class="col-md-4 blog-box" data-aos="fade-down">
                        <h3 class="blog-title"><a href="/news?viewnews=<%=n.getId()%>&action=details"><%=n.getTitle()%></a></h3>
                        <div class="blog-image-block"> <img src="<%=n.getImage()%>" alt="" class="img-fluid"> </div>
                        <p class="blog-content"><%=content%></p>
                        <p class="blog-content">
                        <form action="news" method="GET">
                            <input type="hidden" name="viewnews" value="<%=n.getId()%>">
                            <button type="submit" class="btn btn-info" name="action" value="details">Read more</button>
                        </form>
                    </div>
                    <% }%>
                    <!--End loop-->

                </div>
                <!-- /.row -->
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
