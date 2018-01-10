/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class ValidateUser extends HttpServlet {

    // Connect to database
    private final UserDAO userDAO = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (userDAO.validateUser(request.getParameter("username"))) {
            response.getWriter().write("<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\" style=\"color: red\"> Username has already been taken</i>");
        } else {
            response.getWriter().write("<i class=\"fa fa-check-circle-o\" aria-hidden=\"true\" style=\"color: green\"> Username is available</i>");
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
