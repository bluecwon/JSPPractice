<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String id=request.getParameter("id");
	if(id==null||id.trim().equals("")){%>
	<script type="text/javascript">
	alert("아이디를 입력하셔야 합니다.")
	history.back();
	</script>
<%	return;//_jspservice 메소드를 끝내기 위해서
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="big01";
	String pass="big01";
	Connection con=DriverManager.getConnection(url, user, pass);
	String sql="delete from student where id=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, id);
	int res=ps.executeUpdate();
	if(res>0){%>
		<script type="text/javascript">
		alert("학생 삭제 성공ㅜㅜ 학생 목록페이지로 이동합니다.")
		location.href="list.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("해당 아이디는 존재하지 않는 아이디 입니다.")
		location.href="student.jsp"
		</script>
<%} %>