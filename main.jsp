<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="library.*,java.util.Vector"%>
<jsp:useBean id="pMgr" class="library.bookMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<h2><a>도서목록</a></h2>
		<table width="500" border="1">
			<tr>
				<td align="center"><b>번 호</b></td>
				<td align="center"><b>제 목</b></td>
				<td align="center"><b>가 격</b></td>
				<td align="center"><b>출판사</b></td>
				<td align="center"><b>저 자</b></td>
			</tr>
			<tr>
			<%
				  Vector<BookBean> vlist = pMgr.getAllList();
				  int num=0;

				  int count = vlist.size();
				  for (int i = 0; i < vlist.size(); i++) {
				  	BookBean plBean = vlist.get(i);
					num = plBean.getNum();
					String title = plBean.getTitle();
					int price = plBean.getPrice();
					String publisher = plBean.getPublisher();
					String author = plBean.getAuthor();

					out.println("	<tr><td align='center'>" + num + "</td>");
					out.println("<td><a href='libraryUpload.jsp?num=" + num + "'>" + title + "</a></td>");
					out.println("<td>" + price + "</td>");
					out.println("<td>" + publisher + "</td>");
					out.println("<td>" + author + "</td></tr>");
				}
			%>

			<tr>
				<td colspan=3 align="center"><input type="button" value="도서추가" 
				onclick="javascript_:location.href='insert.jsp'"/></td>
			</tr>
		</table>
	</form>
</body>
</html>