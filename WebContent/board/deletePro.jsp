<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:setProperty property="pool" name="bdb" value="<%=pool %>"/>
<%
	String num=request.getParameter("num");
	String passwd=request.getParameter("passwd");
	if(bdb.checkPass(Integer.parseInt(num), passwd)){
		int res=bdb.deleteBoard(Integer.parseInt(num));
		if(res>0){%>
		<script type="text/javascript">
		alert("�� ������ �����߽��ϴ�.")
		location.href="list.jsp"
		</script>
		<%} else{%>
		<script type="text/javascript">
		alert("�� ������ �����߽��ϴ�. �ٽ� �õ��� �ּ���")
		history.back();
		</script>
		<%}}else{%>
		<script type="text/javascript">
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
		history.back();
		</script>
		<%} %>
	
<%@ include file="../bottom.jsp" %>