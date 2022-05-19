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
<%@page import="Dao.AboutDAOImpl"%>
<%@page import="Model.About"%>
<%@page import="Model.Slide_ImageAdvertise"%>
<%@page import="Dao.Slide_ImageAdvertiseDAOImpl"%>
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
	Account acc = (Account) session.getAttribute("memberSession");
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
		TinhTrangDAO tt = new TinhTrangDAO();
		List<Product> listProductSearch = new ArrayList<>();
		List<Product> list12 = new ArrayList<>();
		list12 = sanPhamDAO.getList();
		listProductSearch= (List<Product>) session.getAttribute("dsSearch");
		ArrayList<Product> arr = sanPhamDAO.getListtt();
		ArrayList<Product> arr2 = tt.listProductbyPromotion();
		Season promotion= new Season();
		SeasonDAO promotionDAO= new SeasonDAO();
		promotion= promotionDAO.promotionbyCurrentDate();
		int start = 0, end = 15;
		if (arr.size() < 15) {
			end = arr.size();
		}
		if (request.getParameter("start") != null) {
			start = Integer.parseInt(request.getParameter("start"));
		}
		if (request.getParameter("end") != null) {
			end = Integer.parseInt(request.getParameter("end"));
		}
		ArrayList<Product> list = sanPhamDAO.getListByPage(arr, start, end);
		
		

		ArrayList<Product> arr1 = sanPhamDAO.getList1();
		int start1 = 0, end1 = 15;
		if (arr1.size() < 15) {
			end1 = arr1.size();
		}
		if (request.getParameter("start1") != null) {
			start1 = Integer.parseInt(request.getParameter("start1"));
		}
		if (request.getParameter("end1") != null) {
			end1 = Integer.parseInt(request.getParameter("end1"));
		}
		ArrayList<Product> list1 = sanPhamDAO.getListByPage(arr1, start1, end1);
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		int start22 = 0, end22 = 15;
		if (arr2.size() < 15) {
			end22 = arr2.size();
		}
		if (request.getParameter("start22") != null) {
			start22 = Integer.parseInt(request.getParameter("start22"));
		}
		if (request.getParameter("end22") != null) {
			end22 = Integer.parseInt(request.getParameter("end22"));
		}
		ArrayList<Product> list22 = sanPhamDAO.getListByPage22(arr2, start22, end22);
	%>
<%		
		CategoryDAOImpl danhMucDAO = new CategoryDAOImpl();
		//Cart cart = new Cart();
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
<%
	
    AboutDAOImpl abDAO = new AboutDAOImpl();
	ArrayList<About> a = abDAO.getList();
		
		
		

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


 <jsp:include page="Slide_ImageAdvertise.jsp"></jsp:include>
 
    

    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Chất lượng</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Miễn phí giao hàng</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Đổi trả sau 14 ngày</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->		
   
    <!-- Products Start -->
    <div class="container-fluid py-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">SẢN PHẨM NỔI BẬT</span></h2>
        <div class="row px-xl-5">         
            <div class="col">
           
                <div class="owl-carousel related-carousel">
                 <%
				for (Product s : list22) {
			%> 
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                        
                            <img class="img-fluid w-100" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=s.getImage()%>" alt="">
                            
                            <div class="product-action">                           
                                <a class="btn btn-outline-dark btn-square" href="CartServlet?enter=insert&ID_Product=<%=s.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (s.getQuantity()==0) {											
												%>style="pointer-events: none;  " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%>><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href="detail.jsp?ID_Product=<%=s.getID_Product()%>"><i class="fas fa-eye"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href=""><p <%if (s.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=s.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=s.getQuantity()%>
								sản phẩm
							</p></a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5><%=nf.format(s.getPrice() - s.getSale())%>
								VNĐ
							</h5><h6 class="text-muted ml-2"><del><h6 <%if (s.getSale()==0) {%>style="color:#f5f5f5;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(s.getPrice())%>
								VNĐ</h6></del></h6>							
                            </div>			   
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small></small>
                            </div>
                        </div>
                    </div>
                     <%
				}
			%>
                   
            </div>
        </div>
    </div>
					
    <!-- Products End -->

<%
        Slide_ImageAdvertiseDAOImpl adDAO = new Slide_ImageAdvertiseDAOImpl();
		ArrayList<Slide_ImageAdvertise> listad = adDAO.getList();		

%>
<%
				for (Slide_ImageAdvertise ad : listad) {
			%>
    <!-- Offer Start -->
    <div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5">
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="<%=ad.getImage_Advertise4()%>" alt="">
                    
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="<%=ad.getImage_Advertise5()%>" alt="">
                   
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->
              
  <%
				}
			%>

  <!-- Products Start -->
    <div class="container-fluid py-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">SẢN PHẨM KHUYỄN MÃI</span></h2>
        <div class="row px-xl-5">         
            <div class="col">
           
                <div class="owl-carousel related-carousel">
                 <%
				for (Product s : list1) {
			%> 
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                        
                            <img class="img-fluid w-100" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=s.getImage()%>" alt="">
                            
                            <div class="product-action">                           
                                <a class="btn btn-outline-dark btn-square" href="CartServlet?enter=insert&ID_Product=<%=s.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (s.getQuantity()==0) {											
												%>style="pointer-events: none;  " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%>><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href="detail.jsp?ID_Product=<%=s.getID_Product()%>"><i class="fas fa-eye"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href=""><p <%if (s.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=s.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=s.getQuantity()%>
								sản phẩm
							</p></a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5><%=nf.format(s.getPrice() - s.getSale())%>
								VNĐ
							</h5><h6 class="text-muted ml-2"><del><h6 <%if (s.getSale()==0) {%>style="color:#f5f5f5;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(s.getPrice())%>
								VNĐ</h6></del></h6>							
                            </div>	
                           	   
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small></small>
                            </div>
                        </div>
                    </div>
                     <%
				}
			%>
                   
            </div>
        </div>
    </div>

</div>
</div>

    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="bg-light p-4">
                        <img src="img/vendor-1.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-2.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-3.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-4.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-5.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-6.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-7.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
         <%
				for (About ab : a) {
			%>
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <h5 class="text-secondary text-uppercase mb-4">LIÊN LẠC</h5>               
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i><%=ab.getAddress()%></p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i><%=ab.getEmail()%></p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i><%=ab.getPhone()%></p>
            </div>
            <%
				}
			%>	
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">CỬA HÀNG NHANH CHÓNG</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Nhà</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Cửa hàng của chúng tôi</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Chi tiết cửa hàng</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Giỏ hàng</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Thủ thục thanh toán</a>
                            <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Liên hệ chúng tôi</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">Tài khoản của tôi</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Đăng nhập</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Đăng ký</a>                       
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">Bản tin</h5>
                        
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Your Email Address">
                                <div class="input-group-append">
                                    <button class="" style="background-color: #31a08a">Đăng ký</button>
                                </div>
                            </div>
                        </form>
                        <h6 class="text-secondary text-uppercase mt-4 mb-3">Theo chúng tôi</h6>
                        <div class="d-flex">
                            <a class="btn btn-primary btn-square mr-2" style="background-color: #31a08a" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-primary btn-square mr-2" style="background-color: #31a08a" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-primary btn-square mr-2" style="background-color: #31a08a" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-primary btn-square" style="background-color: #31a08a" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-secondary">
                    &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                    by
                    <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->




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