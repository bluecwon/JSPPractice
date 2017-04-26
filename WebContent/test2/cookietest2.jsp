<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//쿠키로 넘어온 데이터를 찾아 출력하기
	Cookie cks[]=request.getCookies();//쿠키를 배열로 받아와야함 몇개인지 모르니
	String name=null, value=null;
	if(cks!=null){
		out.println("<h2>클라이언트로부터 넘어온 쿠키</h2>");
		for(int i=0;i<cks.length;i++){
			name=cks[i].getName();
			value=cks[i].getValue();
			out.println("name ="+name+", value="+value);
			out.println("<br>");
		}
	}
%>