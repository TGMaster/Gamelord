<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{background: #DCDCDC;}
            h1{text-align: left}
            .wrapper {width:400px;padding:30px;background:white;margin: 0 auto;float: left}
            .wrapper h2{text-transform: uppercase;color: #e74c3c}
            .wrapper p{color:#222;font-weight:bold}
            .wrapper input[type=text],
            .wrapper input[type=email],
            textare{
                width :100%;margin-bottom:15px; padding: 5px;
            }
            .wrapper a{
                text-decoration: none; background: #2ecc71; color: #fff; display: block;padding: 10px 15px;text-align: left; font-size: 15px;
            }
            .img {

                text-align: center;


            }
            .img label{color: #e74c3c}
        </style>

    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <h1>Contact Form</h1>
        <hr>
        <div class="wrapper">
            <h2>Contact Form</h2>
            <p>We will try to contact within 24 hours</p>
            <form action="contact" method="post">
                <label>Full name*</label>
                <input type="text" name="fullname" id="fullname" placeholder="Enter your name" required="required">

                <label>Email*</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required="required">
                <label>Phone</label>
                <input type="tel" name="phone" id="phone" placeholder="Enter your phone">
                <label>Message*</label><br>
                <textarea name="message" cols="30" rows="10" placeholder="Type your message here" required="required">
                </textarea>
                <br>
                <button type="submit" name="action" id="submit" value="send">Send</button>
            </form>
        </div>
        <div class="img">
            <label>CONTACT INFORMATION</label><br>
            <label>Address: 141 Tran Dinh Xu, District 1, Ho Chi Minh city</label><br>
            <label>Telephone: (028)  35152222</label>


            <br>
            <label>Email:vndtcompany@gmail.com</label><br>
            <img src="address.jpg" width ="500" height="400">

        </div>



        <jsp:include page="footer.jsp"/>
    </body>


</html>