<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!--count/count.jsp-->
<%!
	int count=0;
	String path=null;
	
	public void jspInit(){
		path=this.getServletContext().getRealPath("count/count.txt");
		FileReader fr=null;
		BufferedReader br=null;
		try{
			fr=new FileReader(path);
			br=new BufferedReader(fr);
			String line=br.readLine();
			if(line!=null){
				count=Integer.parseInt(line.trim());
			}
		}catch(FileNotFoundException e){
			countSaveFile();
		}catch(IOException e){
			countSaveFile();
		}
	}
	
	public void countSaveFile(){
		FileWriter fw=null;
		BufferedWriter bw=null;
		PrintWriter pw=null;
		try{
			fw=new FileWriter(path);
			bw=new BufferedWriter(fw);
			pw=new PrintWriter(bw);
			pw.println(count);
			pw.close();
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public void jspDestroy(){
		countSaveFile();
	}
%>
<%
	if(session.isNew()){// 새로운 브라우저의 요청이 되었을때 호출
		count++;
	}

	if(count%10==0){
		countSaveFile();
	}
%>
<b>방문횟수 : </b>
<%
	String countStr=String.valueOf(count);
	int len=countStr.length();
	for(int i=0;i<len;++i){%>
		<img src="<%=request.getContextPath()%>/img/no<%=countStr.charAt(i)%>.gif">
	<%}
%>