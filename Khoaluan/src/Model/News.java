package Model;

import java.sql.Timestamp;

public class News {
	private String ID_News;
	private News_Category Danh_Muc_News;
	private String Name_News;
	private String Image_News;
	private String Posting_Date;
	private String Describe_News;
	private String Detail_News;
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	public News(String iD_News, News_Category danh_Muc_News, String name_News, String image_News, String posting_Date,
			String describe_News, String detail_News) {
		super();
		ID_News = iD_News;
		Danh_Muc_News = danh_Muc_News;
		Name_News = name_News;
		Image_News = image_News;
		Posting_Date = posting_Date;
		Describe_News = describe_News;
		Detail_News = detail_News;
	}
	public String getID_News() {
		return ID_News;
	}
	public void setID_News(String iD_News) {
		ID_News = iD_News;
	}
	public News_Category getDanh_Muc_News() {
		return Danh_Muc_News;
	}
	public void setDanh_Muc_News(News_Category danh_Muc_News) {
		Danh_Muc_News = danh_Muc_News;
	}
	public String getName_News() {
		return Name_News;
	}
	public void setName_News(String name_News) {
		Name_News = name_News;
	}
	public String getImage_News() {
		return Image_News;
	}
	public void setImage_News(String image_News) {
		Image_News = image_News;
	}
	public String getPosting_Date() {
		return Posting_Date;
	}
	public void setPosting_Date(String posting_Date) {
		Posting_Date = posting_Date;
	}
	public String getDescribe_News() {
		return Describe_News;
	}
	public void setDescribe_News(String describe_News) {
		Describe_News = describe_News;
	}
	public String getDetail_News() {
		return Detail_News;
	}
	public void setDetail_News(String detail_News) {
		Detail_News = detail_News;
	}
	
	
}
