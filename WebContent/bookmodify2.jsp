<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	String writer=request.getParameter("writer");
	String publisher=request.getParameter("publisher");
	if(name==null||writer==null||publisher==null||//�������� ���� ã�ƿ�����
			name.trim().equals("")||writer.trim().equals("")||publisher.trim().equals("")){%>
	<script type="text/javascript">
	alert("������ ������ ���ǻ縦 ��� �Է��ϼž� �մϴ�.")
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
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
		alert("���� ���� ����!! ���� ����������� �̵��մϴ�.")
		location.href="booklist.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("���� ���� ����!! ���� ������������ �̵��մϴ�.")
		location.href="bookmanagement.jsp"
		</script>
<%}%>
