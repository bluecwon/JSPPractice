<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("EUC-KR"); %>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="mdao" class="my.member.MemberDAO"/>
    <jsp:useBean id="mdto" class="my.member.MemberDTO"/>
    <jsp:setProperty property="pool" name="mdao" value="<%=pool %>"/>
    <jsp:setProperty property="*" name="mdto"/>
    
	<%int res=mdao.editMember(mdto);
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