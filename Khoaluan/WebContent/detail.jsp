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
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang ch???</a>
                    <a class="breadcrumb-item text-dark" href="shop.jsp">C???a h??ng</a>
                    <span class="breadcrumb-item active">Chi ti???t s???n ph???m</span>
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
                    <p class="mb-4"> K??ch th?????c: <%=sp.getSize()%></p>
                    <p class="mb-4"> Ch???t li???u: <%=sp.getMaterial()%></p>
                    <h3 class="font-weight-semi-bold mb-4"><span <%if (sp.getSale()==0) {%>style="color:#f7f7f0;" <%}
                        else{ %> style="display: block; font-family: 'Roboto', sans-serif;font-size: 20px;font-weight: 700; text-decoration: line-through;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VN??</span> <br>
							
								<span><%=nf.format(sp.getPrice() - sp.getSale())%> VN??</span></h3>
                  
                    <div class="d-flex mb-3">
                        <strong class="text-dark mr-3">S??? l?????ng: </strong>c??n
								<%=sp.getQuantity()%>
								s???n ph???m
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
									<input type="submit"  class="btn btn-primary" value="Th??m v??o gi??? h??ng"  />			
									<iclass="fa fa-shopping-cart"></i>
								</a>
                   
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Th??ng tin</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Nh???n x??t (1)</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">B???o h??nh </a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-4">V???n chuy???n</a>
                    </div>
                    <div class="tab-content">
                   <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">M?? t??? s???n ph???m</h4>
                           <p><%=sp.getDescribe()%></p>
                        </div>     
                    <div class="tab-pane fade" id="tab-pane-3">
                            <h4 class="mb-3"></h4>
                            <p> - C??c s???n ph???m n???i th???t t???i Nh?? Xinh ??a s??? ?????u ???????c s???n xu???t t???i nh?? m??y c???a c??ng ty c??? ph???n x??y d???ng ki???n tr??c AA v???i ?????i ng?? nh??n vi??n v?? c??ng nh??n ??u t?? c??ng c?? s??? v???t ch???t hi???n ?????i (http://www.aacorporation.com/). Nh?? Xinh ???? ki???m tra k??? l?????ng t??? ngu???n nguy??n li???u cho ?????n s???n ph???m ho??n thi???n cu???i c??ng..</p>
                            <p> - Nh?? Xinh b???o h??nh m???t n??m cho c??c tr?????ng h???p c?? l???i v??? k??? thu???t trong qu?? tr??nh s???n xu???t hay l???p ?????t.</p>
                            <p> - Qu?? kh??ch kh??ng n??n t??? s???a ch???a m?? h??y b??o ngay cho Nh?? Xinh qua hotline: 0367396802.</p>
                            <p> - Sau th???i gian h???t h???n b???o h??nh, n???u qu?? kh??ch c?? b???t k??? y??u c???u hay th???c m???c th?? vui l??ng li??n h??? v???i Nh?? Xinh ????? ???????c h?????ng d???n v?? gi???i quy???t c??c v???n ????? g???p ph???i.</p>
                            <h4 class="mb-3"> TUY NHI??N NH?? XINH KH??NG B???O H??NH CHO C??C TR?????NG H???P SAU:</h4>
                            <p> - Kh??ch h??ng t??? ?? s???a ch???a khi s???n ph???m b??? tr???c tr???c m?? kh??ng b??o cho Nh?? Xinh.</p>
                            <p> - S???n ph???m ???????c s??? d???ng kh??ng ????ng quy c??ch c???a s??? b???o h??nh (???????c trao g???i khi qu?? kh??ch mua s???n ph???m) g??y n??n tr???y x?????c, m??p, d?? b???n hay m???t m??u.</p>
                            <p> - S???n ph???m b??? bi???n d???ng do m??i tr?????ng b??n ngo??i b???t b??nh th?????ng (qu?? ???m, qu?? kh??, m???i hay do t??c ?????ng t??? c??c thi???t b??? ??i???n n?????c, c??c h??a ch???t hay dung m??i kh??ch h??ng s??? d???ng kh??ng ph?? h???p).</p>
                            <p> - S???n ph???m h???t h???n b???o h??nh.</p>
                            <p> - S???n ph???m kh??ng c?? phi???u b???o h??nh c???a Nh?? Xinh.</p>
                       
                        </div>  
                        <div class="tab-pane fade" id="tab-pane-4">
                            <h4 class="mb-3">GIAO H??NG T???N N??I</h4>
                            <p>Nh?? Xinh cung c???p d???ch v??? giao h??ng t???n n??i, l???p r??p v?? s???p x???p v??? tr?? theo ????ng ?? mu???n c???a qu?? kh??ch:</p>
                            <p>- MI???N PH?? giao h??ng trong n???i th??nh Tp.Hu??? , ??p d???ng cho c??c ????n h??ng tr??? gi?? tr??n 5 tri???u.</p>
                            <p>- ?????i v???i khu v???c c??c t???nh l??n c???n: T??nh ph?? h???p l?? theo d???a tr??n qu??ng ???????ng v???n chuy???n</p>
                           
                        </div>                    
                        <div class="tab-pane fade" id="tab-pane-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">????nh gi?? s???n ph???m <%=sp.getName_Product()%></h4>
                                    <div class="media mb-4">
                                        
                                        <div class="media-body">
                                            <h6>Phan ????nh Th???<small> - <i>04-05-2022</i></small></h6>
                                            <div class="text-primary mb-2">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                            <p>S???n ph???m r???t t???t, r???t h??i l??ng v??? ch???t l?????ng s???n ph???m.</p>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4 class="mb-4">????? l???i m???t ????nh gi??</h4>
                                    <small>?????a ch??? email c???a b???n s??? kh??ng ???????c c??ng b???. C??c tr?????ng b???t bu???c ???????c ????nh d???u *</small>
                                    <div class="d-flex my-3">
                                        <p class="mb-0 mr-2">????nh gi?? c???a b???n *:</p>
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
                                            <label for="message">????nh gi?? c???a b???n *</label>
                                            <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        
                                        <div class="form-group mb-0">
                                            <input type="submit" value="B??nh lu???n" class="btn btn-primary px-3">
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