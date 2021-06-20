<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2><a>도서 추가</a></h2>

	<form action="insertPost" method="post">
		제 목 : <input type="text" width="200" name="title" /><br /><br />
		가 격 : <input type="text" width="200" name="price" /><br /><br />
		출판사 : <input type="text" width="200" name="publiher" /><br /><br />
		저 자 : <input type="text" width="200" name="author" /><br /><br />
		<input type="submit" value="도서추가">
	</form>
</body>
</html>