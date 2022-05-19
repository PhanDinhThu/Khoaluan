<%@page import="com.restfb.types.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="Model.*"%>
<%@page import="Model.Cart"%>
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
<%if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/Khoaluan/login.jsp");
}
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
	cart = new Cart();
	session.setAttribute("cart", cart);
}
TreeMap<Product, Integer> list = cart.getList();
%>
<jsp:include page="header.jsp"></jsp:include><br><br>
<div style="text-align:center; margin-bottom:10%; font-weight:bold" >
           
                    <img class="img-fluid" src="images/thanhcom.jpg" alt=""  style="height:300px; width: 300px">  <br>                
           
	<p style="text-transform: uppercase; text-align:center;font-size:35px; margin-bottom: 10px"> Mua hàng thành công ! </p>
	<p style="text-transform: uppercase; text-align:center;font-size:35px; margin-bottom: 10px"> CẢM ƠN BẠN ĐÃ MUA HÀNG BÊN CỬA HÀNG CHÚNG TÔI ! </p><br>
	
	<a href="index.jsp" style=" background:#31a08a; padding: 10px 30px;color:white; font-weight:bold; border-radius:10px">Quay lại trang chủ</a>
	
	</div>
	
	
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