<%@page import="java.util.*, my.book.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="bdao" class="my.book.BookDAO"/>
<html>
<head>
<title>�л� ���������</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>�� �� �� �� �� ��</h2>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="300">
			<tr align="center" bgcolor="YELLOW">
				<th>������</th>
				<th>������</th>
				<th>���ǻ�</th>
				<th>�԰���</th>
			</tr>
			<%
				ArrayList<BookDTO> list= bdao.listBook();
				if(list!=null||list.size()!=0){
					for(BookDTO bdto:list){
			%>
			<tr align="center">
				<td><%=bdto.getName()%></td>
				<td><%=bdto.getWriter()%></td>
				<td><%=bdto.getPublisher()%></td>
				<td><%=bdto.getIndate()%></td>
			</tr>
			<%
					}
				}
				else{
			%>
			<tr>
				<td colspan="3" align="center">���� ����� �����ϴ�.</td>
			</tr>
			<%
				}
			%>
		</table>
		<form action="bookmanagement.jsp">
		<input type="submit" value="Ȯ��">
		</form>
</body>
</html>

<!-- 
	1. �⺻ ȭ�� ��� ���
	2. ����̹� �˻�
	3. DB�� �����Ͽ� ������ ����
	4. ����� �޾Ƽ�
	5. ������ ���, ������ ���ٶ�� ���
-->