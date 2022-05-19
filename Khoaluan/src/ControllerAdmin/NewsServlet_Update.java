package ControllerAdmin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Dao.CategoryDAOImpl;
import Dao.NewsDAOImpl;
import Dao.News_CategoryDAOImpl;
import Dao.ProductDAOImpl;
import Dao.SeasonDAO;
import Model.Account;


import Dao.News_CategoryDAOImpl;
import Dao.NewsDAOImpl;
import Model.News_Category;
import Model.News;
@MultipartConfig
@WebServlet("/NewsServlet_Update")
public class NewsServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static NewsDAOImpl newsDAO = new NewsDAOImpl();
	private static News_CategoryDAOImpl cateDAO = new News_CategoryDAOImpl();  
    
       
   
    public NewsServlet_Update() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		String url = "";
		String ID_News = request.getParameter("ID_News");
		System.out.println("wwww1"+ID_News);
	    String Danh_Muc_News = request.getParameter("Danh_Muc_News"); 
	
		String Name_News = request.getParameter("Name_News");
		System.out.println("wwww2"+Name_News);
		String Image_News = request.getParameter("Image_News");
	
		String Posting_Date =   request.getParameter("Posting_Date");
		
		String Describe_News = request.getParameter("Describe_News");
		String Detail_News = request.getParameter("Detail_News"); 
		;
		System.out.println("extractFileName: "+request.getPart("Image_News").getSubmittedFileName());
		Part part = request.getPart("Image_News");
		if (part != null) {
			String imagePath = getFolderUpload().getAbsolutePath() + File.separator + part.getSubmittedFileName();
			Image_News = imagePath;
			part.write(imagePath);
		}


		String matintuc_error = "", madanhmuc_error = "", tentintuc_error = "", hinhanh_error = "", ngaydang_error = "",
				mota_error = "", chitiet_error = "";

	
		if (ID_News.equals("")) {
			matintuc_error = "Vui lòng nhập mã tin tức !";
		}
		if (matintuc_error.length() > 0) {
			request.setAttribute("matintuc_error", matintuc_error);
		}

		if (Name_News.equals("")) {
			tentintuc_error = "Vui lòng nhập tên tin tức !";
		}
		if (tentintuc_error.length() > 0) {
			request.setAttribute("tensanpham_error", tentintuc_error);
		}
		if (Image_News.equals("")) {
			hinhanh_error = "Vui lòng chọn hình ảnh !";
		}
		if (hinhanh_error.length() > 0) {
			request.setAttribute("hinhanh_error", hinhanh_error);
		}
	
		if (Describe_News.equals("")) {
			mota_error = "Vui lòng nhập mô tả tin tức !";
		}
		if (mota_error.length() > 0) {
			request.setAttribute("mota_error", mota_error);
		}
		if (Detail_News.equals("")) {
			chitiet_error = "Vui lòng nhập chi tiết tin tức !";
		}
		if (chitiet_error.length() > 0) {
			request.setAttribute("kichthuoc_error", chitiet_error);
		}
		
		request.setAttribute("ID_News", ID_News);
		request.setAttribute("Name_News", Name_News);
		request.setAttribute("Image_News", Image_News);
		request.setAttribute("Posting_Date", Posting_Date); 
		request.setAttribute("Describe_News", Describe_News);		
		request.setAttribute("Detail_News", Detail_News); 
		
		try {
			switch (action) {
			case "Update":

				if (matintuc_error.length() == 0 && tentintuc_error.length() == 0
				&& hinhanh_error.length() == 0 && mota_error.length() == 0 && chitiet_error.length()== 0) {
			News_Category cate = new News_Category();
			cate.setID_News_Category(cateDAO.getNews_Category(Danh_Muc_News).getID_News_Category());
			News news = new News(ID_News, cate, Name_News, Image_News, Posting_Date, Describe_News, Detail_News);
			newsDAO.updateNews(news);
			System.out.println("wwww"+news);
			url ="/Admin/News_manager.jsp";
			break;
		} else {
			url ="/Admin/News_update.jsp";
		}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	public File getFolderUpload() {
		File folderUpload = new File(System.getProperty("user.home") + "/images/sanpham");
		if (!folderUpload.exists()) {
			folderUpload.mkdirs();
		}
		return folderUpload;
	}

}
