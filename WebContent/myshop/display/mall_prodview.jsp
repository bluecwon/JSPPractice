<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@include file="mall_top.jsp" %>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
<script type="text/javascript">
	function cartAdd(){
		check=confirm("��ٱ��Ͽ� �����ðڽ���?")
		if(check==true){
		document.f.action="mall_cartAdd.jsp";
		document.f.submit()
		}else{
		history.back();
		}
	}
	function order(){
		check=confirm("��ñ����Ͻðڽ���?")
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
			alert("�߸��� �����Դϴ�.")
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
			alert("ó������ �ٽ� �õ����ּ���")
			location.href("main.jsp")
		</script>
	<% return;}
	String uppath=config.getServletContext().getRealPath("/myshop/images");
%>
<div align="center">
<table width="600" height="400" class="outline">
	<tr class="m1" height="10%"><td colspan="2" align="center"><font color="green" size="4"><b>[<%=pdto.getPname() %>] ��ǰ����</b></font></td></tr>
	<tr class="m3" height="45%">
		<td width="50%" align="center" class="m3"><img src="<%=uppath%>\<%=pdto.getPimage()%>" width="200" height="200"></td>
		<td class="m3">
			��ǰ��ȣ : <%=pdto.getPnum() %><br>
			��ǰ�̸� : <%=pdto.getPname() %><br>
			��ǰ���� : <font color="red"><b><%=pdto.getPrice() %></b></font>��<br>
			��ǰ����Ʈ : <font color="red"><b>[<%=pdto.getPoint() %>]</b></font>point<br>
			<form name="f" method="post">
			<input type="hidden" name="mode" value="2">
			<input type="hidden" name="pname" value="<%=pdto.getPname()%>">
			<input type="hidden" name="price" value="<%=pdto.getPrice()%>">
			<input type="hidden" name="key" value="<%=key %>">
			<input type="hidden" name="pnum" value="<%=pdto.getPnum() %>">
			��ǰ���� : <input type="text" name="qty" value="1" maxlength="2" size="3">��<br><br>
			<a href="javascript:cartAdd();">��ٱ���</a> | <a href="javascript:order()">��ñ���</a>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="2" valign="top">
			<b>��ǰ �� ����</b><br>
			<%=pdto.getPcontents() %>
		</td>
	</tr>
</table>
</div>