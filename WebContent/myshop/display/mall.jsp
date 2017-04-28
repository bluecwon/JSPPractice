<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@include file="mall_top.jsp" %>
    <jsp:useBean id="pdao" class="my.shop.ProductBean"/>
    <jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
<% request.setCharacterEncoding("EUC-KR");
String uppath=config.getServletContext().getRealPath("/myshop/images");
%>
<h3>Welcome to My Mall</h3>
<%
	ArrayList<ProductDTO> plist=pdao.listSpecProduct("HIT");
	if(plist==null||plist.size()==0){%>
		<h4><font color="red">��Ʈ��ǰ�� �����ϴ�.</font></h4>
	<%}else{%>
		<hr color="green" width="600">
		<font color="red" size="5" face="����"><b>H I T</b></font>
		<hr color="green" width="600">
		<table width="600">
		<tr align="center">
	<%
	for(ProductDTO dto:plist){%>
	<td align="center">
		<a href="mall_prodview.jsp?pnum=<%=dto.getPnum()%>"><img src="<%=uppath%>\<%=dto.getPimage()%>" width="80" height="80"></a><br>
		<%=dto.getPname()%><br>
		<font color="red"><%=dto.getPrice()%></font>��<br>
		[<%=dto.getPoint()%>] Point
	</td>
	<%}%>
	</tr>
	</table>
	<%}%>
<%
	ArrayList<ProductDTO> nlist=pdao.listSpecProduct("NEW");
	if(nlist==null||nlist.size()==0){%>
		<h4><font color="red">����ǰ�� �����ϴ�.</font></h4>
	<%}else{%>
		<hr color="green" width="600">
		<font color="red" size="5" face="����"><b>N E W</b></font>
		<hr color="green" width="600">
		<table width="600">
		<tr align="center">
	<%
	for(ProductDTO dto:nlist){%>
	<td align="center">
		<a href="mall_prodview.jsp?pnum=<%=dto.getPnum()%>"><img src="<%=uppath%>\<%=dto.getPimage()%>" width="80" height="80"></a><br>
		<%=dto.getPname()%><br>
		<font color="red"><%=dto.getPrice()%></font>��<br>
		[<%=dto.getPoint()%>] Point
	</td>
	<%}%>
	</tr>
	</table>
	<%}%>
	<%
	ArrayList<ProductDTO> blist=pdao.listSpecProduct("BEST");
	if(blist==null||blist.size()==0){%>
		<h4><font color="red">����Ʈ��ǰ�� �����ϴ�.</font></h4>
	<%}else{%>
		<hr color="green" width="600">
		<font color="red" size="5" face="����"><b>B E S T</b></font>
		<hr color="green" width="600">
		<table width="600">
		<tr align="center">
	<%
	for(ProductDTO dto:blist){%>
	<td align="center">
		<a href="mall_prodview.jsp?pnum=<%=dto.getPnum()%>"><img src="<%=uppath%>\<%=dto.getPimage()%>" width="80" height="80"></a><br>
		<%=dto.getPname()%><br>
		<font color="red"><%=dto.getPrice()%></font>��<br>
		[<%=dto.getPoint()%>] Point
	</td>
	<%}%>
	</tr>
	</table>
	<%}%>
<%@include file="mall_bottom.jsp" %>