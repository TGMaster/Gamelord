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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
        <!-- Use JavaBean to get information-->
        <jsp:useBean id="news" scope="application" class="function.NewsDTO"/>

        <!-- Header
         ================================================== -->
        <jsp:include page="header.jsp"/>

        <section class="about-sec parallax-section" id="about">
            <div class="container">
                <center><div class="row">
                    <div class="col-md-10">
                        <h2><jsp:getProperty name="news" property="title"/></h2>
                        <h4 style="text-align: right"><small><jsp:getProperty name="news" property="date"/></small></h4>
                    </div>
                </div></center>
                <div class="row">
                    <div class="col-md-4">
                        <img src="<jsp:getProperty name="news" property="image"/>" class="img-fluid"/>
                    </div>
                    <div class="col-md-4">
                        <p style="text-align: left"><jsp:getProperty name="news" property="content"/></p>
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
        <script src="js/bootstrap.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/nivo-lightbox.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/core.js"></script>


        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
