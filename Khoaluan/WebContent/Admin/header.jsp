<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Furniture -  Admin Online sales site</title>

<link href="/Khoaluan/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
<%

if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/Khoaluan/login.jsp");
} 

Account user = (Account)session.getAttribute("memberSession");
	
if(user != null){
	if(user.getAccess() != 1 && user.getAccess() !=3 && user.getAccess() != 4)
	return;
}
/* System.out.print("ggg"+user); */







%>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/Khoaluan/Admin/index.jsp">FURNITURE</a>
		</div>
		<div
		
			style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			
			<a  href="/Khoaluan/Admin/account_profile_admin.jsp"class="" style="color: white;margin-right:5px"><i class="fa fa-user" aria-hidden="true"></i>   <%=user.getFull_Name()%></a>&emsp;
			<a href="/Khoaluan/LoginServlet?enter=logout" class="" style="color: white;"><i class="fa fa-sign-out" aria-hidden="true"></i>  Đăng xuất</a>
			
		</div>
		</nav>
	</div>
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="assets/js/morris/morris.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>