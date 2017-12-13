package function;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class NewsDAO {

    private final Database connector;

    public NewsDAO() {
        connector = new Database(
                "localhost", "3306", "gaming", "root", "");
    }
    
    public ArrayList<NewsDTO> getNews(int n) {
        ArrayList<NewsDTO> listOfNews = new ArrayList<NewsDTO>();
        
        String query = "SELECT * FROM news LIMIT " + n;
        
        connector.openConnection();
        
        ResultSet rs = connector.ExecuteQuery(query);
        
        try {
            
            while (rs.next()) {
                int id = rs.getInt("news_id");
                String title = rs.getString("news_title");
                String content = rs.getString("news_content");
                String date = rs.getString("news_date");
                String image = rs.getString("news_image");
                
                NewsDTO news = new NewsDTO(id, title, content, date, image);
                listOfNews.add(news);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(NewsDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  listOfNews;
    }
    
    public ArrayList<NewsDTO> getAllNews() {
        ArrayList<NewsDTO> listOfNews = new ArrayList<NewsDTO>();
        
        String query = "SELECT * FROM news";
        
        connector.openConnection();
        
        ResultSet rs = connector.ExecuteQuery(query);
        
        try {
            
            while (rs.next()) {
                int id = rs.getInt("news_id");
                String title = rs.getString("news_title");
                String content = rs.getString("news_content");
                String date = rs.getString("news_date");
                String image = rs.getString("news_image");
                
                NewsDTO news = new NewsDTO(id, title, content, date, image);
                listOfNews.add(news);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(NewsDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  listOfNews;
    }
    
    
    public void addNews(String title , String content , String date , String image ) {
        
        String sqlStatement = "INSERT INTO news (news_title,news_content,news_date,news_image) VALUES ('" + title + "','"  + content + "','" + date + "','" + image + "');";

        System.out.println("SQL: " + sqlStatement );
        connector.openConnection();
        connector.ExecuteUpdate(sqlStatement);
        connector.closeConnection();

    }
    
}
