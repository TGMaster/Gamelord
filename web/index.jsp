<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="News.*, java.util.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="icon" href=" ">
        <title>Gamelord Home Page | Game Developer Company</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/gallery.css" rel="stylesheet">

        <!-- Helper Styles -->
        <link rel="stylesheet" href="css/loaders.css">
        <link rel="stylesheet" href="css/swiper.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/animation.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">
        <link rel="stylesheet prefetch" href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>

    <body>

        <!-- Loading screen -->
        <div class="loader loader-bg">

            <div class="loader-inner ball-clip-rotate-pulse">
                <div></div>
                <div></div>
            </div>

        </div>

        <!-- Top Navigation -->
        <nav class="navbar navbar-toggleable-md mb-4 top-bar navbar-static-top sps sps--abv">
            <div class="container">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse1" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mx-auto logo" href="/index.jsp">GAME<span>LORD</span></a>
                <div class="collapse navbar-collapse" id="navbarCollapse1">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"> <a class="nav-link" href="/index.jsp"><strong>HOME</strong> <span class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/store"><strong>STORE</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/news"><strong>NEWS</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/about.html"><strong>ABOUT</strong></a> </li>
                        <li class="nav-item"> <a class="nav-link" href="/contact"><strong>CONTACT</strong></a> </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Swiper Silder
          ================================================== -->
        <!-- Slider main container -->
        <div class="swiper-container main-slider" id="myCarousel">
            <div class="swiper-wrapper">
                <div class="swiper-slide slider-bg-position" style="background:url('img/overwatch.png')" data-hash="slide1"></div>
                <div class="swiper-slide slider-bg-position" style="background:url('img/assasin.jpg')" data-hash="slide2"> </div>
                <div class="swiper-slide slider-bg-position" style="background:url('img/batman.jpg')" data-hash="slide3"></div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Navigation -->
            <div class="swiper-button-prev"><i class="fa fa-chevron-left"></i></div>
            <div class="swiper-button-next"><i class="fa fa-chevron-right"></i></div>
        </div>

        <!-- News
          ================================================== -->
        <section class="service-sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading text-md-center text-xs-center">
                            <h2>Lastest News</h2>
                        </div>
                    </div>

                    <!--Start loop to show news-->
                    <%
                        NewsDAO newsDAO = new NewsDAO();
                        List<News> listOfNews = newsDAO.getAllNews();
                        if (listOfNews.size() > 2) {
                            for (int i = 0; i < 3; i++) {
                                String content = listOfNews.get(i).getContent();
                                if (content.contains("<br>")) {
                                    String[] temp = content.split("<br>");
                                    content = temp[0] + " ...";
                                }

                    %>

                    <div class="col-md-4 blog-box" data-aos="fade-down">
                        <div class="blog-image-block"> <img src="<%=listOfNews.get(i).getImage()%>" alt="" class="img-fluid"> </div>
                        <h3 class="blog-title"><a href="/news?viewnews=<%=i%>&action=details"><%=listOfNews.get(i).getTitle()%></a></h3>
                        <p class="blog-content"><%=content%></p>
                    </div>
                    <% }
                        }%>
                    <!--End loop-->

                </div>
                <!-- /.row -->

                <!--Button-->
                <div class="row" data-aos="fade-up">
                    <div class="col-md-12 blog-box" align="center">
                        <a href="/news" class="btn btn-white-blue btn-capsul"><b>More News</b></a>
                    </div>
                </div>
            </div>

        </section>

        <!-- Gallery
        ================================================== -->
        <section class="gallery-sec" id="gallery">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading text-md-center text-xs-center">
                            <h2>Games Gallery</h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="wrapper">
                            <div class="column" data-aos="flip-up">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-down">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-left">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-right">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-up">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-down">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-left">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-right">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-up">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-down">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-left">
                                <div class="inner"></div>
                            </div>
                            <div class="column" data-aos="flip-right">
                                <div class="inner"></div>
                            </div>
                        </div>
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
        <script src="js/scrollPosStyler.js"></script>
        <script src="js/swiper.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/nivo-lightbox.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/core.js"></script>

        <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>

        <script src="js/effects.js" ></script>

    </body>
</html>
