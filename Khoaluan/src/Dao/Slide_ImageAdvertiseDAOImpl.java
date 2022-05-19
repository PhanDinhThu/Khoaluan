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



import Connection.DBConnection;

import Model.Slide_ImageAdvertise;


public class Slide_ImageAdvertiseDAOImpl implements Slide_ImageAdvertiseDAO {



	
	// Hien thi thong tin chi tiet
	@Override
	public Slide_ImageAdvertise getDetailAdvertise(String ID_Advertise) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Image_Advertises WHERE ID_Advertise='" + ID_Advertise + "'";
		Slide_ImageAdvertise ad = new Slide_ImageAdvertise();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {		
				ad.setID_Advertise(rs.getInt("ID_Advertise"));
				ad.setImage_Advertise1(rs.getString("Image_Advertise1"));
				ad.setImage_Advertise2(rs.getString("Image_Advertise2"));
				ad.setImage_Advertise3(rs.getString("Image_Advertise3"));
				ad.setImage_Advertise4(rs.getString("Image_Advertise4"));
				ad.setImage_Advertise5(rs.getString("Image_Advertise5"));
				
				
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return ad;
	}

	// Lay danh sach san pham theo List
	@Override
	public ArrayList<Slide_ImageAdvertise> getList() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Image_Advertises ";
		ArrayList<Slide_ImageAdvertise> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Slide_ImageAdvertise ad = new Slide_ImageAdvertise();
				ad.setID_Advertise(rs.getInt("ID_Advertise"));
				ad.setImage_Advertise1(rs.getString("Image_Advertise1"));
				ad.setImage_Advertise2(rs.getString("Image_Advertise2"));
				ad.setImage_Advertise3(rs.getString("Image_Advertise3"));
				ad.setImage_Advertise3(rs.getString("Image_Advertise3"));
				ad.setImage_Advertise4(rs.getString("Image_Advertise4"));
				ad.setImage_Advertise5(rs.getString("Image_Advertise5"));
				arr.add(ad);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	
	

	@Override
	public void updateAdvertise(Slide_ImageAdvertise ad)  {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Image_Advertises SET  Image_Advertise1=?,Image_Advertise2=?,Image_Advertise3=?,Image_Advertise3=?, Image_Advertise3=?, Image_Advertise3=?"
				+ " WHERE ID_Advertise=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ad.getImage_Advertise1());  
			ps.setString(2, ad.getImage_Advertise2());
			ps.setString(3, ad.getImage_Advertise3());
			ps.setString(4, ad.getImage_Advertise4());  
			ps.setString(5, ad.getImage_Advertise5());	
			ps.setInt(6, ad.getID_Advertise());
			ps.executeUpdate();
			ketNoi.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}

	@Override
	public Slide_ImageAdvertise getAdvertise(String ID_Advertise) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkIdAdvertise(String ID_Advertise) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT ID_Advertises FROM Image_Advertise WHERE ID_Advertise ='" + ID_Advertise + "'";
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
