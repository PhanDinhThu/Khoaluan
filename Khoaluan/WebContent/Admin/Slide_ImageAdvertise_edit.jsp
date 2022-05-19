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
	String anh1_error = "", anh2_error = "",anh3_error = "", anh4_error = "", anh5_error = "";
		if (request.getAttribute("anh1_error") != null) {
			anh1_error = (String) request.getAttribute("anh1_error");
		}
		if (request.getAttribute("anh2_error") != null) {
			anh2_error = (String) request.getAttribute("anh2_error");
		}
		if (request.getAttribute("anh3_error") != null) {
			anh3_error = (String) request.getAttribute("anh3_error");
		}
		if (request.getAttribute("anh4_error") != null) {
			anh4_error = (String) request.getAttribute("anh4_error");
		}
		if (request.getAttribute("anh5_error") != null) {
			anh5_error = (String) request.getAttribute("anh5_error");
		}
		

		String  anh1= "", anh2="", anh3 = "", anh4= "", anh5 = "";
		
		if (request.getAttribute("Image_Advertise1") != null) {
			anh1 = (String) request.getAttribute("Image_Advertise1");
		}
		if (request.getAttribute("Image_Advertise2") != null) {
			anh2 = (String) request.getAttribute("Image_Advertise2");
		}
		if (request.getAttribute("Image_Advertise3") != null) {
			anh3 = (String) request.getAttribute("Image_Advertise3");
		}
		if (request.getAttribute("Image_Advertise4") != null) {
			anh4 = (String) request.getAttribute("Image_Advertise4");
		}
		if (request.getAttribute("Image_Advertise5") != null) {
			anh5 = (String) request.getAttribute("Image_Advertise5");
		}

	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Slide Ảnh</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">Sửa Slide Ảnh</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/Khoaluan/Slide_ImageAdvertise_Sevlet_Update" method="post">
										
											<div class="form-group">
												<label>Hình ảnh 1</label> 
												<span style="color: red"><%=anh1_error %></span>
												<input class="form-control" type="text" name="Image_Advertise1" value="<%=request.getParameter("Image_Advertise1") %>"  />
											</div>
											
											<div class="form-group">
												<label>Hình ảnh 2</label> 
												<span style="color: red"><%=anh2_error %></span>
												<input class="form-control" type="text" name="Image_Advertise2" value="<%=request.getParameter("Image_Advertise2") %>"  />
											</div>
											
											<div class="form-group">
												<label>Hình ảnh 3</label> 
												<span style="color: red"><%=anh3_error %></span>
												<input class="form-control" type="text" name="Image_Advertise3" value="<%=request.getParameter("Image_Advertise3") %>" />
											</div>
											
											<div class="form-group">
												<label>Hình ảnh 4</label> 
												<span style="color: red"><%=anh4_error %></span>
												<input class="form-control" type="text" name="Image_Advertise4" value="<%=request.getParameter("Image_Advertise4") %>" />
											</div>
											
											<div class="form-group">
												<label>Hình ảnh 5</label> 
												<span style="color: red"><%=anh5_error %></span>
												<input class="form-control" type="text" name="Image_Advertise5" value="<%=request.getParameter("Image_Advertise5") %>"  />
											</div>
											
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_Advertise" value="<%=request.getParameter("ID_Advertise")%>"> 				
											<button type="submit" class="btn btn-success">Cập nhật</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
												<a href="Slide_ImageAdvertise_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>
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