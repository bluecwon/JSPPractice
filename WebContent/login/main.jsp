<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String id=(String)session.getAttribute("id");
if(id==null){%>
	<script type="text/javascript">
	alert("�α����� �ʿ��� �������Դϴ�.")
	location.href="login.jsp"
	</script>
<%return;}
%>
<h2>�α��� ���� �� ������</h2>
�α��� ���� �� ���̵� : <%=id %>
