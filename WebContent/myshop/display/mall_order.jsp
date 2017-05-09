<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:useBean id="cartbean" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="pl" name="cartbean" value="<%=prolist%>"/>
<%@ include file="mall_top.jsp"%>
<%
	String m=request.getParameter("mode");
	int mode=Integer.parseInt(m);
	if(mode==1){
%>
<table width="99%" border="1" align="center">
	<tr class="m2"> 
		<td colspan="3" align="center">
			<h4>결재 내역서 보기</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="50%">상품명</th>
		<th width="15%">수량</th>
		<th width="35%">금액</th>
	</tr>	
<%
		DecimalFormat df = new DecimalFormat("###,###");
		int cartTotalPrice = 0;
		int cartTotalPoint = 0;
		
		Hashtable<String, ProductDTO> hlist = cartbean.listCart(); 
		if (hlist == null || hlist.size()==0){%>
	<tr>
		<td colspan="3">결재 내역이 없습니다.</td>
	</tr>	
<%	}else {
			Enumeration<String> enu = hlist.keys();
			while(enu.hasMoreElements()){
				String pnum = enu.nextElement();
				ProductDTO dto = hlist.get(pnum);
				int qty = dto.getPqty();%>
	<tr>
		<td align="center">
			<b><%=dto.getPname()%></b>
		</td>
		<td align="right">
			<b><%=qty%>개</b>
		</td>
		<td align="right">
		<b><%=df.format(dto.getPrice()*qty)%>원<br>
		</td>	
	</tr>
<%		cartTotalPrice += dto.getPrice()*qty;
			cartTotalPoint += dto.getPoint()*qty;
			} %>		
	<tr class="m1">
		<td align="center" colspan="3"><b>결재하실 총액은 : </b> : 
			<font color="red"><%=df.format(cartTotalPrice)%>원<br></font>	
		</td>
	</tr>			
<%	}return;}else{
	String pname=request.getParameter("pname");
	String p=request.getParameter("price");
	String q=request.getParameter("qty");
	int price=Integer.parseInt(p);
	int qty=Integer.parseInt(q);
%>	
	<table width="99%" border="1" align="center">
	<tr class="m2"> 
		<td colspan="3" align="center">
			<h4>결재 내역서 보기</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="50%">상품명</th>
		<th width="15%">수량</th>
		<th width="35%">금액</th>
	</tr>
	<tr>
		<td align="center">
			<b><%=pname%></b>
		</td>
		<td align="right">
			<b><%=qty%>개</b>
		</td>
		<td align="right">
		<b><%=price*qty%>원<br>
		</td>
	</tr>
	<tr class="m1">
		<td align="center" colspan="3"><b>결재하실 총액은 : </b> 
			<font color="red"><%=price*qty%>원<br></font>	
		</td>
	</tr>
	
<%} %>
</table>	
<%@ include file="mall_bottom.jsp"%>