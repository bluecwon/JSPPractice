<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	if(name==null||name.trim().equals("")){%>
	<script type="text/javascript">
	alert("도서명을 입력하셔야 합니다.")
	history.back();
	</script>
<%	return;//_jspservice 메소드를 끝내기 위해서
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="big01";
	String pass="big01";
	Connection con=DriverManager.getConnection(url, user, pass);
	String sql="delete from book where name=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, name);
	int res=ps.executeUpdate();
	if(res>0){%>
		<script type="text/javascript">
		alert("도서 삭제 성공 도서 목록페이지로 이동합니다.")
		location.href="booklist.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("해당 도서명을 가진 책은 없습니다..")
		location.href="bookmanagement.jsp"
		</script>
<%} %>