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


import Dao.AboutDAOImpl;
import Model.About;



import Dao.News_CategoryDAOImpl;
import Dao.NewsDAOImpl;
import Model.News_Category;
import Model.News;
@MultipartConfig
@WebServlet("/AboutServlet_Update")
public class AboutServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AboutDAOImpl abDAO = new AboutDAOImpl();  
    
       
   
    public AboutServlet_Update() {
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
		String ID_About = request.getParameter("ID_About");	   
		String Image_About = request.getParameter("Image_About");
		String Content_About = request.getParameter("Content_About");	
		String Email = request.getParameter("Email");
		String Address = request.getParameter("Address");
		int Phone =   Integer.parseInt(request.getParameter("Phone"));
		;
		System.out.println("extractFileName: "+request.getPart("Image_About").getSubmittedFileName());
		Part part = request.getPart("Image_About");
		if (part != null) {
			String imagePath = getFolderUpload().getAbsolutePath() + File.separator + part.getSubmittedFileName();
			Image_About = imagePath;
			part.write(imagePath);
		}


		String magioithieu_error = "", hinhanh_error = "", noidung_error = "", email_error = "", diachi_error = "", sodienthoai_error = "";

	
		if (ID_About.equals("")) {
			magioithieu_error = "Vui lòng nhập mã giới thiệu !";
		}
		if (magioithieu_error.length() > 0) {
			request.setAttribute("matintuc_error", magioithieu_error);
		}

		if (Image_About.equals("")) {
			hinhanh_error = "Vui lòng chọn hình ảnh !";
		}
		if (hinhanh_error.length() > 0) {
			request.setAttribute("hinhanh_error", hinhanh_error);
		}
		if (Content_About.equals("")) {
			noidung_error = "Vui nhập mô tả giới thiệu !";
		}
		if (noidung_error.length() > 0) {
			request.setAttribute("noidung_error", noidung_error);
		}
	
		if (Email.equals("")) {
			email_error = "Vui lòng nhập email !";
		}
		if (email_error.length() > 0) {
			request.setAttribute("email_error", email_error);
		}
		if (Address.equals("")) {
			diachi_error = "Vui lòng nhập địa chỉ!";
		}
		if (diachi_error.length() > 0) {
			request.setAttribute("diachi_error", diachi_error);
		}
		
		
		request.setAttribute("ID_About", ID_About);
		request.setAttribute("Image_About", Image_About);
		request.setAttribute("Content_About", Content_About);
		request.setAttribute("Email", Email);
		request.setAttribute("Address", Address);
		request.setAttribute("Phone", Phone);
		
		try {
			switch (action) {
			case "Update":

				if (magioithieu_error.length() == 0 && noidung_error.length() == 0 
				&& email_error.length() == 0 && diachi_error.length() == 0 && sodienthoai_error.length() == 0) {					
					About ab = new About(ID_About, Image_About, Content_About, Email, Address, Phone);
					abDAO.updateAbout(ab);
					System.out.println("wwww"+ab);
					url ="/Admin/About_manager.jsp";
					break;
				} else {
					url ="/Admin/about_edit.jsp";
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
		File folderUpload = new File(System.getProperty("user.home") + "/images/gioithieu");
		if (!folderUpload.exists()) {
			folderUpload.mkdirs();
		}
		return folderUpload;
	}

}
