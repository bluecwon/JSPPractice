<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="cdao" class="my.shop.CategoryBean"/>
    <jsp:setProperty property="pool" name="cdao" value="<%=pool %>"/>
<% request.setCharacterEncoding("EUC-KR"); %>
    <link rel="stylesheet" type="text/css" href="../../style.css">
    
<html>
<head>
	<title>홈페이지</title>
</head>
<body>
	<div align="center">
	<table border="1" width="800" height="600">
		<tr height="10%">
			<td colspan="2" align="center">
			HOME |
			<a href="<%=request.getContextPath()%>/myshop/admin/main.jsp">관리자홈</a> |
			<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">쇼핑몰홈</a> |
			장바구니 |
			회사소개 |
			</td>
		</tr>
		<tr>
			<td align="center" valign="top" width="20%"><b>Tree/view</b><br>
				<table border="1">
					<% ArrayList<CategoryDTO> list=cdao.listCategory();
					if(list!=null&&list.size()!=0){
						for(CategoryDTO cdto:list){%>
						<tr>
							<td><a href="mall_cgprodlist.jsp?cate=<%=cdto.getCode()%>"><%=cdto.getCname()%>[<%=cdto.getCode()%>]</a></td>
						</tr>
					<%}} %>
				</table>
			</td>
			<td align="center" width="80%">
				