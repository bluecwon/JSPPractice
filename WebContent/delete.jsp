<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String id=request.getParameter("id");
	if(id==null||id.trim().equals("")){%>
	<script type="text/javascript">
	alert("���̵� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
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
		alert("�л� ���� �����̤� �л� ����������� �̵��մϴ�.")
		location.href="list.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("�ش� ���̵�� �������� �ʴ� ���̵� �Դϴ�.")
		location.href="student.jsp"
		</script>
<%} %>