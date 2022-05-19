
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="Model.*"%>
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
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<Product, Integer> list = cart.getList();

		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
	%>
<%

	Account user = (Account)session.getAttribute("memberSession");
	String username;
	if(user!=null){
		username = user.getUsername();
	}
	else {
		username ="";
	}
%>
 <jsp:include page="header.jsp"></jsp:include>    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang chủ</a>
                    <a class="breadcrumb-item text-dark" href="shop.jsp">Cửa hàng</a>
                    <span class="breadcrumb-item active">Giỏ hàng</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                           
                            <th>Sản phẩm</th>                          
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <%
								for (Map.Entry<Product, Integer> ds : list.entrySet()) {
							%>
                        <tr>
                            <td class="align-middle"><img src="${pageContext.request.contextPath}/DisplayImage?imageId=<%=ds.getKey().getImage()%>" alt="" style="width: 50px;"> <%=ds.getKey().getName_Product()%> 
                            <p>
										Mã Sản Phẩm:
										<%=ds.getKey().getID_Product()%></p>
										</td>
                            <td class="align-middle"><p><%=nf.format(ds.getKey().getPrice() - ds.getKey().getSale())%>
										VNĐ
									</p></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <a class="btn btn-minus"
											href="CartServlet?enter=giam&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
											- </a>
											<input class="form-control bg-secondary border-0 text-center" type="text"
											value="<%=ds.getValue()%>" autocomplete="off" size="1"
											disabled=""> 
								   <a class="btn btn btn-plus"
											href="CartServlet?enter=tang&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
											+ </a> 
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle"><p class="cart_total_price"><%=nf.format(ds.getValue() * ((ds.getKey().getPrice()) - (ds.getKey().getSale()))) %>
										VNĐ
									</p></td>
                            <td class="align-middle">
									<a class="cart_quantity_delete"
									href="CartServlet?enter=remove&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"><i
										class="fa fa-times"></i></a><i class=""></i></td>
                        </tr>
                        <%
								}
							%>
           </tbody>
                </table>
                
            </div>
            <div class="col-lg-4">
                
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pb-2">
                        <div class="d-flex justify-content-between mb-3">
                       
                            <h6>Subtotal</h6>
                            <h6><%=nf.format(cart.totalCart())%></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                          
                            
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5><%=nf.format(cart.totalCart())%></h5>
                        </div>
                         <a class="" href="checkout.jsp">
						<input type="submit"  class="btn btn-block btn-primary font-weight-bold my-3 py-3" value="TIẾN HÀNH THANH TOÁN" style="margin-top:5%; margin-bottom:50px; background-color: #31a08a"/></a>
                     
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->


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