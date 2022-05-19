
<%@page import="Dao.News_CategoryDAOImpl"%>
<%@page import="Model.News_Category"%>
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
<script type="text/javascript" src="<%=request.getContextPath() %>/Admin/libraries/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/Admin/libraries/ckfinder/ckfinder.js"></script>
</head>
<body>
<%
if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/Khoaluan/login.jsp");
	
} 

		String matintuc_error = "", madanhmuc_error = "", tentintuc_error = "", hinhanh_error = "", ngaydang_error ="",
				mota_error = "",chitiet_error = "";
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
		
		

		String matintuc = "", madanhmuc = "", tentintuc = "", hinhanh = "", ngaydang ="", mota = "",chitiet = "";
		if (request.getAttribute("ID_News") != null) {
			matintuc = (String) request.getAttribute("ID_News");
		}
		if (request.getAttribute("Danh_Muc_News") != null) {
			madanhmuc = (String) request.getAttribute("Danh_Muc_News");
		}
		if (request.getAttribute("Name_News") != null) {
			tentintuc = (String) request.getAttribute("Name_News");
		}
		if (request.getAttribute("Image_News") != null) {
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
						<h2>QUẢN LÝ TIN TỨC</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">Thêm Tin Tức</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/Khoaluan/NewsServlet_Add" method="post" enctype="multipart/form-data">
										
											<div class="form-group">
												<label>Mã tin tức</label><br>
												<span style="color: red"><%=matintuc_error %></span>
												<input class="form-control" type="text" name="ID_News" value="<%=matintuc %>" />
											</div>
											<div class="form-group">
												<label>Mã loại tin</label>
												<select  class="form-control" name="Danh_Muc_News"> 
						                     <%  News_CategoryDAOImpl newsDAO= new News_CategoryDAOImpl();
								                List<News_Category> listnews= newsDAO.getList();
								                for(int i=0;i<listnews.size();i++){
								                								          
								                String ID_News_Category = listnews.get(i).getID_News_Category();
		
							                 %>
 							                  <option value="<%=ID_News_Category%>" ><%=ID_News_Category%></option>
  							                 <%
							                  }
  							                 %> 
						                    </select>
											</div>
											
											
											<div class="form-group">											
												<label>Tên Tin Tức</label><br>
												<span style="color: red"><%=tentintuc_error %></span>
												<input class="form-control"  type="text" name="Name_News" value="<%=tentintuc %>" />
											</div>							
                    
											<div class="form-group">
												<label>Chọn hình ảnh</label><br>
												<span style="color: red"><%=hinhanh_error %></span>
												<input type="file" class="form-control" name="Image_News" value="<%=hinhanh %>" />
											
											</div>
																
											<div class="form-group">
												<label>Ngày đăng</label><br>
												<span style="color: red"><%=ngaydang_error %></span>
												<input class="form-control" name="Posting_Date" type="date"  value="<%=ngaydang %>" />												
											</div>
											
											<div class="form-group">
												<label>Mô tả</label><br>
												<span style="color: red"><%=mota_error %></span>
												<input class="form-control" name="Describe_News" type="text" " value="<%=mota %>" />												
											</div>
											
											<div class="form-group">
												<label>Mô tả chi tiết</label><br>
												<span style="color: red"><%=chitiet_error %></span>
												<textarea rows="20" cols="20" id="editor" type="text" class="form-control" name="Detail_News">	 <%=chitiet%></textarea>									
											</div>
											
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Phục hồi</button>
										    <a href="/Khoaluan/Admin/News_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>
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
	<script>
 var editor = CKEDITOR.replace('editor');
 CKFinder.setupCKEditor(editor, 'libraries/ckfinder/');
</script>
</body>
</html>