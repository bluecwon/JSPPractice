<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@include file="mall_top.jsp" %>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
<script type="text/javascript">
	function cartAdd(){
		check=confirm("장바구니에 담으시겠습까?")
		if(check==true){
		document.f.action="mall_cartAdd.jsp";
		document.f.submit()
		}else{
		history.back();
		}
	}
	function order(){
		check=confirm("즉시구매하시겠습까?")
		if(check==true){
		document.f.action="mall_order.jsp";
		document.f.submit()
		}else{
		history.back();
		}
	}
</script>
<%String spnum=request.getParameter("pnum");
	String spec=request.getParameter("pspec");
	String cate=request.getParameter("cate");
	if(spnum==null||spnum.trim().equals("")){%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.")
			location.href("main.jsp")
		</script>
	<%return;}
	int pnum=Integer.parseInt(spnum);
	ProductDTO pdto=null;
	String key=null;
	if(cate==null||cate.trim().equals("")){
		pdto=prolist.searchProduct(spec,pnum);
		key=spec;
	}else{
		pdto=prolist.searchProduct(cate,pnum);
		key=cate;
	}
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
			상품포인트 : <font color="red"><b>[<%=pdto.getPoint() %>]</b></font>point<br>
			<form name="f" method="post">
			<input type="hidden" name="mode" value="2">
			<input type="hidden" name="pname" value="<%=pdto.getPname()%>">
			<input type="hidden" name="price" value="<%=pdto.getPrice()%>">
			<input type="hidden" name="key" value="<%=key %>">
			<input type="hidden" name="pnum" value="<%=pdto.getPnum() %>">
			상품갯수 : <input type="text" name="qty" value="1" maxlength="2" size="3">개<br><br>
			<a href="javascript:cartAdd();">장바구니</a> | <a href="javascript:order()">즉시구매</a>
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