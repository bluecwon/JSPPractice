<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*, my.student.*"%>
<jsp:useBean id="stdao" class="my.student.StudentDAO"/>
	
<html>
<head>
<title>학생 찾기 페이지</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>학 생 I D 찾 기</h2>
		<hr color=green width="300">
	</div>
	<table align="center" border="1" width="300">
		<tr align="center" bgcolor="YELLOW">
			<th>ID</th>
			<th>Name</th>
			<th>Cname</th>
		</tr>
		<%
			String name = request.getParameter("name");
			if (name == null || name.trim().equals("")) {
				response.sendRedirect("student.jsp");
				return;
			}
			ArrayList<StudentDTO> list=stdao.searchStudent(name);
			if(list!=null&&list.size()!=0){
			for(StudentDTO sdto:list){
			%>
				<tr align="center">
					<td><%=sdto.getId()%></td>
					<td><%=sdto.getName()%></td>
					<td><%=sdto.getCname()%></td>
				</tr>
			<%
				}
			}
			else {
		%>
		<tr>
			<td colspan="3" align="center">이름에 해당하는 아이디가 존재하지 않습니다.</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>