<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<html>
<head>
<title>도서 찾기 페이지</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>도 서 찾 기</h2>
		<hr color=green width="300">
	</div>
	<table align="center" border="1" width="300">
		<tr align="center" bgcolor="YELLOW">
			<th>도서명</th>
			<th>지은이</th>
			<th>출판사</th>
			<th>입고일</th>
		</tr>
		<%
			String name = request.getParameter("name");
			if (name == null || name.trim().equals("")) {
				response.sendRedirect("bookmanagement.jsp");
				return;
			}
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "big01";
			String pass = "big01";
			Connection con = DriverManager.getConnection(url, user, pass);
			String sql = "select count(*) from book where name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if(count>0){
				sql = "select * from book where name=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				rs = ps.executeQuery();
				while (rs.next()) {
		%>
		<tr align="center">
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("writer")%></td>
			<td><%=rs.getString("publisher")%></td>
			<td><%=rs.getString("indate")%></td>
		</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan="3" align="center">해당 도서명을 가지는 책이 존재하지않습니다.</td>
		</tr>
		<%
			}
		%>
		<tr>
		
		</tr>
	</table>
</body>
</html>