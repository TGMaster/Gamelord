/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Database.PasswordHashing;
import java.io.File;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditProfile extends HttpServlet {

    private static final String SAVE_DIRECTORY = "img";

    // Connect to Database
    private static final UserDAO userDAO = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        // Do GET
        if (action == null) {
            rd = sc.getRequestDispatcher("/profile.jsp");
            rd.forward(request, response);
        } // Do POST
        else {
            if (action.equals("edit")) {

                // Call Session
                HttpSession session = request.getSession();

                String error = "";

                String username = request.getParameter("username");
                String oldpass = request.getParameter("oldpass");
                String newpass = request.getParameter("newpass");
                String newpass2 = request.getParameter("newpass2");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String dob = request.getParameter("dob");
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
                }

                // Create folder if not exist.
                File fileSaveDir = new File(fullSavePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }

                String imagename = extractFileName(part);
                if (imagename != null && imagename.length() > 0) {
                    String filePath = fullSavePath + File.separator + "user" + File.separator + imagename;
                    System.out.println("Write attachment to file: " + filePath);

                    // Store
                    part.write(filePath);
                }

                if (oldpass.equals("") || email.equals("") || address.equals("")) {
                    error += "Please fill out all required fields";
                } else if (!newpass.equals("")) {
                    if (!newpass.equals(newpass2)) {
                        error += "Your password and confirmation password do not match";
                    }
                } else {
                    User user = userDAO.login(username);
                    if (user.getPass() == null) {
                    } else if (!PasswordHashing.checkPassword(oldpass, user.getPass())) {
                        error += "You have entered wrong password";
                    }
                }

                System.out.println("ERROR: " + error);

                if (error.length() > 0) {
                    request.setAttribute("error", error);

                    rd = sc.getRequestDispatcher("/profile.jsp");
                    rd.forward(request, response);

                } else {
                    User u = userDAO.login(username);

                    String password = oldpass;
                    String img = u.getImage();
                    if (!newpass.equals("")) {
                        password = newpass;
                    }

                    if (imagename != null && imagename.length() > 0) {
                        img = imagename;
                    }

                    User new_user = new User(u.getID(), email, username, PasswordHashing.hashPassword(password), dob, address, img, u.isAdmin());

                    // Update Database
                    userDAO.updateUser(new_user);

                    // Destroy session
                    session.removeAttribute("user");
                    // Add new one
                    session.setAttribute("user", new_user);

                    response.sendRedirect("/edit");
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

    public static String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
}
