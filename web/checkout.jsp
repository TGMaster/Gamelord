<%-- 
    Document   : checkout
    Created on : Jan 10, 2018, 1:54:50 PM
    Author     : TGMaster
--%>

<%@page import="User.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="icon" href=" ">
        <title>Gamelord Registration Page | Game Developer Company</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

    </head>

    <body>

        <%
            User u = null;
            UserDAO userDAO = new UserDAO();
            String username;

            Cookie[] cookies = request.getCookies();
            u = (User) session.getAttribute("user");
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        username = cookie.getValue();
                        u = userDAO.login(username);
                    }
                }
            }

            if (session.getAttribute("user") == null) {
                session.setAttribute("user", u);
            }

            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }

            String message = "";
            if (request.getAttribute("message") != null) {
                message = (String) request.getAttribute("message");
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
                            <li class="nav-item active"> <a class="nav-link" href="/store"><strong>STORE</strong> <span class="sr-only">(current)</span></a> </li>
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
                <div class="row">
                    <section>

                        <ul class="nav nav-pills nav-justified" role="tablist">

                            <li role="presentation" class="nav-item">
                                <a href="#step1" class="nav-link active" data-toggle="pill" aria-controls="step1" role="tab" title="Step 1">
                                    1
                                </a>
                            </li>

                            <li role="presentation" class="nav-item">
                                <a href="#step2" class="nav-link disabled" data-toggle="pill" aria-controls="step2" role="tab" title="Step 2">
                                    2
                                </a>
                            </li>
                            <li role="presentation" class="nav-item">
                                <a href="#step3" class="nav-link disabled" data-toggle="pill" aria-controls="step3" role="tab" title="Step 3">
                                    3
                                </a>
                            </li>
                        </ul>

                        <div class="row">
                            <form role="form" action="checkout" method="POST">
                                <div class="tab-content">


                                    <div class="tab-pane active" role="tabpanel" id="step1">
                                        <h3>Step 1 of 3</h3>
                                        <p>Billing Information</p>

                                        <div class="form-check-inline form-check">
                                            <label class="form-check-label" data-toggle="collapse" data-target="#promo">
                                                <input type="checkbox" class="form-check-input"> I have a promo code
                                            </label>
                                        </div>
                                        <div class="collapse" id="promo">
                                            <div class="form-group">
                                                <label for="inputpromo" class="control-label">Promo Code</label>
                                                <div class="form-inline">
                                                    <input type="text" class="form-control" id="inputpromo" placeholder="Enter promo code">
                                                    <button class="btn btn-success">Apply</button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Username -->
                                        <div class="form-group row">
                                            <label class="col-md-4 col-form-label">Username:</label>
                                            <div class="col-md-8">
                                                <input type="hidden" name="username" value="<%=u.getName()%>">
                                                <p class="form-control-static"><%=u.getName()%></p>
                                            </div>
                                        </div>

                                        <!-- Email -->
                                        <div class="form-group row">
                                            <label class="col-md-4 col-form-label">Email:</label>
                                            <div class="col-md-8">
                                                <p class="form-control-static"><%=u.getEmail()%></p>
                                            </div>
                                        </div>

                                        <!-- Address -->
                                        <div class="form-group row">
                                            <label class="col-md-4 col-form-label">Address:</label>
                                            <div class="col-md-8">
                                                <p class="form-control-static"><%=u.getAddress()%></p>
                                            </div>
                                        </div>

                                        <div class="float-right">
                                            <a class="btn btn-info next-step" href="/edit">Edit</a>
                                            <button type="button" class="btn btn-primary btn-success next-step">Confirm and continue</button>
                                        </div>
                                    </div>



                                    <div class="tab-pane" role="tabpanel" id="step2">
                                        <h3>Step 2 of 3</h3>
                                        <p>Payment Method</p>


                                        <div class="row">                        
                                            <label class="radio-inline"><input type="radio" name="optradio">Credit card</label>
                                            <div class="credit_card">
                                                <ul class="payments_ul">
                                                    <li>
                                                        <img src="http://localhost/nukkad-shop/public/assets/img/credit-card.png">
                                                    </li>
                                                    <li>
                                                        <img src="http://localhost/nukkad-shop/public/assets/img/mastercard.png">
                                                    </li>
                                                    <li>
                                                        <img src="http://localhost/nukkad-shop/public/assets/img/paypal.png">
                                                    </li>
                                                    <li>
                                                        <img src="http://localhost/nukkad-shop/public/assets/img/visa.png">
                                                    </li>
                                                </ul>
                                            </div>

                                            <!-- Card Name -->
                                            <div class="form-group row">
                                                <label for="namecard" class="col-sm-3 col-form-label">* Name on card</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                                    <input type="text" class="form-control" id="namecard" placeholder="Name on card" name="namecard" required onchange="email_validate(this.value);">
                                                    <div class="status" id="status"></div>
                                                </div>
                                            </div>

                                            <div class="name_of_card">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Card number</label>
                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Card number">
                                                </div>
                                            </div>
                                            <p>Expiration date</p>
                                            <div class="expir_date col-md-3">                      
                                                <div class="form-group">                      
                                                    <select class="form-control">
                                                        <option>-- Select -- </option>
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="expir_date col-md-5">
                                                <div class="form-group">
                                                    <select class="form-control">
                                                        <option>-- Year -- </option>
                                                        <option>2006</option>
                                                        <option>2006</option>
                                                        <option>2007</option>
                                                        <option>2008</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-4"> 
                                            <label class="radio-inline"><input type="radio" name="optradio">Debit card</label>
                                            <div class="debit_card">
                                                <div class="form-group">
                                                    <select class="form-control">
                                                        <option>-- Debit card -- </option>
                                                        <option>All Visa/MasterCard Debit Card</option>
                                                        <option>All Rupay Debit Cards</option>
                                                        <option>All SBI Maestro Debit Cards</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4"> 
                                            <label class="radio-inline"><input type="radio" name="optradio">Net Banking</label>
                                            <div class="net_banking">
                                                <div class="form-group">
                                                    <select class="form-control">
                                                        <option>-- Net Banking -- </option>
                                                        <option>Allahabad Bank</option>
                                                        <option>Andhra Bank</option>
                                                        <option>Airtel Payments Bank</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="float-right">
                                            <button type="button" class="btn btn-default prev-step">Previous</button>
                                            <button type="submit" class="btn btn-success next-step" name="action" value="buy">PURCHASE</button>
                                        </div>
                                    </div>



                                    <div class="tab-pane" role="tabpanel" id="step3">
                                        <h3>Complete</h3>
                                        <p>Thanks for your purchasing</p>
                                        <ul class="list-inline pull-xs-right">
                                            <a class="btn btn-info" href="/store">Back to store</a>
                                        </ul>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </form>
                        </div>
                    </section>
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
        <script src="js/checkout.js"></script>

    </body>
</html>
