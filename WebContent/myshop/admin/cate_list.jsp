<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="cdao" class="my.shop.CategoryBean"/>
    <jsp:setProperty property="pool" name="cdao" value="<%=pool %>"/>
<%@ include file = "top.jsp"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<h5>카테고리 목록</h5>
<table border="1" width="400" class="outline">
	<tr bgcolor="yellow" height="10%">
		<th class="m2">번호</th>
		<th class="m2">카테고리코드</th>
		<th class="m2">카테고리명</th>
		<th class="m2">삭제</th>
	</tr>
	<%
	ArrayList<CategoryDTO> list=cdao.listCategory();
	if(list==null||list.size()==0){%>
	<tr align="center">
		<td colspan="4" class="box"><font color="red">등록된 카테고리가 없습니다.</font></td>
	</tr>
	<%return;}else{
	for(CategoryDTO dto:list){%>
	<tr align="center">
		<td class="box"><%=dto.getCnum() %></td>
		<td class="box"><%=dto.getCode() %></td>
		<td class="box"><%=dto.getCname() %></td>
		<td class="box"><a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">삭제</a></td>
	</tr>
	<%}
	} %>
</table>
<%@ include file = "bottom.jsp"%>