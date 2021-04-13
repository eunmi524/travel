<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="page-wrapper">
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Reply Modify</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	        
	            <div class="panel-heading">Reply Modify Page</div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	            
	            	<form id="frmModify" role="form" action="/reply/modify" method="post">
	            	
	            	
	                    <div class="form-group">
	            			<label>Rno</label> <input class="form-control" name='rno' value='<c:out value="${replyModify.rno }"/>' readonly="readonly">
	            		</div>
	            		
	            		<!-- <div class="form-group">
	            			<label>Bno</label> 
	            		</div> -->
	            		<input type="hidden" class="form-control" name='bno' value='<c:out value="${replyModify.bno }"/>' readonly="readonly">
	            		
	            		<div class="form-group">
	            			<label>Text area</label>
	            			<textarea class="form-control" rows="3" name='replyContent' ><c:out value="${replyModify.replyContent }" /></textarea>
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>memberId</label> <input class="form-control" name='memberId' value='<c:out value="${replyModify.memberId }"/>' readonly="readonly">
	            		</div>
	            		
<%-- 	            		<div class="form-group">
	            			<label>replyDate</label> 
	            			<!-- <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/>  -->
	            			<input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/> <!-- 해결1 -->
	            			<input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${reply.replyDate}" />' disabled="disabled"/> <!-- 해결2 -->
	            		</div> --%>
	            			<input type="hidden" name="replyDate" value="${replyModify.replyDate}"/> <!-- 해결2 -->
	            			
<%-- 	            		<div class="form-group">
	            			<label>Update Date</label> 
	            			<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${board.updateDate}" />' readonly="readonly">
	            			<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value= "${board.updateDate}" />' readonly="readonly"> <!-- 해결1 -->
	            			<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${reply.updateDate}" />' disabled="disabled"> <!-- 해결2 -->
	            		</div> --%>
	            			<input type="hidden" name="updateDate" value="${replyModify.updateDate}"/> <!-- 실제 보내는건 위에가 아니라 여기 타입에 맞춰서 보내짐? -->

	                   		<button type="submit" data-oper='replyModify' class="btn btn-default">Modify</button>
	                   		<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
	                   		<button type="submit" data-oper='list' class="btn btn-info">List</button>
	                   	</form>
					</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>