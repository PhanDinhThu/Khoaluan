<%@page import="Model.InvoiceDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="Model.Category"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.AboutDAOImpl"%>
<%@page import="Dao.News_CategoryDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="Model.About"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Furniture -  Admin Online sales site</title>

<link href="/Khoaluan/assets/css/bootstrap.css" rel="stylesheet" />
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
		AboutDAOImpl abDAO = new AboutDAOImpl();
		ArrayList<About> list = abDAO.getList();
		TinhTrangDAO ttDAO = new TinhTrangDAO();
%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ GIỚI THIỆU</h2>
						 <div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							
						</div> 				
					</div>
				</div>
		
				<hr />

				<div class="row">
					<div class="col-md-12">
				
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">QUẢN LÝ GIỚI THIỆU</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example2">
										<thead>
											<tr>
												<th>Mã giới thiệu</th>																								
												<th>Hình Ảnh</th>											
												<th>Mô tả</th>
												<th>Email</th>
												<th>Địa chỉ</th>
												<th>Số điện thoại</th>											
												<th>Chức năng</th>
											</tr>
										</thead>
										<tbody>
										<%
												for (About ab : list) {
											%>
											<tr class="odd gradeX">
												<td><%=ab.getID_About()%></td>																								
												<td><img style="width:60px; height:auto" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=ab.getImage_About()%>" alt="<%=ab.getImage_About()%>" alt="" /></td>
												<td><%=ab.getContent_About()%></td>		
												<td><%=ab.getEmail()%></td>
												<td><%=ab.getAddress()%></td>	
												<td><%=ab.getPhone()%></td>								
												<td class="center" style="text-align: center;">
												<a class="btn btn-info btn-xs" style="margin-bottom:5px" href="/Khoaluan/Admin/About_edit.jsp?action=Update&ID_About=<%=ab.getID_About()%>&Image_About=${pageContext.request.contextPath}/DisplayImage?imageId=<%=ab.getImage_About()%>&Content_About=<%=ab.getContent_About()%>&Email=<%=ab.getEmail()%>&Address=<%=ab.getAddress() %>&Phone=<%=ab.getPhone() %>">Cập  nhật</a> 
													 
													 </td>
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
				</div>

			</div>

		</div>
	</div>
	

	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example2').dataTable();
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>