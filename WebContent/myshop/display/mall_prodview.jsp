<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@include file="mall_top.jsp" %>
<jsp:useBean id="pdao" class="my.shop.ProductBean"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
<%String spnum=request.getParameter("pnum");
	if(spnum==null||spnum.trim().equals("")){%>
		<script type="text/javascript">
			alert("�߸��� �����Դϴ�.")
			location.href("main.jsp")
		</script>
	<%return;}
	int pnum=Integer.parseInt(spnum);
	ProductDTO pdto=pdao.searchProduct(pnum);
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
			��ǰ����Ʈ : <font color="red"><b><%=pdto.getPoint() %></b></font>point<br>
			<form name="f" action="" method="post">
			��ǰ���� : <input type="text" name="qty" value="1" maxlength="2" size="3">��
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