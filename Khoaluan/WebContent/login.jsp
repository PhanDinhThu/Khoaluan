<%@page import="Dao.AccountDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
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
 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
		
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0&appId=327890844754184&autoLogAppEvents=1"></script>
		
		<script>
		
$(document).ready(function(){
	
	$("#userregister").keypress(function() {
		$("#userregister-error").html('');
	});
	$("#passregister").keypress(function() {
		$("#passregister-error").html('');
	});
	
	function isEmail(email) {
		var isValid = false;
		var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(regex.test(email)) {
			isValid = true;
		}
		return isValid;
	}
	$('#forgot-password').click(function(){
		$("#forgotModal").modal('show')
		$("#emailForgot").keypress(function() {
		$("#alert-emailForgot").html('')
		$("#alert-emailSuccess").html('')
		$(".container-login").css('opacity', '0.9');
		})
 		
		 $('#sendForgot').click(function(){
			 	var flag=0
				var email= $("#emailForgot").val()
				if(email.trim() == ""){
					$("#alert-emailForgot").html('(* Vui lòng nhập email! *)');
					flag=1
				}
				 if(email.trim() !="" && isEmail(email)==false){
					$("#alert-emailForgot").html('(* E-mail không hợp lệ *)');
					flag=1
				} 
				if(flag==0){
						 $.ajax({
							type : "post",
							url : "/Khoaluan/forgotPassword",
							data : {
								email : email
							},
							success : function(response) {
								console.log(response)
								if (response == "success") {
									$("#alert-emailSuccess").html('(*  Mail đã được gửi. Vui lòng kiểm tra email của bạn! *)')
									$("#sendForgot").css('display', 'none')
									$("#clo").css('display', 'block')
								
									
								}
								else if (response == "fail"){
										
									$("#alert-emailForgot").html('(* Email không hợp lệ! *)')
								}
								
							}
						}); 
				}
		})  
	})
		


})
 
</script>
</head>
<body>
<div id="fb-root" ></div>
	<%
		
		String error = "";
		if (request.getAttribute("error") != null) {
			error = (String) request.getAttribute("error");
		}
		String usernamex = "", passwordx = "";
		if (request.getAttribute("usernamex") != null) {
			usernamex = (String) request.getAttribute("usernamex");
		}
		if (request.getAttribute("passwordx") != null) {
			passwordx = (String) request.getAttribute("passwordx");
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>



	<section id="form-login-ts">
	<div class="container-login">
				<div class="login-form">
					<h2>ĐĂNG NHẬP</h2>
					<form action="LoginServlet" method="post">
						
							<input type="text" placeholder="Tài Khoản" name="ten_dang_nhap"
								value="<%=usernamex%>" style="margin-bottom:3%" /> <br>
							<input type="password" placeholder="Mật Khẩu" name="mat_khau" value="<%=passwordx%>" style="margin-bottom:3%" />
								<p style="color: red; margin-left:7%"><%=error%>
							<input type="hidden" name="access" value="2" />
							<input type="hidden" name="status" value="1" />
						     
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							 <a id="forgot-password" href="#" 
									style="text-align:left; text-decoration:underline">Quên mật khẩu?</a>
							<div class="row margin-bottom-5">
								
							</div>
							<button type="submit" class="btn btn-default" >Đăng nhập</button>
							<!-- <div class="fb-login-button btn-fb"  data-width="1000px" data-size="large" 
							data-button-type="login_with" data-auto-logout-link="false" data-use-continue-as="false"
							 scope="public_profile,email" onlogin="checkLoginState();"></div> -->
							 <div style="padding-left:20%" class="fb-login-button btn-fb" data-width="1000px" data-size="large" 
							data-button-type="login_with" data-auto-logout-link="false" data-use-continue-as="false"
							 scope="public_profile,email" onlogin="checkLoginState();"></div>
                              
                         <div style="margin-bottom:5%; margin-top:2%">
				         <a  id="register-click" href="register.jsp"> Bạn chưa có tài khoản? Đăng ký ngay ! </a>
				         </div>
				     
					</form>
				</div>
				
			</div>
		
	</section>


	<script>
	  function statusChangeCallback(response) {
	    console.log('statusChangeCallback');
	    console.log(response);
	    if (response.status === 'connected') {
	      testAPI();
	    } else {
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this app.';
	    }
	  }
	
	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	    FB.api('/me',{fields: ' name, email'}, function(response) {
	    	  console.log(response);
	    	  window.location.href = 'LoginFacebook?action=Face&name='+response.name+'&email='+response.email+'&id='+response.id;
	    });
	  }
	
	  window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '327890844754184',
	    cookie     : true, 
	    xfbml      : true, 
	    version    : 'v2.9' 
	  });
	
	
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
	
	  };
	
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
	
	  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	    });
	  }
	</script>
	
    <jsp:include page="footer.jsp"></jsp:include>
    <div class="modal fade" id="forgotModal" role="dialog" style="display: none;width:50%; margin:auto">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content" style="border: 1px solid lightgray">
			<div class="modal-header" style="background-color: #F5F5F5">
						<h5 class="modal-title" style="color:black" >Quên mật khẩu</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
					<p>Vui lòng nhập địa chỉ email của bạn!</p>
					<input type="text" name="email" style="width:100%;border-radius: 5px; border:1px solid lightgray;padding:5px" 
					placeholder="E-mail" id="emailForgot" />
					<span class="alert" style="font-size:15px; padding:10px 0px" id="alert-emailForgot"></span>
					<span class="alert" style="font-size:15px; color:green; padding: 10px 0px" id="alert-emailSuccess"></span>
					<button  style="width:20%;margin-top: 30px;margin-bottom:30px; text-align: center; margin-left: 35%" class="btn btn-success" id="sendForgot">GỬI</button>
					 <button type="button" id ="clo"class="btn btn-default" style="margin-left:30px; display:none" data-dismiss="modal">Đóng</button>
					</form>
				</div>
				
			</div>
		</div>
	</div> 
			<div class="modal fade" id="resendModal" role="dialog" style="display: none">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
			<div class="modal-header">
						<h5 class="modal-title">Mail</h5>
					</div>
				<div class="modal-body">
					<p>Mail đã được gửi. Vui lòng kiểm tra email!</p>
				</div>
				<div class="modal-footer">
					<button type="button" id="btn-ok" class="btn btn-success" data-dismiss="modal">Đồng ý</button>
				</div>
			</div>
		</div>
   
</body>
</html>