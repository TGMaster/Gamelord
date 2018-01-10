package Mail;

import java.io.IOException;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

public class ContactController extends HttpServlet {

    private final String myemail = "gamelord.company@gmail.com";
    private final String service = "service.gamelord@gmail.com";
    private final String mailserver = "smtp.gmail.com";
    private final String subject = "[Support] Gamelord Contact";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Call Session
        HttpSession session = request.getSession();

        // Get action
        String action = request.getParameter("action");

        // Show contact form
        if (action == null) {
            rd = sc.getRequestDispatcher("/contact.jsp");
            rd.forward(request, response);
        } // Send mail
        else if (action.equals("send")) {
            String name = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phonenumber");
            String msg = request.getParameter("message");

            if (name.equals("") || email.equals("") || msg.equals("")) {
                session.setAttribute("message", "PLEASE DON'T TRY TO USE THIS TRICK");
            } else {
                Date today = new Date();

                String message = "<table>"
                        + "<tr><td>FROM:</td> <td><strong>" + name + "</strong></td></tr>"
                        + "<tr><td>DATE:</td> <td><strong>" + today.toString() + "</strong></td></tr>"
                        + "<tr><td>EMAIL:</td> <td><strong>" + email + "</strong></td></tr>"
                        + "<tr><td>PHONE:</td> <td><strong>" + phone + "</strong></td></tr>"
                        + "<tr><td colspan=2>MESSAGE:</td></tr>"
                        + "<tr><td colspan=2>" + msg + "</td></tr>"
                        + "</table>";

                Mail mail = new Mail(myemail, service, message, subject, mailserver);
                MailController sendMail = new MailController();

                if (sendMail.sendMail(mail)) {
                    session.setAttribute("message", "We will contact you soon!");
                } else {
                    session.setAttribute("message", "There was an error while processing");
                }

                response.sendRedirect("/contact");
            }
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
