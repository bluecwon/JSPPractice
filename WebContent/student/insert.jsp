<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- insert.jsp -->
    <% request.setCharacterEncoding("EUC-KR"); %><!-- ����Ʈ ����϶� �ѱ� ó�� -->
    <jsp:useBean id="stdao" class="my.student.StudentDAO"/>
        <!-- Student stdao =new StudentDAO();  ���� ����-->
    <!-- useBean�� default �����ڸ� �ҷ����� ������ �� �����ؾ� �Ѵ� public -->
    <jsp:useBean id="stdto" class="my.student.StudentDTO"/>
    <!-- <jsp:setProperty property="id" name="stdto"/> -->
    <!-- stdto.setID(request.getParameter("id")); -->
    <jsp:setProperty property="*" name="stdto"/>
    <!-- ��� �Ѿ���� ���� �ڵ����� dto�� �־ ���� -->
<%
	//String id=request.getParameter("id");
	//String name=request.getParameter("name");
	//String cname=request.getParameter("cname");
	
	if(stdto.getId()==null||stdto.getName()==null||stdto.getCname()==null||//�������� ���� ã�ƿ�����
			stdto.getId().trim().equals("")||stdto.getName().trim().equals("")||stdto.getCname().trim().equals("")){%>
	<script type="text/javascript">
	alert("���̵�, �̸�, �б޸��� ��� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
	}
	int res=stdao.insertStudent(stdto);
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