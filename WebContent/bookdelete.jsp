<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	if(name==null||name.trim().equals("")){%>
	<script type="text/javascript">
	alert("�������� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
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
		alert("���� ���� ���� ���� ����������� �̵��մϴ�.")
		location.href="booklist.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("�ش� �������� ���� å�� �����ϴ�..")
		location.href="bookmanagement.jsp"
		</script>
<%} %>