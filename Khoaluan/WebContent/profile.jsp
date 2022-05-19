<%@page import="Model.AccountSession"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
  <link href="css/css/main.css" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        
        <script>
        $(document).ready(function(){
        	
        	
        	$("#MatKhau").keypress(function() {
        		$("#password_error").html('');
        	});
        	$("#FullName").keypress(function() {
        		$("#fullname_error").html('');
        	});
        	$("#Address").keypress(function() {
        		$("#address_error").html('');
        	});
        	$("#SDT").keypress(function() {
        		$("#phone_error").html('');
        	});
        	})
        </script>
</head>
<body>
<%if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/Khoaluan/login.jsp");
} 
	


	 String password_error = "", fullname_error = "", phone_error = "",
				address_error = "";
		if (request.getAttribute("password_error") != null) {
			password_error = (String) request.getAttribute("password_error");
		}
		
		if (request.getAttribute("fullname_error") != null) {
			fullname_error = (String) request.getAttribute("fullname_error");
		}
		if (request.getAttribute("phone_error") != null) {
			phone_error = (String) request.getAttribute("phone_error");
		}
		if (request.getAttribute("address_error") != null) {
			address_error = (String) request.getAttribute("address_error");
		}
		
		/* String  password = "", phone = "", fullname = "", address = "";
		
		if (request.getAttribute("Password") != null) {
			password = (String) request.getAttribute("Password");
		}
		
		if (request.getAttribute("Fullname") != null) {
			fullname = (String) request.getAttribute("Fullname");
		}
		if (request.getAttribute("Phone") != null) {
			phone = (String) request.getAttribute("Phone");
		}
		if (request.getAttribute("Address") != null) {
			address = (String) request.getAttribute("Address");
		}  */
	
	%>

<jsp:include page="header.jsp"></jsp:include>

	  <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang chủ</a>
                    <a class="breadcrumb-item text-dark" href="ForgotPassword.jsp">Thông tin cá nhân</a>                  
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
	<div>

	<div class="table-content" style=" width:60%; margin:auto; background: #f7f7f0; ">
		<form action="/Khoaluan/EditProfile" method="post"> <br>
			<h2 class="Title-edit" style="text-align:center">THÔNG TIN CÁ NHÂN</h2><br>
	
		<%
		
			AccountDAOImpl memberDAO = new 	AccountDAOImpl();
			Account member = new Account();
			member = (Account) session.getAttribute("memberSession");
			
			/* member = memberDAO.getAccount(AccountSession.Username); */
		
			
			
		%>
			
		<p style="font-weight:bold; margin-left: 10%">Tên Tài khoản</p>
	   <input id="FullName" type="text"
			placeholder="Mời bạn nhập họ và tên" style="border-radius: 10px;" name="Fullname"
			value="<%=member.getFull_Name()%>">
	
		<span id="fullname_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert" ><%=fullname_error %></span>
			
		
		
		<p style="font-weight:bold; margin-left: 10%">Tên Tài khoản</p>
		<input id="Username" class="col-10" type="text" style="background:#DDDDDD; border-radius: 10px;"
			placeholder="" name="Username"
			value="<%=member.getUsername()%>"readonly>
			
			<p style="font-weight:bold; margin-left: 10%">Mật Khẩu</p>
		<input id="MatKhau" class="col-10" type="password"
			placeholder="Mời bạn nhập mật khẩu" name="Password"
			value="<%=member.getPassword()%>">
	
		<span id="password_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert"><%=password_error %></span>	
		<p style="font-weight:bold; margin-left: 10%">Email</p>
		<input style="background: #DDDDDD; border-radius: 10px;" color: black;"
			class="col-10" type="email" id="Email" name="Email"
			placeholder="" value="<%=member.getEmail()%>"
			readonly>
		
				
		<p style="font-weight:bold; margin-left: 10%">Địa chỉ</p>
		<input id="Address" class="col-10" type="text"
			placeholder="Mời bạn nhập họ và tên" style="border-radius: 10px;" name="Address"
			value="<%=member.getAddress()%>">
		<span id="address_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert" ><%=address_error %></span>
		
		
		<p style="font-weight:bold; margin-left: 10%">Số điện thoại</p>
		<input id="SDT" class="col-10" type="text"
			placeholder="Mời bạn nhập số điện thoại của bạn" style="border-radius: 10px;" name="Phone"
			value="<%=member.getSDT()%>">
		<p id="phone_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert"><%=phone_error %></p>
		<input type="hidden" name="action" value="Update1"> 
		<input type="hidden" name="ID_Account" value="<%=member.getID_Account()%>"> 
			<button type="submit"  id="submit-edit" style="background: #31a08a;border: 0 solid black;color: white;border-radius: 8px;padding: 10px 60px;margin-left:10%;color:black" class="button-submit">Lưu</button>
			<button type="reset" class="btn btn-primary" style="background: #31a08a; border: 0 solid black; padding: 10px 30px; color: white;margin-left: 10px;margin-bottom: 10px;border-radius: 8px; margin-left:10%;color:black">Khôi phục</button>
			<a href="index.jsp"  style="background: red; border: 0 solid black; padding: 13px 20px; color: white;margin-left: 10px;margin-bottom: 10px;border-radius: 20px; margin-left:10%;color:black">Thoát</a>
		
		 </form> 
	</div>
	
		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>