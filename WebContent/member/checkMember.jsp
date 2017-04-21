<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
    <jsp:useBean id="mdao" class="my.member.MemberDAO"/>
    <jsp:useBean id="mdto" class="my.member.MemberDTO"/>
    <jsp:setProperty property="*" name="mdto"/>
<%  if(mdto.getName()==null||mdto.getName().trim().equals("")){%>
		<script type="text/javascript">
		alert("이름을 제대로 입력해 주세요.")
		location.href="member_Ssn.jsp"
		</script>
	<% return;
	} %>
	<%  if(mdto.getSsn1()==null||mdto.getSsn1().trim().equals("")||mdto.getSsn1().trim().length()!=6
			||mdto.getSsn2()==null||mdto.getSsn2().trim().equals("")||mdto.getSsn2().trim().length()!=7){%>
		<script type="text/javascript">
		alert("주민등록 번호가 잘못되었습니다.")
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
		alert("회원 아이디가 없습니다. 회원가입 페이지로 넘어갑니다.")
		document.f.submit()
		</script>
	<%}else{%>
	<script type="text/javascript">
		alert("회원 아이디가 이미 존재합니다. 로그인해 주세요.")
		location.href="../login.jsp"
		</script>
	<%}%>
	
	<!-- document.f.submit() 히든타입의 form태그를 이동시키는 방법-->