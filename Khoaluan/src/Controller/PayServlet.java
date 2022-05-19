package Controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TreeMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AccountDAOImpl;
import Dao.CategoryDAOImpl;
import Dao.InvoiceDAOImpl;
import Dao.InvoiceDetailDAOImpl;
import Dao.ProductDAOImpl;
import Model.Account;
import Model.Cart;
import Model.Category;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Product;
import Other.SendMail;

public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	private InvoiceDAOImpl hdDAO = new InvoiceDAOImpl();
	private InvoiceDetailDAOImpl hdctDAO = new InvoiceDetailDAOImpl();
	private AccountDAOImpl accDAO = new AccountDAOImpl();
	private ProductDAOImpl proDAO = new ProductDAOImpl();
	private CategoryDAOImpl cateDAO = new CategoryDAOImpl();

	public PayServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String Shipping_Address = request.getParameter("Shipping_Address");
		String Payment_Methods = request.getParameter("Payment_Methods");
		String Account = request.getParameter("Account");
		String Email = request.getParameter("Email");
		String Phone = request.getParameter("Phone");
		String Time_Limit = request.getParameter("Time_Limit");
		String Note = request.getParameter("Note");
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date afterCreatedDate = new Date();
		try {
			afterCreatedDate = (Date)afterFormat.parse(Time_Limit);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String Time_Limit1 = formatDay.format(afterCreatedDate);
		
		
		
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		String error_address = "", error_methods = "", error_email = "", error_phone = "";

		if (Shipping_Address.equals("")) {
			error_address = "";
		}
		if (error_address.length() > 0) {
			request.setAttribute("error_address", error_address);
		}
		if (Payment_Methods.equals("")) {
			error_methods = "";
		}
		if (error_methods.length() > 0) {
			request.setAttribute("error_methods", error_methods);
		}
		if (Email.equals("")) {
			error_email = "";
		}
		if (error_email.length() > 0) {
			request.setAttribute("error_email", error_email);
		}
		if (Phone.equals("")) {
			error_phone = "";
		}
		if (error_phone.length() > 0) {
			request.setAttribute("error_phone", error_phone);
		}

		request.setAttribute("Shipping_Address", Shipping_Address);
		request.setAttribute("Payment_Methods", Payment_Methods);
		request.setAttribute("Email", Email);
		request.setAttribute("Phone", Phone);
		request.setAttribute("Time_Limit1", Time_Limit1);
		request.setAttribute("Note", Note);
		

		try {
			if (error_address.length() == 0 && error_methods.length() == 0 && error_email.length() == 0 && error_phone.length() == 0 &&!cart.getList().isEmpty()) {
				Date date = new Date();
				System.out.println("aa" + cart + "ss");
				Random rd = new Random();
				int n = 234363123;
				
				String mhd = "MHD" + date.getTime();
				/*
				 * Account acc = new Account();
				 * 
				 * acc.setID_Account(accDAO.getAccount(Account).getID_Account());
				 */
				Account acc= new Account();
				acc = (Account) session.getAttribute("memberSession");
				int total = cart.totalCart();
				int k = 1;
				String id_employee = "0";
				
				Invoice hd = new Invoice(mhd, acc, Shipping_Address, Payment_Methods,
						new Timestamp(new Date().getTime()), 2, total, id_employee, Time_Limit1, Note);
				hd.setID_Invoice(mhd);
				hdDAO.insertInvoice(hd);
				TreeMap<Product, Integer> list = cart.getList();
				for (Map.Entry<Product, Integer> ds : list.entrySet()) {
					Product pr = new Product();
					pr.setID_Product(ds.getKey().getID_Product());
					pr.setName_Product(ds.getKey().getName_Product());
					int mhdct = rd.nextInt(n);
					int st = (ds.getValue() * ds.getKey().getPrice()) - (ds.getValue() * ds.getKey().getSale()) ;
					hdctDAO.insertInvoiceDetail(
							new InvoiceDetail(mhdct, hd, pr, ds.getValue(), ds.getKey().getPrice(), ds.getKey().getSale(), st));
					
					Product pro = new Product(pr.getID_Product(),null,null,null,ds.getValue(),null,null, null, 0,0,null);
					proDAO.updateQuantity(pro);
                    
				
				}

				request.setAttribute("message", "Thanh toán thành công !");
				session.removeAttribute("cart");
				request.getRequestDispatcher("buysuccess.jsp").forward(request, response);
				 
			} else {
				request.setAttribute("message", "Mua hàng thất bại !");
				request.getRequestDispatcher("checkout.jsp").forward(request, response);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
