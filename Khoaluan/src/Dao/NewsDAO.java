package Dao;

import java.util.ArrayList;

import Model.News;
import Model.Product;

public interface NewsDAO {
	// Lay danh sach san pham dua theo ma danh muc
		public ArrayList<News> getListNewsByCategory(String ID_Category_News);
	
		

		// Hien thi thong tin chi tiet san pham
		public News getDetailNews(String ID_News);

		// Lay danh sach tt theo danh sach
		public ArrayList<News> getList();
		

		public ArrayList<News> getListByPage(ArrayList<News> arr, int start, int end);

		
		
		// Lay tt Theo Ma
		public  News getNews(String ID_News);
		
		// Them moi tt
			public void insertNews(News news);

			// Sua tt
		 public void updateNews(News news); 

			// Xoa tt
		public void deleteNews(String ID_News);
			
		public boolean checkIdNews(String ID_News);
}

