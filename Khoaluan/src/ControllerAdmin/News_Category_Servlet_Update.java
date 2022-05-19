package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.News_CategoryDAOImpl;
import Dao.NewsDAOImpl;
import Model.News_Category;
import Model.News;

@WebServlet("/News_Category_Servlet_Update")
public class News_Category_Servlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static NewsDAOImpl newsDAO = new NewsDAOImpl();
	private static News_CategoryDAOImpl cateDAO = new News_CategoryDAOImpl();
       
   
    public News_Category_Servlet_Update() {
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
		
		String tendanhmuc_error = "";
		if (Name_News_Category.equals("")) {
			tendanhmuc_error = "Vui lòng nhập tên loại tin tức !";
		}
		if (tendanhmuc_error.length() > 0) {
			request.setAttribute("tendanhmuc_error", tendanhmuc_error);
		}
		
		request.setAttribute("ID_News_Category", ID_News_Category);
		request.setAttribute("Name_News_Category", Name_News_Category);
		
		try {
			switch (action) {
			case "Update":

				if (tendanhmuc_error.length() == 0 ) {
					News_Category cate = new News_Category(ID_News_Category, Name_News_Category, null);
					cateDAO.updateNews_NameCategory(cate);
					url ="/Admin/News_Category_manager.jsp";
					break;
				} else {
					url ="/Admin/News_Category_edit.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}