package function;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

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

        NewsDAO connector = new NewsDAO();

        ArrayList<NewsDTO> ln = connector.getAllNews();

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
        } else if (action.equals("addnews")) {
            
            String tit = request.getParameter("tit");
            String title = tit.replace("\'", "\\\'");
            String con = request.getParameter("con");
            String content = con.replace("\'", "\\\'");

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Date today = new Date();
            String date = sdf.format(today);

            String im = request.getParameter("image");
            connector.addNews(title, content, date, im);
            response.sendRedirect("/news");
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
