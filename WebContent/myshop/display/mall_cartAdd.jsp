<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:useBean id="cartbean" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="pl" name="cartbean" value="<%=prolist%>"/>
<%
String key=request.getParameter("key");
String pnum=request.getParameter("pnum");
String qty=request.getParameter("qty");
int ipnum=Integer.parseInt(pnum);
int iqty=Integer.parseInt(qty);
if(cartbean.cartAdd(key, ipnum, iqty)){%>
<script type="text/javascript">
	alert("담기에 성공하셨습니다.")
	location.href("mall_cartList.jsp")
</script>
<%}else{%>
<script type="text/javascript">
	alert("담기에 실패하셨습니다.")
	history.back();
</script>
<%}%>