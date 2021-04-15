<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

<style>
	.uploadResult { width:100%; background-color: gray;}
	.uploadResult ul{ display:flex; flex-flow: row; justify-content: center; align-items: center; }  /* flex-flow: row -> 파일이 왼쪽에서 오른쪽으로 옆으로 보여줌 */
	.uploadResult ul li{ list-style: none; padding: 10px; align-content: center; text-align: center; }
	.uploadResult ul li img{ width: 100px; }
	.uploadResult ul li span { color: white; }
	.bigPictureWrapper { position: absolute; display: none; justify-content: center; align-items: center; top:0%; width:100%; height:100%; background-color:gray; z-index:100; background:rgba(255,255,255,0.5);}
	.bigPicture {position: relative; display:flex; justify-content: center; align-items: center;}
/* 	.bigPicture img { width: 600px; } */
	.bigPicture img { height: 100%; max-width: 100%; width: auto; overflow:hidden }
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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

<!-- 첨부파일 정보 표시 -->	
<div class="row"> 
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">

            	<div class='bigPictureWrapper'>
					<div class='bigPicture'>
						<!-- 이미지 파일이 표시되는 DIV -->
					</div>
				</div>
            
        	<div class="panel-heading">첨부파일</div><!-- /.panel-heading -->
            <div class="panel-body">
            <!-- 원본 이미지 파일 표시 위치: CSS의 flex 를 이용해서, 이 위치가 아니라 화면 중앙에 표시됨 -->	
				<div class="form-group-body">
					<input type="file" name='uploadFile' multiple="multiple">
				</div>
		
            	<div class="uploadResult">
					<ul>
						<!-- 업로드 후 결과가 표시되는 화면 위치 -->
					</ul>
				</div>
			</div> 
		</div>                   
	</div>	<!-- .col-lg-12 end -->
</div> <!-- .row : 댓글 화면 표시 끝 -->  

<script type="text/javascript">



</script>
</body>
</html>