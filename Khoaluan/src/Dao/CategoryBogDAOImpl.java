package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;

import Model.CategoryBog;



public class CategoryBogDAOImpl implements CategoryBogDAO {

	@Override
	public ArrayList<CategoryBog> getListParentCategoryBog() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM CategoryBogs WHERE Parent_Category_Bog='null'";
		ArrayList<CategoryBog> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryBog danhMuc = new CategoryBog();
				danhMuc.setID_Category_Bog(rs.getString("ID_Category_Bog"));
				danhMuc.setName_Category_Bog(rs.getString("Name_Category_Bog"));
				danhMuc.setParent_Category_Bog(rs.getString("Parent_Category_Bog"));
				arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<CategoryBog> getListSubCategoryBog(String ID_Category_Bog) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM CategoryBogs WHERE Parent_Category_Bog='" + ID_Category_Bog + "'";
		ArrayList<CategoryBog> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryBog danhMuc = new CategoryBog();
				danhMuc.setID_Category_Bog(rs.getString("ID_Category_Bog"));
				danhMuc.setName_Category_Bog(rs.getString("Name_Category_Bog"));
				danhMuc.setParent_Category_Bog(rs.getString("Parent_Category_Bog"));
				arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<CategoryBog> getList() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM CategoryBogs WHERE Parent_Category_Bog='TT001'";
		ArrayList<CategoryBog> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
			    CategoryBog danhMuc = new CategoryBog();
			     danhMuc.setID_Category_Bog(rs.getString("ID_Category_Bog"));
			     danhMuc.setName_Category_Bog(rs.getString("Name_Category_Bog"));
				 arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public CategoryBog getIdCategoryBog(String ID_Category_Bog) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM CategoryBogs WHERE ID_Category_Bog =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Category_Bog);
			ResultSet rs = ps.executeQuery();
			CategoryBog cate= new CategoryBog();
			while (rs.next()) {
				cate.setID_Category_Bog(rs.getString("ID_Category_Bog"));
				cate.setName_Category_Bog(rs.getString("Name_Category_Bog"));
				
				
			
				
			}
			return cate;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean checkCategoryBog(String ID_Category_Bog) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT ID_Category_Bog FROM CategoryBogs WHERE ID_Category_Bog='" + ID_Category_Bog + "'";
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
	public void insertCategoryBog(CategoryBog cate) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO CategoryBogs VALUES (?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, cate.getID_Category_Bog());
			ps.setString(2, cate.getName_Category_Bog());
			ps.setString(3, cate.getParent_Category_Bog());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public CategoryBog getCategoryBog(String ID_Category_Bog) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM CategoryBogs WHERE ID_Category_Bog ='" + ID_Category_Bog + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			CategoryBog cate = new CategoryBog();
			while (rs.next()) {
				
				cate.setID_Category_Bog(rs.getString("ID_Category_Bog"));
				cate.setName_Category_Bog(rs.getString("Name_Category_Bog"));
				
				
				
			}
			
				return cate;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateNameCategoryBog(CategoryBog cate) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE CategoryBogs SET  Name_Category_Bog=?  WHERE ID_Category_Bog=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			
			ps.setString(1, cate.getName_Category_Bog());
			ps.setString(2, cate.getID_Category_Bog());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}
	@Override
	public void deleteCategoryBog(String ID_Category_Bog) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE FROM CategoryBogd WHERE ID_Category_Bog = ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Category_Bog);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}

