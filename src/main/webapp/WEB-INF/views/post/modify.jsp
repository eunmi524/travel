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

<div id="page-wrapper">
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Post Modify</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	        
	            <div class="panel-heading">Post Modify Page</div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	            
	            	<form id="frmModify" role="form" action="/post/modify" method="post">
	            	
	                    <div class="form-group">
	            			<label>postBno</label> <input class="form-control" name='postBno' value='<c:out value="${postModify.postBno }"/>' readonly="readonly">
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>postTitle</label> <input class="form-control" name='postTitle' value='<c:out value="${postModify.postTitle }"/>' >
	            		</div>
	            		
	            		<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control" rows="3" name='postContent' ><c:out value="${postModify.postContent }" /></textarea>
						</div>
	            		
	            		<div class="form-group">
	            			<label>MemberId</label> <input class="form-control" name='memberId' value='<c:out value="${postModify.memberId }"/>' readonly="readonly">
	            		</div>
	            		
						<div class="form-group">
	            			<label>postRegDate</label> 
	            			<!-- <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/>  -->
	            			<%-- <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/> --%> <!-- 해결1 -->
	            			<input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${postModify.postRegDate}" />' disabled="disabled"/> <!-- 해결2 -->
	            		</div>
	            			<input type="hidden" name="regDate" value="${postModify.postRegDate}"/> <!-- 해결2 -->
	            			
	            		<div class="form-group">
	            			<label>Update Date</label> 
	            			<%-- <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${board.updateDate}" />' readonly="readonly"> --%>
	            			<%-- <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value= "${board.updateDate}" />' readonly="readonly"> --%> <!-- 해결1 -->
	            			<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${postModify.postUpdateDate}" />' disabled="disabled"> <!-- 해결2 -->
	            		</div>
	            			<input type="hidden" name="updateDate" value="${postModify.postUpdateDate}"/> <!-- 실제 보내는건 위에가 아니라 여기 타입에 맞춰서 보내짐? -->

	                   		<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
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