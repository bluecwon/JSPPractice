<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id=(String)session.getAttribute("id");
	String pwd=(String)session.getAttribute("pwd");
	if(id==null||pwd==null){%>
		<script type="text/javascript">
			alert("���� �α��� �� �ּ���!!")
			location.href="sessiontest1.jsp"
		</script>
	<%return;
	} %>
<h2>ȸ �� �� �� �� �� ��</h2>
<font color="red">
	<b>ȸ���鸸 �� �� �ִ� ������ �Դϴ�.</b><br>
	<b>�α����� �ȵǾ������� ��� �� ������ ������ �Դϴ�.</b><br>
</font>
<br>
<a href="sessiontest3.jsp">�α׾ƿ�</a>
