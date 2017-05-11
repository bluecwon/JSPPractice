<%@page import="java.util.*, my.board.*, my.db.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<%
	String num=request.getParameter("num");
	String passwd=request.getParameter("passwd");
	if(bdb.checkPass(Integer.parseInt(num), passwd)){
		String filename=bdb.getFile(Integer.parseInt(num));
		int res=bdb.deleteBoard(Integer.parseInt(num));
		if(res>0){
			String delPath = application.getRealPath("/board/downloadfile");
			File file = new File(delPath, filename);
			if(file.exists())file.delete();
		%>
		<script type="text/javascript">
		alert("글 삭제에 성공했습니다.")
		location.href="list.jsp"
		</script>
		<%} else{%>
		<script type="text/javascript">
		alert("글 삭제에 실패했습니다. 다시 시도해 주세요")
		history.back();
		</script>
		<%}}else{%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		history.back();
		</script>
		<%} %>
	
<%@ include file="../bottom.jsp" %>