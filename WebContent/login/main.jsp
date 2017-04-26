<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String id=(String)session.getAttribute("id");
if(id==null){%>
	<script type="text/javascript">
	alert("로그인이 필요한 페이지입니다.")
	location.href="login.jsp"
	</script>
<%return;}
%>
<h2>로그인 성공 후 페이지</h2>
로그인 성공 한 아이디 : <%=id %>
