<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	if(name==null||	name.trim().equals("")){%>
	<script type="text/javascript">
	alert("�������� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
	}%>
	
<html>
<head>
<title>���� ���� ����</title>
</head>
<body>
<div align="center">
<form action="bookmodify2.jsp" method="post">
		<hr color=green width="300">
		<h2>�� �� �� ��</h2>
		<hr color=green width="300">
	<%Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="big01";
	String pass="big01";
	Connection con=DriverManager.getConnection(url, user, pass);
	String sql="select count(*) from book where name=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, name);
	ResultSet rs=ps.executeQuery();
	rs.next();
	int res=rs.getInt(1);
	if(res>0){%>
				������ : <input type="text" name="name" value=<%=name%> readOnly><br>
				������ : <input type="text" name="writer"><br>
				���ǻ� : <input type="text" name="publisher"><br>
				<input type="submit" value="����">
				<input type="reset" value="���">
				<!-- asldfkjasldjfoiasjfoaewflkahsdf -->
	<%}%>
	
	</form>
	</div>
</body>
</html>