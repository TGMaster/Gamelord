<%@page import="News.*"%>
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
        <link href="css/loaders.css" rel="stylesheet">
        <link href="css/swiper.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>


        <!-- Use JavaBean to get information-->
        <%
            News n = (News) session.getAttribute("news");
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
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <section class="service-sec">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading text-md-center text-xs-center">
                        <h2>NEWS</h2>
                    </div>
                </div>
            </div>
        </section>

        <section class="about-sec parallax-section">
            <div class="container">

                <center><div class="row">
                        <div class="col-md-10">
                            <h2><%=n.getTitle()%></h2>
                            <h4 style="text-align: right"><small><%=n.getDate()%></small></h4>
                        </div>
                    </div></center>
                <div class="row">
                    <div class="col-md-4">
                        <img src="<%=n.getImage()%>" class="img-fluid"/>
                    </div>
                    <div class="col-md-4">
                        <p style="text-align: left"><%=n.getContent()%></p>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="fb-comments" data-href="http://localhost:8080/news?action=details&viewnews=<%=n.getId()%>" data-numposts="5"></div>
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
    </body>
</html>
