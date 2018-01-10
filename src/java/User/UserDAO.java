package User;

import Database.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.logging.*;

public class UserDAO {

    // Check existing username
    public boolean validateUser(String username) {

        String query = "SELECT * FROM users WHERE user_name = ?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insert account
    public boolean insertUser(User user) {

        String query = "INSERT INTO users (user_name, user_pass, user_email, user_dob, user_address, user_image, user_admin) VALUES "
                + "(?, ?, ?, STR_TO_DATE(?,'%d-%m-%Y'), ?, ?, ?)";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPass());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getDOB());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getImage());
            ps.setBoolean(7, user.isAdmin());
            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    // Check login
    public User login(String name) {
        User u = new User();

        String query = "SELECT * FROM users WHERE user_name = ?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u.setID(rs.getInt("user_id"));
                u.setEmail(rs.getString("user_email"));
                u.setName(rs.getString("user_name"));
                u.setPass(rs.getString("user_pass"));
                u.setAddress(rs.getString("user_address"));
                u.setImage(rs.getString("user_image"));

                // Format Date
                if (rs.getDate("user_DOB") != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    java.util.Date bday = rs.getDate("user_DOB");
                    u.setDOB(sdf.format(bday));
                }
                u.setAdmin(rs.getBoolean("user_admin"));
            }

            connection.close();
            return u;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateUser(User u) {
        String query = "UPDATE users SET user_name=?, user_pass=?, user_email=?, user_dob=STR_TO_DATE(?,'%d/%m/%Y'), user_address=?, user_image=? WHERE user_name=?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getPass());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getDOB());
            ps.setString(5, u.getAddress());
            ps.setString(6, u.getImage());
            ps.setString(7, u.getName());
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
