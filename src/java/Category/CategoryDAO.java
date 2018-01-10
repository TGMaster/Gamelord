package Category;

import Database.Database;
import java.sql.*;
import java.util.logging.*;
import java.util.*;

public class CategoryDAO {

    // Get Category
    public List<Category> getCategory() {
        List<Category> listOfCat = new ArrayList<>();
        String query = "SELECT * FROM category";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("category_name");

                Category category = new Category(id, name);
                listOfCat.add(category);
            }
            
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOfCat;
    }

    // Total Product
    public int countProductByCategory(int categoryID) {
        String query = "SELECT count(product_id) FROM product WHERE category_id = ?";
        int count = 0;

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    // Get name of category
    public String getName(int category_id) {
        String categoryName = null;
        String query = "SELECT * FROM category WHERE category_id = ?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, category_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                categoryName = rs.getString("category_name");
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return categoryName;
    }
}
