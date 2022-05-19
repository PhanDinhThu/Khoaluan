package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.eclipse.jdt.internal.compiler.lookup.ImplicitNullAnnotationVerifier;

import Connection.DBConnection;
import Model.Account;
import Model.News_Category;

import Model.News;
import Model.Season;
import Model.Statistic;

public class NewsDAOImpl implements NewsDAO {

	// Lay danh sach dua theo ma danh muc
	@Override
	public ArrayList<News> getListNewsByCategory(String ID_News_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News WHERE ID_News_Category='" + ID_News_Category + "'";
		ArrayList<News> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				News tt = new News();
				tt.setID_News(rs.getString("ID_News"));
				News_Category danhMuc = new News_Category(rs.getString("ID_News_Category"), "", "");
				tt.setDanh_Muc_News(danhMuc);
				tt.setName_News(rs.getString("Name_News"));
				tt.setImage_News(rs.getString("Image_News"));
				tt.setPosting_Date(rs.getString("Posting_Date"));
				tt.setDescribe_News(rs.getString("Describe_News"));
				tt.setDetail_News(rs.getString("Detail_News"));
				arr.add(tt);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	
	
	// Hien thi thong tin chi tiet
	@Override
	public News getDetailNews(String ID_News) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News WHERE ID_News='" + ID_News + "'";
		News tt = new News();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				News_Category danhMuc = new News_Category(rs.getString("ID_News_Category"), "", "");
				tt.setID_News(rs.getString("ID_News"));
				tt.setDanh_Muc_News(danhMuc);
				tt.setName_News(rs.getString("Name_News"));
				tt.setImage_News(rs.getString("Image_News"));
				tt.setPosting_Date(rs.getString("Posting_Date"));
				tt.setDescribe_News(rs.getString("Describe_News"));
				tt.setDetail_News(rs.getString("Detail_News"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
			ex.printStackTrace();
		}
		return tt;
	}

	// Lay danh sach theo List
	@Override
	public ArrayList<News> getList() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News ";
		ArrayList<News> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				News tt = new News();
				tt.setID_News(rs.getString("ID_News"));
				News_Category danhMuc = new News_Category(rs.getString("ID_News_Category"), "", "");
				tt.setDanh_Muc_News(danhMuc);
				tt.setName_News(rs.getString("Name_News"));
				tt.setImage_News(rs.getString("Image_News"));
				tt.setPosting_Date(rs.getString("Posting_Date"));
				tt.setDescribe_News(rs.getString("Describe_News"));				
				tt.setDetail_News(rs.getString("Detail_News"));
	
				arr.add(tt);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	
		@Override
		public ArrayList<News> getListByPage(ArrayList<News> arr, int start, int end) {
			ArrayList<News> list = new ArrayList<>();
			for (int i = start; i < end; i++) {
				list.add(arr.get(i));
			}
			return list;
		}
		
	@Override
	public News getNews(String ID_News) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM News WHERE ID_News =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_News);
			ResultSet rs = ps.executeQuery();
			News pr = new News();
			while (rs.next()) {
				pr.setID_News(rs.getString("ID_News"));
				pr.setName_News(rs.getString("Name_News"));
			}
			return pr;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	 public void insertNews(News news) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO News VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, news.getID_News());
			ps.setString(2, news.getDanh_Muc_News().getID_News_Category()); 
			ps.setString(3, news.getName_News());
			ps.setString(4, news.getImage_News());
			ps.setString(5, news.getPosting_Date());
			ps.setString(6, news.getDescribe_News());
			ps.setString(7, news.getDetail_News());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateNews(News news)  {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE News SET ID_News_Category=?, Name_News=?, Image_News=?, Describe_News=?, Detail_News=? WHERE ID_News=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, news.getDanh_Muc_News().getID_News_Category()); 
			ps.setString(2, news.getName_News());
			ps.setString(3, news.getImage_News());
			ps.setString(4, news.getDescribe_News());
			ps.setString(5, news.getDetail_News());
			ps.setString(6, news.getID_News());
			ps.executeUpdate();
			ketNoi.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}

	@Override
	public void deleteNews(String ID_News) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE News FROM News WHERE ID_News= ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_News);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
		@Override
		public boolean checkIdNews(String ID_News) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT ID_News FROM News WHERE ID_News ='" + ID_News + "'";
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
}
