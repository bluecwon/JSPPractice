<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//��Ű�� �Ѿ�� �����͸� ã�� ����ϱ�
	Cookie cks[]=request.getCookies();//��Ű�� �迭�� �޾ƿ;��� ����� �𸣴�
	String name=null, value=null;
	if(cks!=null){
		out.println("<h2>Ŭ���̾�Ʈ�κ��� �Ѿ�� ��Ű</h2>");
		for(int i=0;i<cks.length;i++){
			name=cks[i].getName();
			value=cks[i].getValue();
			out.println("name ="+name+", value="+value);
			out.println("<br>");
		}
	}
%>