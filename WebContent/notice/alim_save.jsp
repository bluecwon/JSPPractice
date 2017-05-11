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
		pw.println("내용 :");
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
			alert("제목과 내용을 모두 입력해 주세요!!")
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
alert("공지사항이 저장되었습니다. 메인페이지로 이동합니다.")
location.href="../index.jsp"
</script>