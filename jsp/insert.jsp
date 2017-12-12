<%-- 
    Document   : test
    Created on : Dec 10, 2017, 10:41:33 PM
    Author     : Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <h1> Thank you for informing us. We will contact you as soon as possible.</h1>
    </head>
    <body>
         <%
 String connectionURL="jdbc:mysql://localhost:3306/mydb?user=root;password=19021997"; //step 2
 Connection connection = null; //step 3
 Statement statement = null; //step 4
 ResultSet rs = null;
%>
--------------------------------------------------------------
<%
connection =  DriverManager.getConnection(connectionURL, "root", "19021997");
statement = connection.createStatement();
String email = request.getParameter("email"); 
String name = request.getParameter("fullname");
String phone = request.getParameter("phone");
String message = request.getParameter("message");
int ins =  statement.executeUpdate("INSERT INTO regist(name, email, phone, message) VALUES('"+ name +"','"+ email +"','"+ phone +"','"+ message +"')"); //!IMPORTANT!!

%>  
    </body>
</html>
