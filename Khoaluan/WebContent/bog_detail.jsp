<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Advertise"%>
<%@page import="Model.Cart"%>
<%@page import="Model.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.NewsDAOImpl"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.News_CategoryDAOImpl"%>
<%@page import="Model.Account"%>
<%@page import="Model.Cart"%>
<%@page import="Model.News_Category"%>
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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
 <%
	
     NewsDAOImpl newsDAO = new NewsDAOImpl();
 News n = newsDAO.getDetailNews(request.getParameter("ID_News"));		
 System.out.println("ssd"+n);
%>

		<%
		CategoryDAOImpl danhMucDAO = new CategoryDAOImpl();
	    News_CategoryDAOImpl new_categoryDAO = new News_CategoryDAOImpl();	 
	%>
  <jsp:include page="header.jsp"></jsp:include>

<!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang ch???</a>
                    <span class="breadcrumb-item active">Tin t???c</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
     <!-- Shop Start -->
    <div class="container-fluid" >
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-4" >
                <!-- Price Start -->
                <h5 class="section-title position-relative text-uppercase mb-3" ><span class="bg-secondary pr-3">TH??? LO???I TIN T???C</span></h5>
                <div class="bg-light p-4 mb-30"  >
                         
          <%
					for (News_Category Parent_News : new_categoryDAO.getListParentNews_Category()) {
				%>
				
					<div class="panel panel-default">
					<div class="panel-heading">

						<%
							for (News_Category tin_tuc_con : new_categoryDAO.getListSubNews_Category(Parent_News.getID_News_Category())) {
						%>

					</div>
					<div class="panel-body">
						<ul>
						<li><a
								href="bog1.jsp?ID_News_Category=<%=tin_tuc_con.getID_News_Category()%>"><%=tin_tuc_con.getName_News_Category()%></a></li>
							

							<%
								}
							%>
						<%
					}
				%>
						</ul>
					</div>
				</div>		
			</div>
</div>  
   <div class="news-content">
     <h4 class="title"><span>Tin t???c</span></h4><hr><br>      
	
		 <h2><%=n.getName_News()%></h2>
		  <p class="date"><%=n.getPosting_Date()%></p>
                    <div class="desc"><h2 class="detail-sp" data-field="sapo" style="font-size: 14px; line-height: 20px; width: 800px; float: left; letter-spacing: normal;"><%=n.getDescribe_News()%></h2><div class="content-new clear" data-field="body" style="margin: 0px auto; clear: both; font-size: 12pt; line-height: 22px; font-family: 'Times New Roman'; color: rgb(68, 68, 68); padding-bottom: 10px; text-align: justify;"><div class="VCSortableInPreviewMode" type="Photo" style="margin: auto auto 9.29688px; text-align: center;"></div></div></div>
               
       <div class="row px-xl-5">           
            <div class="col-md-3 col-sm-4 col-xs-12 image">
                <div class="product-offer mb-30" style="height: 400px; width: 700px">          
                    <img class="" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=n.getImage_News()%>" alt="">                  
                </div>    
                </div>                   
              </div>
              <div class="desc"><h2 class="detail-sp" data-field="sapo" style="font-size: 14px; line-height: 20px; width: 800px; float: left; letter-spacing: normal;"><%=n.getDetail_News()%></h2><div class="content-new clear" data-field="body" style="margin: 0px auto; clear: both; font-size: 12pt; line-height: 22px; font-family: 'Times New Roman'; color: rgb(68, 68, 68); padding-bottom: 10px; text-align: justify;"><div class="VCSortableInPreviewMode" type="Photo" style="margin: auto auto 9.29688px; text-align: center;"></div></div></div>  
              
           
            </div>
          
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