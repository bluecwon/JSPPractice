<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<%request.setCharacterEncoding("EUC-KR");%>

<%!
	public void countSaveFile(String path,String title,String info){
		FileWriter fw=null;
		BufferedWriter bw=null;
		PrintWriter pw=null;
	try{
		fw=new FileWriter(path);
		bw=new BufferedWriter(fw);
		pw=new PrintWriter(bw);
		pw.println("<body bgcolor='pink'>");
		pw.println("<h2>"+title+"</h2>");
		pw.println("<p>");
		pw.println("���� :");
		pw.println(info);
		pw.println("</body>");
		pw.close();
	}catch(IOException e){
		e.printStackTrace();
	}
}
%>
<%
	String subject=request.getParameter("subject");
	String notice=request.getParameter("notice");
	String filename=request.getParameter("filename");
	if (filename == null || filename.trim().equals("")){
		response.sendRedirect("alim.jsp");
		return;
	}
	
	if (subject == null || notice == null || subject.trim().equals("") || 
			notice.trim().equals("")){%>
		<script type="text/javascript">
			alert("����� ������ ��� �Է��� �ּ���!!")
			location.href="alim.jsp"
		</script>		
<%		return;
	}
	String path=null;
	path=application.getRealPath("notice/"+filename);
	String msg=subject+","+notice;
	countSaveFile(path,subject,notice);
%>
<script type="text/javascript">
alert("���������� ����Ǿ����ϴ�. ������������ �̵��մϴ�.")
location.href="../index.jsp"
</script>