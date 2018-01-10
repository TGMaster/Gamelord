/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Database.PasswordHashing;
import Mail.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Registrer extends HttpServlet {

    private static final String service = "service.gamelord@gmail.com";
    private static final String mailserver = "smtp.gmail.com";
    private static final String subject = "[Registration] Welcome to GAMELORD";

    // Connect Database
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        rd = sc.getRequestDispatcher("/registration.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Call session
        HttpSession session = request.getSession();

        // User object
        User user = new User();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String pass2 = request.getParameter("password2");
        String address = request.getParameter("address");
        String dob = request.getParameter("dob");

        String error = "";

        if (username.equals("") || email.equals("") || pass.equals("") || address.equals("")) {
            error += "Please fill out all required fields";
        } else {
            if (!pass.equals(pass2)) {
                error += "Your password and confirmation password do not match";
            }
        }

        String text
                = "Thanks for signing up to keep in touch with <strong>GAMELORD</strong>. From now on there might be a few things about GAMELORD you would like to know:<br>"
                + "First , you will find more than 1000 games online and offline at GAMELORD<br>"
                + "Second, you can place your order online and then collect at the same time<br>"
                + "Third, we have a fantastic website that updates daily<br>"
                + "Final, we have an active online community<br><br>"
                + "Keep your eyes peeled for a special offer email from us. In the meantime, see the latest and greatest game from the website.";

        if (error.length() > 0) {

            request.setAttribute("error", error);

            rd = sc.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);

        } else {
            user.setName(username);
            user.setPass(PasswordHashing.hashPassword(pass));
            user.setEmail(email);
            user.setAddress(address);
            if (dob.equals("")) {
                // Format Date
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date today = new Date();
                dob = sdf.format(today);
            }
            dob = dob.replace("/", "-");
            user.setDOB(dob);
            
            // Set Normal User by default
            user.setAdmin(false);
            
            // Set Default Profile Pic
            user.setImage("avatar.jpg");

            // Check if adding is successful
            if (userDAO.insertUser(user)) {

                text = "Hi <strong>" + user.getName() + "</strong>,<br><br>" + text;

                Cookie loginCookie = new Cookie("username", username);
                //setting cookie to expiry in 30 mins
                loginCookie.setMaxAge(60 * 60 * 24 * 365);
                response.addCookie(loginCookie);

                Mail mail = new Mail(user.getEmail(), service, text, subject, mailserver);
                MailController sm = new MailController();
                sm.sendMail(mail);

                session.setAttribute("user", user);
                response.sendRedirect("/store");
            } else {
                request.setAttribute("error", "Error in Registration");
                rd = sc.getRequestDispatcher("/registration.jsp");
                rd.forward(request, response);
            }
        }
    }
}
