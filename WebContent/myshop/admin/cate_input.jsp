<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "top.jsp"%>
<form name="f" action="cate_input_ok.jsp" method="post">
<h5>카테고리 등록</h5>
<table border="1" class="outline">
	<tr>
		<td bgcolor="yellow">카테고리 코드</td>
		<td><input type="text" name="code"></td>
	</tr>
	<tr>
		<td bgcolor="yellow">카테고리 이름</td>
		<td><input type="text" name="cname"></td>
	</tr>
	<tr>
		<td colspan="2" align="center" class="m2">
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>
<%@ include file = "bottom.jsp"%>