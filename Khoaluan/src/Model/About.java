package Model;

public class About {
	private String ID_About;
	private String Image_About;
	private String Content_About;
	private String Email;
	private String Address;
	private int Phone;
	public About() {
		// TODO Auto-generated constructor stub
	}
	public About(String iD_About, String image_About, String content_About, String email, String address, int phone) {
		super();
		ID_About = iD_About;
		Image_About = image_About;
		Content_About = content_About;
		Email = email;
		Address = address;
		Phone = phone;
	}
	public String getID_About() {
		return ID_About;
	}
	public void setID_About(String iD_About) {
		ID_About = iD_About;
	}
	public String getImage_About() {
		return Image_About;
	}
	public void setImage_About(String image_About) {
		Image_About = image_About;
	}
	public String getContent_About() {
		return Content_About;
	}
	public void setContent_About(String content_About) {
		Content_About = content_About;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public int getPhone() {
		return Phone;
	}
	public void setPhone(int phone) {
		Phone = phone;
	}
	
}
