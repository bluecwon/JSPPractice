<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.*"%>
    <% request.setCharacterEncoding("EUC-KR"); %>
 	<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="pdao" class="my.shop.ProductBean"/>
    <jsp:useBean id="pdto" class="my.shop.ProductDTO"/>
    <jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
    <%
		MultipartRequest mr=null;
		DefaultFileRenamePolicy dp;
		String upPath=config.getServletContext().getRealPath("/myshop/images");
		int len=30*1024*1024;
		try{
			dp=new DefaultFileRenamePolicy();
			mr=new MultipartRequest(request,upPath,len,"EUC-KR",dp);
		}catch(IOException e){
			e.printStackTrace();
		}
		pdto.setPnum(Integer.parseInt(mr.getParameter("pnum")));
		pdto.setPname(mr.getParameter("pname"));
		pdto.setPcompany(mr.getParameter("pcompany"));
		pdto.setPimage(mr.getFilesystemName("pimage"));
		pdto.setPspec(mr.getParameter("pspec"));
		if(pdto.getPimage()==null){
			pdto.setPimage(mr.getParameter("pimage1"));
		}else{
			File file=new File(upPath+"/"+mr.getParameter("pimage1"));
			file.delete();
		}
		pdto.setPqty(Integer.parseInt(mr.getParameter("pqty")));
		pdto.setPrice(Integer.parseInt(mr.getParameter("price")));
		pdto.setPcontents(mr.getParameter("pcontents"));
		pdto.setPoint(Integer.parseInt(mr.getParameter("point")));

		int res=pdao.updateProduct(pdto);
		if(res>0){%>
		<script type="text/javascript">
			alert("수정에 성공하셨습니다.")
			location.href("prod_list.jsp")
		</script>
		<%} else{%>
		<script type="text/javascript">
			alert("수정에 실패하였습니다. 다시 시도해주세요")
			location.href("prod_list.jsp")
		</script>
		<%} %>