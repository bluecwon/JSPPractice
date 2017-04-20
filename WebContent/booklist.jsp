<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<html>
<head>
<title>학생 목록페이지</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>도 서 목 록 보 기</h2>
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
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String user = "big01";
				String pass = "big01";
				Connection con = DriverManager.getConnection(url, user, pass);
				String sql = "select * from book";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				int i = 0;
				while (rs.next()) {
					i++;
			%>
			<tr align="center">
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("writer")%></td>
				<td><%=rs.getString("publisher")%></td>
				<td><%=rs.getString("indate")%></td>
			</tr>
			<%
				}
				if (i == 0) {
			%>
			<tr>
				<td colspan="3" align="center">도서 목록이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
		<form action="bookmanagement.jsp">
		<input type="submit" value="확인">
		</form>
</body>
</html>

<!-- 
	1. 기본 화면 모습 출력
	2. 드라이버 검색
	3. DB와 연결하여 쿼리문 전송
	4. 결과를 받아서
	5. 있으면 출력, 없으면 없다라고 출력
-->