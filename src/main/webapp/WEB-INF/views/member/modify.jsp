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
	        <h1 class="page-header">Member Modify</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	        
	            <div class="panel-heading">Member Modify Page</div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	            
	            	<form id="frmModify" role="form" action="/member/modify" method="post">
	            	
	                    <div class="form-group">
	            			<label>memberId</label> <input class="form-control" name='memberId' value='<c:out value="${memberModify.memberId }"/>' readonly="readonly">
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>memberPw</label> <input class="form-control" name='memberPw' value='<c:out value="${memberModify.memberPw }"/>' >
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>memberName</label> <input class="form-control" name='memberName' value='<c:out value="${memberModify.memberName }"/>' >
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>memberEmail</label> <input class="form-control" name='memberEmail' value='<c:out value="${memberModify.memberEmail }"/>' >
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>memberPhoneNumber</label> <input class="form-control" name='memberPhoneNumber' value='<c:out value="${memberModify.memberPhoneNumber }"/>' >
	            		</div>
	            		
	            		<div class="form-group">
	            			<label>joinDate</label> 
	            			<!-- <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/>  -->
	            			<%-- <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value= "${board.regDate}" />' readonly="readonly"/> --%> <!-- 해결1 -->
	            			<input class="form-control" name='joinDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${memberModify.joinDate}" />' disabled="disabled"/> <!-- 해결2 -->
	            		</div>


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
			formObj.attr("action", "/member/remove");
			
		} else if(operation === 'list'){
			self.location= "/member/list";
			return;
			
		}
		formObj.submit();
	});
});
</script>
</html>