
<%@page import="com.sun.accessibility.internal.resources.accessibility"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.AccountSession"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Furniture - Online sales site</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<%
 Account acc = (Account) session.getAttribute("memberSession");
if (acc == null) {
	response.sendRedirect("/Khoaluan/login.jsp");
}
 
InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
 String ID_Account = acc.getID_Account(); 
ArrayList<Invoice> listInvoice = invoiceDAO.getListInvoice1(ID_Account);
AccountDAOImpl accDAO = new AccountDAOImpl();

ProductDAOImpl productDAO = new ProductDAOImpl(); 

NumberFormat nf = NumberFormat.getInstance();
nf.setMinimumIntegerDigits(0);
/* Account user = new AccountDAOImpl().getUser(ID_Account); */
	
	%>

  <jsp:include page="header.jsp"></jsp:include>

    <!-- Cart Start -->
    <h2 style="text-align:center;text-transform: uppercase">LỊCH SỬ MUA HÀNG </h2><br>
    <div class="container-fluid">
        <div class="row px-xl-5">
            
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>												
                           <th>Mã Hóa Đơn</th>
						   <th>Địa Chỉ Giao Hàng</th>
						   <th>Phương Thức Thanh Toán</th>
						   <th>Tổng tiền hóa đơn</th>
						   <th>Ngày Mua Hàng</th>
						   <th>Ngày giao hàng</th>
						   <th>Trạng Thái Đơn Hàng</th>
						   <th>Chi tiết</th>			
												
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<%
											for (Invoice invoice : listInvoice) {
										%>
                        <tr>
                            <td class="align-middle"><%=invoice.getID_Invoice()%></td>
                            <td><%=invoice.getShipping_Address()%></td>
                            <td class="align-middle"><%=invoice.getPayment_Methods()%></td>
                            <td class="align-middle"><%=invoice.getTotal_Invoice() %></td>
                            <td class="align-middle"><%=invoice.getPurchase_Date()%></td>
                            <td <%if (invoice.getStatus_Order()==3) {%> style="color:red;" <%}
                       
												%>> <%if (invoice.getStatus_Order()==3) {%> Ngày hủy: <%=invoice.getTime_Limit()%> <%}
                        else{ %> <%=invoice.getTime_Limit()%>
													<%
													}
												%></td>
												<td class="center" style="text-align: center;">
												<%
													if (invoice.getStatus_Order()==1){
												%>
												<a class="btn btn-primary btn-xs" >Đã Thanh Toán</a>
												<%
													}															
												%>	
												<% 
													if (invoice.getStatus_Order()==2) {											
												%>									
												<a class="btn btn-primary btn-xs">Đang Xử Lý</a>			
												<%
													}
												%>
												<% 
													if (invoice.getStatus_Order()==3) {											
												%>									
												<a class="btn btn-danger btn-xs">Đã Hủy</a>			
												<%
													}
												%>
												</td>
                            	  <td class="center" style="text-align: center;">
												
												<a href="/Khoaluan/InvoiceHistoryDetail?action=View&ID_Invoice=<%=invoice.getID_Invoice() %>"
													class="btn btn-warning btn-xs">Xem</a></td>
                        </tr>
                       <%
											}
										%>
                  </tbody>
                </table>
                 
            </div>
            
            </div>
        </div>
    </div>
    <br>
   
                        <nav>
                          <ul class="pagination justify-content-center">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</span></a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                          </ul>
                        </nav>
                 
    <!-- Cart End -->


    <jsp:include page="footer.jsp"></jsp:include>


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>