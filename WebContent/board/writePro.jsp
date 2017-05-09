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
	alert("제목, 내용, 패스워드모두 입력하셔야 합니다.")
	history.back();
	</script>
	<% return;
	}
	int res=bdb.inputBoard(bdbb);
	if(res>0){%>
	<script type="text/javascript">
	alert("글 등록에 성공했습니다.")
	location.href="list.jsp"
	</script>
	<%} else{%>
	<script type="text/javascript">
	alert("글 등록에 실패했습니다. 다시 시도해 주세요")
	history.back();
	</script>
	<%} %>

<%@ include file="../bottom.jsp" %>