/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

import Category.*;
import News.*;
import User.*;
import java.io.*;
import java.security.SecureRandom;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import org.apache.commons.lang3.RandomStringUtils;
import static org.apache.commons.lang3.StringEscapeUtils.escapeHtml4;

/**
 *
 * @author TGMaster
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class StoreController extends HttpServlet {

    private static final String SAVE_DIRECTORY = "img";

    // Connect to database
    private final ProductDAO productDAO = new ProductDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final UserDAO userDAO = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Call session
        HttpSession session = request.getSession();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Get cart session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Get action
        String action = request.getParameter("action");

        int pages = 1, firstResult, maxResult, total;

        User u = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    u = userDAO.login(cookie.getValue());
                }
            }
        }
        
        if (session.getAttribute("user") != null) {
            u = (User) session.getAttribute("user");
        }

        // Index page
        if (action == null) {

            if (request.getParameter("pages") != null) {
                pages = (Integer) Integer.parseInt(request.getParameter("pages"));
            }

            total = productDAO.countProduct();

            if (total <= 6) {
                firstResult = 1;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 6;
                maxResult = 6;
            }

            List<Product> listOfProduct = productDAO.getAllProducts(firstResult, maxResult);

            session.setAttribute("listOfProduct", listOfProduct);
            rd = sc.getRequestDispatcher("/store.jsp");
            rd.forward(request, response);

        } else {

            switch (action) {

                // Add cart
                case "add": {
                    List<Product> listProduct = (ArrayList<Product>) session.getAttribute("listOfProduct");
                    int Pid = (Integer) Integer.parseInt(request.getParameter("productID"));
                    Product p = productDAO.getProduct(Pid);
                    if (cart.getCartItems().containsKey(Pid)) {
                        cart.addToCart(Pid, new Item(p,
                                cart.getCartItems().get(Pid).getQuantity()));
                    } else {
                        cart.addToCart(Pid, new Item(p, 1));
                    }
                    session.setAttribute("listOfProduct", listProduct);
                    session.setAttribute("cart", cart);
                    rd = sc.getRequestDispatcher("/store.jsp");
                    rd.forward(request, response);

                    break;
                }

                // Remove from cart
                case "remove": {
                    List<Product> listProduct = (ArrayList<Product>) session.getAttribute("listOfProduct");
                    int Pid = (Integer) Integer.parseInt(request.getParameter("productID"));
                    cart.removeFromCart(Pid);
                    if (cart.countItem() > 0) {
                        request.setAttribute("remove-modal", "");
                    }
                    session.setAttribute("listOfProduct", listProduct);
                    session.setAttribute("cart", cart);
                    rd = sc.getRequestDispatcher("/store.jsp");
                    rd.forward(request, response);

                    break;
                }

                // Search product
                case "search": {
                    int category = (Integer) Integer.parseInt(request.getParameter("category"));
                    String search = request.getParameter("searchProduct");

                    List<Product> searchList = productDAO.searchProduct(search, category);
                    session.setAttribute("listOfProduct", searchList);

                    rd = sc.getRequestDispatcher("/store.jsp");
                    rd.forward(request, response);

                    break;
                }

                // View product
                case "view":
                    int productID = 0;
                    if (!request.getParameter("productID").equals("")) {
                        productID = (Integer) Integer.parseInt(request.getParameter("productID"));
                    }
                    session.setAttribute("user", u);
                    session.setAttribute("cart", cart);
                    Product product = productDAO.getProduct(productID);
                    session.setAttribute("product", product);
                    rd = sc.getRequestDispatcher("/product.jsp");
                    rd.forward(request, response);

                    break;

                // Delete Product
                case "delete": {
                    int id = Integer.parseInt(request.getParameter("productID"));
                    productDAO.remove(id);
                    total = productDAO.countProduct();
                    if (total <= 6) {
                        firstResult = 1;
                        maxResult = total;
                    } else {
                        firstResult = (pages - 1) * 6;
                        maxResult = 6;
                    }
                    List<Product> listAll = productDAO.getAllProducts(firstResult, maxResult);
                    session.setAttribute("listOfProduct", listAll);
                    response.sendRedirect("/editProduct.jsp");

                    break;
                }

                // Add Product
                case "addproduct": {
                    // Get category ID
                    int category = Integer.parseInt(request.getParameter("category"));
                    // Input title and content with specialHTMLCharacter
                    String title = escapeHtml4(request.getParameter("name"));
                    title = NewsController.convertSup(title);
                    String content = escapeHtml4(request.getParameter("content"));
                    content = NewsController.convertSup(content);
                    double price = Double.parseDouble(request.getParameter("price"));
                    // Get Key
                    // Input image
                    Part part = request.getPart("image");
                    // ROOT directory
                    String appPath = request.getServletContext().getRealPath("");
                    appPath = appPath.replace('\\', '/');
                    // Place to store file.
                    String fullSavePath;
                    if (appPath.endsWith(File.separator)) {
                        fullSavePath = appPath + SAVE_DIRECTORY;
                    } else {
                        fullSavePath = appPath + File.separator + SAVE_DIRECTORY;
                    }       // Create folder if not exist.
                    File fileSaveDir = new File(fullSavePath);
                    if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdir();
                    }
                    String imagename = EditProfile.extractFileName(part);
                    if (imagename != null && imagename.length() > 0) {
                        String filePath = fullSavePath + File.separator + "products" + File.separator + imagename;
                        System.out.println("Write attachment to file: " + filePath);

                        // Store
                        part.write(filePath);
                    }       // Create Product key

                    String key = randomString() + "-" + randomString() + "-" + randomString();

                    // Create product
                    Product p = new Product();
                    p.setCid(category);
                    p.setContent(content);
                    p.setImage(imagename);
                    p.setName(title);
                    p.setPrice(price);
                    p.setKey(key);
                    // Add to database
                    productDAO.insert(p);
                    total = productDAO.countProduct();
                    if (total <= 6) {
                        firstResult = 1;
                        maxResult = total;
                    } else {
                        firstResult = (pages - 1) * 6;
                        maxResult = 6;
                    }
                    List<Product> listAll = productDAO.getAllProducts(firstResult, maxResult);
                    session.setAttribute("listOfProduct", listAll);
                    response.sendRedirect("/editProduct.jsp");
                    break;
                }
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

    private String randomString() {
        char[] possibleCharacters = ("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789").toCharArray();
        return RandomStringUtils.random(5, 0, possibleCharacters.length - 1, false, false, possibleCharacters, new SecureRandom());
    }

}
