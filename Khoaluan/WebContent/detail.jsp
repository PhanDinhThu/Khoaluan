<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Season"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Model.Account"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Account"%>
<%@page import="Model.Category"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Dao.ImageDetailDAOImpl"%>
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
<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.10&appId=327890844754184";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

<%
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
		Product sp = sanPhamDAO.getDetailProduct(request.getParameter("ID_Product"));
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);		
        ImageDetailDAOImpl imgDAO = new ImageDetailDAOImpl();
        System.out.println("ssd"+sp);
        CategoryDAOImpl cateDAO = new CategoryDAOImpl();
	%>

    <jsp:include page="header.jsp"></jsp:include>

    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang chủ</a>
                    <a class="breadcrumb-item text-dark" href="shop.jsp">Cửa hàng</a>
                    <span class="breadcrumb-item active">Chi tiết sản phẩm</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Shop Detail Start -->
    <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                        <div class="carousel-item active">
                             <img class="w-100 h-100" src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=sp.getImage()%>" alt="Image">
                        </div>
                        <div class="carousel-item">
                         <img class="w-100 h-100" src=" <%=imgDAO.getIdImage(sp.getID_Product()).getDetail_Image()%>" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src=" <%=imgDAO.getIdImage(sp.getID_Product()).getDetail_Image1()%>" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src=" <%=imgDAO.getIdImage(sp.getID_Product()).getDetail_Image2()%>" alt="Image">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30">
                <div class="h-100 bg-light p-30">
                    <h3><%=sp.getName_Product()%></h3>
                    
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star-half-alt"></small>
                            <small class="far fa-star"></small>
                        </div>
                        <small class="pt-1"></small>
                    </div>
                    <p class="mb-4"> Kích thước: <%=sp.getSize()%></p>
                    <p class="mb-4"> Chất liệu: <%=sp.getMaterial()%></p>
                    <h3 class="font-weight-semi-bold mb-4"><span <%if (sp.getSale()==0) {%>style="color:#f7f7f0;" <%}
                        else{ %> style="display: block; font-family: 'Roboto', sans-serif;font-size: 20px;font-weight: 700; text-decoration: line-through;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</span> <br>
							
								<span><%=nf.format(sp.getPrice() - sp.getSale())%> VNĐ</span></h3>
                  
                    <div class="d-flex mb-3">
                        <strong class="text-dark mr-3">Số lượng: </strong>còn
								<%=sp.getQuantity()%>
								sản phẩm
                    </div>
                    
                  
                        <a
									href="Detail_ProductServlet?enter=insert2&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									type="button" 
									<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none;  " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> >
									<input type="submit"  class="btn btn-primary" value="Thêm vào giỏ hàng"  />			
									<iclass="fa fa-shopping-cart"></i>
								</a>
                   
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Thông tin</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Nhận xét (1)</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Bảo hành </a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-4">Vận chuyển</a>
                    </div>
                    <div class="tab-content">
                   <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Mô tả sản phẩm</h4>
                           <p><%=sp.getDescribe()%></p>
                        </div>     
                    <div class="tab-pane fade" id="tab-pane-3">
                            <h4 class="mb-3"></h4>
                            <p> - Các sản phẩm nội thất tại Nhà Xinh đa số đều được sản xuất tại nhà máy của công ty cổ phần xây dựng kiến trúc AA với đội ngũ nhân viên và công nhân ưu tú cùng cơ sở vật chất hiện đại (http://www.aacorporation.com/). Nhà Xinh đã kiểm tra kỹ lưỡng từ nguồn nguyên liệu cho đến sản phẩm hoàn thiện cuối cùng..</p>
                            <p> - Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất hay lắp đặt.</p>
                            <p> - Quý khách không nên tự sửa chữa mà hãy báo ngay cho Nhà Xinh qua hotline: 0367396802.</p>
                            <p> - Sau thời gian hết hạn bảo hành, nếu quý khách có bất kỳ yêu cầu hay thắc mắc thì vui lòng liên hệ với Nhà Xinh để được hướng dẫn và giải quyết các vấn đề gặp phải.</p>
                            <h4 class="mb-3"> TUY NHIÊN NHÀ XINH KHÔNG BẢO HÀNH CHO CÁC TRƯỜNG HỢP SAU:</h4>
                            <p> - Khách hàng tự ý sửa chữa khi sản phẩm bị trục trặc mà không báo cho Nhà Xinh.</p>
                            <p> - Sản phẩm được sử dụng không đúng quy cách của sổ bảo hành (được trao gửi khi quý khách mua sản phẩm) gây nên trầy xước, móp, dơ bẩn hay mất màu.</p>
                            <p> - Sản phẩm bị biến dạng do môi trường bên ngoài bất bình thường (quá ẩm, quá khô, mối hay do tác động từ các thiết bị điện nước, các hóa chất hay dung môi khách hàng sử dụng không phù hợp).</p>
                            <p> - Sản phẩm hết hạn bảo hành.</p>
                            <p> - Sản phẩm không có phiếu bảo hành của Nhà Xinh.</p>
                       
                        </div>  
                        <div class="tab-pane fade" id="tab-pane-4">
                            <h4 class="mb-3">GIAO HÀNG TẬN NƠI</h4>
                            <p>Nhà Xinh cung cấp dịch vụ giao hàng tận nơi, lắp ráp và sắp xếp vị trí theo đúng ý muốn của quý khách:</p>
                            <p>- MIỄN PHÍ giao hàng trong nội thành Tp.Huế , áp dụng cho các đơn hàng trị giá trên 5 triệu.</p>
                            <p>- Đối với khu vực các tỉnh lân cận: Tính phí hợp lý theo dựa trên quãng đường vận chuyển</p>
                           
                        </div>                    
                        <div class="tab-pane fade" id="tab-pane-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">Đánh giá sản phẩm <%=sp.getName_Product()%></h4>
                                    <div class="media mb-4">
                                        
                                        <div class="media-body">
                                            <h6>Phan Đình Thứ<small> - <i>04-05-2022</i></small></h6>
                                            <div class="text-primary mb-2">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                            <p>Sản phẩm rất tốt, rất hài lòng về chất lượng sản phẩm.</p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4 class="mb-4">Để lại một đánh giá</h4>
                                    <small>Địa chỉ email của bạn sẽ không được công bố. Các trường bắt buộc được đánh dấu *</small>
                                    <div class="d-flex my-3">
                                        <p class="mb-0 mr-2">Đánh giá của bạn *:</p>
                                        <div class="text-primary">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                    </div>
                                    <form>
                                        <div class="form-group">
                                            <label for="message">Đánh giá của bạn *</label>
                                            <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        
                                        <div class="form-group mb-0">
                                            <input type="submit" value="Bình luận" class="btn btn-primary px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->


    


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