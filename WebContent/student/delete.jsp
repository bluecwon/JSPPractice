<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- insert.jsp -->
    <jsp:useBean id="stdao" class="my.student.StudentDAO"/>
<%
	String id=request.getParameter("id");
	if(id==null||id.trim().equals("")){%>
	<script type="text/javascript">
	alert("���̵� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;//_jspservice �޼ҵ带 ������ ���ؼ�
	}
	int res=stdao.deleteStudent(id);
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