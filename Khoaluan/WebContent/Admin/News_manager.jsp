<%@page import="Model.InvoiceDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.News"%>
<%@page import="Model.News_Category"%>
<%@page import="Dao.NewsDAOImpl"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.News_CategoryDAOImpl"%>
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
		NewsDAOImpl newsDAO = new NewsDAOImpl();
		ArrayList<News> listNews = newsDAO.getList();
		News_CategoryDAOImpl cateDAO = new News_CategoryDAOImpl();
		SeasonDAO seasonDAO = new SeasonDAO();
		InvoiceDetailDAOImpl indeDAO = new InvoiceDetailDAOImpl();
		ArrayList<InvoiceDetail> listInvoiceDetail3 = indeDAO.getListInvoiceDetail();
		
		TinhTrangDAO ttDAO = new TinhTrangDAO();
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ TIN TỨC</h2>
						
						
						<!-- comment -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/Khoaluan/Admin/News_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm Tin Tức</a>
						</div>
						
					</div>
				</div>
		
				<hr />
         <div class="row">
					<div class="col-md-12">
				
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">QUẢN LÝ TIN TỨC</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example2">
										<thead>
											<tr>
												<th>Mã Tin Tức</th>
												<th>Mã Loại Tin Tức</th>
												<th>Tên Tin Tức</th>
												<th>Hình Ảnh</th>
												<th>Ngày đăng</th>
												<th>Mô Tả</th>
												<th>Mô tả chi tiết</th>								
											</tr>
										</thead>
										<tbody>
										<%
												for (News news : listNews) {
											%>
											<tr class="odd gradeX">
												<td><%=news.getID_News()%></td>
												<td><%=cateDAO.getIdNews_Category(news.getDanh_Muc_News().getID_News_Category()).getID_News_Category()%></td>
												<td><%=news.getName_News()%></td>
												<td><img style="width:60px; height:auto" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=news.getImage_News()%>" alt="<%=news.getImage_News()%>" alt="" /></td>
							
												<td><%=news.getPosting_Date()%></td>
												<td><%=news.getDescribe_News()%></td>
												<td><%=news.getDetail_News()%></td>										
												<td class="center" style="text-align: center;">
													<a href="/Khoaluan/Admin/News_update.jsp?action=Update&ID_News=<%=news.getID_News()%>&Danh_Muc_News=<%=cateDAO.getIdNews_Category(news.getDanh_Muc_News().getID_News_Category()).getID_News_Category()%>&Name_News=<%=news.getName_News()%>&Image_News=${pageContext.request.contextPath}/DisplayImage?imageId=<%=news.getImage_News()%>&Posting_Date=<%=news.getPosting_Date()%>&Describe_News=<%=news.getDescribe_News()%>&Detail_News=<%=news.getDetail_News()%>"
												
													class="btn btn-info btn-xs" style="margin-bottom:5px">Sửa</a> 
													  <a  href="/Khoaluan/NewsServlet_Del?action=Delete&ID_News=<%=news.getID_News()%>" onclick="return confirm('Bạn có chắc chắn xóa tin tức <%=news.getID_News()%> không ?')"
														 
													 class="btn btn-warning btn-xs">Xóa</a>  
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