package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;
import Model.Category;
import Model.News_Category;



public interface News_CategoryDAO {
	// load danh sach danh muc cha
		public ArrayList<News_Category> getListParentNews_Category();
		
		//load danh sach danh muc con
		public ArrayList<News_Category> getList();
		public ArrayList<News_Category> getListSubNews_Category(String ID_News_Category);
		
		public News_Category getIdNews_Category(String ID_News_Category);
		public boolean checkNews_Category(String ID_New_Category_Category);
		public News_Category getNews_Category(String ID_News_Category);
		public ArrayList<News_Category> getListParentNews_Category1();
		public void insertNews_Category(News_Category cate);
		
		public void updateNews_NameCategory(News_Category cate) ;
		public void deleteNews_Category(String ID_News_Category);
}
