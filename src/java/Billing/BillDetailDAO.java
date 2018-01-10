/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Billing;

import java.sql.*;
import Database.Database;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TGMaster
 */
public class BillDetailDAO {

    public void insert(BillDetail b) {

        // Connect to Database
        Connection connection = Database.getConnection();

        String query = "INSERT INTO billdetail (bd_id,bill_id, product_id, bd_price, bd_quantity) VALUES(?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareCall(query);

            ps.setInt(1, b.getID());
            ps.setLong(2, b.getBid());
            ps.setInt(3, b.getPid());
            ps.setDouble(4, b.getPrice());
            ps.setInt(5, b.getQuantity());
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public BillDetail getBill(int bID) {
        BillDetail bd = new BillDetail();
        // Connect to Database
        Connection connection = Database.getConnection();
        
        String query = "SELECT * FROM billdetail WHERE bill_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, bID);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bd.setID(rs.getInt("bd_id"));
                bd.setBid(rs.getLong("bill_id"));
                bd.setPid(rs.getInt("product_id"));
                bd.setPrice(rs.getDouble("bd_price"));
                bd.setQuantity(rs.getInt("bd_quantity"));
            }
            
            connection.close();
            return bd;
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
