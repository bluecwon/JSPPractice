<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//��Ű�����ϱ�
	Cookie ck=new Cookie("id","admin");
	//mapŸ�Կ����� Ű�� ������ �Է��� �ؼ� Ű������ ���� ���� �� �ִµ�
	//cookie�� �̸��� ������ ������ �ȴ�.
	//����, �̸����� ���� ������ ���� �ƴ϶� ������ �᳻�� Ȯ���� �Ѵ�.
	Cookie ck2=new Cookie("pwd","1234");
	
	//��ȿ�ð� ����
	ck.setMaxAge(12*60*60);//�ʴ��� �Է�
	ck2.setMaxAge(24*60*60);
	//���� - MaxAge���� 0���� �ϸ� ������ ���� ȿ���� �ش�.
	
	//Ŭ���̾�Ʈ�� ����
	response.addCookie(ck);
	response.addCookie(ck2);
%>