<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); 
	String mode=request.getParameter("mode");
	String modeString=null;
	if(mode.equals("1")){
		modeString="searchid.jsp";
	}else{
		modeString="searchpw.jsp";
	}
	%>
	<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="mdao" class="my.member.MemberDAO"/>
    <jsp:useBean id="mdto" class="my.member.MemberDTO"/>
    <jsp:setProperty property="pool" name="mdao" value="<%=pool %>"/>
    <jsp:setProperty property="*" name="mdto"/>
	<% if(mdto.getName()==null||mdto.getName().trim().equals("")){%>
		<script type="text/javascript">
		alert("�̸��� ����� �Է��� �ּ���.")
		location.href="<%=modeString%>"
		</script>
	<% return;
	} %>
	<%  if(mdto.getSsn1()==null||mdto.getSsn1().trim().equals("")||mdto.getSsn1().trim().length()!=6
			||mdto.getSsn2()==null||mdto.getSsn2().trim().equals("")||mdto.getSsn2().trim().length()!=7){%>
		<script type="text/javascript">
		alert("�ֹε�� ��ȣ�� �߸��Ǿ����ϴ�.")
		location.href="<%=modeString%>"
		</script>
	<% return;
	}
	if(mode.equals("2")){
		if(mdto.getId()==null||mdto.getId().trim().equals("")){%>
		<script type="text/javascript">
		alert("���̵� ����� �Է��� �ּ���.")
		location.href="searchpw.jsp"
		</script>
	<% 	return;
		}
	}
	String res=null;
	if(mode.equals("1")){
		res=mdao.searchId(mdto);
	}else{
		res=mdao.searchPw(mdto);
	}
	
	if(res==null||res.trim().equals("")){%>
		<script type="text/javascript">
		alert("�Է��Ͻ� ������ ȸ���� �����ϴ� �ٽ� Ȯ�����ּ���.")
		location.href="<%=modeString%>"
		</script>
	<%}else{%>
		<script type="text/javascript">
		alert("���Ͻô� ������<%=res%>")
		self.close()
		</script>
		<%}%>