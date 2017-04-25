<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="mdao" class="my.member.MemberDAO"/>
    <jsp:setProperty property="pool" name="mdao" value="<%=pool %>"/>

	<%
	String no=request.getParameter("no");
	if(no==null||no.trim().equals("")){
		response.sendRedirect("viewmember.jsp");
	}
	int res=mdao.deleteMember(Integer.parseInt(no));
	if(res>0){%>
	<script type="text/javascript">
	alert("회원 삭제에 성공하셨습니다.")
	location.href="viewmember.jsp"
	</script>
	<%} else{%>
	<script type="text/javascript">
	alert("회원 삭제에 실패하였습니다. 다시 시도해 주세요")
	location.href="viewmember.jsp"
	</script>
	<%} %>