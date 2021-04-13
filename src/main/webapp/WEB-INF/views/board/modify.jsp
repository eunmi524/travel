<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="page-wrapper">
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Board Modify</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	        
	            <div class="panel-heading">Board Modify Page</div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	            
	            	<form id="frmModify" role="form" action="/board/modify" method="post">
	            	
	                    <div class="form-group">
	            			<label>Bno</label> <input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title }"/>' >
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>Text area</label>
	            			<textarea class="form-control" rows="3" name='content' ><c:out value="${board.content }" /></textarea>
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>memberId</label> <input class="form-control" name='memberId' value='<c:out value="${board.memberId }"/>' readonly="readonly">
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>regDate</label> 
	            			<!-- <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/>  -->
	            			<%-- <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/> --%> <!-- 해결1 -->
	            			<input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${board.regDate}" />' disabled="disabled"/> <!-- 해결2 -->
	            		</div>
	            			<input type="hidden" name="regDate" value="${board.regDate}"/> <!-- 해결2 -->
	            			
	            		<div class="form-group">
	            			<label>Update Date</label> 
	            			<%-- <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${board.updateDate}" />' readonly="readonly"> --%>
	            			<%-- <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value= "${board.updateDate}" />' readonly="readonly"> --%> <!-- 해결1 -->
	            			<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${board.updateDate}" />' disabled="disabled"> <!-- 해결2 -->
	            		</div>
	            			<input type="hidden" name="updateDate" value="${board.updateDate}"/> <!-- 실제 보내는건 위에가 아니라 여기 타입에 맞춰서 보내짐? -->

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" >
$(document).ready(
function(){
	var formObj = $("#frmModify");
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		alert(operation);
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
			
		} else if(operation === 'list'){
			self.location= "/board/list";
			return;
			
		}
		formObj.submit();
	});
});

</script>

</html>