<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mdao" class="my.member.MemberDAO"/>
<jsp:useBean id="mdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%if(mdao.loginOk(mdto)){%>
	<script type="text/javascript">
	alert("�α��ο� �����ϼ̽��ϴ�.")
	</script>
<%} else {%>
	<script type="text/javascript">
	alert("�α��ο� �����ϼ̽��ϴ�.")
	</script>
<%}%>