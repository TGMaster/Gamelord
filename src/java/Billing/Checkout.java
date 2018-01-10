/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Billing;

import Product.*;
import User.*;
import Mail.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Checkout extends HttpServlet {

    private static final String service = "service.gamelord@gmail.com";
    private static final String mailserver = "smtp.gmail.com";
    private static final String subject = "[GAMELORD] Confirmation for your order";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Call session
        HttpSession session = request.getSession();

        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        if (action == null) {

            rd = sc.getRequestDispatcher("/checkout.jsp");
            rd.forward(request, response);

        } else {
            String message = "";
            String error = "";
            
            // Set time
            Calendar calendar = Calendar.getInstance();
            java.sql.Timestamp date = new java.sql.Timestamp(calendar.getTime().getTime());

            // Cart
            ProductDAO productDAO = new ProductDAO();
            Cart cart = (Cart) session.getAttribute("cart");

            // User
            User u = (User) session.getAttribute("user");
            String payment = request.getParameter("payment");
            String username = request.getParameter("username");

            // Email time
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy 'at' hh:mm:ss a");

            // Bill
            BillDAO billDAO = new BillDAO();
            BillDetailDAO bdDAO = new BillDetailDAO();
            Bill b = new Bill();
            b.setId(dNow.getTime());
            b.setUid(u.getID());
            b.setDate(date);
            b.setPayment(payment);
            b.setAddress(u.getAddress());
            b.setTotal(cart.totalCart());
            billDAO.insert(b);

            // Send email
            String text = "<p><strong>Purchase Detail</strong></p>"
                    + "<p>Purchase Date: <i>" + ft.format(dNow) + "</i></p>"
                    + "<p>Customer Name: <strong>" + username + "</strong></p>"
                    + "<p>Payment Method: <i>" + payment + "</i></p>"
                    + "<p>Items: </p><ul>";

            for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
                Product p = list.getValue().getProduct();
                bdDAO.insert(new BillDetail(0, dNow.getTime(), p.getPid(), p.getPrice(), list.getValue().getQuantity()));
                text += "<li>" + p.getName() + ": £" + p.getPrice() + " - Key: <strong>" + p.getKey() + "</strong></li>";
            }

            text += "</ul><p>Total: <strong>£" + cart.totalCart() + "</strong></p>"
                    + "<p>Sold by: <strong>GameLord Company</strong></p>";

            // Mail
            Mail mail = new Mail(u.getEmail(), service, text, subject, mailserver);
            MailController sm = new MailController();
            if (sm.sendMail(mail)) {
                message = "Thanks for your purchasing";
                cart = new Cart();
                session.setAttribute("cart", cart);
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
