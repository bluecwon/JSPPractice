<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	if(name==null||	name.trim().equals("")){%>
	<script type="text/javascript">
	alert("도서명을 입력하셔야 합니다.")
	history.back();
	</script>
<%	return;//_jspservice 메소드를 끝내기 위해서
	}%>
	
<html>
<head>
<title>도서 정보 수정</title>
</head>
<body>
<div align="center">
<form action="bookmodify2.jsp" method="post">
		<hr color=green width="300">
		<h2>도 서 수 정</h2>
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
				도서명 : <input type="text" name="name" value=<%=name%> readOnly><br>
				지은이 : <input type="text" name="writer"><br>
				출판사 : <input type="text" name="publisher"><br>
				<input type="submit" value="수정">
				<input type="reset" value="취소">
				<!-- asldfkjasldjfoiasjfoaewflkahsdf -->
	<%}%>
	
	</form>
	</div>
</body>
</html>