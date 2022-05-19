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


</head>

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
		ArrayList<Product> list = sanPhamDAO.getListByPage(arr, start, end);
		
		

		ArrayList<Product> arr1 = sanPhamDAO.getList1();
		int start1 = 0, end1 = 4;
		if (arr1.size() < 4) {
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
		int start22 = 0, end22 = 4;
		if (arr2.size() < 4) {
			end22 = arr2.size();
		}
		if (request.getParameter("start22") != null) {
			start22 = Integer.parseInt(request.getParameter("start22"));
		}
		if (request.getParameter("end22") != null) {
			end22 = Integer.parseInt(request.getParameter("end22"));
		}
		ArrayList<Product> list22 = sanPhamDAO.getListByPage22(arr2, start22, end22);
		 AboutDAOImpl abDAO = new AboutDAOImpl();
			ArrayList<About> listab = abDAO.getList();
	%>


	<%
		
		CategoryDAOImpl danhMucDAO = new CategoryDAOImpl();
		//Cart cart = new Cart();
		if( session.getAttribute("cart")!=null)
		cart = (Cart) session.getAttribute("cart");
	
	%>
 <jsp:include page="header.jsp"></jsp:include>
    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang chủ</a>
                    <a class="breadcrumb-item text-dark" href="#">Cửa hàng</a>                
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-4">
                <!-- Price Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">THỂ LOẠI SẢN PHẨM</span></h5>
                <div class="bg-light p-4 mb-30">
                    <%
					for (Category Parent_Category : danhMucDAO.getListParentCategory()) {
				%>
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
								href="shop1.jsp?ID_Category=<%=danh_muc_con.getID_Category()%>"><%=danh_muc_con.getName_Category()%></a></li>

							<%
								}
							%>
						</ul>
					</div>
				</div>

				<%
					}
				%>
                    
                </div>
               
                <!-- Price End -->
                
                <!-- Color Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Tin tức</span></h5>
                <div class="bg-light p-4 mb-30">
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="color-all">
                            <label class="custom-control-label" for="price-all">Chất lượng sản phẩm tốt</label>
                            
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-1">
                            <label class="custom-control-label" for="color-1">Miễn phí giao hàng</label>
                           
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-2">
                            <label class="custom-control-label" for="color-2">Hỗ trợ 24/7</label>
                            
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-3">
                            <label class="custom-control-label" for="color-3">Đổi trả hàng sau 14</label>
                           
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-4">
                            <label class="custom-control-label" for="color-4">Sản phẩm giá rẻ</label>
                          
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="color-5">
                            <label class="custom-control-label" for="color-5">...</label>
                           
                        </div>
                    </form>
                </div>
                <!-- Color End -->

               
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-8">
                <div class="row pb-3">
                
                    <div class="col-12 pb-1">
                  
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div>
                                <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
                                <button class="btn btn-sm btn-light ml-2"><i class="fa fa-bars"></i></button>
                            </div>
                            <div class="ml-2">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sorting</button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Latest</a>
                                        <a class="dropdown-item" href="#">Popularity</a>
                                        <a class="dropdown-item" href="#">Best Rating</a>
                                    </div>
                                </div>
                                <div class="btn-group ml-2">
                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Showing</button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">10</a>
                                        <a class="dropdown-item" href="#">20</a>
                                        <a class="dropdown-item" href="#">30</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               
 

            <div class="row px-xl-5">
            <%
				for (Product sp : sanPhamDAO.getListProductByCategory(request.getParameter("ID_Category"))) {
			%>
            <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=sp.getImage()%>" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href="ShopServlet?enter=insert1&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none;  " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> ><i class="fa fa-shopping-cart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href="detail.jsp?ID_Product=<%=sp.getID_Product()%>"><i class="fas fa-eye" ></i></a>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                  <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href=""><p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p></a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h5><h6 class="text-muted ml-2"><del><h6 <%if (sp.getSale()==0) {%>style="color:white;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h6></del></h6>
                        </div>
                        <img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 115px;right: 95px;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/hf.jpg" class="proend" alt="" />
												<img <% String n= sp.getID_Product();
												int i = Integer.parseInt(n);
													if (i >= 122) {											
												%>style="display:block;position: absolute;top: 15px;right: 30px;" <%}
                                                    else{ %> style="display:none "
												<%
												   }
												%>  src="images/home/new.png" class="new" alt=""  />
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
            </div>
            <%
				}
			%>
        
          <%
				for (Product sp : list) {
			%>  
            <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=sp.getImage()%>" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href="ShopServlet?enter=insert1&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none;  " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> ><i class="fa fa-shopping-cart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href="detail.jsp?ID_Product=<%=sp.getID_Product()%>"><i class="fas fa-eye"></i></a>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                  <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href=""><p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p></a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h5><h6 class="text-muted ml-2"><del><h6 <%if (sp.getSale()==0) {%>style="color:#f7f7f0;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h6></del></h6>
                        </div>
                        <img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 115px;right: 95px;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/hf.jpg" class="proend" alt="" />
												<img <% String n= sp.getID_Product();
												int i = Integer.parseInt(n);
													if (i >= 122) {											
												%>style="display:block;position: absolute;top: 15px;right: 30px;" <%}
                                                    else{ %> style="display:none "
												<%
												   }
												%>  src="images/home/new.png" class="new" alt=""  />
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
            </div>
            <%
				}
			%>
			
			


      <div class="col-12">
      <ul class="pagination justify-content-center">
       <%
					int a, b;
					int limit = arr.size() / 9;
					if (limit * 9 < arr.size()) {
						limit += 1;
					}
					for (int i = 1; i <= limit; i++) {
						a = (i - 1) * 9;
						b = i * 9;
						if (b > arr.size()) {
							b = arr.size();
						}
				%>
				<li><a  href="shop.jsp?start=<%=a%>&end=<%=b%>" style="border:1px solid black; color: black; background: #31a08a;"><%=i%></a></li>
				<%
					}
				%>
					
			</ul>
		</div>
		</div>
		</div>
		</div>
	</div>
	</div>
    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
         <%
				for (About ab : listab) {
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


   
    <!-- Shop End -->     
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