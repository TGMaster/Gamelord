<%@page import="java.util.*, News.*, Category.*"%>
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
        <title>Gamelord News Settings | Game Developer Company</title>

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
                            <h2>NEWS SETTINGS</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <form action="news" method="POST" name="form" id="form" accept-charset="UTF-8">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th class="col-md-3 text-center vcenter">Title</th>
                                    <th class="col-md-5 text-center vcenter">Content</th>
                                    <th class="col-md-2 text-center vcenter">Group</th>
                                    <th class="col-md-4 text-center vcenter">Images</th>
                                    <th class="col-md-1">
                                    </th>
                                </tr>
                            </thead>

                            <tbody class="container-items tableForm">
                                <tr class="controls" >
                                    <td>
                                        <textarea class="form-control" rows="4" placeholder="Title (maximum 255 characters)" name="tit" id="title" required></textarea>
                                    </td>
                                    <td>
                                        <textarea class="form-control" rows="4" placeholder="Description" name="con" required></textarea>
                                    </td>
                                    <td class="vcenter">
                                        <div class="form-group">
                                            <select class="form-control" name="category" required>
                                                <optgroup label="Select game type">
                                                    <option value="" selected hidden>Groups</option>
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
                                        <textarea class="form-control" rows="4" placeholder="Name of image in /img/news/" name="image" required></textarea>
                                    </td>
                                    <td class="text-center vcenter">
                                        <button type="success" class="btn btn-success btn-xs" name="action" value="addnews" id="submit">
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


        <!--Show News-->
        <%
            NewsDAO connector = new NewsDAO();
            List<News> listOfNews = connector.getAllNews();
        %>
        <!-- News
          ================================================== -->
        <section class="service-sec">
            <div class="container">
                <div class="row">

                    <!--Start loop to show news-->
                    <%
                        for (int i = 0; i < listOfNews.size(); i++) {
                            String content = listOfNews.get(i).getContent();
                            if (content.contains("<br>")) {
                                String[] temp = content.split("<br>");
                                content = temp[0] + " ...";
                            }
                    %>

                    <div class="col-md-4 blog-box" data-aos="fade-down">
                        <h3 class="blog-title"><a href="/news?viewnews=<%=i%>&action=details"><%=listOfNews.get(i).getTitle()%></a></h3>
                        <div class="blog-image-block"> <img src="<%=listOfNews.get(i).getImage()%>" alt="" class="img-fluid"> </div>
                        <p class="blog-content"><%=content%></p>
                        <form action="news" method="POST">
                            <p class="blog-content">
                                <input type="hidden" name="details" value="<%=i%>">
                                <button type="submit" class="btn btn-info" name="action" value="details">Read more</button>
                                <input type="hidden" name="remove" value="<%=listOfNews.get(i).getId()%>" >
                                <button type="submit" class="btn btn-danger" name="action" value="remove">Remove <i id="btn_i" class="fa fa-trash" aria-hidden="true"></i></button>
                            </p>
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
