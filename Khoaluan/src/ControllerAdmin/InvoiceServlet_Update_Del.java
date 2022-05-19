package ControllerAdmin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.InvoiceDAOImpl;
import Dao.InvoiceDetailDAOImpl;
import Dao.ProductDAOImpl;
import Dao.SeasonDAO;
import Model.Account;
import Model.Cart;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Season;


@WebServlet("/InvoiceServlet_Update_Del")
public class InvoiceServlet_Update_Del extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private static InvoiceDetailDAOImpl invoiceDetailDAO = new InvoiceDetailDAOImpl();

	public InvoiceServlet_Update_Del() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Invoice = request.getParameter("ID_Invoice");
		String url = "";
		try {
			switch (action) {
			case "Delete":
				invoiceDAO.deleteInvoice(ID_Invoice);
				url = "/Admin/invoice_manager.jsp";
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
		String ID_Invoice = request.getParameter("ID_Invoice");
		 String Status = request.getParameter("Status_Order");
		
		int Status_Order = Integer.parseInt(request.getParameter("Status_Order"));

		String url = "";
		String error_address = "", error_methods = "", error_status = "";

		
		// Validate trang thai
		if (Status_Order == 0) {
			error_status = "Vui lòng chọn trạng thái đơn hàng !";
		}
		if (Status_Order == 1 || Status_Order == 2 || Status_Order == 3 ||  Status_Order == 4) {
			request.setAttribute("error_status", error_status);
		}

		
		request.setAttribute("Status_Order", Status_Order);
		
		try {
			
				switch (action) {
				case "Update":
					HttpSession session = request.getSession();
					Account acc = (Account) session.getAttribute("memberSession");
					String ID_Employee = acc.getID_Account();
					invoiceDAO.updateInvoice(
							new Invoice(ID_Invoice, null, null, null, null, Status_Order,0, ID_Employee, null, null ));
					if (Status.equals("3")) {
						ArrayList<InvoiceDetail> listInvoice = invoiceDetailDAO.getListUpdateProduct(ID_Invoice);
						for (InvoiceDetail invoiceDetail : listInvoice) {
							
							proDAO.updateQuantity1(invoiceDetail.getQuantity(), invoiceDetail.getSan_Pham().getID_Product());
						}
					}
					url = "/Admin/invoice_manager.jsp";
					break;
				}
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}
}
