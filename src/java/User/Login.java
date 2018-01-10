/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Database.PasswordHashing;
import Product.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Login extends HttpServlet {

    // Connect Database
    private final UserDAO userDAO = new UserDAO();

    // New Cart
    Cart cart = new Cart();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // User object
        User user;

        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");
        String error = "";

        String action = request.getParameter("action");

        if (action == null) {
            rd = sc.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
            
        } else {

            if (username.equals("") || pass.equals("")) {
                error += "Please enter all username and password";
            } else {
                user = userDAO.login(username);
                if (user.getPass() == null) {
                    error += "User does not exist";
                } else {
                    if (!PasswordHashing.checkPassword(pass, user.getPass())) {
                        error += "Please enter valid username or password";
                    }
                }
            }
            if (error.length() > 0) {
                request.setAttribute("error", error);

                rd = sc.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
            } else {

                // Call session
                HttpSession session = request.getSession();

                user = userDAO.login(username);

                session.setAttribute("user", user);
                session.setAttribute("cart", cart);

                if (remember != null) {
                    Cookie loginCookie = new Cookie("username", username);
                    //setting cookie to expiry in 30 mins
                    loginCookie.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(loginCookie);
                }
                
                response.sendRedirect("/store");
            }
        }
    }
}
