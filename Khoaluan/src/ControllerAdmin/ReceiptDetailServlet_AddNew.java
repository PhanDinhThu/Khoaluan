package ControllerAdmin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Random;
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
import Dao.GoodReceiptDAO;
import Dao.GoodReceiptDetailDAO;
import Dao.ProductDAOImpl;
import Dao.SeasonDAO;
import Model.Category;
import Model.GoodReceipt;
import Model.GoodReceiptDetail;
import Model.Product;
import Model.Season;


@MultipartConfig
@WebServlet("/ReceiptDetailServlet_AddNew")
public class ReceiptDetailServlet_AddNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();
	private static SeasonDAO seasonDAO = new SeasonDAO();
	private GoodReceiptDetailDAO grdDAO = new GoodReceiptDetailDAO();
	private GoodReceiptDAO grDAO = new GoodReceiptDAO();

	public ReceiptDetailServlet_AddNew() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Product = request.getParameter("ID_Product");
		String url = "";
		try {
			switch (action) {
			case "Delete":
				proDAO.deleteProduct(ID_Product);
				url = "/Admin/product_manager.jsp";
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		String ID_Product = request.getParameter("ID_Product");
		String Danh_Muc = request.getParameter("Danh_Muc");
		String Name_Product = request.getParameter("Name_Product");
		String Image = request.getParameter("Image");
		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
		String Describe = request.getParameter("Describe");
		String Size = request.getParameter("Size");
		String Material = request.getParameter("Material");
		int PriceImport = Integer.parseInt(request.getParameter("PriceImport"));
		int Price = Integer.parseInt(request.getParameter("Price"));	
		int Mua = Integer.parseInt(request.getParameter("Mua"));
		int Sale =0;
		int ID_Receipt = Integer.parseInt(request.getParameter("ID_Receipt"));
		;
		System.out.println("extractFileName: "+request.getPart("Image").getSubmittedFileName());
		Part part = request.getPart("Image");
		if (part != null) {
			String imagePath = getFolderUpload().getAbsolutePath() + File.separator + part.getSubmittedFileName();
			Image = imagePath;
			part.write(imagePath);
		}

		String masanpham_error = "", madanhmuc_error = "", tensanpham_error = "", hinhanh_error = "",
				soluong_error = "", mota_error = "", kichthuoc_error= "", chatlieu_error= "",gianhap = "", giaban_error = "", giamgia_error = "", mua_error = "";

		if (ID_Product.equals("")) {
			masanpham_error = "Vui lòng nhập mã sản phẩm!";
		} else {
			if (proDAO.checkIdProduct(ID_Product) == true) {
				masanpham_error = "Mã sản phẩm đã tồn tại, vui lòng nhập mã khác !";
			}
		}
		if (masanpham_error.length() > 0) {
			request.setAttribute("masanpham_error", masanpham_error);
		}
		if (madanhmuc_error.length() > 0) {
			request.setAttribute("tensanpham_error", tensanpham_error);
		}
		if (Name_Product.equals("")) {
			tensanpham_error = "Vui lòng nhập tên sản phẩm!";
		}
		if (tensanpham_error.length() > 0) {
			request.setAttribute("tensanpham_error", tensanpham_error);
		}

		request.setAttribute("masanpham", ID_Product);
		request.setAttribute("madanhmuc", Danh_Muc);
		request.setAttribute("tensanpham", Name_Product);
		request.setAttribute("hinhanh", Image);
		request.setAttribute("soluong", Quantity);
		request.setAttribute("mota", Describe);
		request.setAttribute("kichthuoc", Size);
		request.setAttribute("chatlieu", Material);
		request.setAttribute("gianhap", PriceImport);
		request.setAttribute("giaban", Price);
		request.setAttribute("giamgia", Sale);
		request.setAttribute("Mua", Mua);
		try {
			switch (action) {
			case "Insert":
				if (masanpham_error.length() == 0 && tensanpham_error.length() == 0) {
					Category cate = new Category();
					cate.setID_Category(cateDAO.getCategory(Danh_Muc).getID_Category());
					
					Season season = new Season();
					season.setID_Season(seasonDAO.getSeason(Mua).getID_Season());

					Product pro = new Product(ID_Product, cate, Name_Product, Image, Quantity, Describe, Size, Material, Price, Sale,
							 season);
					proDAO.insertProduct(pro);
                    Date date = new Date();
					
					Random rd = new Random();
					int n = 23431;
					
					int id = rd.nextInt(n);
					System.out.println(id+"11");
					
					
					System.out.println(Price+"44");
					System.out.println(Quantity+"55");
					
					pro.setID_Product(proDAO.getDetailProduct(ID_Product).getID_Product());
				
					String proo = proDAO.getDetailProduct(ID_Product).getID_Product();
					
					System.out.println(proo+"22");
					GoodReceipt gr = new GoodReceipt();
					gr.setID_Receipt(grDAO.getReceipt(ID_Receipt).getID_Receipt());
					System.out.println(gr+"33");
					GoodReceiptDetail grd= new GoodReceiptDetail( id, pro,gr,PriceImport, Quantity );
					grdDAO.insertGRD(grd);
					
					int idd = grDAO.getReceipt(ID_Receipt).getID_Receipt();
					System.out.println(idd+"77");
					int total = PriceImport*Quantity;
					System.out.println(total+"88");
					GoodReceipt grr= new GoodReceipt(idd,null,null,total);
					grDAO.updateGoodReceipt(idd, total);
					
					url = "/Admin/GoodReceipt.jsp";
					break;
				} else {
					url = "/Admin/AddNewReceipt.jsp";
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
