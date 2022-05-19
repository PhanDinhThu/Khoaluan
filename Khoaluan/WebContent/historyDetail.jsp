
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

ArrayList<InvoiceDetail> listInvoiceDetail = (ArrayList<InvoiceDetail>)  request.getAttribute("listDetail");
ProductDAOImpl productDAO = new ProductDAOImpl(); 

NumberFormat nf = NumberFormat.getInstance();
nf.setMinimumIntegerDigits(0);
	
	%>

  <jsp:include page="header.jsp"></jsp:include>

    <!-- Cart Start -->
    <h2 style="text-align:center;text-transform: uppercase">CHI TIẾT LỊCH SỬ MUA HÀNG</h2><br>
    <div class="container-fluid">
        <div class="row px-xl-5">
            
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                           <th>Hóa Đơn Chi Tiết</th>
						   <th>Mã Hóa Đơn</th>
						   <th>Sản Phẩm</th>
						   <th>Số Lượng</th>
						   <th>Giá Sản Phẩm</th>
						   <th>Giảm Giá</th>
						   <th>Tổng Tiền</th>					
												
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <%
											for (InvoiceDetail invoiceDetail : listInvoiceDetail) {
										%>
                        <tr>
                        <td class="align-middle"><%=invoiceDetail.getID_InvoiceDetail()%></td>
                        <td class="align-middle"><%=invoiceDetail.getHoa_Don().getID_Invoice()%></td>
						<td class="align-middle"><%=productDAO.getProduct(invoiceDetail.getSan_Pham().getID_Product()).getName_Product()%></td>
						<td class="align-middle"><%=invoiceDetail.getQuantity()%></td>
						<td class="align-middle"><%=nf.format(invoiceDetail.getPrice())%> VNĐ</td>
						<td class="align-middle"><%=nf.format(invoiceDetail.getSale())%>  </td>
						<td class="align-middle"><%=nf.format(invoiceDetail.getQuantity() * (invoiceDetail.getPrice() - invoiceDetail.getSale()))%> VNĐ</td>
                           
                        </tr>
                       <%
											}
										%>
                  </tbody>
                </table>
                
            </div>
            
            </div><br>
       <div style="text-align:center; margin-bottom:10%; font-weight:bold" >
			 <a href="invoiceDetail.jsp" style=" background:#31a08a; padding: 10px 20px;color:white; font-weight:bold; border-radius:10px">Quay lại</a></div>
		</div>
              
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