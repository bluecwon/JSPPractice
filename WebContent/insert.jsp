<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- insert.jsp -->
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String cname=request.getParameter("cname");
	
	if(id==null||name==null||cname==null||//�������� ���� ã�ƿ�����
			id.trim().equals("")||name.trim().equals("")||cname.trim().equals("")){%>
	<script type="text/javascript">
	alert("���̵�, �̸�, �б޸��� ��� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="big01";
	String pass="big01";
	Connection con=DriverManager.getConnection(url, user, pass);
	String sql="insert into student values(?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, cname);
	int res=ps.executeUpdate();
	if(res>0){%>
		<script type="text/javascript">
		alert("�л� ��� ����!! �л� ����������� �̵��մϴ�.")
		location.href="list.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("�л� ��� ����!! �л� ����������� �̵��մϴ�.")
		location.href="student.jsp"
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