<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

	if(id.equals("admin")&&pwd.equals("1234")){
		session.setAttribute("id", "admin");
		session.setAttribute("pwd", "1234");
		out.println("<font color=blue>");
		out.println("["+id+"]님 환영합니다.");
		out.println("</font>");
		out.println("<a href='sessiontest2.jsp'>다음으로</a>");
	}else{
		out.println("<font color=red>");
		out.println("입력하신 정보가 일치하지 않습니다.");
		out.println("</font>");
		out.println("<a href='sessiontest1.jsp'>다시입력</a>");
	}
%>
