package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;
import Model.Category;
import Model.News_Category;


public class News_CategoryDAOImpl implements News_CategoryDAO {
	@Override
	public ArrayList<News_Category> getListParentNews_Category() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News_Category WHERE Parent_News='null'";
		ArrayList<News_Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				News_Category tintuc = new News_Category();
				tintuc.setID_News_Category(rs.getString("ID_News_Category"));
				tintuc.setName_News_Category(rs.getString("Name_News_Category"));
				tintuc.setParent_News(rs.getString("Parent_News"));
				arr.add(tintuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<News_Category> getListParentNews_Category1() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News_Category WHERE Parent_News='LT'";
		ArrayList<News_Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				News_Category tintuc = new News_Category();
				tintuc.setID_News_Category(rs.getString("ID_News_Category"));
				tintuc.setName_News_Category(rs.getString("Name_News_Category"));
				tintuc.setParent_News(rs.getString("Parent_News"));
				arr.add(tintuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<News_Category> getListSubNews_Category(String ID_News_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News_Category WHERE Parent_News='" + ID_News_Category + "'";
		ArrayList<News_Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				News_Category tintuc = new News_Category();
				tintuc.setID_News_Category(rs.getString("ID_News_Category"));
				tintuc.setName_News_Category(rs.getString("Name_News_Category"));
				tintuc.setParent_News(rs.getString("Parent_News"));
				arr.add(tintuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<News_Category> getList() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News_Category WHERE Parent_News='LT'";
		ArrayList<News_Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
			    News_Category danhMuc = new News_Category();
			     danhMuc.setID_News_Category(rs.getString("ID_News_Category"));
			     danhMuc.setName_News_Category(rs.getString("Name_News_Category"));
				 arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public News_Category getIdNews_Category(String ID_News_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News_Category WHERE ID_News_Category=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_News_Category);
			ResultSet rs = ps.executeQuery();
			News_Category news_category= new News_Category();
			while (rs.next()) {
				news_category.setID_News_Category(rs.getString("ID_News_Category"));
				news_category.setName_News_Category(rs.getString("Name_News_Category"));
				
				
			
				
			}
			return news_category;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public boolean checkNews_Category(String ID_News_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT ID_News_Category FROM News_Category WHERE ID_News_Category='" + ID_News_Category + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public News_Category getNews_Category(String ID_News_Category){
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News_Category WHERE ID_News_Category ='" + ID_News_Category + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			News_Category news_category = new News_Category();
			while (rs.next()) {
				
				news_category.setID_News_Category(rs.getString("ID_News_Category"));
				news_category.setName_News_Category(rs.getString("Name_News_Category"));
				
				
				
			}
			
				return news_category;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void insertNews_Category(News_Category cate) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO News_Category VALUES (?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, cate.getID_News_Category());
			ps.setString(2, cate.getName_News_Category());
			ps.setString(3, cate.getParent_News());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void updateNews_NameCategory(News_Category cate)  {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE News_Category SET  Name_News_Category=?  WHERE ID_News_Category=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			
			ps.setString(1, cate.getName_News_Category());
			ps.setString(2, cate.getID_News_Category());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}
	@Override
	public void deleteNews_Category(String ID_News_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE FROM News_Category WHERE ID_News_Category = ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_News_Category);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
