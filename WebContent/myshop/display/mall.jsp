<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@include file="mall_top.jsp" %>
    <jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
    <jsp:setProperty property="pool" name="prolist" value="<%=pool %>"/>
<% request.setCharacterEncoding("EUC-KR");
String uppath=config.getServletContext().getRealPath("/myshop/images");
String[] spec={"HIT","NEW","BEST"};
%>
<h3>Welcome to My Mall</h3>
<%for(int i=0;i<spec.length;i++){
	ArrayList<ProductDTO> plist=prolist.listSpecProduct(spec[i]);
	if(plist==null||plist.size()==0){%>
		<h4><font color="red"><%=spec[i]%>상품이 없습니다.</font></h4>
	<%}else{%>
		<hr color="green" width="600">
		<font color="red" size="5" face="굴림"><b><%=spec[i]%></b></font>
		<hr color="green" width="600">
		<table width="600">
		<tr align="center">
	<%
	int count=1;
	for(ProductDTO dto:plist){%>
	<td align="center">
		<a href="mall_prodview.jsp?pspec=<%=spec[i]%>&pnum=<%=dto.getPnum()%>"><img src="<%=uppath%>\<%=dto.getPimage()%>" width="80" height="80"></a><br>
		<%=dto.getPname()%><br>
		<font color="red"><%=dto.getPrice()%></font>원<br>
		[<%=dto.getPoint()%>] Point
	</td>
	<%
	count++;
	if(count>3){count=1;%></tr><tr align="center">
	<%}
	}%>
	</tr>
	</table>
	<%}
	}%>
<%@include file="mall_bottom.jsp" %>