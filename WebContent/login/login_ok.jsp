<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.login.*"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="check" class="my.login.LoginCheck"/>
<jsp:setProperty property="*" name="check"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:useBean id="lob" class="my.login.LoginOkBean" scope="session"/>
<jsp:setProperty property="pool" name="check" value="<%=pool%>"/>
<jsp:setProperty property="pool" name="lob" value="<%=pool%>"/>

<%	
	if(check.getId()==null||check.getId().trim().equals("")){
		response.sendRedirect("login.jsp");
		return;
	}
	String saveid=request.getParameter("saveId");
	Cookie ck=new Cookie("saveid",check.getId());
	if(saveid!=null){
		ck.setMaxAge(12*60*60);
	}else{
		ck.setMaxAge(0);
	}
	response.addCookie(ck);
	String mode=request.getParameter("mode");
	int res = check.memberCheck();
	String msg = null, url = "login.jsp";
	switch(res){
	case LoginCheck.OK :
		lob.setId(check.getId());
		lob.infoSetting();
		session.setAttribute("mbno", lob.getName());
		session.setAttribute("mbid",check.getId());
		session.setAttribute("mbpasswd",lob.getPasswd());
		session.setAttribute("mbname", lob.getName());
		session.setAttribute("mbssn1", lob.getSsn1());
		session.setAttribute("mbssn2", lob.getSsn2());
		session.setAttribute("mbemail", lob.getEmail());
		session.setAttribute("mbhp1", lob.getHp1());
		session.setAttribute("mbhp2", lob.getHp2());
		session.setAttribute("mbhp3", lob.getHp3());
		session.setAttribute("mbjoindate", lob.getJoindate());
		msg = lob.getName()+"님, 환영합니다.";
		url = request.getContextPath()+"/index.jsp";
		if(mode.equals("2")){
			url = request.getContextPath()+"/board/list.jsp";	
		}
		break;
	case LoginCheck.NOT_ID :
		msg = check.getId() +"는 없는 아이디 입니다.";
		break;
	case LoginCheck.NOT_PWD :
		msg = check.getId()+"님의 패스워드가 틀렸습니다.";
		break;
	case LoginCheck.ERROR :
		msg = "서버 오류 발생!! 관리자에게 문의하세요";
		break;
	}
%>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>