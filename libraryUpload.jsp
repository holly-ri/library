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
			alert("�н����带 �Է��ϼ���.");
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
<title>���� ����</title>
</head>
<body>
	<form name="delFrm" action="deletePost" method="post">
		�� �� : <input type="text" width="200" name="title" value="<%=title %>"/><br /><br />
		�� �� : <input type="text" width="200" name="price" value="<%=price %>" /><br /><br />
		���ǻ� : <input type="text" width="200" name="publisher" value="<%=publisher %>" /><br /><br />
		�� �� : <input type="text" width="200" name="author" value="<%=author %>" /><br /><br />
		<input type="button" value="����Ʈ" onclick="javascript_:location.href='main.jsp'" />&nbsp
		<input type="button" value="����" onclick="Update()"/>&nbsp
		<input type="submit" value="����" />
		<input type="hidden" name="num" value="<%=num %>">
	</form>
</body>
</html>