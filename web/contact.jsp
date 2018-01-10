<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="icon" href=" ">
        <title>Gamelord Contact Page | Game Developer Company</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">

        <!-- Helper Styles -->
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/animation.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <style>
            /* For Contact Section*/
            #map{
                height:650px;
                width:100%;
                position:relative;
                overflow:hidden;
            }


            .contact-form-area{
                position:absolute;
                bottom:40px;
                background:rgba(0, 0, 0, 0.6);
                padding:30px;
                width:85%;
                border:1px solid #cdcaca;
                border-radius:5px;
                -webkit-border-radius:5px;
                -moz-border-radius:5px;
                margin-bottom:30px;
                -ms-border-radius:5px;
                box-shadow:1px 1px 1px 0 rgba(55,50,40, .10);
                -webkit-box-shadow:1px 1px 1px 0 rgba(55,50,40, .10);
                -moz-box-shadow:1px 1px 1px 0 rgba(55,50,40, .10);
                -ms-box-shadow:1px 1px 1px 0 rgba(55,50,40, .10);

            }
            .contact-form-area form h3{
                font-size:36px;
                color:#fff;
                font-family: 'latobold';
                margin-bottom:20px;
            }
            .form-control {
                height: 35px;
                border: none;
            }
            .contact-form-area form .contact-btn{
                background: #dcdcdc;
                padding: 10px 70px;
                color: #000000;
                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
                -o-transition: all 0.5s;
                -ms-transition: all 0.5s;
                transition: all 0.5s;
            }
            .contact-form-area form .contact-btn:hover{
                background:#fff;
            }
        </style>

    </head>

    <body onload="document.contact.fullname.focus()">
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
                            <li class="nav-item"> <a class="nav-link" href="/news"><strong>NEWS</strong></a> </li>
                            <li class="nav-item"> <a class="nav-link" href="/about.html"><strong>ABOUT</strong></a> </li>
                            <li class="nav-item active"> <a class="nav-link" href="/contact"><strong>CONTACT</strong> <span class="sr-only">(current)</span></a> </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Sections -->
        <section id="contact">

            <div id="map"></div>

            <div class="container text-center">

                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-12 col-xs-12">
                        <div class="contact-form-area">
                            <form name="contact" action="contact" method="POST">
                                <h3>Contact</h3>
                                <div class="form-group">
                                    <input required type="text" class="form-control" placeholder="Your Name" name="fullname" id="txt" onkeyup="ValidateText(this)">
                                </div>

                                <div class="form-group">
                                    <input required type="email" class="form-control" placeholder="Your Email" name="email" id = "email" onchange="email_validate(this.value);">
                                    <div class="status" id="status"></div>
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control phone" name="phonenumber" placeholder="Your Phone Number" onkeyup="validatephone(this);" maxlength="28">
                                    <small style="color: white">We won't use it for marketing</small>
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" rows="7" placeholder="Message" name="message" required></textarea>
                                </div>

                                <button type="submit" class="btn btn-primary contact-btn" name="action" value="send">SEND</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div> <!-- /container -->
        </section>

        <jsp:include page="footer.jsp"/>
        
        <!-- Bootstrap core JavaScript
          ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js" ></script>
        <script src="js/tether.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?key=AIzaSyCZ3R3HV2ECPiClKyFX8Y_UMFg6T_2L1e0"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gmaps.js/0.4.24/gmaps.min.js"></script>
        <script src="js/map.js" ></script>
        <script type="text/javascript" src="js/registration.js"></script>
        
    </body>


</html>
