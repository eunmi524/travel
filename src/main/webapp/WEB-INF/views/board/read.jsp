<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

</head>
<body>

	<div id="page-wrapper"> <!-- 게시물 페이지 시작 -->
	    <div class="row">
	        <div class="col-lg-12">
	            <h1 class="page-header">Board Read</h1>
	        </div>
	        <!-- /.col-lg-12 -->
	    </div>
	    <!-- /.row -->
	    
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="panel panel-default">
	            
	                <div class="panel-heading">Board Read Page</div>
	                <!-- /.panel-heading -->
	                <div class="panel-body">
                        
	<div class="form-group">
		<label>Bno</label> 
		<input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>Title</label>
		<input class="form-control" name='title' readonly="readonly"  value='${board.title }'>
	</div>
	
	<div class="form-group">
		<label>Text area</label>
		<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.content }" /></textarea>
	</div>
	
	<div class="form-group">
		<label>MemberId</label> 
		<input class="form-control" name='memberId' value='<c:out value="${board.memberId }"/>' readonly="readonly">
	</div>
		
	<div class="form-group">
		<label>Update Date</label> 
		<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm:ss" value= "${board.updateDate}" />' readonly="readonly">
	</div>
	
	<button data-oper='modify' class="btn btn-default" onclick='location.href="/board/modify?bno=${board.bno}"'>Modify</button>
	
	<button data-oper='list' class="btn btn-info" onclick='location.href="/board/list"'>List</button>
	
	                        </div> <!-- /.panel-body -->
                    </div>  <!-- /.panel panel-default -->
                </div> <!-- /.col-lg-12 -->
            </div> <!-- /.row: Board-Get  -->


	
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

		
            	<div class="uploadResult">
					<ul>
						<!-- 업로드 후 결과가 표시되는 화면 위치 -->
					</ul>
				</div>
			</div> 
		</div> 
	</div>
</div>
                  
</div>

	<button class="btn btn-info" onclick='location.href="/reply/list?bno=${board.bno}"'>ReplyList</button>

	<button type="button" class="btn btn-primary" onclick="location.href='/reply/insert?bno=${board.bno}&memberId=${member.memberId }'">답글쓰기</button>

		<table width="100%" class="table table-striped" >
		
            <thead>
                <tr>
                    <th>답글번호</th>
                    <th>답글내용</th>
                    <th>답글입력시간</th>
                    <th>답글수정시간</th>
                    <th>작성자</th>
                    <th>글번호</th>
                    <th>수정버튼</th>
                    <th>삭제버튼</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${replyList }" var="reply">
	            <tr>
	            	<td><c:out value="${reply.rno}" /></td>
	            	<td><c:out value="${reply.replyContent}"/></td>
	            	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replyDate}" /></td>
	            	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.updateDate}" /></td>
	            	<td><c:out value="${reply.memberId}"/></td>
	            	<td><c:out value="${reply.bno}"/></td>
	            	<td><button data-oper='replyModify' class="btn btn-default" onclick='location.href="/reply/modify?rno=${reply.rno}"'>답글수정</button></td>
	            	<td><button data-oper='replyRemove' class="btn btn-default" onclick='location.href="/reply/remove?rno=${reply.rno}&bno=${reply.bno }"'>답글삭제</button></td>
	            </tr>
            </c:forEach>
            </tbody>
        </table>
	<%-- <button data-oper='replyModify' class="btn btn-default" onclick='location.href="/reply/modify?rno=${reply.rno}"'>답글수정</button> --%>

	
	<table width="100%" class="table table-striped" >
            <thead>
                <tr>
                    <th>답글번호</th>
                    <th>답글내용</th>
                    <th>답글입력시간</th>
                    <th>답글수정시간</th>
                    <th>작성자</th>
                    <th>글번호</th>
                    <th>수정버튼</th>
                    <th>삭제버튼</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${replyList }" var="reply">
	            <tr>
	            <form action="/reply/modify" method="get">
	            	<td><input name="rno" value="<c:out value="${reply.rno}" />"></td>
	            	<td><input name="replyContent" value="<c:out value="${reply.replyContent}" />"></td>
	            	<td><input name="replyDate" value="<c:out value="${reply.replyDate}" />"><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replyDate}" /></td>
	            	<td><input name="updateDate" value="<c:out value="${reply.updateDate}" />"><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.updateDate}" /></td>
	            	<td><input name="memberId" value="<c:out value="${reply.memberId}" />"><c:out value="${reply.memberId}"/></td>
	            	<td><input name="bno" value="<c:out value="${reply.bno}" />"><c:out value="${reply.bno}"/></td>
	            	<td><button type="submit">답글수정</button></td>
	            </form>
	            </tr>
            </c:forEach>
            </tbody>
        </table>
	
	<form>
	<input name="" value="">
	</form>
	
	
	
	
	
	
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">	
	
//첨부파일 li 클릭 이벤트	
	$(".uploadResult").on("click", "li", function(e){
		
		console.log("view image");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		
		//if(liObj.data("type")){
		if(liObj.data("type") == "I"){
			showImage(path.replace(new RegExp(/\\/g), "/"));
		} else {
			//download
			self.location ="/download?fileName="+path
		}
	});
	
	function showImage(fileCallPath){
		alert(fileCallPath);
		$(".bigPictureWrapper").css("display", "flex").show();
		
		$(".bigPicture")
		.html("<img src='/display?fileName="+fileCallPath+"'>")
		.animate({width:'100%', height: '100%'}, 1000);
	}
	
	
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
		setTimeout(function(){
			$('.bigPictureWrapper').hide();
		}, 1000);
	});

	
//});

$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
			console.log(arr);
			var str ="";
			
			$(arr).each(function(i, attach){
				
				//image type
				//if(attach.fileType){ //데이터베이스 저장 유형과 일치시켜서 fileType이 문자열 (I,F) //책은 boolean타입인데 우리는 String I, F로 바꿨기 때문에 무조건 값이 있어서 true이여서 여기를 실행하게 됨
				if(attach.fileType == "I" ){
					var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
					str += "	<div>";
					str += "		<image src='/display?fileName="+fileCallPath+"'>";
					str += "	</div>";
					str += "</li>";
					
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
					str += "	<div>";
					str += "	<span>" + attach.fileName+ "</span><br/>";
					str += "		<img src='/resources/img/attach.png'>";
					str += "	</div>";
					str += "</li>";
					}
				});
			
				$(".uploadResult ul").html(str);
			
		} //end 실행할 callback 함수 완료
		);//end getjson
	})(); //end function 반-모듈화된 즉실실행함수(변수에 담지 않았으니까 반 모듈화라고 불렀음) ():함수 실행문, 즉시실행 //익명으로 document.ready 실행
}); //.document.ready end	

</script>
</body>


</html>