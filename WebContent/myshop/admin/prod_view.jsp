<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="pdao" class="my.shop.ProductBean"/>
    <jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
<%@ include file = "top.jsp"%>
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
<table border="1" class="outline">
	<caption><b>��ǰ �� ����</b></caption>
	<tr>
		<td class="m2">ī�װ�</td>
		<td><%=pdto.getPcategory_fk()%></td>
		<td class="m2">��ǰ��ȣ</td>
		<td><%=pdto.getPnum()%></td>
	</tr>
	<tr>
		<td class="m2">��ǰ��</td>
		<td><%=pdto.getPname()%></td>
		<td class="m2">����ȸ��</td>
		<td><%=pdto.getPcompany()%></td>
	</tr>
	<tr>
		<td class="m2">��ǰ�̹���</td>
		<td colspan="3" align="center">
		<img src="<%=uppath%>\<%=pdto.getPimage()%>" width="100" height="100">
		</td>
	</tr>
	<tr>
		<td class="m2">��ǰ ����</td>
		<td><%=pdto.getPqty()%></td>
		<td class="m2">��ǰ ����</td>
		<td><%=pdto.getPrice()%></td>
	</tr>
	<tr>
		<td class="m2">��ǰ ����</td>
		<td><%=pdto.getPspec()%></td>
		<td class="m2">��ǰ ����Ʈ</td>
		<td><%=pdto.getPoint()%></td>
	</tr>
	<tr>
		<td class="m2">��ǰ �Ұ�</td>
		<td colspan="3"><textarea name="pcontents" rows="10" cols="60"><%=pdto.getPcontents()%></textarea></td>
	</tr>
	<form name="f" action="prod_list.jsp" method="post">
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="���ư���">
		</td>
	</tr>
	</form>
</table>
</div>
<%@include file="bottom.jsp"%>