<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:useBean id="bdbb" class="my.board.BoardDBBean"/>
<jsp:setProperty property="pool" name="bdb" value="<%=pool %>"/>
<jsp:setProperty property="*" name="bdbb"/>
<%
	if(bdb.checkPass(bdbb.getNum(),bdbb.getPasswd())){
		int res=bdb.updateBoard(bdbb);
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