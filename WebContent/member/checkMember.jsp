<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
    <jsp:useBean id="mdao" class="my.member.MemberDAO"/>
    <jsp:useBean id="mdto" class="my.member.MemberDTO"/>
    <jsp:setProperty property="*" name="mdto"/>
<%  if(mdto.getName()==null||mdto.getName().trim().equals("")){%>
		<script type="text/javascript">
		alert("�̸��� ����� �Է��� �ּ���.")
		location.href="member_Ssn.jsp"
		</script>
	<% return;
	} %>
	<%  if(mdto.getSsn1()==null||mdto.getSsn1().trim().equals("")||mdto.getSsn1().trim().length()!=6
			||mdto.getSsn2()==null||mdto.getSsn2().trim().equals("")||mdto.getSsn2().trim().length()!=7){%>
		<script type="text/javascript">
		alert("�ֹε�� ��ȣ�� �߸��Ǿ����ϴ�.")
		location.href="member_Ssn.jsp"
		</script>
	<% return;
	} %>

<%
	int res = mdao.checkMember(mdto);
	if(res==0){%>
		<form name="f" action="../member.jsp" method="post">
		<input type="hidden" name="name" value="<%=mdto.getName()%>">
		<input type="hidden" name="ssn1" value="<%=mdto.getSsn1()%>">
		<input type="hidden" name="ssn2" value="<%=mdto.getSsn2()%>">
		</form>
		<script type="text/javascript">
		alert("ȸ�� ���̵� �����ϴ�. ȸ������ �������� �Ѿ�ϴ�.")
		document.f.submit()
		</script>
	<%}else{%>
	<script type="text/javascript">
		alert("ȸ�� ���̵� �̹� �����մϴ�. �α����� �ּ���.")
		location.href="../login.jsp"
		</script>
	<%}%>
	
	<!-- document.f.submit() ����Ÿ���� form�±׸� �̵���Ű�� ���-->