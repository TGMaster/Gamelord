<%-- 
    Document   : test
    Created on : Jan 10, 2018, 10:41:41 PM
    Author     : TGMaster
--%>

<%@page import="User.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Site Properties -->
        <title>Gamelord Store Page | Game Developer Company</title>

        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
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

        <div class="container">

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


            <div class="tab-content">

                <div class="tab-pane active" role="tabpanel" id="step1">

                    <form class="form-horizontal" role="form">

                        <div class="row">
                            <div class="col-md-6">
                                <h2>Step 1 of 3</h2>
                                <p>Billing information</p>
                                <hr>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-9">
                                <div class="form-check">
                                    <label class="form-check-label" data-toggle="collapse" data-target="#promo">
                                        <input type="checkbox" class="form-check-input"> I have a promo code
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="collapse" id="promo">
                                <div class="col-md-9 field-label-responsive">
                                    <label for="inputpromo" class="control-label">Promo Code</label>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                            <input type="text" class="form-control" id="inputpromo" placeholder="Enter promo code">
                                            <button class="btn btn-success">Apply</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br/>

                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="name">Username</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                                        <input type="text" name="name" class="form-control" id="name"
                                               value="<%=u.getName()%>" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="email">E-Mail Address</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-envelope"></i></div>
                                        <input type="text" name="email" class="form-control" id="email"
                                               value="<%=u.getEmail()%>" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="address">Address</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-home"></i></div>
                                        <input type="text" name="address" class="form-control" id="address"
                                               value="<%=u.getAddress()%>" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="dob">Date of Birth</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <div class="input-group-addon" style="width: 2.6rem">
                                            <i class="fa fa-birthday-cake"></i>
                                        </div>
                                        <input type="text" name="dob" class="form-control"
                                               id="dob" value="<%=u.getDOB()%>" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <br/>

                    <div class="float-right">
                        <a class="btn btn-info next-step" href="/edit">Edit</a>
                        <button type="button" class="btn btn-primary btn-success next-step">Confirm and continue</button>
                    </div>
                </div>


                <div class="tab-pane" role="tabpanel" id="step2">

                    <form class="form-horizontal" role="form" method="POST" action="checkout">

                        <div class="row">
                            <div class="col-md-6">
                                <h2>Step 2 of 3</h2>
                                <p>Payment Method</p>
                                <hr>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="cardno">Card Number</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-paypal"></i></div>
                                        <input type="text" name="cardno" class="form-control" id="cardno"
                                               placeholder="VISA Card Number" required autofocus onkeyup="ValidateNumber(this)" maxlength="16">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-control-feedback">
                                    <span class="text-danger align-middle">
                                        <div id="statusCard"></div>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="exp">Expiration Date</label>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-calendar-o"></i></div>
                                        <input type="text" name="day" class="form-control" id="exp_m"
                                               placeholder="MM" required onkeyup="ValidateNumber(this)" maxlength="2">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <input type="text" name="year" class="form-control" id="exp_y"
                                               placeholder="YY" required onkeyup="ValidateNumber(this)" maxlength="2">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-control-feedback">
                                    <span class="align-middle">
                                        <div id="statusExp"></div>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="cvv">CVV</label>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <input type="text" name="cvv" class="form-control" id="cvv"
                                               placeholder="CVV" required onkeyup="ValidateNumber(this)" maxlength="3">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-control-feedback">
                                    <span class="text-danger align-middle">
                                        <div id="statusCVV"></div>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 field-label-responsive">
                                <label for="password">Confirm Password</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                        <div class="input-group-addon" style="width: 2.6rem">
                                            <i class="fa fa-key"></i>
                                        </div>
                                        <input type="password" name="password-confirmation" class="form-control"
                                               id="password-confirm" placeholder="Password" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3"><span id="user-result"></span></div>
                        </div>

                    </form>


                    <div class="float-right">
                        <button type="button" class="btn btn-default prev-step">Previous</button>
                        <button type="button" class="btn btn-success next-step" id="next_btn" disabled>Confirm and continue</button>
                    </div>

                </div>

                <div class="tab-pane" role="tabpanel" id="step3">
                    <h2>Almost Done</h2>
                    <p>Please make sure your information is correct!</p>
                    <hr/>

                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <form action="checkout" method="POST">
                                <input type="hidden" name="username" value="<%=u.getName()%>">
                                <input type="hidden" name="payment" value="VISA">
                                <button type="submit" class="btn btn-warning" name="action" value="checkout">PURCHASE</button>
                            </form>
                        </div>
                    </div>

                    <ul class="list-inline float-right">
                        <a class="btn btn-info" href="/store">Back to store</a>
                    </ul>
                </div>

                <div class="clearfix"></div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script src="js/jquery.min.js" ></script>
        <script src="js/tether.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/checkout.js"></script>

    </body>
</html>