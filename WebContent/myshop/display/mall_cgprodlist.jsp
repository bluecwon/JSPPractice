<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@include file="mall_top.jsp" %>
    <jsp:useBean id="pdao" class="my.shop.ProductBean"/>
    <jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
<% request.setCharacterEncoding("EUC-KR");
String uppath=config.getServletContext().getRealPath("/myshop/images");
String cg=request.getParameter("cate");
CategoryDTO cdto=cdao.searchName(cg);
%>
<h3>Welcome to My Mall</h3>
<%
	ArrayList<ProductDTO> clist=pdao.listCateProduct(cg); 
	if(clist==null||clist.size()==0){%>
		<h4><font color="red">관련상품이 없습니다.</font></h4>
	<%}else{%>
		<hr color="green" width="600">
		<font color="red" size="5" face="굴림"><b><%=cdto.getCname()%></b></font>
		<hr color="green" width="600">
		<table width="600">
		<tr align="center">
	<%
	for(ProductDTO dto:clist){%>
	<td align="center">
		<a href="mall_prodview.jsp?pnum=<%=dto.getPnum()%>"><img src="<%=uppath%>\<%=dto.getPimage()%>" width="80" height="80"></a><br>
		<%=dto.getPname()%><br>
		<font color="red"><%=dto.getPrice()%></font>원<br>
		[<%=dto.getPoint()%>] Point
	</td>
	<%}%>
	</tr>
	</table>
	<%}%>