<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="pdao" class="my.shop.ProductBean"/>
    <jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
<%@ include file = "top.jsp"%>
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
<table border="1" class="outline">
	<caption><b>상품 상세 보기</b></caption>
	<tr>
		<td class="m2">카테고리</td>
		<td><%=pdto.getPcategory_fk()%></td>
		<td class="m2">상품번호</td>
		<td><%=pdto.getPnum()%></td>
	</tr>
	<tr>
		<td class="m2">상품명</td>
		<td><%=pdto.getPname()%></td>
		<td class="m2">제조회사</td>
		<td><%=pdto.getPcompany()%></td>
	</tr>
	<tr>
		<td class="m2">상품이미지</td>
		<td colspan="3" align="center">
		<img src="<%=uppath%>\<%=pdto.getPimage()%>" width="100" height="100">
		</td>
	</tr>
	<tr>
		<td class="m2">상품 수량</td>
		<td><%=pdto.getPqty()%></td>
		<td class="m2">상품 가격</td>
		<td><%=pdto.getPrice()%></td>
	</tr>
	<tr>
		<td class="m2">상품 스펙</td>
		<td><%=pdto.getPspec()%></td>
		<td class="m2">상품 포인트</td>
		<td><%=pdto.getPoint()%></td>
	</tr>
	<tr>
		<td class="m2">상품 소개</td>
		<td colspan="3"><textarea name="pcontents" rows="10" cols="60"><%=pdto.getPcontents()%></textarea></td>
	</tr>
	<form name="f" action="prod_list.jsp" method="post">
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="돌아가기">
		</td>
	</tr>
	</form>
</table>
</div>
<%@include file="bottom.jsp"%>