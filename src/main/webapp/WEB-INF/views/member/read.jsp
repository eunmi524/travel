<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
		<label>memberId</label> 
		<input class="form-control" name='memberId' value='<c:out value="${memberRead.memberId }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>memberPw</label>
		<input class="form-control" name='memberPw' readonly="readonly"  value='${memberRead.memberPw }'>
	</div>
	
	<div class="form-group">
		<label>memberName</label>
		<input class="form-control" name='memberName' readonly="readonly"  value='${memberRead.memberName }'>
	</div>
	
	<div class="form-group">
		<label>memberEmail</label>
		<input class="form-control" name='memberEmail' readonly="readonly"  value='${memberRead.memberEmail }'>
	</div>
	
	<div class="form-group">
		<label>memberPhoneNumber</label>
		<input class="form-control" name='memberPhoneNumber' readonly="readonly"  value='${memberRead.memberPhoneNumber }'>
	</div>
		
	<div class="form-group">
		<label>joinDate</label> 
		<input class="form-control" name='joinDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${memberRead.joinDate}" />' readonly="readonly">
	</div>
	
	<button data-oper='modify' class="btn btn-default" onclick='location.href="/member/modify?memberId=${memberRead.memberId}"'>Modify</button>
	<button data-oper='list' class="btn btn-info" onclick='location.href="/board/list"'>List</button>
	
	<button class="btn btn-info" onclick='location.href="/reply/list?bno=${board.bno}"'>ReplyList</button>
	


</body>
</html>