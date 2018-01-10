package Product;

import Database.Database;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {

    // Insert Product
    public void insert(Product p) {
        // Connect to database
        Connection connection = Database.getConnection();

        String query = "INSERT INTO product(category_id,product_name,product_image,product_price,product_content,product_key) VALUES (?,?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareCall(query);

            ps.setInt(1, p.getCid());
            ps.setString(2, p.getName());
            ps.setString(3, p.getImage());
            ps.setDouble(4, p.getPrice());
            ps.setString(5, p.getContent());
            ps.setString(6, p.getKey());

            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Remove Product
    public void remove(int id) {
        // Connect to database
        Connection connection = Database.getConnection();

        String query = "DELETE FROM product WHERE product_id = ?";

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Get All Products
    public List<Product> getAllProducts(int firstResult, int maxResult) {
        List<Product> listOfProduct = new ArrayList<>();

        String query;
        if (firstResult == 0 && maxResult == 0) {
            query = "SELECT * FROM product";
        } else {
            query = "SELECT * FROM product LIMIT ?,?";
        }

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, firstResult);
            ps.setInt(2, maxResult);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setPid(rs.getInt("product_id"));
                product.setCid(rs.getInt("category_id"));
                product.setName(rs.getString("product_name"));
                product.setImage(rs.getString("product_image"));
                product.setPrice(rs.getDouble("product_price"));
                product.setContent(rs.getString("product_content"));
                product.setKey(rs.getString("product_key"));

                listOfProduct.add(product);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOfProduct;
    }

// Get Product based on ID
    public Product getProduct(int productID) {
        String query = "SELECT * FROM product WHERE product_id = ?";
        Product product = new Product();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                product.setPid(rs.getInt("product_id"));
                product.setCid(rs.getInt("category_id"));
                product.setName(rs.getString("product_name"));
                product.setImage(rs.getString("product_image"));
                product.setPrice(rs.getDouble("product_price"));
                product.setContent(rs.getString("product_content"));
                product.setKey(rs.getString("product_key"));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    // Search
    public List<Product> searchProduct(String productName, int category_id) {
        String query;
        List<Product> list = new ArrayList<>();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps;
            if (!productName.equals("") && category_id != 0) {
                query = "SELECT * FROM product WHERE product_name LIKE ? "
                        + "AND category_id = ?";
                ps = connection.prepareCall(query);
                ps.setString(1, "%" + productName + "%");
                ps.setInt(2, category_id);

            } else {
                if (productName.equals("")) {
                    query = "SELECT * FROM product WHERE category_id = ?";
                    ps = connection.prepareCall(query);
                    ps.setInt(1, category_id);
                } else {
                    query = "SELECT * FROM product WHERE product_name LIKE ?";
                    ps = connection.prepareCall(query);
                    ps.setString(1, "%" + productName + "%");
                }
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setPid(rs.getInt("product_id"));
                product.setCid(rs.getInt("category_id"));
                product.setName(rs.getString("product_name"));
                product.setImage(rs.getString("product_image"));
                product.setPrice(rs.getDouble("product_price"));
                product.setContent(rs.getString("product_content"));
                product.setKey(rs.getString("product_key"));

                list.add(product);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int countProduct() {
        String query = "SELECT count(product_id) FROM product";
        int count = 0;

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
