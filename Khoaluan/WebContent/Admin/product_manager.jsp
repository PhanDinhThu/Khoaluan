<%@page import="Model.InvoiceDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="Model.Category"%>
<%@page import="Dao.ProductDAOImpl"%>
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
		ProductDAOImpl proDAO = new ProductDAOImpl();
		ArrayList<Product> listPro = proDAO.getList();
		CategoryDAOImpl cateDAO = new CategoryDAOImpl();
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
						<h2>QUẢN LÝ SẢN PHẨM</h2>
						
						
						<!-- comment -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/Khoaluan/Admin/product_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm Sản Phẩm</a>
						</div>
						
					</div>
				</div>
		
				<hr />

				<div class="row">
					<div class="col-md-12">
				
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">QUẢN LÝ SẢN PHẨM</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example2">
										<thead>
											<tr>
												<th>Mã Sản Phẩm</th>
												<th>Mã Danh Mục</th>
												<th>Tên Sản Phẩm</th>
												<th>Hình Ảnh</th>
												<th>Số Lượng</th>
												<th>Mô Tả</th>
												<th>Kích thước</th>
												<th>Chất liệu</th>
												<th>Giá Bán</th>
												<th>Giảm Giá</th>												
												<th>Sự kiện nổi bật</th>
												<th>Chức năng</th>
											</tr>
										</thead>
										<tbody>
										<%
												for (Product pro : listPro) {
											%>
											<tr class="odd gradeX">
												<td><%=pro.getID_Product()%></td>
												<td><%=cateDAO.getIdCate(pro.getDanh_Muc().getID_Category()).getID_Category()%></td>
												<td><%=pro.getName_Product()%></td>
												<td><img style="width:60px; height:auto" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=pro.getImage()%>" alt="<%=pro.getImage()%>" alt="" /></td>
												<td><%=pro.getQuantity()%></td>
												<td><%=pro.getDescribe()%></td>
												<td><%=pro.getSize()%></td>
												<td><%=pro.getMaterial()%></td>
												<td><%=pro.getPrice()%></td>
												<td><%=pro.getSale()%></td>																					
												<td><%=seasonDAO.getIdSeason(pro.getMua().getID_Season()).getName_Season()%></td>
												<td class="center" style="text-align: center;">
													<a href="/Khoaluan/Admin/product_edit.jsp?action=Update&ID_Product=<%=pro.getID_Product()%>&Danh_Muc=<%=cateDAO.getIdCate(pro.getDanh_Muc().getID_Category()).getID_Category()%>&Name_Product=<%=pro.getName_Product() %>
													&Image=${pageContext.request.contextPath}/DisplayImage?imageId=<%=pro.getImage()%>&Quantity=<%=pro.getQuantity() %>&Describe=<%=pro.getDescribe() %>&Size=<%=pro.getSize() %>&Material=<%=pro.getMaterial() %>&Price=<%=pro.getPrice()%>&Sale=<%=pro.getSale()%>&Mua=<%=seasonDAO.getIdSeason(pro.getMua().getID_Season()).getID_Season()%>"
												
													class="btn btn-info btn-xs" style="margin-bottom:5px">Sửa</a> 
													  <a <% String ID_Product = pro.getID_Product();
													 if (ttDAO.checkEmptyProduct(ID_Product) == true) {											
												        %>style="display:none" <%}
                                                    else{ %> style=" display:block;color:black"
													<%
													}
												%>  href="/Khoaluan/ProductServlet_Delete?action=Delete&ID_Product=<%=pro.getID_Product()%>" onclick="return confirm('Bạn có chắc chắn xóa sản phẩm <%=pro.getName_Product() %> không ?')"
														 
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