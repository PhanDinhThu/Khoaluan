package Dao;

import java.util.ArrayList;
import java.util.List;

import Model.Account;
import Model.Product;
import Model.About;

public interface AboutDAO {

	// Hien thi thong tin chi tiet
	public About getDetailAbout(String ID_About);
	public ArrayList<About> getListByPage(ArrayList<About> arr, int start, int end);
	// Lay theo danh sach
	public ArrayList<About> getList();

	// Lay Theo Ma
	public About getAbout(String ID_About);
	
	// Them moi
	public void insertAbout(About ab);

	// Sua
	 public void updateAbout(About ab); 

	// Xoa
	public void deleteAbout(String ID_About);
	
	public boolean checkIdAbout(String ID_About);
		
		
		
}
