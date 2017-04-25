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
		alert("이름을 제대로 입력해 주세요.")
		location.href="<%=modeString%>"
		</script>
	<% return;
	} %>
	<%  if(mdto.getSsn1()==null||mdto.getSsn1().trim().equals("")||mdto.getSsn1().trim().length()!=6
			||mdto.getSsn2()==null||mdto.getSsn2().trim().equals("")||mdto.getSsn2().trim().length()!=7){%>
		<script type="text/javascript">
		alert("주민등록 번호가 잘못되었습니다.")
		location.href="<%=modeString%>"
		</script>
	<% return;
	}
	if(mode.equals("2")){
		if(mdto.getId()==null||mdto.getId().trim().equals("")){%>
		<script type="text/javascript">
		alert("아이디를 제대로 입력해 주세요.")
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
		alert("입력하신 정보의 회원이 없습니다 다시 확인해주세요.")
		location.href="<%=modeString%>"
		</script>
	<%}else{%>
		<script type="text/javascript">
		alert("원하시는 정보는<%=res%>")
		self.close()
		</script>
		<%}%>