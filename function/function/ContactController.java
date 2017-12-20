package function;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import JavaMail.*;

public class ContactController extends HttpServlet {

    private String myemail = "tien.grimes@gmail.com";
    private String mailserver = "smtp.gmail.com";
    private String subject = "[Support] Gamelord Contact";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        // Show contact form
        if (action == null) {
            rd = sc.getRequestDispatcher("/contact.jsp");
            rd.forward(request, response);
        }
        
        // Send mail
        else if (action.equals("send")) {
            String name = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String msg = request.getParameter("message");
            
            String message = "FROM: " + name
                    + "DATE: "
                    + "SUBJECT: " + subject
                    + "PHONE: " + phone
                    + "MESSAGE: \n" + msg;

            Mail mail = new Mail(myemail, email, message, subject, mailserver);
            MailController sendMail = new MailController();
            sendMail.sendMail(mail);
            
            rd = sc.getRequestDispatcher("/contact.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
