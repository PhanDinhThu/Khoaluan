<%@page import="com.restfb.types.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="Model.*"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page import="com.sun.accessibility.internal.resources.accessibility"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.AccountSession"%>
<%@page import="Model.Account"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
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
		if (session.getAttribute("memberSession") == null) {
			response.sendRedirect("/Khoaluan/login.jsp");
		} else {
			Account user = (Account)session.getAttribute("memberSession");
			
			if(user != null){
				if(user.getAccess() != 2) return;
			}
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			TreeMap<Product, Integer> list = cart.getList();

			NumberFormat nf = NumberFormat.getInstance();
			nf.setMinimumIntegerDigits(0);

			String error_address = "", error_methods = "", error_email="", error_phone="", error_time="", error_full_Name="" ,  error_note="" ;
			if (request.getAttribute("error_address") != null) {
				error_address = (String) request.getAttribute("error_address");
			}
			if (request.getAttribute("error_email") != null) {
				error_email = (String) request.getAttribute("error_email");
			}
			if (request.getAttribute("error_phone") != null) {
				error_phone = (String) request.getAttribute("error_phone");
			}
			if (request.getAttribute("error_methods") != null) {
				error_methods = (String) request.getAttribute("error_methods");
			}
			if (request.getAttribute("error_time") != null) {
				error_time = (String) request.getAttribute("error_time");
			}
			if (request.getAttribute("error_full_Name") != null) {
				error_full_Name = (String) request.getAttribute("error_full_Name");
			}
			if (request.getAttribute("error_note") != null) {
				error_note = (String) request.getAttribute("error_note");
			}
			String Shipping_Address = user.getAddress();
			String Phone = user.getSDT();
			String Email = user.getEmail();
			String Full_Name = user.getFull_Name();
			String Note = "";
			String Payment_Methods = "";
			/* String Time_Limit=""; */
			/*  if (request.getAttribute("Shipping_Address") != null) {
				Shipping_Address = (String) request.getAttribute("Shipping_Address");
			}
			
			if (request.getAttribute("Email") != null) {
				Email = (String) request.getAttribute("Email");
			}  */
			if (request.getAttribute("Payment_Methods") != null) {
				Payment_Methods = (String) request.getAttribute("Payment_Methods");
			}
			if (request.getAttribute("Total_Invoice") != null) {
				Payment_Methods = (String) request.getAttribute("Total_Invoice");
			}
			
			Date d = new Date();
			
			Calendar c = Calendar.getInstance();
	        c.setTime(d);

	        // manipulate date
	       
	        c.add(Calendar.DATE, 3); //same with c.add(Calendar.DAY_OF_MONTH, 1);
	       

	        // convert calendar to date
	        Date currentDatePlusOne = c.getTime();
			System.out.println("abcd"+currentDatePlusOne);
			SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
			Date afterCreatedDate = new Date();
			
		/* 	String date = formatDay.format(d); */
			String Time_Limit_FM = formatDay.format(currentDatePlusOne);	
			afterCreatedDate = (Date)formatDay.parse(Time_Limit_FM);
			String Time_Limit = afterFormat.format(afterCreatedDate);
	%>	
<jsp:include page="header.jsp"></jsp:include>


    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang chủ</a>
                    <a class="breadcrumb-item text-dark" href="shop.jsp">Cửa hàng</a>
                    <span class="breadcrumb-item active">Thanh toán</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    
    <!-- Checkout Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">ĐỊA CHỈ THANH TOÁN</span></h5>
                 <form action="PayServlet" method="post">
                <div class="bg-light p-30 mb-5">
                    <div class="row">         
                        <div class="col-md-6 form-group">
                            <label>Họ và Tên</label>
                            <span style="color: red;"><%=error_full_Name%></span>
                            <input class="form-control" type="text" name="Full_Name" value="<%=Full_Name%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <span style="color: red;"><%=error_email%></span>
                            <input class="form-control" type="email" name="Email" value="<%=Email%>"></input>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Địa chỉ</label>
                            <span style="color: red;"><%=error_address%></span>
                            <input class="form-control" type="text" name="Shipping_Address" value="<%=Shipping_Address%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số điện thoại</label>
                            <span style="color: red;"><%=error_phone%></span>
                            <input class="form-control" type="phone" name="Phone" value="<%=Phone%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ngày giao hàng</label>
                            <span style="color: red;"><%=error_time%></span>
                            <input class="form-control" type="text" name="Time_Limit" value="<%=Time_Limit%>"  readonly>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ghi chú</label>                          
                            <input class="form-control" type="text" name="Note" value="<%=Note%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Phương thức thanh toán</label>
                            <select class="custom-select" name="Payment_Methods"  onchange="validateSelectBox(this)">
                                <option selected value="Thanh toán khi giao hàng">Thanh toán khi giao hàng</option>
                                <option value="Thanh toán qua thẻ ngân hàng"> Thanh toán qua thẻ ngân hàng </option>                               
                            </select><br><br>
                            <input type="submit" value="Xác Nhận Mua Hàng" class="btn btn-block btn font-weight-bold my-3 py-3" id="okie" style="margin-bottom: 20px;background-color: #31a08a"/>
						</form>
						<span style="color: red;">${message}</span>
					</div>
                      <div id="ss" style="display:none; margin-top: 30px">
				<!--  <img  style="width:400px" src="images/home/sa.png" alt="" /><br> -->
					<img  style="width:200px" src="images/home/paypal.png" alt="" />
					
				 <div>  
				 <span style="">Sản phẩm </span>
				 <span style="margin-left:220px;">Giá tiền </span> 
				 <span style="margin-left:140px;"> Số lượng</span>
				 </div>
			<form action="${initParam['posturl']}" method="POST">
                     <input type="hidden" name="upload" value="1" />
                     <input type="hidden" name="return" value="${initParam['returnurl']}" />
                     <input type="hidden" name="cmd" value="_cart" />
                      <input type="hidden" name="business" value="${initParam['business']}" />
                        <%
						for (Map.Entry<Product, Integer> ds : list.entrySet()) {
							 		%>
	<div >			
     
     <input type="text" name="item_name_1" value="<%=ds.getKey().getName_Product()%>" readonly style="width:50%;"  /> 
      
      <input type="text" name="amount_1" value="<%=(ds.getKey().getPrice() - ds.getKey().getSale()) %>" readonly "/>
     
      <input type="text" name="quantity_1" value="<%=ds.getValue()%>"readonly style=" width:10%" />
      </div>	
      <%
						}
					%>
      <input type="submit"  class="btn btn-block btn font-weight-bold my-3 py-3" value="Xác nhận và Thanh toán" style="margin-top:5%; margin-bottom:30px;background-color: #31a08a"/>
   	
   </form>
			
   
   </div>                          
                         
                        <div class="col-md-12">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="shipto">
                                <label class="custom-control-label" for="shipto"  data-toggle="collapse" data-target="#shipping-address">Gửi đến địa chủ khác</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse mb-5" id="shipping-address">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Shipping Address</span></h5>
                    <div class="bg-light p-30">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Họ và Tên</label>
                                <input class="form-control" type="text" placeholder="John">
                            </div>                         
                            <div class="col-md-6 form-group">
                                <label>E-mail</label>
                                <input class="form-control" type="text" placeholder="example@email.com">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Địa chỉ</label>
                                <input class="form-control" type="text" placeholder="+123 456 789">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Số điện thoại</label>
                                <input class="form-control" type="text" placeholder="123 Street">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Ngày giao hàng</label>
                                <input class="form-control" type="text" placeholder="123 Street">
                            </div>                         
                            <div class="col-md-6 form-group">
                                <label>Ghi chú</label>
                                <input class="form-control" type="text" placeholder="New York">
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
             <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">TỔNG ĐƠN ĐẶT HÀNG</span></h5>
            <div class="container-fluid">
        
          
                <table class="table table-success table-striped">
                    <thead>
                        <tr>
                           
                            <th>Products</th>                                                                              
                            <th>Quantity</th>
                            <th>Price</th>
                             <th>Into money</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <%
								for (Map.Entry<Product, Integer> ds : list.entrySet()) {
							%>
                        <tr>
                            <td class="align-middle"><%=ds.getKey().getName_Product()%> 			
                            <td class="align-middle">
                                <%=ds.getValue()%>
                            </td>
                            <td class="align-middle">
							<%=nf.format(ds.getKey().getPrice() - ds.getKey().getSale())%>																	
						</td>
                            
                           <td class="align-middle"><h6><%=nf.format(ds.getValue() * ((ds.getKey().getPrice()) - (ds.getKey().getSale()))) %>
										
									</h6></td>
                        </tr>
                       <%
								}
							%> 
           </tbody>
                </table>
                
            </div>
          		             
			<div class="mb-5">              
                    <div class="bg-light p-30">
                      <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6><%=nf.format(cart.totalCart())%>  VND</h6> 
                        </div>
                        <div class="d-flex justify-content-between">
                         
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5><%=nf.format(cart.totalCart())%> VND</h5>
                        </div>
                    </div>  
                    </div>
                </div>
                
          	 	
          	 </div>
           
            </div>
         <%
								}
							%>		
	</div>
	</div>
    <!-- Checkout End -->

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
     <script language="javascript">
            function validateSelectBox(obj){
                var options = obj.children;
                for (var i = 0; i < options.length; i++){
                    if (options[1].selected){
                      document.getElementById('ss').style.display = "block";
                      document.getElementById('okie').style.display = "none"; 
                    }
                  else{
                	  document.getElementById('ss').style.display = "none";
                	  document.getElementById('okie').style.display = "block"; 
                	 
                	  
                	 
                  }
                }
                
               
            }
        </script>
</body>

</html>