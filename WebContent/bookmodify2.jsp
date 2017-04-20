<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	String writer=request.getParameter("writer");
	String publisher=request.getParameter("publisher");
	if(name==null||writer==null||publisher==null||//페이지를 직접 찾아왔을때
			name.trim().equals("")||writer.trim().equals("")||publisher.trim().equals("")){%>
	<script type="text/javascript">
	alert("도서명 지은이 출판사를 모두 입력하셔야 합니다.")
	</script>
<%	return;//_jspservice 메소드를 끝내기 위해서
	}
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="big01";
	String pass="big01";
	Connection con=DriverManager.getConnection(url, user, pass);
	String sql="update book set writer=?, publisher=? where name=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, writer);
	ps.setString(2, publisher);
	ps.setString(3, name);
	int res=ps.executeUpdate();
	if(res>0){%>
		<script type="text/javascript">
		alert("도서 수정 성공!! 도서 목록페이지로 이동합니다.")
		location.href="booklist.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("도서 수정 실패!! 도서 관리페이지로 이동합니다.")
		location.href="bookmanagement.jsp"
		</script>
<%}%>
