/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Billing;

import Database.Database;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

/**
 *
 * @author TGMaster
 */
public class BillDAO {

    public void insert(Bill b) {

        Connection connection = Database.getConnection();

        String query = "INSERT INTO bill (user_id,bill_date,bill_total,bill_payment,bill_address,bill_id) VALUES (?,?,?,?,?,?)";

        PreparedStatement ps;

        try {
            ps = (PreparedStatement) connection.prepareStatement(query);
            ps.setInt(1, b.getUid());
            ps.setString(2, b.getDate());
            ps.setDouble(3, b.getTotal());
            ps.setString(4, b.getPayment());
            ps.setString(5, b.getAddress());
            ps.setLong(6, b.getId());

            ps.executeUpdate();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Bill> getList() {

        Connection connection = Database.getConnection();

        String query = "SELECT * FROM bill";

        List<Bill> list = new ArrayList<>();

        try {
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Bill bill = new Bill();

                bill.setId(rs.getInt("bill_id"));
                bill.setUid(rs.getInt("user_id"));
                bill.setDate(rs.getString("bill_date"));
                bill.setTotal(rs.getDouble("bill_total"));
                bill.setPayment(rs.getString("bill_payment"));
                bill.setAddress(rs.getString("bill_address"));

                list.add(bill);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
}
