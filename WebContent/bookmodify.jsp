<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- edit.jsp -->
<%
		String name = request.getParameter("name");
		if (name==null || name.trim().equals("")){
			response.sendRedirect("bookmanagement.jsp");
			return;
		}
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "big01";
		String pass = "big01";
		Connection con = DriverManager.getConnection(url, user, pass);
		String sql = "select * from book where name=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			//String name = rs.getString(1);
			String writer = rs.getString(2);
			String publisher = rs.getString(3);
			String indate = rs.getString(4);%>
	<hr color="green" width="300">
	<h2>�� �� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name="f" action="bookmodify2.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					������ : <input type="text" name="name" 
					value="<%=name%>" readOnly><br>
					������ : <input type="text" name="writer" 
					value="<%=writer%>"><br>
					���ǻ� : <input type="text" name="publisher" 
					value="<%=publisher%>"><br>
					<input type="submit" value="�Է�">
					<input type="reset" value="���">
				</td>
			</tr>
		</table>
	</form>			
<%	}%>	















