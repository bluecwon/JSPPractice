<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
    <jsp:useBean id="mdao" class="my.member.MemberDAO"/>
    <jsp:useBean id="mdto" class="my.member.MemberDTO"/>
    <jsp:setProperty property="*" name="mdto"/>
<%
	if(mdto.getName()==null||mdto.getId()==null||mdto.getPasswd()==null||mdto.getSsn1()==null||mdto.getSsn2()==null
	||mdto.getName().trim().equals("")||mdto.getId().trim().equals("")||
	mdto.getPasswd().trim().equals("")||mdto.getSsn1().trim().equals("")||mdto.getSsn2().trim().equals("")){%>
	<script type="text/javascript">
	alert("�̸�, ID, �н�����, �ֹε�Ϲ�ȣ�� ���  ���ϼž� �մϴ�.")
	history.back();
	</script>
	<% return;
	}
	int res=mdao.inputMember(mdto);
	if(res>0){%>
	<script type="text/javascript">
	alert("ȸ�� ���Կ� �����Ͽ����ϴ�.")
	self.close()
	</script>
	<%} else{%>
	<script type="text/javascript">
	alert("ȸ�� ���Կ� �����Ͽ����ϴ�. �ٽ� �õ��� �ּ���")
	location.href="member_Ssn.jsp"
	</script>
	<%} %>
