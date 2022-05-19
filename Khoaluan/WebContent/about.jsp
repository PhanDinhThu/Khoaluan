<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.News_CategoryDAOImpl"%>
<%@page import="Dao.AboutDAOImpl"%>
<%@page import="Model.About"%>
<%@page import="java.util.ArrayList"%>
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
</head>

<body>
  <%
	
    AboutDAOImpl abDAO = new AboutDAOImpl();
	ArrayList<About> arr = abDAO.getList();
		
		int start = 0, end = 9;
		if (arr.size() < 9) {
			end = arr.size();
		}
		if (request.getParameter("start") != null) {
			start = Integer.parseInt(request.getParameter("start"));
		}
		if (request.getParameter("end") != null) {
			end = Integer.parseInt(request.getParameter("end"));
		}
		ArrayList<About> list = abDAO.getListByPage(arr, start, end);
		
		

	%>

  <jsp:include page="header.jsp"></jsp:include>
<!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang chủ</a>
                    <span class="breadcrumb-item active">Giới thiệu</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
  <%
				for (About ab : list) {
			%>
    <!-- Breadcrumb End -->
<div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5">
            <div class="col-md-12 col-lg-6  col-xs-12">
                <div class="product-offer mb-30" style="height: 500px">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=ab.getImage_About()%>" alt="">
                    <div class="offer-text">                       
                        <h3 class="text-white mb-3"></h3>
                        <a href="" class=""></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="carousel-item position-relative active" style="height: 430px;">  
                 <div class="banner_h2_Right_text">
                                    <div class="wpb_wrapper">                                    
                                        <h3 class="text-center">Về chúng tôi.</h3><br>
                                        <p class="text-center" style="color: black"><%=ab.getContent_About()%></p>
                                        
                                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                  
  <%
				}
			%>		
   


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