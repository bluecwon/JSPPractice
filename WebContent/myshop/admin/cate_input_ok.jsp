<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("EUC-KR"); %>
 	<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="cdao" class="my.shop.CategoryBean"/>
    <jsp:useBean id="cdto" class="my.shop.CategoryDTO"/>
    <jsp:setProperty property="pool" name="cdao" value="<%=pool %>"/>
    <jsp:setProperty property="*" name="cdto"/>
<%
	if(cdto.getCode()==null||cdto.getCode().trim().equals("")){%>
		<script type="text/javascript">
			alert("�ڵ尪�� �ٽ� �Է����ּ���.")
			location.href("cate_input.jsp")
		</script>
	<%return;}
	if(cdto.getCode()==null||cdto.getCode().trim().equals("")){%>
		<script type="text/javascript">
			alert("�̸��� �ٽ� �Է����ּ���.")
			location.href("cate_input.jsp")
		</script>
	<%return;}
		int res=cdao.inputCategory(cdto);
		if(res>0){%>
		<script type="text/javascript">
			alert("�Է¿� �����ϼ̽��ϴ�.")
			location.href("cate_list.jsp")
		</script>
		<%} else{%>
		<script type="text/javascript">
			alert("�Է¿� �����Ͽ����ϴ�. �ٽ� �õ����ּ���")
			location.href("cate_input.jsp")
		</script>
		<%} %>
	
	
	