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
import Dao.ProductDAOImpl;
import Dao.SeasonDAO;
import Model.Account;

import Model.Category;
import Model.Product;
import Model.Season;
@MultipartConfig
@WebServlet("/ProductServlet_Update")
public class ProductServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();
	private static SeasonDAO seasonDAO = new SeasonDAO();
    
       
   
    public ProductServlet_Update() {
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
		String ID_Product = request.getParameter("ID_Product");
		System.out.println("wwww1"+ID_Product);
	    String Danh_Muc = request.getParameter("Danh_Muc"); 
	
		String Name_Product = request.getParameter("Name_Product");
		String Image = request.getParameter("Image");
		int Quantity =   Integer.parseInt(request.getParameter("Quantity"));		
		String Describe = request.getParameter("Describe");
		String Size = request.getParameter("Size");
		String Material = request.getParameter("Material");
		int Price = Integer.parseInt(request.getParameter("Price"));
		int Sale = Integer.parseInt(request.getParameter("Sale"));
		int Mua = Integer.parseInt(request.getParameter("Mua"));
		;
		System.out.println("extractFileName: "+request.getPart("Image").getSubmittedFileName());
		Part part = request.getPart("Image");
		if (part != null) {
			String imagePath = getFolderUpload().getAbsolutePath() + File.separator + part.getSubmittedFileName();
			Image = imagePath;
			part.write(imagePath);
		}


		String masanpham_error = "",  tensanpham_error = "", hinhanh_error = "", soluong_error = "",
				mota_error = "", giaban_error = "", giamgia_error = "", kichthuoc_error ="", chatlieu_error = "";

	
		if (ID_Product.equals("")) {
			masanpham_error = "Vui lòng nhập mã sản phẩm !";
		}
		if (masanpham_error.length() > 0) {
			request.setAttribute("masanpham_error", masanpham_error);
		}

		if (Name_Product.equals("")) {
			tensanpham_error = "Vui lòng nhập tên sản phẩm !";
		}
		if (tensanpham_error.length() > 0) {
			request.setAttribute("tensanpham_error", tensanpham_error);
		}
		if (Image.equals("")) {
			hinhanh_error = "Vui lòng chọn hình ảnh !";
		}
		if (hinhanh_error.length() > 0) {
			request.setAttribute("hinhanh_error", hinhanh_error);
		}
	
		if (Describe.equals("")) {
			mota_error = "Vui lòng nhập mô tả sản phẩm !";
		}
		if (mota_error.length() > 0) {
			request.setAttribute("mota_error", mota_error);
		}
		if (Size.equals("")) {
			kichthuoc_error = "Vui lòng nhập kích thước sản phẩm !";
		}
		if (kichthuoc_error.length() > 0) {
			request.setAttribute("kichthuoc_error", kichthuoc_error);
		}
		if (Material.equals("")) {
			chatlieu_error = "Vui lòng nhập chất liệu sản phẩm !";
		}
		if (chatlieu_error.length() > 0) {
			request.setAttribute("chatlieu_error", chatlieu_error);
		}
		request.setAttribute("ID_Product", ID_Product);
		request.setAttribute("Name_Product", Name_Product);
		request.setAttribute("Image", Image);
		request.setAttribute("Quantity", Quantity);
		request.setAttribute("Describe", Describe);
		request.setAttribute("Size", Size); 
		request.setAttribute("Material", Material); 
		request.setAttribute("Price", Price);
		request.setAttribute("Sale", Sale);
	
	
		request.setAttribute("Mua", Mua);
		try {
			switch (action) {
			case "Update":

				if (masanpham_error.length() == 0 && tensanpham_error.length() == 0
						&& hinhanh_error.length() == 0 && mota_error.length() == 0 && kichthuoc_error.length()== 0 && chatlieu_error.length()== 0) {
					Category cate = new Category();
					cate.setID_Category(cateDAO.getCategory(Danh_Muc).getID_Category());
					Season season = new Season();
					season.setID_Season(seasonDAO.getSeason(Mua).getID_Season());
					Product pro = new Product(ID_Product,cate, Name_Product, Image, Quantity, Describe, Size, Material, Price, Sale,
							 season);
					proDAO.updateProduct(pro);
					System.out.println("wwww"+pro);
					url ="/Admin/product_manager.jsp";
					break;
				} else {
					url ="/Admin/product_edit.jsp";
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
