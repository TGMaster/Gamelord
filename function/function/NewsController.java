package function;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
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

        NewsDAO connector = new NewsDAO();

        ArrayList<NewsDTO> ln = connector.getAllNews();

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Call session
        HttpSession session = request.getSession();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Get action
        String action = request.getParameter("action");
        
        // Show news page
        if (null == action) { 
            rd = sc.getRequestDispatcher("/news.jsp");
            rd.forward(request, response);
        } 
        else switch (action) {
            
            case "details": // Read more function
                String idd = request.getParameter("viewnews");
                int id = Integer.parseInt(idd);
                NewsDTO news = ln.get(id);
                session.setAttribute("news", news);
                rd = sc.getRequestDispatcher("/newsdetail.jsp");
                rd.forward(request, response);
                break;
                
            case "addnews": // Add news function
                // Input title and content with replace superscript
                String tit = request.getParameter("tit");
                String title = convertSup(tit);
                String con = request.getParameter("con");
                String content = convertSup(con);
                // Format Date
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date today = new Date();
                String date = sdf.format(today);
                // Input image
                String im = request.getParameter("image");
                // Add to database
                connector.addNews(title, content, date, im);
                response.sendRedirect("/news");
                break;
        }

    }

    private String convertSup(String word) {
        StringBuilder sb = new StringBuilder();
        
        char[] charArray = word.toLowerCase().toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            // Single character case
            switch (charArray[i]) {
                // Apostrophe
                case '\'':
                    sb.append("\\\'");
                    break;
                // Trademark
                case '™':
                    sb.append("&trade;");
                    break;
                // Register
                case '®':
                    sb.append("&reg;");
                    break;
                // Copyright
                case '©':
                    sb.append("&copy;");
                    break;
                default:
                    sb.append(word.charAt(i));
                    break;
            }
        }
        return sb.toString();
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
