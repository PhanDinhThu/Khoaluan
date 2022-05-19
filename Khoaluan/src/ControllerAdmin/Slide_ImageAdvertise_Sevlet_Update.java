package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Slide_ImageAdvertiseDAOImpl;
import Model.Slide_ImageAdvertise;


@WebServlet("/Slide_ImageAdvertise_Sevlet_Update")
public class Slide_ImageAdvertise_Sevlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Slide_ImageAdvertiseDAOImpl adDAO = new Slide_ImageAdvertiseDAOImpl();
       
   
    public Slide_ImageAdvertise_Sevlet_Update() {
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
		int ID_Advertise = Integer.parseInt(request.getParameter("ID_Advertise"));
		String Image_Advertise1 = request.getParameter("Image_Advertise1");
		String Image_Advertise2 = request.getParameter("Image_Advertise2");
		String Image_Advertise3 = request.getParameter("Image_Advertise3");
		String Image_Advertise4 = request.getParameter("Image_Advertise4");
		String Image_Advertise5 = request.getParameter("Image_Advertise5");
		
		String anh1_error = "", anh2_error = "", anh3_error = "", anh4_error = "", anh5_error = "";
		if (Image_Advertise1.equals("")) {
			anh1_error = "Vui lòng chọn ảnh !";
		}
		if (Image_Advertise2.equals("")) {
			anh2_error = "Vui lòng chọn ảnh !";
		}
		if (Image_Advertise3.equals("")) {
			anh3_error = "Vui lòng chọn ảnh !";
		}
		if (Image_Advertise4.equals("")) {
			anh4_error = "Vui lòng chọn ảnh !";
		}
		if (Image_Advertise5.equals("")) {
			anh5_error = "Vui lòng chọn ảnh !";
		}
		
		request.setAttribute("ID_Advertise", ID_Advertise);
		request.setAttribute("Image_Advertise1", Image_Advertise1);
		request.setAttribute("Image_Advertise2", Image_Advertise2);
		request.setAttribute("Image_Advertise3", Image_Advertise3);
		request.setAttribute("Image_Advertise4", Image_Advertise4);
		request.setAttribute("Image_Advertise5", Image_Advertise5);
		try {
			switch (action) {
			case "Update":

				if (anh1_error.length() == 0 && anh1_error.length() == 0 && anh2_error.length() == 0 && anh3_error.length() == 0 && anh4_error.length() == 0 && anh5_error.length() == 0) {
					Slide_ImageAdvertise ad = new Slide_ImageAdvertise(ID_Advertise,Image_Advertise1, Image_Advertise2, Image_Advertise3, Image_Advertise4, Image_Advertise5);
					adDAO.updateAdvertise(ad);
					url ="/Admin/Slide_ImageAdvertise_manager.jsp";
					break;
				} else {
					url ="/Admin/Slide_ImageAdvertise_edit.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}