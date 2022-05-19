package Model;

public class Advertise {
	private String ID_Advertise;
	private String Image_Advertise1;
	private String Image_Advertise2;
	private String Image_Advertise3;
	private String Content1;
	private String Content2;
	private String Content3;
	public Advertise() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Advertise(String iD_Advertise, String image_Advertise1, String image_Advertise2, String image_Advertise3,
			String content1, String content2, String content3) {
		super();
		ID_Advertise = iD_Advertise;
		Image_Advertise1 = image_Advertise1;
		Image_Advertise2 = image_Advertise2;
		Image_Advertise3 = image_Advertise3;
		Content1 = content1;
		Content2 = content2;
		Content3 = content3;
	}
	public String getID_Advertise() {
		return ID_Advertise;
	}
	public void setID_Advertise(String iD_Advertise) {
		ID_Advertise = iD_Advertise;
	}
	public String getImage_Advertise1() {
		return Image_Advertise1;
	}
	public void setImage_Advertise1(String image_Advertise1) {
		Image_Advertise1 = image_Advertise1;
	}
	public String getImage_Advertise2() {
		return Image_Advertise2;
	}
	public void setImage_Advertise2(String image_Advertise2) {
		Image_Advertise2 = image_Advertise2;
	}
	public String getImage_Advertise3() {
		return Image_Advertise3;
	}
	public void setImage_Advertise3(String image_Advertise3) {
		Image_Advertise3 = image_Advertise3;
	}
	public String getContent1() {
		return Content1;
	}
	public void setContent1(String content1) {
		Content1 = content1;
	}
	public String getContent2() {
		return Content2;
	}
	public void setContent2(String content2) {
		Content2 = content2;
	}
	public String getContent3() {
		return Content3;
	}
	public void setContent3(String content3) {
		Content3 = content3;
	}
	
	
}
