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
	if(bdbb.getSubject()==null||bdbb.getContent()==null||bdbb.getPasswd()==null
	||bdbb.getSubject().trim().equals("")||bdbb.getContent().trim().equals("")||
	bdbb.getPasswd().trim().equals("")){%>
	<script type="text/javascript">
	alert("����, ����, �н������� �Է��ϼž� �մϴ�.")
	history.back();
	</script>
	<% return;
	}
	int res=bdb.inputBoard(bdbb);
	if(res>0){%>
	<script type="text/javascript">
	alert("�� ��Ͽ� �����߽��ϴ�.")
	location.href="list.jsp"
	</script>
	<%} else{%>
	<script type="text/javascript">
	alert("�� ��Ͽ� �����߽��ϴ�. �ٽ� �õ��� �ּ���")
	history.back();
	</script>
	<%} %>

<%@ include file="../bottom.jsp" %>