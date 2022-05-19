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
<script src="js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/Admin/libraries/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/Admin/libraries/ckfinder/ckfinder.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<script src="js/jquery.js"></script>
	     <script>
        $(document).ready(function(){
        	
        	
        	$("#madanhmuc").keypress(function() {
        		$("#madanhmuc_error").html('');
        	});
        	$("#tendanhmuc").keypress(function() {
        		$("#tendanhmuc_error").html('');
        	});
       
        	})
        </script>
</head>
<body>
<%
if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/Khoaluan/login.jsp");
} 
		String madanhmuc_error = "", tendanhmuc_error = "";
		if (request.getAttribute("madanhmuc_error") != null) {
			madanhmuc_error = (String) request.getAttribute("madanhmuc_error");
		}
		if (request.getAttribute("tendanhmuc_error") != null) {
			tendanhmuc_error = (String) request.getAttribute("tendanhmuc_error");
		}
		
		String madanhmuc = "", tendanhmuc = "";
		if (request.getAttribute("ID_News_Category") != null) {
			madanhmuc = (String) request.getAttribute("ID_News_Category");
		}
		if (request.getAttribute("Name_News_Category") != null) {
			tendanhmuc = (String) request.getAttribute("Name_News_Category");
		}
		
		%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ LOẠI TIN TỨC</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading"  style="background:#106356; color:black; font-weight:bold">Thêm Loại Tin Tức </div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/Khoaluan/News_Category_Servlet_Add" method="post">
										
											<div class="form-group">
												<label>Mã loại tin</label>
												<input class="form-control" type="text" name="ID_News_Category" id="madanhmuc" value="<%=madanhmuc %>" />
												<span style="color: red" id="madanhmuc_error"><%=madanhmuc_error %></span>
											</div>
											
											<div class="form-group">
												<label>Tên loại tin</label> 
												 <textarea rows="20" cols="20" id="editor" class="form-control" name="Name_News_Category"  value="<%=tendanhmuc%>"></textarea>										
												<span style="color: red" id="tendanhmuc_error"><%=tendanhmuc_error %></span>
											</div>
											
											
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm danh mục</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
											<a href="/Khoaluan/Admin/News_Category_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
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
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>