<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- insert.jsp -->
<%
	String name=request.getParameter("name");
	String writer=request.getParameter("writer");
	String publisher=request.getParameter("publisher");
	Calendar rightnow=Calendar.getInstance();
	//String date=""+rightnow.get(Calendar.YEAR)+(rightnow.get(Calendar.MONTH)+1)+rightnow.get(Calendar.DAY_OF_MONTH);
	//SimpleDateFormat을 활용 쉽게 가능
	if(name==null||writer==null||publisher==null||//페이지를 직접 찾아왔을때
			name.trim().equals("")||writer.trim().equals("")||publisher.trim().equals("")){%>
	<script type="text/javascript">
	alert("도서명 지은이 출판사를 모두 입력하셔야 합니다.")
	history.back();
	</script>
<%	return;//_jspservice 메소드를 끝내기 위해서
	}
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
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
	if(res==0){
	sql="insert into book values(?,?,?,sysdate)";
	ps=con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, writer);
	ps.setString(3, publisher);
	//ps.setString(4, date);
	res=ps.executeUpdate();
	if(res>0){%>
		<script type="text/javascript">
		alert("도서 등록 성공!! 도서 목록페이지로 이동합니다.")
		location.href="booklist.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("도서 등록 실패!! 도서 관리페이지로 이동합니다.")
		location.href="bookmanagement.jsp"
		</script>
<%}
}else{%>
		<script type="text/javascript">
		alert("도서 등록 실패!! 해당 도서명이 존재합니다.")
		location.href="bookmanagement.jsp"
		</script>
<%} %>
<!-- 
	1. 넘어온 데이터 받아오기
	2. 받은 데이터의 유효성을 검사
	3. 드라이버 검색
	4. DB와 연결하여 쿼리문을 전송
	5. 결과에 따라 성공하면 list.jsp로 이동
	    실패를 하면 student.jsp로 이동을 시킨다.
-->