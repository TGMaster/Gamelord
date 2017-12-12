/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmiu.scse.mypractice.news;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author junnguyen
 */
public class NewsDAO {

    private MySqlConnectionManager sqlConnectionManager;
    

    public NewsDAO() {

        sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "datacenter", "root", "Phuvinh651997");

    }

    
    public ArrayList<NewsDTO> getAllnews() {

        ArrayList<NewsDTO> listOfnews = new ArrayList<NewsDTO>();

        String sqlStatement = "SELECT * FROM news";

        sqlConnectionManager.openConnection();

        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);

        try {
            while (rs.next()) {
                int id = rs.getInt("idnews");
                String title = rs.getString("titlenews");
                String content = rs.getString("contentnews");
                String date = rs.getString("datepost");
                String author = rs.getString("author");
                 String im = rs.getString("picture");
               NewsDTO news = new NewsDTO (id, title , content , date , author , im);
               listOfnews.add(news);

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsController.class.getName()).log(Level.SEVERE, null, ex);
        }

        sqlConnectionManager.closeConnection();

        return listOfnews;
    }
    
    public void addnews(int idnews, String title , String content , String date , String author , String image ) {

       
        if(image == null) image = "C:\test.jpg" ;
        
        
        
        String sqlStatement = "INSERT INTO news (idnews,titlenews,contentnews,datepost,author,picture) VALUES (" + idnews + ",'" + title+ "','"  + content + "','" + date + "','" + author 
             + "','"  + image   + "');";

        //System.out.println("SQL: " + sqlStatement );
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();

    }
}
