<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="cdao" class="my.shop.CategoryBean"/>
    <jsp:setProperty property="pool" name="cdao" value="<%=pool %>"/>
<%@ include file = "top.jsp"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<h5>ī�װ� ���</h5>
<table border="1" width="400" class="outline">
	<tr bgcolor="yellow" height="10%">
		<th class="m2">��ȣ</th>
		<th class="m2">ī�װ��ڵ�</th>
		<th class="m2">ī�װ���</th>
		<th class="m2">����</th>
	</tr>
	<%
	ArrayList<CategoryDTO> list=cdao.listCategory();
	if(list==null||list.size()==0){%>
	<tr align="center">
		<td colspan="4" class="box"><font color="red">��ϵ� ī�װ��� �����ϴ�.</font></td>
	</tr>
	<%return;}else{
	for(CategoryDTO dto:list){%>
	<tr align="center">
		<td class="box"><%=dto.getCnum() %></td>
		<td class="box"><%=dto.getCode() %></td>
		<td class="box"><%=dto.getCname() %></td>
		<td class="box"><a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">����</a></td>
	</tr>
	<%}
	} %>
</table>
<%@ include file = "bottom.jsp"%>