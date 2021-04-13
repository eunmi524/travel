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



<div class="row">
	<div class="col-lg-12">
	    <div class="panel panel-default">
	    
	        <div class="panel-heading">댓글</div>
	        <!-- /.panel-heading -->
	        
	<div class="panel-body">
	
		<form role="form" action="/reply/insert" method="post">	
			<div class="form-group">
				<label>replyContent</label> <input class="form-control" name='replyContent'>
			</div>
		

			<div class="form-group">
				<label>memberId</label> <input class="form-control" name='memberId' value='<c:out value="${sessionScope.memberId }" />'>
			</div>
			
			<div class="form-group">
				<label>bno</label> <input class="form-control" name='bno' value='<c:out value="${replyInsert}"/>' >
			</div>
			
			
			<button type="submit" class="btn btn-default">Submit Button</button>
			<button type="reset" class="btn btn-default">Reset Button</button>
		</form>
	</div>
	<!-- /.panel-body -->
</div>
<!-- /.panel panel-default -->
</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</body>
</html>