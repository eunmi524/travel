<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	
	<form action="/member/login" method="post">
		<input name="memberId" type="text" placeholder="아이디를 입력하세요.."/>
		<input name="memberPw" type="password" placeholder="암호를 입력하세요.."/>
		<hr>
		<input type="submit" value="로그인"></input>		
	</form>
</body>
</html>