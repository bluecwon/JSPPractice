<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="bdao" class="my.book.BookDAO"/>
    
    <!-- insert.jsp -->
<%
	String name=request.getParameter("name");
	String writer=request.getParameter("writer");
	String publisher=request.getParameter("publisher");
	if(name==null||writer==null||publisher==null||//�������� ���� ã�ƿ�����
			name.trim().equals("")||writer.trim().equals("")||publisher.trim().equals("")){%>
	<script type="text/javascript">
	alert("������ ������ ���ǻ縦 ��� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
<%	return;
	}
	int res=bdao.checkBook(name);
	if(res==0){
		res= bdao.insertBook(name, writer, publisher);
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