/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *
 * @author Inspiron
 */
public class XuLyDB {
     private Connection con;
 
    public XuLyDB(){
        try {
            Connection connection =DBConnect.getConnection();;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    public SanPham getSanPham(String ms){
        SanPham sp=null;
 
        try {
            Statement stmt=con.createStatement();
            String sql="select * from sanpham where mssp='"+ms+"'";
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()){
                String mssp=rs.getString("mssp");
                String ten=rs.getString("tenSP");
                double dg=rs.getDouble("dongia");
                sp=new SanPham(mssp,ten,dg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sp;
    }
 
    public ResultSet getAllProducts(){
        ResultSet rs=null;
        try {
            Statement stmt=con.createStatement();
            String sql="select * from sanpham";
            rs=stmt.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}
