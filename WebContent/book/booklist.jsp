<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
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