package News;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import static org.apache.commons.lang3.StringEscapeUtils.escapeHtml4;

public class NewsController extends HttpServlet {

    private static final NewsDAO newsDAO = new NewsDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Call session
        HttpSession session = request.getSession();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Get action
        String action = request.getParameter("action");

        // Show news page
        if (action == null) {
            List<News> listOfNews = newsDAO.getAllNews();
            session.setAttribute("ln", listOfNews);
            rd = sc.getRequestDispatcher("/news.jsp");
            rd.forward(request, response);
        } else {

            if (action.equals("details")) { // Read more function
                News news = new News();
                if (request.getParameter("viewnews") != null) {
                    int id = Integer.parseInt(request.getParameter("viewnews"));
                    news = newsDAO.getNews(id);
                }
                
                session.setAttribute("news", news);
                rd = sc.getRequestDispatcher("/newsdetail.jsp");
                rd.forward(request, response);
            } else if (action.equals("addnews")) {// Add news function
                // Get category ID
                int category = Integer.parseInt(request.getParameter("category"));

                // Input title and content with specialHTMLCharacter
                String title = escapeHtml4(request.getParameter("tit"));
                title = convertSup(title);
                String content = escapeHtml4(request.getParameter("con"));
                content = convertSup(content);

                // Format Date
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date today = new Date();
                String date = sdf.format(today);

                // Input image
                String im = escapeHtml4(request.getParameter("image"));
                im = convertSup(im);

                // Add to database
                newsDAO.addNews(category, title, content, date, im);
                List<News> ln = newsDAO.getAllNews();
                session.setAttribute("ln", ln);
                response.sendRedirect("/managersite.jsp");

                //Search news
            } else if (action.equals("search")) {
                int category = (Integer) Integer.parseInt(request.getParameter("category"));
                String search = escapeHtml4(request.getParameter("searchNews"));

                List<News> searchList = newsDAO.searchNews(search, category);
                session.setAttribute("ln", searchList);

                rd = sc.getRequestDispatcher("/news.jsp");
                rd.forward(request, response);

                // Remove news function
            } else if (action.equals("remove")) {
                int id = (Integer) Integer.parseInt(request.getParameter("remove"));
                newsDAO.removeNews(id);

                List<News> listAll = newsDAO.getAllNews();
                session.setAttribute("ln", listAll);

                response.sendRedirect("/managersite.jsp");
            }
        }

    }

    public static String convertSup(String word) {
        StringBuilder sb = new StringBuilder();

        char[] charArray = word.toLowerCase().toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            // Single character case
            switch (charArray[i]) {
                // New line
                case '\n':
                    sb.append("<br>");
                    break;
                // Trademark
                case '\u2122':
                    sb.append("&trade;");
                    break;
                // Register
                case '\u00AE':
                    sb.append("&reg;");
                    break;
                // Copyright
                case '\u00a9':
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
