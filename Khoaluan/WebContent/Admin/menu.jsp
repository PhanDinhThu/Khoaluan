<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Model.Account"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Furniture -  Admin Online sales site</title>

<link href="/Khoaluan/Admin/assets/css/bootstrap.css" " rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	 -->
</head>
<body>

 <%
		Account user = (Account) session.getAttribute("memberSession");
		 if(user == null){			
			response.sendRedirect("/Khoaluan/login.jsp");
			return;
		} 
		%> 
	<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			


			        
					<li><a <% if (user.getAccess() == 3) {											
						%>style="display:none" <%}else{ %> style=" display:block;"<%}%>  href="/Khoaluan/Admin/account_manager.jsp"><i
					class="fa fa-user fa-3x"></i> QUẢN LÝ THÀNH VIÊN</a></li>
			        <li><a <% if (user.getAccess() == 3) {											
						%>style="display:none" <%}else{ %> style=" display:block;"<%}%> class="active-menu"  href="/Khoaluan/Admin/category_manager.jsp"><i 
			        class="fa fa-qrcode fa-3x"></i>	QUẢN LÝ DANH MỤC</a></li>
			        <li><a  <% if (user.getAccess() == 3) {											
						%>style="display:none" <%}else{ %> style=" display:block;"<%}%> href="/Khoaluan/Admin/product_manager.jsp"><i
					class="fa fa-bar-chart-o fa-3x"></i> QUẢN LÝ SẢN PHẨM</a></li>
			        <li><a class="active-menu" href="/Khoaluan/Admin/invoice_manager.jsp"><i
					class="fa fa-edit fa-3x"></i> QUẢN LÝ ĐƠN HÀNG</a></li>
					 <li><a  href="/Khoaluan/Admin/qlymuasukien.jsp"><i
					class="fa fa-phone-square fa-3x"></i> QUẢN LÝ LIÊN HỆ </a></li>			        				
					 <li><a class="active-menu" href="/Khoaluan/Admin/News_manager.jsp"><i
					class="fa fa-external-link fa-3x"></i> QUẢN LÝ TIN TỨC </a></li>
					 <li><a  href="/Khoaluan/Admin/News_Category_manager.jsp"><i
					 class="fa fa-dashboard fa-3x"></i> QUẢN LÝ LOẠI TIN TỨC </a></li>
					 <li><a  class="active-menu" href="/Khoaluan/Admin/About_manager.jsp"><i
					class="fa fa-home fa-3x"></i> QUẢN LÝ GIỚI THIỆU </a>
					<li><a  href="/Khoaluan/Admin/Slide_ImageAdvertise_manager.jsp"><i 
					class="fa fa-picture-o fa-3x"></i> QUẢN LÝ SLIDE </a></li>						      
                    <li><a  <% if (user.getAccess() == 3) {											
						%>style="display:none" <%}else{ %> style=" display:block;"<%}%>  class="active-menu" href="/Khoaluan/Admin/season_manager.jsp"><i
					 class="fa fa-dashboard fa-3x"></i> QUẢN LÝ SỰ KIỆN </a></li>
					<li><a <% if (user.getAccess() == 3) {											
						%>style="display:none" <%}else{ %> style=" display:block;"<%}%> href="/Khoaluan/Admin/inventory_manager.jsp"><i 
			        class="fa fa-qrcode fa-3x"></i> QUẢN LÝ TỒN KHO</a></li>			       
					<li><a <% if (user.getAccess() == 3) {											
						%>style="display:none" <%}else{ %> style=" display:block;"<%}%> class="active-menu"  href="/Khoaluan/Admin/GoodReceipt.jsp"><i
					class="fa fa-edit fa-3x"></i> PHIẾU NHẬP </a></li>
					 <li><a   href="/Khoaluan/Admin/Statistic.jsp"><i
					class="fa fa-bar-chart-o fa-3x"></i> THỐNG KÊ DOANH THU</a></li>					
					<li><a  <% if (user.getAccess() == 3 ) {											
						%>style="display:none" <%}else{ %> style=" display:block;"<%}%> class="active-menu" href="/Khoaluan/Admin/thongkeloinhuan.jsp"><i 
					 class="fa-money fa fa-3x"></i> THỐNG KÊ LỢI NHUẬN</a></li> 	
					 
		</ul>

	</div>

	</nav>

	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="assets/js/morris/morris.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>