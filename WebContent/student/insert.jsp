<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- insert.jsp -->
    <jsp:useBean id="stdao" class="my.student.StudentDAO"/>
    <!-- Student stdao =new StudentDAO();  ���� ����-->
    <!-- useBean�� default �����ڸ� �ҷ����� ������ �� �����ؾ� �Ѵ� public -->
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
	int res=stdao.insertStudent(id,name,cname);
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