<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<jsp:useBean id="pbean" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pbean" value="<%=pool%>"/>

<%
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		
		int res = pbean.deleteProduct(Integer.parseInt(pnum));
		String msg = null;
		String url = "prod_list.jsp";
		if (res>0){
			String delPath = application.getRealPath("/myshop/images");
			File file = new File(delPath, pimage);
			if (file.exists()){
				file.delete();
				msg = "��ǰ��������!! ��ǰ������� �̵��մϴ�.";
			}else {
				msg = "��ǰ��������(�̹��������� ����)!! ��ǰ������� �̵��մϴ�.";
			}
		}else {
			msg = "��ǰ��������!! ��ǰ������� �̵��մϴ�.";
		}
%>   
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>