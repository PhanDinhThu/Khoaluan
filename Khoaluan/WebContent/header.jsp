<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Season"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Model.Account"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Account"%>
<%@page import="Model.Category"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Furniture - Online sales site</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
     <!-- Bootstrap CSS -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <link href="css/css/main.css" rel="stylesheet">
    

</head>
<!-- <script>
$(document).ready(function(){
	  $("#btnSearchIndex").click(function(){
	    var value = $("#textSearchIndex").val().toLowerCase();
	    $(".tim-kiem").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	</script> -->

 
<style>
#pagination {
		display: flex;
		display: -webkit-flex; /* Safari 8 */
		flex-wrap: wrap;
		-webkit-flex-wrap: wrap; /* Safari 8 */
		justify-content: center;
		-webkit-justify-content: center;
	}
</style>

<body>

	<%
		CategoryDAOImpl danhMucDAO = new CategoryDAOImpl();
		Cart cart = new Cart();
		if( session.getAttribute("cart")!=null)
		cart = (Cart) session.getAttribute("cart");
	
	%>
<%

	Account user = (Account)session.getAttribute("memberSession");
	String full_Name;
	if(user!=null){
		full_Name = user.getFull_Name();
	}
	else {
		full_Name ="";
	}
%>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary1 py-1 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center h-100">
                   <a href="#" class="" data-toggle="dropdown"  style="color: #31a08a" ><i class="fa fa-phone" aria-hidden="true"></i> Hotline: 0367396802</a>       
                </div>
            </div>
            
            <div class="col-lg-6 text-center text-lg-right">
                 <div class="d-inline-flex align-items-center">                
                 <div class="nav-item dropdown" >
                                <a href="#" class="" data-toggle="dropdown"  style="color: #31a08a" ><i class="fa fa-envelope" aria-hidden="true"></i> furniture230900@gmail.com</a>                                
                            </div>                  
                   </div>           
            </div>
        </div>
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Furniture</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
                <form method="get" action="/Khoaluan/shop2.jsp">
                    <div class="input-group">
                        <input type="text" id="text-Search" name="ID_Seach" class="form-control"  placeholder="Nhập thông tin tìm kiếm....">
                        <div id="btnSearch" class="input-group-append">
                            <span id="err11" class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
           
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                    <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>DANH MỤC SẢN PHẨM</h6>
                   
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
               

                         <%
					for (Category Parent_Category : danhMucDAO.getListParentCategory()) {
				%>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                    <div class="navbar-nav w-100">
                     
				<div class="panel panel-default">
					<div class="panel-heading">

						<%
							for (Category danh_muc_con : danhMucDAO.getListSubCategory(Parent_Category.getID_Category())) {
						%>

						<%-- <%=Parent_Category.getName_Category()%> --%>

					</div>
					<div class="panel-body">
						<ul>
							<li><a
								href="shop1.jsp?ID_Category=<%=danh_muc_con.getID_Category()%>" class="nav-item nav-link"><%=danh_muc_con.getName_Category()%></a></li>

							<%
								}
							%>
						</ul>
					</div>
				</div>
				<%
					}
				%>
                     
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                        <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link active">TRANG CHỦ</a>
                            <a href="shop.jsp" class="nav-item nav-link">SẢN PHẨM</a>
                            <a href="about.jsp" class="nav-item nav-link">GIỚI THIỆU</a>
                            <a href="bog.jsp" class="nav-item nav-link">TIN TỨC</a>                           
                            <a href="contact.jsp" class="nav-item nav-link">LIÊN HỆ</a>
                        </div>
                        
                        <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                <div class="nav-item dropdown">
                                <a href="#" class="" data-toggle="dropdown" <%if(user!=null){%> style="display:block;color: white" <%}
                        else{ %> style="display:none"<%} %>> <i class="fa fa-user" style="color:#31a08a"> </i>  <%=full_Name%> </a>
                                <div class="dropdown-menu bg-primary rounded-0 border-0 m-0" <%if(user==null){%> style="display:none" <%} %>>
                                    <a href="/Khoaluan/profile.jsp" class="dropdown-item">Thông tin tài khoản</a>
                                    <a href="/Khoaluan/invoiceDetail.jsp" class="dropdown-item">Thông tin đơn hàng</a>
                                    <a href="/Khoaluan/invoiceHistory.jsp" class="dropdown-item">Lịch sử mua hàng</a>
                                    <a href="LoginServlet?enter=logout" class="dropdown-item">Đăng xuất</a>
                                </div>
                            </div>
                 <div class="nav-item dropdown" >
                                <a href="#" class="" data-toggle="dropdown" <%if(user!=null){%> style="display:none; color: black " <%}
                        else{ %> style="display:block; color: white"<%} %>> <i class="fa fa-user" style="color:#31a08a" ></i>&ensp;TÀI KHOẢN</a>
                                <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                    <a href="login.jsp" class="dropdown-item">Đăng nhập</a>
                                    <a href="register.jsp" class="dropdown-item">Đăng ký</a>
                                </div>
                            </div>                  
                   </div> &emsp;          
                            <a href="" class="btn px-0">
                                <i class="fas fa-heart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>
                            <a href="cart.jsp" class="btn px-0 ml-3">
                                <i class="fas fa-shopping-cart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;"><%=cart.countItem()%></span>
                            </a>
                            
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->



  
</body>

</html>