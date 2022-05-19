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
import Model.Category;
import Model.Product;
import Model.About;
import Model.Season;
import Model.Statistic;

public class AboutDAOImpl implements AboutDAO {

	
	
	// Hien thi thong tin chi tiet san pham
	@Override
	public About getDetailAbout(String ID_About) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM About WHERE ID_About='" + ID_About + "'";
		About ab = new About();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ab.setID_About(rs.getString("ID_About"));	
				ab.setImage_About(rs.getString("Image_About"));
				ab.setContent_About(rs.getString("Content_About"));
				ab.setEmail(rs.getString("Email"));
				ab.setAddress(rs.getString("Address"));
				ab.setPhone(rs.getInt("Phone"));
				
			}
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
			ex.printStackTrace();
		}
		return ab;
	}

	// Lay danh sach san pham theo List
	@Override
	public ArrayList<About> getList() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM About";
		ArrayList<About> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
            About ab = new About();
				ab.setID_About(rs.getString("ID_About"));	
				ab.setImage_About(rs.getString("Image_About"));
				ab.setContent_About(rs.getString("Content_About"));
				ab.setEmail(rs.getString("Email"));
				ab.setAddress(rs.getString("Address"));
				ab.setPhone(rs.getInt("Phone"));
				arr.add(ab);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<About> getListByPage(ArrayList<About> arr, int start, int end) {
		ArrayList<About> list = new ArrayList<>();
		for (int i = start; i < end; i++) {
			list.add(arr.get(i));
		}
		return list;
	}
	@Override
	public About getAbout(String ID_About) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM About WHERE ID_About =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_About);
			ResultSet rs = ps.executeQuery();
			About pr = new About();
			while (rs.next()) {
				pr.setID_About(rs.getString("ID_About"));
				pr.setImage_About(rs.getString("Image_About"));
				pr.setContent_About(rs.getString("Content_About"));
				pr.setEmail(rs.getString("Email"));
				pr.setAddress(rs.getString("Address"));
				pr.setPhone(rs.getInt("Phone"));
			}
			return pr;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public void insertAbout(About ab) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO About VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ab.getID_About());
			ps.setString(2, ab.getImage_About());
			ps.setString(3, ab.getContent_About());
			ps.setString(4, ab.getEmail());
			ps.setString(5, ab.getAddress());
			ps.setInt(6, ab.getPhone());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateAbout(About ab)  {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE About SET  Image_About=?, Content_About=?, Email=?, Address=?, Phone=? WHERE ID_About=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ab.getImage_About());
			ps.setString(2, ab.getContent_About());
			ps.setString(3, ab.getEmail());
			ps.setString(4, ab.getAddress());
			ps.setInt(5, ab.getPhone());
			ps.setString(6, ab.getID_About());
			ps.executeUpdate();
			ketNoi.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}

	@Override
	public void deleteAbout(String ID_About) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE About FROM About WHERE ID_About= ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_About);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

		@Override
		public boolean checkIdAbout(String ID_About) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT ID_About FROM About WHERE ID_About ='" + ID_About + "'";
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
