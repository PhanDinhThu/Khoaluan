<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Account"%>
<%@page import="Model.Empty"%>
<%@page import="Model.GoodReceipt"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@page import="Dao.GoodReceiptDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Furniture -  Admin Online sales site</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
<link href="/Khoaluan/Admin/assets/css/bootstrap.css"
	rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="/Khoaluan/Admin/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<link href="/Khoaluan/Admin/assets/css/custom.css"
	rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	
</head>
<body>

	<%
	/* if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	}  */
	Account user = (Account) session.getAttribute("memberSession");
		 if(user == null){			
			response.sendRedirect("/Khoaluan/login.jsp");
			return;
		} 
		
	Account employee= new Account ();
	AccountDAOImpl accDAO = new AccountDAOImpl();
	GoodReceipt goodReceipt= new GoodReceipt();
	GoodReceiptDAO goodReceiptDAO= new GoodReceiptDAO();
	List<GoodReceipt> listGoodReceipts = goodReceiptDAO.listGoodReceipts();
	DecimalFormat formatter = new DecimalFormat("###,###.00");
	NumberFormat nf = NumberFormat.getInstance();
	nf.setMinimumIntegerDigits(0);
	
	%>
	 <%
double count=0; 
												for (GoodReceipt st : listGoodReceipts ) {
												count += st.getTotal();
												
												}
												
												
											  
												%>
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>PHI???U NH???P</h2>
		
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<!-- <button data-button="addReceipt" id="btnAddReceipt" class="btn btn-success" style="color: white;text-transform:uppercase;font-size:14px;">Th??m Phi???u Nh???p</button> -->
								 <a class="navbar-brand" href="/Khoaluan/Admin/goodreceipt_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Th??m Phi???u Nh???p</a> 
						</div>
					</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#106356; color:black; font-weight:bold">QU???N L?? PHI???U NH???P  <span style="color:white;float:right"><span style="color:black; text-transform:uppercase">T???ng v???n nh???p:</span>  <%= nf.format(count)%> VN??</span></div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead >
											<tr style="text-align: center;">
												<th>M?? Phi???u Nh???p</th>
						                        <th>Ng?????i L???p Phi???u</th>
						                        <th>Ng??y L???p Phi???u</th>
						                        <th>T???ng ti???n </th>
						                        <th>Chi ti???t</th>
						                        <th>Ch???c n??ng</th>
						                        
											</tr>
										</thead>
										<tbody>
					<%
											for (GoodReceipt gr : listGoodReceipts) {
												String a = accDAO.getUser(gr.getID_Account()).getID_Account();
												
										%>				<tr style="height:50px"  class="odd gradeX contentPage tableViewContent">
												<td ><%=gr.getID_Receipt()%></td>
						<td class="colNgayDat"><%=accDAO.getUser(gr.getID_Account()).getUsername()%></td>
						<td class="colTotal"><%=gr.getCreated_date()%></td>
						<td class="colInfo"><%=nf.format(gr.getTotal())%> VN??
						</td>
							<td style="text-align:center">
							<a href="/Khoaluan/ReceiptServlet_View?action=Views&ID_Receipt=<%=gr.getID_Receipt()%>"
													class="btn btn-warning btn-xs" style="padding:3px 10px">Xem</a></td>
							
						</td>
						<td style="text-align:center">
							 <a <% if(gr.getTotal() > 0 || !user.getID_Account().equals(a)){ %> style="display:none"<%}else{ %> style=" display: block;padding:3px 0px;margin-left:30%;width:35%"
										<%
										}
									%> 
							href="/Khoaluan/ReceiptServlet_Delete?action=Delete&ID_Receipt=<%=gr.getID_Receipt()%>" onclick="return confirm('B???n c?? ch???c ch???n x??a m?? phi???u nh???p l?? <%=gr.getID_Receipt()%> kh??ng ?')"
							 class="btn-deleteReceipt btn btn-danger btn-xs"
								>X??a</a> 
						</td>
					
											</tr>
										<%
												}
											%>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

 
	
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>