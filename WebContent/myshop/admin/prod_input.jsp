<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
    <jsp:useBean id="cdao" class="my.shop.CategoryBean"/>
    <jsp:setProperty property="pool" name="cdao" value="<%=pool %>"/>
<%@ include file = "top.jsp"%>
<div align="center">
<table border="1" class="outline">
<form name="prodin" action="prod_input_ok.jsp" method="post" enctype="multipart/form-data">
	<tr>
		<td class="m2">ī�װ�</td>
		<td>
			<select name="categorycode">
				<%ArrayList<CategoryDTO> list=cdao.listCategory();
				for(CategoryDTO dto:list){%>
				<option value="<%=dto.getCode()%>"><%=dto.getCname()%> [<%=dto.getCode() %>]
				<%}%>
			</select>
		</td>
	</tr>
	<tr>
		<td class="m2">��ǰ��</td>
		<td><input type="text" name="pname"></td>
	</tr>
	<tr>
		<td class="m2">��ǰ�ڵ�</td>
		<td><input type="text" name="productcode"></td>
	</tr>
	<tr>
		<td class="m2">����ȸ��</td>
		<td><input type="text" name="pcompany"></td>
	</tr>
	<tr>
		<td class="m2">��ǰ�̹���</td>
		<td><input type="file" name="pimage"></td>
	</tr>
	<tr>
		<td class="m2">��ǰ ����</td>
		<td><input type="text" name="pqty"></td>
	</tr>
	<tr>
		<td class="m2">��ǰ ����</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td class="m2">��ǰ ����</td>
		<td>
		<select name="pspec">
			<option value="normal"> ::NORMAL::
			<option value="hit"> ::HIT::
			<option value="best"> ::BEST::
			<option value="new"> ::NEW::
		</select>
		</td>
	</tr>
	<tr>
		<td class="m2">��ǰ �Ұ�</td>
		<td><textarea name="pcontents" rows="10" cols="60"></textarea></td>
	</tr>
	<tr>
		<td class="m2">��ǰ ����Ʈ</td>
		<td><input type="text" name="point"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="��ǰ ���">
			<input type="reset" value="���">
		</td>
	</tr>
	</form>
</table>
</div>
<%@include file="bottom.jsp"%>
