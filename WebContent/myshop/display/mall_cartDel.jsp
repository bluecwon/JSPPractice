<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<jsp:useBean id="cartbean" class="my.shop.mall.CartBean" scope="session"/>
<%
String pnum=request.getParameter("pnum");
int ipnum=Integer.parseInt(pnum);
if(cartbean.cartDelete(ipnum)){%>
<script type="text/javascript">
	alert("������ �����ϼ̽��ϴ�.")
	location.href("mall_cartList.jsp")
</script>
<%}else{%>
<script type="text/javascript">
	alert("������ �����ϼ̽��ϴ�.")
	history.back();
</script>
<%}%>