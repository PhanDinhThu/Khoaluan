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
<link href="/TKhoaluan/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
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
	String matintuc_error = "", madanhmuc_error = "",tentintuc_error = "", hinhanh_error = "",
				ngaydang_error = "",mota_error="", chitiet_error="";
		if (request.getAttribute("matintuc_error") != null) {
			matintuc_error = (String) request.getAttribute("matintuc_error");
		}
		 if (request.getAttribute("madanhmuc_error") != null) {
			madanhmuc_error = (String) request.getAttribute("madanhmuc_error");
		} 
		if (request.getAttribute("tentintuc_error") != null) {
			tentintuc_error = (String) request.getAttribute("tentintuc_error");
		}
		if (request.getAttribute("hinhanh_error") != null) {
			hinhanh_error = (String) request.getAttribute("hinhanh_error");
		}
		if (request.getAttribute("ngaydang_error") != null) {
			ngaydang_error = (String) request.getAttribute("ngaydang_error");
		}
		if (request.getAttribute("mota_error") != null) {
			mota_error = (String) request.getAttribute("mota_error");
		}
		if (request.getAttribute("chitiet_error") != null) {
			chitiet_error = (String) request.getAttribute("chitiet_error");
		}
	
		

		String  matintuc= "", madanhmuc="", tentintuc = "", hinhanh= "", ngaydang = "", mota="", chitiet="";
		
		if (request.getAttribute("ID_News") != null) {
			matintuc = (String) request.getAttribute("ID_News");
		}
		 if (request.getAttribute("Danh_Muc_News") != null) {
			madanhmuc = (String) request.getAttribute("Danh_Muc_News");
		} 
		if (request.getAttribute("Name_News") != null) {
			tentintuc = (String) request.getAttribute("Nam_News");
		}
		if (request.getAttribute("Image_Newss") != null) {
			hinhanh = (String) request.getAttribute("Image_News");
		}
		if (request.getAttribute("Posting_Date") != null) {
			ngaydang = (String) request.getAttribute("Posting_Date");
		}
		if (request.getAttribute("Describe_News") != null) {
			mota = (String) request.getAttribute("Describe_News");
		
		}
		if (request.getAttribute("Detail_News") != null) {
			chitiet = (String) request.getAttribute("Detail_News");
		}
		
		
		

	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Tin Tức</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">Sửa tin tức</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/Khoaluan/NewsServlet_Update" method="post" enctype="multipart/form-data">
										 <div class="form-group">											
												<label>Mã danh mục</label> 
												<span style="color: red"><%=madanhmuc_error%></span>
												<input class="form-control" type="text" name="Danh_Muc_News" value="<%=request.getParameter("Danh_Muc_News") %>" />
											</div>  
											
											<div class="form-group">
												<label>Tên tin tức</label> 
												<span style="color: red"><%=tentintuc_error %></span>
												<input class="form-control" type="text" name="Name_News" value="<%=request.getParameter("Name_News") %>" />
											</div>
											<div class="form-group">
												<label>Hình ảnh</label> <br>
												<span style="color: red"><%=hinhanh_error %></span>
												<img src="<%=request.getParameter("Image_News") %>" style="width: 80px; margin-bottom: 10px">
												<input type="file" class="form-control" name="Image_News" value="<%=request.getParameter("Image_News") %>" >
											</div>																														
											<div class="form-group">
												<label>Mô tả</label> 
												<span style="color: red"><%=mota_error %></span>
												<input class="form-control" type="text" name="Describe_News" value="<%=request.getParameter("Describe_News")%>" />
											</div>
											<div class="form-group">
												<label>Mô tả chi tiết</label> 
												<span style="color: red"><%=chitiet_error %></span>
												 <textarea rows="20" cols="20" id="editor" class="form-control" name="Detail_News" > <%=request.getParameter("Detail_News")%></textarea>
											</div>
																				
											
											
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_News" value="<%=request.getParameter("ID_News")%>"> 				
											<button type="submit" class="btn btn-success">Sửa</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
												<a href="News_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>
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