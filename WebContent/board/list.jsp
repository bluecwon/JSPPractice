<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
		<hr color=green width="300">
		<font size="4"><b>글 목 록</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
			<tr align="center" class="m2">
				<th class ="m3" width="10%">번호</th>
				<th class ="m3" width="25%">제목</th>
				<th class ="m3" width="15%">작성자</th>
				<th class ="m3" width="15%">작성일</th>
				<th class ="m3" width="10%">조회</th>
				<th class ="m3" width="15%">IP</th>
				<th class ="m3" whidth="10%">파일</th>
			</tr>
			<%
				int pagenum=1;
				String pages=request.getParameter("page");
				if(pages!=null){
					pagenum=Integer.parseInt(pages);
				}
				int pageSize=5;
				int pageGroupSu=3;
				int startRow=pagenum*pageSize-(pageSize-1);
				int endRow=startRow+pageSize-1;
				int countRow=bdb.getCount();
				if(endRow>countRow)endRow=countRow;
				int number=countRow-(pagenum-1)*pageSize;
				int maxPage=countRow/pageSize+(countRow%pageSize==0?0:1);
				int startPage=(pagenum-1)/pageGroupSu*pageGroupSu+1;
				int endPage=startPage+pageGroupSu-1;
				if(endPage>maxPage)endPage=maxPage;
				ArrayList<BoardDBBean> list=bdb.listBoard(startRow,endRow);
				if(list!=null&&list.size()!=0){
					for(BoardDBBean bdbb:list){
			%>
			<tr align="center">
				<td><%=number--%></td>
				<td align="left"><a href="content.jsp?num=<%=bdbb.getNum()%>">
				<%if(bdbb.getRe_level()>0){for(int j=0;j<bdbb.getRe_level();j++){%><img src="../img/level.gif" height="1" width="15" border="0"><%}%>re: <%}%><%=bdbb.getSubject()%></a></td>
				<td><%=bdbb.getWriter()%></td>
				<td><%=bdbb.getReg_date()%></td>
				<td><%=bdbb.getReadcount() %></td>
				<td><%=bdbb.getIp() %></td>
				<%if(bdbb.getFilesize()==0){ %>
					<td><img src="../img/level.gif"></td>
				<%}else{ %>
					<td><img src="../img/folder.gif"></td>
				<%} %>
			</tr>
			<%
					}
				}
				else{
			%>
			<tr>
				<td colspan="6" align="center">글이 없습니다.</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="7" align="right">현재 <%=pagenum%>page | <a href="writeForm.jsp?mode=1">글쓰기</a></td>
			</tr>
			<tr>
				<td colspan="7" align="center">
				<%if(startPage>pageGroupSu){%>
					<a href="list.jsp?page=<%=startPage-pageGroupSu+(pageGroupSu-1)%>">[이전]</a>
				<%}%>
				<%for(int i=startPage;i<=endPage;i++){%>
					<a href="list.jsp?page=<%=i%>">[<%=i%>]</a>
				<%}%>
				<%if(endPage<maxPage){%>
				<a href="list.jsp?page=<%=startPage+pageGroupSu%>">[다음]</a>
				<%}%>
				</td>
			</tr>
		</table>
<%@ include file="../bottom.jsp" %>