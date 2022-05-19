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
<script type="text/javascript" src="<%=request.getContextPath() %>/Admin/libraries/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/Admin/libraries/ckfinder/ckfinder.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>

	<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/Khoaluan/login.jsp");
	} 
	String magioithieu_error = "",  hinhanh_error = "",	noidung_error = "", email_error = "", diachi_error = "", sodienthoai_error = ""  ;
		if (request.getAttribute("magioithieu_error") != null) {
			magioithieu_error = (String) request.getAttribute("magioithieu_error");
		}

		if (request.getAttribute("hinhanh_error") != null) {
			hinhanh_error = (String) request.getAttribute("hinhanh_error");
		}
		if (request.getAttribute("noidung_error") != null) {
			noidung_error = (String) request.getAttribute("noidung_error");
		}
		if (request.getAttribute("email_error") != null) {
			email_error = (String) request.getAttribute("email_error");
		}
		if (request.getAttribute("diachi_error") != null) {
			noidung_error = (String) request.getAttribute("diachi_error");
		}
		if (request.getAttribute("sodienthoai_error") != null) {
			sodienthoai_error = (String) request.getAttribute("sodienthoai_error");
		}
		String  magioithieu= "", hinhanh= "", noidung = "", email = "", diachi = "", sodienthoai ="";
		
		if (request.getAttribute("ID_About") != null) {
			magioithieu = (String) request.getAttribute("ID_About");
		}
		
		if (request.getAttribute("Image_About") != null) {
			hinhanh = (String) request.getAttribute("Image_About");
		}
		if (request.getAttribute("Content_About") != null) {
			noidung = (String) request.getAttribute("Content_About");
		}
		if (request.getAttribute("Email") != null) {
			email = (String) request.getAttribute("Email");
		}
		if (request.getAttribute("Address") != null) {
			diachi = (String) request.getAttribute("Address");
		}
		if (request.getAttribute("Phone") != null) {
			sodienthoai = (String) request.getAttribute("Phone");
		}
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Giới Thiệu</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">Sửa thông tin </div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/Khoaluan/AboutServlet_Update" method="post" enctype="multipart/form-data">
																																												
											<div class="form-group">
												<label>Hình ảnh</label> <br>
												<span style="color: red"><%=hinhanh_error %></span>
												<img src="<%=request.getParameter("Image_About") %>" style="width: 80px; margin-bottom: 10px">
												<input type="file" class="form-control" name="Image_About" value="<%=request.getParameter("Image_About") %>" >
											</div>	
											
											<div class="form-group">
												<label>Mô tả </label> 
												<span style="color: red"><%=noidung_error %></span>
												<textarea rows="20" cols="20" id="editor" name="Content_About"><%=request.getParameter("Content_About")%></textarea> 
											</div>
											
											<div class="form-group">
												<label>Email</label> 
												<span style="color: red"><%=email_error %></span>
												<input type="text" class="form-control" name="Email" value="<%=request.getParameter("Email") %>" />
											</div>
											
											<div class="form-group">
												<label>Địa chỉ</label> 
												<span style="color: red"><%=diachi_error %></span>
												<input type="text" class="form-control" name="Address" value="<%=request.getParameter("Address") %>" />
											</div>
											
											<div class="form-group">
												<label>Số điện thoại</label> 
												<span style="color: red"><%=sodienthoai_error %></span>
												<input type="text" class="form-control" name="Phone" value="<%=Integer.parseInt(request.getParameter("Phone"))%>" />
											</div>
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_About" value="<%=request.getParameter("ID_About")%>"> 				
											<button type="submit" class="btn btn-success">Cập nhật</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
												<a href="About_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>
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
	<script>
 var editor = CKEDITOR.replace('editor');
 CKFinder.setupCKEditor(editor, 'libraries/ckfinder/');
</script>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
</body>
</html>