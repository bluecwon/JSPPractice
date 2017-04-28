<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@include file="mall_top.jsp" %>
<jsp:useBean id="pdao" class="my.shop.ProductBean"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
<%String spnum=request.getParameter("pnum");
	if(spnum==null||spnum.trim().equals("")){%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.")
			location.href("main.jsp")
		</script>
	<%return;}
	int pnum=Integer.parseInt(spnum);
	ProductDTO pdto=pdao.searchProduct(pnum);
	if(pdto==null){%>
		<script type="text/javascript">
			alert("처음부터 다시 시도해주세요")
			location.href("main.jsp")
		</script>
	<% return;}
	String uppath=config.getServletContext().getRealPath("/myshop/images");
%>
<div align="center">
<table width="600" height="400" class="outline">
	<tr class="m1" height="10%"><td colspan="2" align="center"><font color="green" size="4"><b>[<%=pdto.getPname() %>] 상품정보</b></font></td></tr>
	<tr class="m3" height="45%">
		<td width="50%" align="center" class="m3"><img src="<%=uppath%>\<%=pdto.getPimage()%>" width="200" height="200"></td>
		<td class="m3">
			상품번호 : <%=pdto.getPnum() %><br>
			상품이름 : <%=pdto.getPname() %><br>
			상품가격 : <font color="red"><b><%=pdto.getPrice() %></b></font>원<br>
			상품포인트 : <font color="red"><b><%=pdto.getPoint() %></b></font>point<br>
			<form name="f" action="" method="post">
			상품갯수 : <input type="text" name="qty" value="1" maxlength="2" size="3">개
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="2" valign="top">
			<b>상품 상세 설명</b><br>
			<%=pdto.getPcontents() %>
		</td>
	</tr>
</table>
</div>