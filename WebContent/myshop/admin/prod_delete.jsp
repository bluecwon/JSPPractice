<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="pdao" class="my.shop.ProductBean"/>
    <jsp:setProperty property="pool" name="pdao" value="<%=pool %>"/>
	<%request.setCharacterEncoding("EUC-KR");
	String pnum=request.getParameter("pnum");
	int res=pdao.deleteProduct(Integer.parseInt(pnum));
	if(res>0){%>
	<script type="text/javascript">
		alert("������ �����ϼ̽��ϴ�.")
		location.href("prod_list.jsp")
	</script>
	<%} else{%>
	<script type="text/javascript">
		alert("������ �����Ͽ����ϴ�. �ٽ� �õ����ּ���")
		location.href("prod_list.jsp")
	</script>
	<%} %>