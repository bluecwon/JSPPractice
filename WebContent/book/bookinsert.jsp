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
	//SimpleDateFormat�� Ȱ�� ���� ����
	if(name==null||writer==null||publisher==null||//�������� ���� ã�ƿ�����
			name.trim().equals("")||writer.trim().equals("")||publisher.trim().equals("")){%>
	<script type="text/javascript">
	alert("������ ������ ���ǻ縦 ��� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
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
		alert("���� ��� ����!! ���� ����������� �̵��մϴ�.")
		location.href="booklist.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("���� ��� ����!! ���� ������������ �̵��մϴ�.")
		location.href="bookmanagement.jsp"
		</script>
<%}
}else{%>
		<script type="text/javascript">
		alert("���� ��� ����!! �ش� �������� �����մϴ�.")
		location.href="bookmanagement.jsp"
		</script>
<%} %>
<!-- 
	1. �Ѿ�� ������ �޾ƿ���
	2. ���� �������� ��ȿ���� �˻�
	3. ����̹� �˻�
	4. DB�� �����Ͽ� �������� ����
	5. ����� ���� �����ϸ� list.jsp�� �̵�
	    ���и� �ϸ� student.jsp�� �̵��� ��Ų��.
-->