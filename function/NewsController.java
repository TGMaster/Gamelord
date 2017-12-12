package vn.edu.hcmiu.scse.mypractice.news;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.edu.hcmiu.scse.mypractice.news.NewsDAO;
import vn.edu.hcmiu.scse.mypractice.news.NewsDTO;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/NewsServlet"})
public class NewsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        NewsDAO databaseService = new NewsDAO();

        ArrayList<NewsDTO> ln = databaseService.getAllnews();

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Call session
        HttpSession session = request.getSession();

        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        session.setAttribute("ln", ln);
        if (action == null) {
            rd = sc.getRequestDispatcher("/news.jsp");
            rd.forward(request, response);
        } else if (action.equals("readmore")) {
            String idd = request.getParameter("gotonews");
            int id = Integer.parseInt(idd);
            NewsDTO news = ln.get(id);
            session.setAttribute("news", news);
            rd = sc.getRequestDispatcher("/newsdetail.jsp");
            rd.forward(request, response);
        } else {
            String idd = request.getParameter("id");
            int id = Integer.parseInt(idd);
            String tit = request.getParameter("tit");
            String con = request.getParameter("con");
            String date = request.getParameter("date");
            String au = request.getParameter("au");
            String im = request.getParameter("image");
            databaseService.addnews(id, tit, con, date, au, im);
            rd = sc.getRequestDispatcher("/managersite.jsp");
            rd.forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
