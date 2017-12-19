<%@page import="JavaMail.Mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            Mail mail = new Mail();
            mail = (Mail)session.getAttribute("email");
        %>
        
        <jsp:useBean id="mail" scope="session" class="JavaMail.Mail" />
        
        <jsp:setProperty name="mail" property="to" value="<%=mail.getTo()%>"/>
        <jsp:setProperty name="mail" property="from" value="<%=mail.getFrom()%>"/>
        <jsp:setProperty name="mail" property="smtpServ" value="<%=mail.getSmtpServ()%>"/>
        <jsp:setProperty name="mail" property="subject" value="<%=mail.getSubject()%>"/>
        <jsp:setProperty name="mail" property="message" value="<%=mail.getMessage()%>"/>

        <%
            String to = mail.getTo();
            int result;
            result = mail.sendMail();
            if (result == 0) {
                out.println(" Mail Successfully Sent to " + to);
            } else {
                out.println(" Mail NOT Sent to " + to);
            }
        %>

    </body>
</html>
