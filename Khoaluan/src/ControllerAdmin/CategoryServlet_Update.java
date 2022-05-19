package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDAOImpl;
import Dao.ProductDAOImpl;
import Model.Category;
import Model.Product;

@WebServlet("/CategoryServlet_Update")
public class CategoryServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();
       
   
    public CategoryServlet_Update() {
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
		String ID_Category = request.getParameter("ID_Category");
		String Name_Category = request.getParameter("Name_Category");
		
		String tendanhmuc_error = "";
		if (Name_Category.equals("")) {
			tendanhmuc_error = "Vui lòng nhập tên danh mục !";
		}
		if (tendanhmuc_error.length() > 0) {
			request.setAttribute("tendanhmuc_error", tendanhmuc_error);
		}
		
		request.setAttribute("ID_Category", ID_Category);
		request.setAttribute("Name_Category", Name_Category);
		
		try {
			switch (action) {
			case "Update":

				if (tendanhmuc_error.length() == 0 ) {
					Category cate = new Category(ID_Category, Name_Category, null);
					cateDAO.updateNameCategory(cate);
					url ="/Admin/category_manager.jsp";
					break;
				} else {
					url ="/Admin/category_edit.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}