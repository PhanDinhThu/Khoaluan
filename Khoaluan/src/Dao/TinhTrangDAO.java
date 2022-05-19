package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import Connection.DBConnection;
import Model.Category;
import Model.Empty;
import Model.Product;
import Model.Season;
import Model.Statistic;
import Model.TinhTrang;

public class TinhTrangDAO {
	public static List<TinhTrang> listTinhTrangs() throws SQLException {

		Connection ketNoi = DBConnection.getConnection();

		List<TinhTrang> dsTinhTrangs = new ArrayList<>();
		String sqlString = "select * from StatusProduct";
		System.out.print(sqlString);

		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {	
			TinhTrang tt = new TinhTrang(rSet.getInt(1), rSet.getString(2), rSet.getInt(3));
			dsTinhTrangs.add(tt);

		}
		return dsTinhTrangs;
	}
		public ArrayList<Product> listProductbySearch(String textSearch)  throws SQLException{


			Connection ketNoi = DBConnection.getConnection();
			Statement stm = ketNoi.createStatement();
			ArrayList<Product> listProduct = new ArrayList<>();
			String ss = "'%"+textSearch+"%'";
			Date d=new Date();
			SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
			String date = formatDay.format(d);
			String sqlString = "select p.ID_Product, p.ID_Category, P.Name_Product, P.Image, P.Quantity,P.Describe, P.Size, P.Material, P.Price, P.Sale from Product P where P.Name_Product LIKE " + ss;
			ResultSet rs = stm.executeQuery(sqlString);
			while (rs.next()) {
		
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setSize(rs.getString("Size"));
				sanPham.setMaterial(rs.getString("Material"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				listProduct.add(sanPham);

			}
		return listProduct;
		}
	
	 public static ArrayList<Product> listProductbyPromotion() throws SQLException {
	  
	  Connection ketNoi = DBConnection.getConnection(); Statement stm =
	  ketNoi.createStatement();
	  ArrayList<Product> listProduct = new ArrayList<>();
	  Date d=new Date(); SimpleDateFormat formatDay = new
	  SimpleDateFormat("yyyy/MM/dd"); String date = formatDay.format(d); String
	  sqlString = String.format("select P.ID_Product,P.ID_Category, P.Name_Product, P.Image, P.Quantity, P.Describe, P.Price, P.Sale,  S.ID_Season, S.Name_Season\r\n" + 
	  		" from Product P \r\n" + 
	  		"inner join  Season S on P.ID_Season = S.ID_Season \r\n" + 
	  		"WHERE dateStart <= '"+date+"' and dateEnd >= '"+date+"' \r\n" + 
	  		"GROUP BY P.ID_Product,P.ID_Category, P.Name_Product, P.Image, P.Quantity, P.Describe, P.Price, P.Sale, S.ID_Season, S.Name_Season");
	  
	  ResultSet rs = stm.executeQuery(sqlString); 
	  while (rs.next()) {
		  Product sanPham = new Product();
			sanPham.setID_Product(rs.getString("ID_Product"));
			Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
			sanPham.setDanh_Muc(danhMuc);
			sanPham.setName_Product(rs.getString("Name_Product"));
			sanPham.setImage(rs.getString("Image"));
			sanPham.setQuantity(rs.getInt("Quantity"));
			sanPham.setDescribe(rs.getString("Describe"));
			sanPham.setPrice(rs.getInt("Price"));
			sanPham.setSale(rs.getInt("Sale"));
			Season season = new Season(rs.getInt("ID_Season"), "", "","");
			sanPham.setMua(season);
			listProduct.add(sanPham);
	  }
	  return listProduct; 
	  }
	
		public static ArrayList<Empty> getListEmpty() throws SQLException{
			Connection ketNoi = DBConnection.getConnection();
			String sql = "select i.ID_Account from Account a join Invoice i on a.ID_Account=i.ID_Account group by i.ID_Account";
			ArrayList<Empty> list = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Empty e= new Empty(rs.getString("ID_Account"));
					list.add(e);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}
		public static boolean checkEmpty(String ID_Account)throws SQLException {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "select i.ID_Account from Account a join Invoice i on a.ID_Account=i.ID_Account where i.ID_Account ='"+ ID_Account +"' GROUP by i.ID_Account";
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
		public static boolean checkEmptyProduct(String ID_Product)throws SQLException {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "select id.ID_Product from Product p join InvoiceDetail id on p.ID_Product=id.ID_Product where id.ID_Product ='"+ ID_Product +"' group by id.ID_Product";
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
		public static boolean checkEmptyCategory(String ID_Category)throws SQLException {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "select c.ID_Category from Product p join Category c on p.ID_Category=c.ID_Category where c.ID_Category ='"+ ID_Category +"' group by c.ID_Category";
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
		public static boolean checkEmptyNews_Category(String ID_News_Category)throws SQLException {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "select c.ID_News_Category from News p join News_Category c on p.ID_News_Category=c.ID_News_Category where c.ID_News_Category ='"+ ID_News_Category +"' group by c.ID_News_Category";
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
		public static boolean checkEmptySeason(int ID_Season)throws SQLException {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "select s.ID_Season from Product p join Season s on p.ID_Season=s.ID_Season where s.ID_Season ='"+ ID_Season +"' group by s.ID_Season";
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
