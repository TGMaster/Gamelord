package News;

import Database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import java.util.logging.*;

public class NewsDAO {

    // Get All News
    public List<News> getAllNews() {
        List<News> listOfNews = new ArrayList<>();
        String query = "SELECT * FROM news ORDER BY `news_date` DESC";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                News news = new News();

                news.setId(rs.getInt("news_id"));
                news.setCid(rs.getInt("category_id"));
                news.setTitle(rs.getString("news_title"));
                news.setContent(rs.getString("news_content"));

                // Format Date
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date today = rs.getDate("news_date");
                news.setDate(sdf.format(today));
                news.setImage(rs.getString("news_image"));

                listOfNews.add(news);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listOfNews;
    }

    public News getNews(int newsID) {
        String query = "SELECT * FROM news WHERE news_id = ?";
        News news = new News();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, newsID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                news.setId(rs.getInt("news_id"));
                news.setCid(rs.getInt("category_id"));
                news.setTitle(rs.getString("news_title"));
                news.setImage(rs.getString("news_image"));
                news.setContent(rs.getString("news_content"));

                // Format Date
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date today = rs.getDate("news_date");
                news.setDate(sdf.format(today));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return news;
    }

    public void addNews(int categoryID, String title, String content, String date, String image) {

        String query = "INSERT INTO news "
                + "(category_id,news_title,news_content,news_date,news_image) VALUES "
                + "(?,?,?,STR_TO_DATE(?,'%Y-%m-%d'),'img/news/?.jpg')";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, categoryID);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, date);
            ps.setString(5, image);
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<News> searchNews(String name, int category_id) {
        List<News> listOfNews = new ArrayList<>();
        String query;

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps;

            // All fields are filled
            if (!name.equals("") && category_id > 0) {
                query = "SELECT * FROM news WHERE news_title LIKE ? "
                        + "AND category_id = ?";
                ps = connection.prepareCall(query);
                ps.setString(1, "%" + name + "%");
                ps.setInt(2, category_id);

            } else if (category_id == 0 && name.equals("")) {
                query = "SELECT * FROM news";
                ps = connection.prepareCall(query);
                
            } else {    // 1 of them is empty
                if (name.equals("")) {
                    query = "SELECT * FROM news WHERE category_id = ?";
                    ps = connection.prepareCall(query);
                    ps.setInt(1, category_id);

                } else {
                    query = "SELECT * FROM news WHERE news_title LIKE ?;";
                    ps = connection.prepareCall(query);
                    ps.setString(1, "%" + name + "%");

                }
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                News news = new News();

                news.setId(rs.getInt("news_id"));
                news.setCid(rs.getInt("category_id"));
                news.setTitle(rs.getString("news_title"));
                news.setContent(rs.getString("news_content"));

                // Format Date
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date today = rs.getDate("news_date");
                news.setDate(sdf.format(today));

                news.setImage(rs.getString("news_image"));

                listOfNews.add(news);
            }
            
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listOfNews;
    }

    public void removeNews(int id) {
        String query = "DELETE FROM news WHERE news_id = ?";

        // Connect to database
        Connection connection = Database.getConnection();
        
        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
