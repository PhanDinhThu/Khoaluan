package Dao;
import java.util.ArrayList;
import java.util.List;
import Model.Slide_ImageAdvertise;


public interface Slide_ImageAdvertiseDAO {
		// Hien thi  
		public Slide_ImageAdvertise getDetailAdvertise(String ID_Advertise);
		// Lay theo danh sach
		public ArrayList<Slide_ImageAdvertise> getList();	
		// Lay Theo Ma
		public Slide_ImageAdvertise getAdvertise(String ID_Advertise);		
		public void updateAdvertise(Slide_ImageAdvertise ad); 
		public boolean checkIdAdvertise(String ID_Advertise);
			

}
