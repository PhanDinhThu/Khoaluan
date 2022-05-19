package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Product;
import Other.SendMail;

@WebServlet("/PaypalServlet")
public class PaypalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InvoiceDAOImpl hdDAO = new InvoiceDAOImpl();
	private InvoiceDetailDAOImpl hdctDAO = new InvoiceDetailDAOImpl();
	private AccountDAOImpl accDAO = new AccountDAOImpl();
	private ProductDAOImpl proDAO = new ProductDAOImpl();
	private CategoryDAOImpl cateDAO = new CategoryDAOImpl();
	public PaypalServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	
		String stt = request.getParameter("st");		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if(stt.equals("Completed")) {
			Date date = new Date();
			Random rd = new Random();
			int n = 234363123;
			
			//
			Date d = new Date();
			
			Calendar c = Calendar.getInstance();
	        c.setTime(d);

	        // manipulate date
	       
	        c.add(Calendar.DATE, 3); //same with c.add(Calendar.DAY_OF_MONTH, 1);
	       

	        // convert calendar to date
	        Date currentDatePlusOne = c.getTime();
			System.out.println("abc"+currentDatePlusOne);
			SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
			String date2 = formatDay.format(d);
			String date1 = formatDay.format(currentDatePlusOne);
			//
			String mhd = "MHD" + date.getTime();
			
			Account acc= new Account();
			acc = (Account) session.getAttribute("memberSession");
			int total = cart.totalCart();
			String add="22 Lê Lợi, Thành Phố Huế";
			String pay ="Thanh toán qua thẻ";
			String note = "";
			int k = 1;
			String id_employee = "0";
			
			
			Invoice hd = new Invoice(mhd, acc, add, pay,
					new Timestamp(new Date().getTime()), 2, total, id_employee, date1, note);
			
			hd.setID_Invoice(mhd);
			hdDAO.insertInvoice(hd);
			TreeMap<Product, Integer> list = cart.getList();
			for (Map.Entry<Product, Integer> ds : list.entrySet()) {
				Product pr = new Product();
				pr.setID_Product(ds.getKey().getID_Product());
				pr.setName_Product(ds.getKey().getName_Product());
				int mhdct = rd.nextInt(n);
				int st = (ds.getValue() * ds.getKey().getPrice()) - (ds.getValue() * ds.getKey().getSale());
				hdctDAO.insertInvoiceDetail(
						new InvoiceDetail(mhdct, hd, pr, ds.getValue(), ds.getKey().getPrice(), ds.getKey().getSale(), st));
				
				Product pro = new Product(pr.getID_Product(),null,null,null,ds.getValue(),null,null, null, 0,0,null);
				proDAO.updateQuantity(pro);
                
		
			}

			request.setAttribute("message", "Thanh toán thành công !");
			session.removeAttribute("cart");
			request.getRequestDispatcher("buysuccess.jsp").forward(request, response);
			
			;
		} else {
			request.setAttribute("message", "Mua hàng thất bại!");
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		}
	}

