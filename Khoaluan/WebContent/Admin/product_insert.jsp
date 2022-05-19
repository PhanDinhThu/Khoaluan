<%@page import="Dao.GoodReceiptDAO"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Model.GoodReceipt"%>
<%@page import="Model.Category"%>
<%@page import="Model.Season"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

		String masanpham_error = "", madanhmuc_error = "", tensanpham_error = "", hinhanh_error = "", soluong_error = "",
				mota_error = "", kichthuoc_error= "", chatlieu_error="", giaban_error="",giamgia_error="", mua_error="";
		if (request.getAttribute("masanpham_error") != null) {
			masanpham_error = (String) request.getAttribute("masanpham_error");
		}
		if (request.getAttribute("madanhmuc_error") != null) {
			madanhmuc_error = (String) request.getAttribute("madanhmuc_error");
		}
		if (request.getAttribute("tensanpham_error") != null) {
			tensanpham_error = (String) request.getAttribute("email_error");
		}
		if (request.getAttribute("hinhanh_error") != null) {
			hinhanh_error = (String) request.getAttribute("hinhanh_error");
		}
		if (request.getAttribute("soluong_error") != null) {
			soluong_error = (String) request.getAttribute("soluong_error");
		}
		if (request.getAttribute("mota_error") != null) {
			mota_error = (String) request.getAttribute("mota_error");
		}
		if (request.getAttribute("kichthuoc_error") != null) {
			kichthuoc_error = (String) request.getAttribute("kichthuoc_error");
		}
		if (request.getAttribute("chatlieu_error") != null) {
			chatlieu_error = (String) request.getAttribute("chatlieu_error");
		}
		if (request.getAttribute("giaban_error") != null) {
			giaban_error = (String) request.getAttribute("giaban_error");
		}
		if (request.getAttribute("giamgia_error") != null) {
			giamgia_error = (String) request.getAttribute("giamgia_error");
		}
		if (request.getAttribute("mua_error") != null) {
			mua_error = (String) request.getAttribute("mua_error");
		}


		String masanpham = "", madanhmuc = "", tensanpham = "", hinhanh = "", soluong = "", mota = "", kichthuoc= "", chatlieu="",giaban="", giamgia="",mua="";
		if (request.getAttribute("ID_Product") != null) {
			masanpham = (String) request.getAttribute("ID_Product");
		}
		if (request.getAttribute("Danh_Muc") != null) {
			madanhmuc = (String) request.getAttribute("Danh_Muc");
		}
		if (request.getAttribute("Name_Product") != null) {
			tensanpham = (String) request.getAttribute("Name_Product");
		}
		if (request.getAttribute("Image") != null) {
			hinhanh = (String) request.getAttribute("Image");
		}
		if (request.getAttribute("Quantity") != null) {
			soluong = (String) request.getAttribute("Quantity");
		}
		if (request.getAttribute("Describe") != null) {
			mota = (String) request.getAttribute("Describe");
		}
		if (request.getAttribute("Size") != null) {
			kichthuoc = (String) request.getAttribute("Size");
		}
		if (request.getAttribute("Material") != null) {
			chatlieu = (String) request.getAttribute("Material");
		}
		 if (request.getAttribute("Price") != null) {
			giaban = (String) request.getAttribute("Price");
		}
		if (request.getAttribute("Sale") != null) {
			giamgia = (String) request.getAttribute("Sale");
		} 
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ SẢN PHẨM</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">Thêm Sản Phẩm</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/Khoaluan/ProductServlet_Add_Del" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<label>Mã sản phẩm</label>
												<span style="color: red"><%=masanpham_error %></span>
												<input class="form-control" type="text" name="ID_Product" value="<%=masanpham %>" />
											</div>
											<div class="form-group">
												<label>Mã danh mục</label>
												<select  class="form-control" name="Danh_Muc"> 
						                     <%  CategoryDAOImpl cateDAO= new CategoryDAOImpl();
								                List<Category> listCate= cateDAO.getList();
								                for(int i=0;i<listCate.size();i++){
								                String ID_Category= listCate.get(i).getID_Category();
		
							                 %>
 							                  <option value="<%=ID_Category%>" ><%=ID_Category%></option>
  							                 <%
							                  }
  							                 %> 
						                    </select>
											</div>
											 
											<div class="form-group">											
												<label>Tên sản phẩm</label> 
												<span style="color: red"><%=tensanpham_error %></span>
												<input class="form-control"  type="text" name="Name_Product" value="<%=tensanpham %>" />
											</div>
											
											<div class="form-group">
												<label>Chọn hình ảnh</label> 
												<span style="color: red"><%=hinhanh_error %></span>
												<input type="file" class="form-control" name="Image" value="<%=hinhanh %>" />
											</div>
											
											<div class="form-group">
												<label>Số lượng</label> 
												<span style="color: red"><%=soluong_error %></span>
												<input class="form-control" type="text" name="Quantity" value="<%=soluong %>" />
											</div>
											
											<div class="form-group">
												<label>Mô tả</label> 
												<span style="color: red"><%=mota_error %></span>
												<input class="form-control" type="text" name="Describe" value="<%=mota %>" />
											</div>
											
											 <div class="form-group">
												<label>Kích thước</label> 
												<span style="color: red"><%=kichthuoc_error %></span>
												<input class="form-control" type="text" name="Size" value="<%=kichthuoc %>" />
											</div> 
											<div class="form-group">
												<label>Chất liệu</label> 
												<span style="color: red"><%=chatlieu_error %></span>
												<input class="form-control" type="text" name="Material" value="<%=kichthuoc%>" />
											</div> 
											
											<div class="form-group">
												<label>Giá bán</label> 
												<span style="color: red"><%=giaban_error%></span>
												<input class="form-control" type="text" name="Price" value="<%=giaban%>" />
											</div>
											<div class="form-group">
												<label>Giảm giá</label> 
												<span style="color: red"><%=giamgia_error %></span>
												<input class="form-control" type="text" name="Sale" value="<%=giamgia %>" />
											</div>
											
											<div class="form-group">
												<label>Sản phẩm nổi bật tháng</label>
												<select  class="form-control" name="Mua"> 
						                     <%  SeasonDAO ssDAO= new SeasonDAO();
								                List<Season> listseason= ssDAO.getListSeason();
								                for(int i=0;i<listseason.size();i++){
								                	
								                int ID_Season= listseason.get(i).getID_Season();
								                String Name_Season = listseason.get(i).getName_Season();
		
							                 %>
 							                  <option value="<%=ID_Season%>" ><%=ID_Season%>  - <%=Name_Season%> </option>
  							                 <%
							                  }
  							                 %> 
						                    </select>
											</div>
											
											
							
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Phục hồi</button>
										    <a href="/Khoaluan/Admin/product_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>
										</form>
										<br />
									</div>
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
	<script src="assets/js/custom.js"></script>
</body>
</html>