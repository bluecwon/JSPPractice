<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 	<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="cdao" class="my.shop.CategoryBean"/>
    <jsp:setProperty property="pool" name="cdao" value="<%=pool %>"/>
    
<%
	request.setCharacterEncoding("EUC-KR");
	String cnum=request.getParameter("cnum");
	int res=cdao.deleteCategory(Integer.parseInt(cnum));
	if(res>0){%>
	<script type="text/javascript">
		alert("������ �����ϼ̽��ϴ�.")
		location.href("cate_list.jsp")
	</script>
	<%} else{%>
	<script type="text/javascript">
		alert("������ �����Ͽ����ϴ�. �ٽ� �õ����ּ���")
		location.href("cate_list.jsp")
	</script>
	<%} %>