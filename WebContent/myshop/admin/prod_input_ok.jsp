<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.io.IOException"%>
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
		pdto.setPname(mr.getParameter("pname"));
		pdto.setPcompany(mr.getParameter("pcompany"));
		pdto.setPimage(mr.getFilesystemName("pimage"));
		pdto.setPqty(Integer.parseInt(mr.getParameter("pqty")));
		pdto.setPrice(Integer.parseInt(mr.getParameter("price")));
		pdto.setPspec(mr.getParameter("pspec"));
		pdto.setPcontents(mr.getParameter("pcontents"));
		pdto.setPoint(Integer.parseInt(mr.getParameter("point")));
	%>
    
<%
	String categorycode=mr.getParameter("categorycode");
	String productcode=mr.getParameter("productcode");
	String pcategory_fk=categorycode+"+"+productcode;
	if(pdto.getPname()==null||pdto.getPname().trim().equals("")){%>
		<script type="text/javascript">
			alert("상품명을 입력해주세요.")
			location.href("prod_input.jsp")
		</script>
	<%return;}
	if(productcode==null||productcode.trim().equals("")){%>
		<script type="text/javascript">
			alert("상품코드를 입력해주세요.")
			location.href("prod_input.jsp")
		</script>
	<%return;}
		pdto.setPcategory_fk(pcategory_fk);
		int res=pdao.inputProduct(pdto);
		if(res>0){%>

		<script type="text/javascript">
			alert("입력에 성공하셨습니다.")
			location.href("prod_list.jsp")
		</script>
		<%} else{%>
		<script type="text/javascript">
			alert("입력에 실패하였습니다. 다시 시도해주세요")
			location.href("prod_input.jsp")
		</script>
		<%} %>