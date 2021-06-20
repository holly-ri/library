<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="library.BookBean"%>
<jsp:useBean id="bMgr" class="library.bookMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  BookBean bean = bMgr.getBoard(num);
	  String title = bean.getTitle();
	  int price = bean.getPrice();
      String publisher = bean.getPublisher();
	  String author = bean.getAuthor();
%>
<script type="text/javascript">
	function Update() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
	function Update2() {
		var frm = document.delFrm;
		frm.action = "updatePost";
		frm.method= "post"
		frm.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 수정</title>
</head>
<body>
	<form name="delFrm" action="deletePost" method="post">
		제 목 : <input type="text" width="200" name="title" value="<%=title %>"/><br /><br />
		가 격 : <input type="text" width="200" name="price" value="<%=price %>" /><br /><br />
		출판사 : <input type="text" width="200" name="publisher" value="<%=publisher %>" /><br /><br />
		저 자 : <input type="text" width="200" name="author" value="<%=author %>" /><br /><br />
		<input type="button" value="리스트" onclick="javascript_:location.href='main.jsp'" />&nbsp
		<input type="button" value="수정" onclick="Update()"/>&nbsp
		<input type="submit" value="삭제" />
		<input type="hidden" name="num" value="<%=num %>">
	</form>
</body>
</html>