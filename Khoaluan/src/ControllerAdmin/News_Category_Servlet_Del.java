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


@WebServlet("/News_Category_Servlet_Del")
public class News_Category_Servlet_Del extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static News_CategoryDAOImpl cateDAO = new News_CategoryDAOImpl();   
       
  
    public News_Category_Servlet_Del() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_News_Category = request.getParameter("ID_News_Category");
		String url = "";
		try {
			switch (action) {
			case "Delete":
				cateDAO.deleteNews_Category(ID_News_Category);
				url = "/Admin/News_Category_manager.jsp";
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
