<%@page import="Model.InvoiceDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Slide_ImageAdvertise"%>
<%@page import="Model.Category"%>
<%@page import="Dao.Slide_ImageAdvertiseDAOImpl"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="Model.Empty"%>
<%@page import="Dao.TinhTrangDAO"%>
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
     Slide_ImageAdvertiseDAOImpl adDAO = new Slide_ImageAdvertiseDAOImpl();
		ArrayList<Slide_ImageAdvertise> list = adDAO.getList();
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ SLIDE ẢNH</h2>
						
						
						<!-- comment -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>					
					</div>
				</div>
		
				<hr />

				<div class="row">
					<div class="col-md-12">
				
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">QUẢN LÝ SLIDE ẢNH</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example2">
										<thead>
											<tr>
												<th>Mã slide</th>
												<th>Hình ảnh 1</th>
												<th>Hình ảnh 2</th>
												<th>Hình ảnh 3</th>
												<th>Hình ảnh 4</th>
												<th>Hình ảnh 5</th>									
												<th>Chức năng</th>
											</tr>
										</thead>
										<tbody>
										<%
												for (Slide_ImageAdvertise ad : list) {
											%>
											<tr class="odd gradeX">
												<td><%=ad.getID_Advertise()%></td>																						
												<td><img style="width:60px; height:auto" src="<%=ad.getImage_Advertise1()%>" alt="" /></td>
												<td><img style="width:60px; height:auto" src="<%=ad.getImage_Advertise2()%>" alt="" /></td>
												<td><img style="width:60px; height:auto" src="<%=ad.getImage_Advertise3()%>" alt="" /></td>
												<td><img style="width:60px; height:auto" src="<%=ad.getImage_Advertise4()%>" alt="" /></td>
												<td><img style="width:60px; height:auto" src="<%=ad.getImage_Advertise5()%>" alt="" /></td>
												
												<td class="center" style="text-align: center;">
													<a href="/Khoaluan/Admin/Slide_ImageAdvertise_edit.jsp?action=Update&ID_Advertise=<%=ad.getID_Advertise()%>&Image_Advertise1=<%=ad.getImage_Advertise1()%>&Image_Advertise2=<%=ad.getImage_Advertise2()%>&Image_Advertise3=<%=ad.getImage_Advertise3() %>&Image_Advertise4=<%=ad.getImage_Advertise4() %>&Image_Advertise5=<%=ad.getImage_Advertise5() %>"												
													class="btn btn-info btn-xs" style="margin-bottom:5px">Cập nhật</a> 													 
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