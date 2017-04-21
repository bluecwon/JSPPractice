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
	alert("이름, ID, 패스워드, 주민등록번호를 모두 입력하셔야 합니다.")
	history.back();
	</script>
	<%return;
	}
	int res=mdao.inputMember(mdto);
	%>
