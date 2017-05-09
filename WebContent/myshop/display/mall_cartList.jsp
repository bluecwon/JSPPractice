<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:useBean id="cartbean" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="pl" name="cartbean" value="<%=prolist%>"/>
<%@ include file="mall_top.jsp"%>
<table width="99%" border="1" align="center">
	<tr class="m2"> 
		<td colspan="6" align="center">
			<h4>장바구니 보기</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="10%">번호</th>
		<th width="30%">상품명</th>
		<th width="10%">수량</th>
		<th width="20%">단가</th>
		<th width="20%">금액</th>
		<th width="10%">삭제</th>
	</tr>	
<%
		DecimalFormat df = new DecimalFormat("###,###");
		int cartTotalPrice = 0;
		int cartTotalPoint = 0;
		
		Hashtable<String, ProductDTO> hlist = cartbean.listCart(); 
		if (hlist == null || hlist.size()==0){%>
	<tr>
		<td colspan="6">장바구니가 비었습니다.</td>
	</tr>	
<%	}else {
			Enumeration<String> enu = hlist.keys();
			while(enu.hasMoreElements()){
				String pnum = enu.nextElement();
				ProductDTO dto = hlist.get(pnum);
				int qty = dto.getPqty();%>
	<tr>
		<td align="center"><%=dto.getPnum()%></td>
		<td align="center">
			<img src="../images/<%=dto.getPimage()%>" width="40" height="40"><br>
			<b><%=dto.getPname()%></b>
		</td>
		<td align="center">
			<form name="f" method="post" action="mall_cartEdit.jsp">
				<br>
				<input type="text" size="3" name="pqty" value="<%=qty%>">개
				<input type="hidden" name="pnum" value="<%=dto.getPnum()%>">
				<input type="submit" value="수정">
			</form>			
		</td>
		<td align="right">
			<b><%=df.format(dto.getPrice())%>원<br>
			[<%=dto.getPoint()%>] point</b>
		</td>	
		<td align="right">
			<font color="red">
			<b><%=df.format(dto.getPrice()*qty)%>원<br>
			[<%=dto.getPoint()*qty%>] point</b>
			</font>
		</td>
		<td align="center">
			<a href="mall_cartDel.jsp?pnum=<%=dto.getPnum()%>">삭제</a>	
		</td>
	</tr>
<%		cartTotalPrice += dto.getPrice()*qty;
			cartTotalPoint += dto.getPoint()*qty;
			} %>		
	<tr class="m1">
		<td colspan="4"><b>장바구니 총액</b> : 
			<font color="red"><%=df.format(cartTotalPrice)%>원<br></font>
			<font color="green">총 적립 포인트 : [<%=cartTotalPoint%>] point</font>	
		</td>
		<td colspan="2">
			<a href="mall_order.jsp?mode=1">[주문하기]</a>
			<a href="javascript:history.go(-2);">[계속쇼핑]</a>
		</td>
	</tr>	
<%	}%>
</table>	
<%@ include file="mall_bottom.jsp"%>