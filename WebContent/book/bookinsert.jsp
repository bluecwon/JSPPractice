<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="bdao" class="my.book.BookDAO"/>
    <% request.setCharacterEncoding("EUC-KR"); %>
    <jsp:useBean id="bdto" class="my.book.BookDTO"/>
    <<jsp:setProperty property="*" name="bdto"/>
    
    <!-- insert.jsp -->
<%
	if(bdto.getName()==null||bdto.getWriter()==null||bdto.getPublisher()==null||//�������� ���� ã�ƿ�����
			bdto.getName().trim().equals("")||bdto.getWriter().trim().equals("")||bdto.getPublisher().trim().equals("")){%>
	<script type="text/javascript">
	alert("������ ������ ���ǻ縦 ��� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;
	}
	int res=bdao.checkBook(bdto.getName());
	if(res==0){
		res= bdao.insertBook(bdto);
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