<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mdao" class="my.member.MemberDAO"/>

	<%
	String no=request.getParameter("no");
	if(no==null||no.trim().equals("")){
		response.sendRedirect("viewmember.jsp");
	}
	int res=mdao.deleteMember(Integer.parseInt(no));
	if(res>0){%>
	<script type="text/javascript">
	alert("ȸ�� ������ �����ϼ̽��ϴ�.")
	location.href="viewmember.jsp"
	</script>
	<%} else{%>
	<script type="text/javascript">
	alert("ȸ�� ������ �����Ͽ����ϴ�. �ٽ� �õ��� �ּ���")
	location.href="viewmember.jsp"
	</script>
	<%} %>