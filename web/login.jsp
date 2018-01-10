<%-- 
    Document   : login
    Created on : Jan 7, 2018, 7:43:19 PM
    Author     : TGMaster
--%>

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
        <title>Gamelord Login Page | Game Developer Company</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>

        <%
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
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
                <form action="login" method="POST" class="form-horizontal" role="form">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <h2>Login</h2>
                            <hr>
                        </div>
                    </div>

                    <%if (error.length() > 0) {%>
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="form-control-feedback">
                                <span class="text-danger align-middle">
                                    <i class="fa fa-close"></i> <%=error%>
                                </span>
                            </div>
                        </div>
                    </div>
                    <%}%>

                    <div class="row">
                        <div class="col-md-3"></div>

                        <div class="col-md-6">
                            <%if (error.length() > 0) {%>
                            <div class="form-group has-danger">
                                <label class="sr-only" for="username">Username</label>
                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                                    <input type="text" name="username" class="form-control" id="username"
                                           placeholder="Username" required autofocus>
                                </div>
                            </div>

                            <%} else {%>
                            <div class="form-group">
                                <label class="sr-only" for="username">Username</label>
                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                                    <input type="text" name="username" class="form-control" id="username"
                                           placeholder="Username" required autofocus>
                                </div>
                            </div>
                            <%}%>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <%if (error.length() > 0) {%>
                            <div class="form-group has-danger">
                                <label class="sr-only" for="password">Password</label>
                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                                    <input type="password" name="password" class="form-control" id="password"
                                           placeholder="Password" required>
                                </div>
                            </div>

                            <%} else {%>

                            <div class="form-group">
                                <label class="sr-only" for="password">Password</label>
                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                                    <input type="password" name="password" class="form-control" id="password"
                                           placeholder="Password" required>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6" style="padding-top: .35rem">
                            <div class="form-check mb-2 mr-sm-2 mb-sm-0">
                                <label class="form-check-label">
                                    <input class="form-check-input" name="remember" type="checkbox" value="yes" id="remember">
                                    <span style="padding-bottom: .15rem">Remember me</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 1rem">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-success" name="action" value="login"><i class="fa fa-sign-in"></i> Login</button>
                            <a class="btn btn-link" href="/register">Register</a>
                            <a class="btn btn-link" href="reset">Forgot Your Password?</a>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Bootstrap core JavaScript
          ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js" ></script>
        <script src="js/tether.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>