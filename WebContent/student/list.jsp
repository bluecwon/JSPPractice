<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.* , my.student.*"%>
	<<jsp:useBean id="stdao" class="my.student.StudentDAO"/>
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
				<th>ID</th>
				<th>�̸�</th>
				<th>�б޸�</th>
			</tr>
			<%
			ArrayList<StudentDTO> list =stdao.listStudent();
			if(list==null || list.size()==0){%>
				<tr>
					<td colspan="3">��ϵ� �л��� �����ϴ�.</td>
				</tr>
			<%}else{
			for(StudentDTO sdto:list){%>
				<tr>
					<td><%=sdto.getId() %></td>
					<td><%=sdto.getName() %></td>
					<td><%=sdto.getCname() %></td>
				</tr>
			<%}
			}
			%>
		</table>
</body>
</html>

<!-- 
	1. �⺻ ȭ�� ��� ���
	2. ����̹� �˻�
	3. DB�� �����Ͽ� ������ ����
	4. ����� �޾Ƽ�
	5. ������ ���, ������ ���ٶ�� ���
-->