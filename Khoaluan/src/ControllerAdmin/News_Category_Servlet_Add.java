package ControllerAdmin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.News_CategoryDAOImpl;
import Model.News_Category;


@WebServlet("/News_Category_Servlet_Add")
public class News_Category_Servlet_Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static News_CategoryDAOImpl cateDAO = new News_CategoryDAOImpl();
       
    public News_Category_Servlet_Add() {
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
		String ID_News_Category = request.getParameter("ID_News_Category");
		String Name_News_Category = request.getParameter("Name_News_Category");
		

		String madanhmuc_error = "", tendanhmuc_error = "";

		
		if (ID_News_Category.equals("")) {
			madanhmuc_error = "Vui lòng nhập mã  loại tin tức !";
		} else {
			if (cateDAO.checkNews_Category(ID_News_Category) == true) {
				madanhmuc_error = "Mã loại tin tức đã tồn tại, không thêm được !";
			}
		}
		if (madanhmuc_error.length() > 0) {
			request.setAttribute("madanhmuc_error", madanhmuc_error);
		}
		
		if (Name_News_Category.equals("")) {
			tendanhmuc_error = "Vui lòng nhập tên loại tin tức!";
		}
		if (tendanhmuc_error.length() > 0) {
			request.setAttribute("tendanhmuc_error", tendanhmuc_error);
		}
		
		

		request.setAttribute("madanhmuc", ID_News_Category);
		request.setAttribute("tendanhmuc", Name_News_Category);
		
		try {
			switch (action) {
			case "Insert":
				if (madanhmuc_error.length() == 0 && tendanhmuc_error.length() == 0 ) {
					
					String parent_news = "LT" ;
					News_Category cate = new News_Category( ID_News_Category, Name_News_Category, parent_news );
					cateDAO.insertNews_Category(cate);
					url = "/Admin/News_Category_manager.jsp";
					
					break;
				} else {
					url = "/Admin/News_Category_insert.jsp";
				}
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
