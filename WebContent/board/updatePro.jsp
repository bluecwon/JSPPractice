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
		alert("글 수정에 성공했습니다.")
		location.href="list.jsp"
		</script>
		<%} else{%>
		<script type="text/javascript">
		alert("글 수정에 실패했습니다. 다시 시도해 주세요")
		history.back();
		</script>
		<%}}else{%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		history.back();
		</script>
		<%} %>
	
<%@ include file="../bottom.jsp" %>