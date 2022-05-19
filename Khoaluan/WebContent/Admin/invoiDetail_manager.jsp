<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Furniture -  Admin Online sales site</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<link rel="stylesheet" href="/Khoaluan/css/normalize.min.css">
	<style type='text/css'>
        .a {
            background: black;
            color: white;
        }
        .b {
            color: black;
        }
        </style>
        <script src="/Khoaluan/js/html5-3.6-respond-1.1.0.min.js"></script>
</head>
<body>
<%
Account acc = (Account) session.getAttribute("memberSession");
if (acc == null) {
	response.sendRedirect("/Khoaluan/login.jsp");
}

ArrayList<InvoiceDetail> listInvoiceDetaila = (ArrayList<InvoiceDetail>) request.getAttribute("listDetails");
ProductDAOImpl productDAO = new ProductDAOImpl(); 

NumberFormat nf = NumberFormat.getInstance();
nf.setMinimumIntegerDigits(0);
	
	%>

<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ CHI TIẾT HÓA ĐƠN </h2>
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/Khoaluan/Admin/invoice_manager.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Quay lại</a>
						</div>
						
					</div>
				</div>
				<hr />


				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">Chi tiết hóa đơn</div>
							<div class="panel-body">
								<div class="table-responsive" id="a">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example-a">
										<thead id="a" class="b">
											<tr style="text-align: center;">
												<th>Mã Hóa Đơn Chi Tiết</th>
												<th>Mã Hóa Đơn</th>
												<th>Sản Phẩm</th>
												<th>Số Lượng</th>
												<th>Giá Sản Phẩm</th>
												<th>Giảm Giá</th>
												<th>Tổng Tiền</th>
												
											</tr>
										</thead>

										<%
											for (InvoiceDetail invoiceDetail : listInvoiceDetaila) {
										%>
										<tbody id="a" class="b">
											<tr class="odd gradeX" id="a" class="b">
												<td><%=invoiceDetail.getID_InvoiceDetail()%></td>
												<td><%=invoiceDetail.getHoa_Don().getID_Invoice()%></td>
												<td><%=productDAO.getProduct(invoiceDetail.getSan_Pham().getID_Product()).getID_Product()%> - <%=productDAO.getProduct(invoiceDetail.getSan_Pham().getID_Product()).getName_Product()%> </td>
												<td><%=invoiceDetail.getQuantity()%></td>
												<td><%=nf.format(invoiceDetail.getPrice())%></td>
											    <td><%=nf.format(invoiceDetail.getSale())%> </td>
								<td><%=nf.format(invoiceDetail.getQuantity() * (invoiceDetail.getPrice() - invoiceDetail.getSale()))%> VNĐ</td>
											</tr>
										</tbody>
										<%
											}
										%>
									</table>
									<button class="bb no-print btn btn-success" style="float:right">IN HÓA ĐƠN </button>
								</div>
							</div>
						</div>
			</div>
				</div>
			</div>
		</div>

	</div>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>
        window.jQuery || document.write('<script src="/Khoaluan/dist/jquery.min.js"><\/script>')
        </script>
       
        <script src="/Khoaluan/js/jQuery.print.js"></script>
        <script type='text/javascript'>
    
        jQuery(function($) { 'use strict';
            $("#a").find('.bb').on('click', function() {
            	/* alert("fsdfds");  */
                $.print("#a");
            });
           
         
            
        });
    
        </script>

</body>
</html>