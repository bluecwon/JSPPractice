<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<html>
<head>
<title>�л� ���������</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>�� �� I D ã ��</h2>
		<hr color=green width="300">
	</div>
	<table align="center" border="1" width="300">
		<tr align="center" bgcolor="YELLOW">
			<th>ID</th>
		</tr>
		<%
			String name = request.getParameter("name");
			if (name == null || name.trim().equals("")) {
				response.sendRedirect("student.jsp");
				return;
			}
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "big01";
			String pass = "big01";
			Connection con = DriverManager.getConnection(url, user, pass);
			String sql = "select count(*) from student where name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if(count>0){
				sql = "select * from student where name=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				rs = ps.executeQuery();
				while (rs.next()) {
		%>
		<tr align="center">
			<td><%=rs.getString("id")%></td>
		</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan="3" align="center">�̸��� �ش��ϴ� ���̵� �������� �ʽ��ϴ�.</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>