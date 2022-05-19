<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Slide_ImageAdvertise"%>
<%@page import="Dao.Slide_ImageAdvertiseDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
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
</head>
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
        Slide_ImageAdvertiseDAOImpl adDAO = new Slide_ImageAdvertiseDAOImpl();
		ArrayList<Slide_ImageAdvertise> list = adDAO.getList();
		

		

	%>
 

<%
				for (Slide_ImageAdvertise ad : list) {
			%>
    <!-- Carousel Start -->
    <div class="container-fluid mb-3" >
        <div class="row px-xl-5">
            <div class="col-lg-12" >
                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel" >
                    <ol class="carousel-indicators">
                        <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#header-carousel" data-slide-to="1"></li>
                        <li data-target="#header-carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item position-relative active" style="height: 500px">
                            <img class="position-absolute w-100 h-100" src="<%=ad.getImage_Advertise1()%>" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;"> 
                                 <h2 class="" style="color: #31a08a"></h2>                                  
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn"></p>
                                    
                                  
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 500px">
                            <img class="position-absolute w-100 h-100" src="<%=ad.getImage_Advertise2()%>" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h2 class="" style="color: #31a08a"></h2>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn"></p>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 500px">
                            <img class="position-absolute w-100 h-100" src="<%=ad.getImage_Advertise3()%>" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown"></h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn"></p>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>           
        </div>
    </div>
<!-- Featured Start -->
                
  <%
				}
			%>

   
</body>

</html>