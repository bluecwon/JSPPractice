<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<jsp:useBean id="cartbean" class="my.shop.mall.CartBean" scope="session"/>
<%
String pnum=request.getParameter("pnum");
String qty=request.getParameter("pqty");
int ipnum=Integer.parseInt(pnum);
int iqty=Integer.parseInt(qty);
if(cartbean.cartEdit(ipnum, iqty)){%>
<script type="text/javascript">
	alert("수량 수정에 성공하셨습니다.")
	location.href("mall_cartList.jsp")
</script>
<%}else{%>
<script type="text/javascript">
	alert("수량 수정에 실패하셨습니다.")
	history.back();
</script>
<%}%> 