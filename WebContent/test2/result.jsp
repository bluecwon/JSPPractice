<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

	if(id.equals("admin")&&pwd.equals("1234")){
		session.setAttribute("id", "admin");
		session.setAttribute("pwd", "1234");
		out.println("<font color=blue>");
		out.println("["+id+"]�� ȯ���մϴ�.");
		out.println("</font>");
		out.println("<a href='sessiontest2.jsp'>��������</a>");
	}else{
		out.println("<font color=red>");
		out.println("�Է��Ͻ� ������ ��ġ���� �ʽ��ϴ�.");
		out.println("</font>");
		out.println("<a href='sessiontest1.jsp'>�ٽ��Է�</a>");
	}
%>
