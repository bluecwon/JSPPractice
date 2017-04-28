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
<form name="prodin" action="prod_update_ok.jsp" method="post" enctype="multipart/form-data">
	<tr>
		<td class="m2">카테고리</td>
			<td><input type="text" name="pcategory_fk" value="<%=pdto.getPcategory_fk()%>" readonly></td>
	</tr>
	<tr>
		<td class="m2">상품번호</td>
		<td><%=pdto.getPnum()%><input type="hidden" name="pnum" value="<%=pdto.getPnum()%>"></td>
	</tr>
	<tr>
		<td class="m2">상품명</td>
		<td><input type="text" name="pname" value="<%=pdto.getPname()%>"></td>
	</tr>
	<tr>
		<td class="m2">제조회사</td>
		<td><input type="text" name="pcompany" value="<%=pdto.getPcompany()%>"></td>
	</tr>
	<tr>
		<td class="m2">상품이미지</td>
		<td>
		<img src="<%=uppath%>\<%=pdto.getPimage()%>" width="60" height="60">
		<input type="hidden" name="pimage1" value="<%=pdto.getPimage()%>">
		<input type="file" name="pimage">
		</td>
	</tr>
	<tr>
		<td class="m2">상품 수량</td>
		<td><input type="text" name="pqty" value="<%=pdto.getPqty()%>"></td>
	</tr>
	<tr>
		<td class="m2">상품 가격</td>
		<td><input type="text" name="price" value="<%=pdto.getPrice()%>"></td>
	</tr>
	<tr>
		<td class="m2">상품 스펙</td>
		<td>
		<select name="pspec">
			<%String[] spec={"NORMAL","HIT","BEST","NEW"};
			for(int i=0;i<spec.length;i++){
				if(spec[i].equals(pdto.getPspec())){%>
					<option value="<%=spec[i]%>" selected> ::<%=spec[i]%>::
				<%}else{%>
					<option value="<%=spec[i]%>"> ::<%=spec[i]%>::
			<%}}%>
		</select>
		</td>
	</tr>
	<tr>
		<td class="m2">상품 소개</td>
		<td><textarea name="pcontents" rows="10" cols="60"><%=pdto.getPcontents()%></textarea></td>
	</tr>
	<tr>
		<td class="m2">상품 포인트</td>
		<td><input type="text" name="point" value="<%=pdto.getPoint()%>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="정보 수정">
			<input type="reset" value="취소">
		</td>
	</tr>
	</form>
</table>
</div>
<%@include file="bottom.jsp"%>
