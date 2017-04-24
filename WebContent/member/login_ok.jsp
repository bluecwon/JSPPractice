<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mdao" class="my.member.MemberDAO"/>
<jsp:useBean id="mdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%if(mdao.loginOk(mdto)){%>
	<script type="text/javascript">
	alert("로그인에 성공하셨습니다.")
	</script>
<%} else {%>
	<script type="text/javascript">
	alert("로그인에 실패하셨습니다.")
	</script>
<%}%>