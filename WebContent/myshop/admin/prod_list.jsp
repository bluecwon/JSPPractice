<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="pdao" class="my.shop.ProductBean"/>
    <jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
<%@ include file = "top.jsp"%>
<% request.setCharacterEncoding("EUC-KR");
String uppath=config.getServletContext().getRealPath("/myshop");
%>
<h5>ī�װ� ���</h5>
<table border="1" width="800" class="outline">
	<tr bgcolor="yellow" height="10%">
		<th class="m2">��ȣ</th>
		<th class="m2">��ǰ�ڵ�</th>
		<th class="m2">��ǰ��</th>
		<th class="m2">�̹���</th>
		<th class="m2">����</th>
		<th class="m2">������</th>
		<th class="m2">����</th>
		<th class="m2">����/����</th>
	</tr>
	<%
	ArrayList<ProductDTO> list=pdao.listProduct();
	if(list==null||list.size()==0){%>
	<tr align="center">
		<td colspan="8" class="box"><font color="red">��ϵ� ī�װ��� �����ϴ�.</font></td>
	</tr>
	<%return;}else{
	for(ProductDTO dto:list){%>
	<tr align="center">
		<td class="box"><%=dto.getPnum() %></td>
		<td class="box"><%=dto.getPcategory_fk() %></td>
		<td class="box"><%=dto.getPname() %></td>
		<td class="box"><a href="prod_view.jsp?pnum=<%=dto.getPnum()%>"><img src="<%=uppath%>\<%=dto.getPimage()%>" width="60" height="60"></a></td>
		<td class="box"><%=dto.getPrice() %></td>
		<td class="box"><%=dto.getPcompany() %></td>
		<td class="box"><%=dto.getPqty() %></td>
		<td class="box">
		<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">���� |</a>
		<a href="prod_delete.jsp?pnum=<%=dto.getPnum()%>">����</a>
		</td>
	</tr>
	<%}
	} %>
</table>
<%@ include file = "bottom.jsp"%>