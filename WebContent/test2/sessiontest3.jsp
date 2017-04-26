<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	session.invalidate(); //세션의 저장된 모든 값을 지우는 메소드
    	//session.removeAttribute("id"); //실제로 따로 지우 않음
    	//session.removeAttribute("pwd");
    %>
<h2>로그아웃 되었습니다.</h2>
<a href="sessiontest1.jsp">로그인</a>