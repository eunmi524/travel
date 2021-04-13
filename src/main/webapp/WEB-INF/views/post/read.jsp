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
		<label>postBno</label> 
		<input class="form-control" name='postBno' value='<c:out value="${postRead.postBno }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>Title</label>
		<input class="form-control" name='postTitle' value='${postRead.postTitle }'>
	</div>
	
	<div class="form-group">
		<label>Text area</label>
		<textarea class="form-control" rows="3" name='postContent' ><c:out value="${postRead.postContent }" /></textarea>
	</div>
	
	<div class="form-group">
		<label>MemberId</label> 
		<input class="form-control" name='memberId' value='<c:out value="${postRead.memberId }"/>' readonly="readonly">
	</div>
		
	<div class="form-group">
		<label>Update Date</label> 
		<input class="form-control" name='postUpdateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${postRead.postUpdateDate}" />' readonly="readonly">
	</div>
	
	<button data-oper='modify' class="btn btn-default" onclick='location.href="/post/modify?postBno=${postRead.postBno}"'>Modify</button>
	<button data-oper='list' class="btn btn-info" onclick='location.href="/post/list"'>List</button>
	
	
</body>
</html>