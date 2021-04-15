<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			
		} else if(operation === 'modify'){
			console.log("submit clicked");
			var str = "";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			formObj.append(str).submit();
		}
		formObj.submit();
	});
});


$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno: bno}, function(arr){  //성공시 실행될 Callback 함수: 데이터베이스로부터 첨부파일 정보(List)를 전달받음
			console.log(arr);
			var str ="";
			
			$(arr).each(function(i, attach){
				
				//image type
				//if(attach.fileType){ //데이터베이스 저장 유형과 일치시켜서 fileType이 문자열 (I,F) //책은 boolean타입인데 우리는 String I, F로 바꿨기 때문에 무조건 값이 있어서 true이여서 여기를 실행하게 됨
				if(attach.fileType == "I" ){
					
					//썸네일 이미지 파일 이름 생성
					var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
					str += "	<div>";
					str += "		<span>" + attach.fileName+"</span>";
					str += "		<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "		<image src='/display?fileName="+fileCallPath+"'>";
					str += "	</div>";
					str += "</li>";
					
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
					str += "	<div>";
					str += "		<span>" + attach.fileName+"</span><br/>";
					str += "		<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'"
					str += "		class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
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


$(".uploadResult").on("click", "button", function(e){
	console.log("delete file");
	
	var targetFile = $(this).data("file");
	var type = $(this).data("type");
	
	var targetLi = $(this).closest("li");
	
	$.ajax({
		url: '/deleteFile',
		data: {fileName: targetFile, type:type},
		dataType: 'text',
		type: 'POST',
		success: function(result){
			alert(result);
			targetLi.remove();
		}
	});
});


//첨부파일 li 클릭 이벤트
/* 	$(".uploadResult").on("click", "li", function(e){
	//$(".uploadResult").on("click", "li img,span", function(e){  //li안에 img나 span을 찾아라(범위를 구체적으로 줄임)	
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
	}); */
	
	//게시물 수정 시의 첨부파일 삭제: (교재):화면에서만 삭제되도록, 업로드된 파일은 삭제되지 않음, 데이터베이스 정보도 변경 없음
	$(".uploadResult").on("click", "button", function(e){

		console.log("delete file");
		if(confirm("Remove this file? ")){
		
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});

//원본 이미지 표시
function showImage(fileCallPath){
	alert(fileCallPath);
	$(".bigPictureWrapper").css("display", "flex").show();
	
	$(".bigPicture")
	.html("<img src='/display?fileName="+fileCallPath+"'>")
	.animate({width:'100%', height: '100%'}, 1000);
}

//표시된 원본 이미지 닫기
$(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
	setTimeout(function(){
		$('.bigPictureWrapper').hide();
	}, 1000);
});


var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB

function checkExtension(fileName, fileSize){
	
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}


//파일 업로드
$("input[type='file']").change(function(e){
	var formData = new FormData();
	var inputFile = $("input[name='uploadFile']");
	var files = inputFile[0].files;
	//formData 객체에 파일 추가
	for(var i = 0; i < files.length; i++){
		//파일 확장자 및 최대크기 검사 함수 실행 if문
		if(!checkExtension(files[i].name, files[i].size)){
		return false;
	}
	//
	formData.append("uploadFile", files[i]);
}
	//url의 컨트롤러에 formData 객체를 POST 방식으로 전송
	$.ajax({
		url: '/uploadAjaxAction',
		processData: false, //contentType 에 설정된 형식으로 데이터 처리 안함
		contentType: false, //contentType 지정 안함
		data:formData, 
		type: 'POST',
		dataType:'json', //컨트롤러로부터 전달받는 데이터 유형
		success: function(result){
			console.log(result);
			showUploadResult(result); //업로드 결과 처리 함수
		}
	}); 

});


function showUploadResult(uploadResultArr){
	//서버로부터 결과내용이 전달되지 않으면 함수 종료
	if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	
	var uploadUL = $(".uploadResult ul");
	//ul에 표시할 HTML 요소 내용을 저장할 변수
	var str ="";
	
	$(uploadResultArr).each(function(i, obj){
		
		//image type 
//		if(obj.image)
		if(obj.image || obj.file_type == "I" ){
			var fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			
			//썸네일 이미지 및 파일 이름 표시
			//li에 data-속성이름 형식으로 값을 설정, 주의! 속성이름은 영문 소문자로만 작성해야 합니다(대문자X)
			//str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='I'>"; //I: 이미지
			str += "	<div>";				
			str += "		<span> " + obj.fileName+"</span>";
			str += "		<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "		<img src='/display?fileName="+fileCallPath+"'>";
			str += "	</div>";
			str += "</li>";
		 //image type이 아닌 경우 (일반파일)
		} else{
			var fileCallPath = encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
			
			//str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' > ";
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='F' > "; //F: 파일
			str += "	<div>";
			str += "		<span> " + obj.fileName+"</span>";
			str += "		<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'>";
			str += "			<i class='fa fa-times'></i>";
			str += "		</button><br>";
			str += "		<img src='/resources/img/attach.png'></a>";
			str += "	</div>";
			str += "</li>";
		}
	});
	
	uploadUL.append(str); //기존 내용 밑에 새 내용 표시
}


//});


$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno: bno}, function(arr){  //성공시 실행될 Callback 함수: 데이터베이스로부터 첨부파일 정보(List)를 전달받음
			console.log(arr);
			var str ="";
			
			$(arr).each(function(i, attach){
				
				//image type
				//if(attach.fileType){ //데이터베이스 저장 유형과 일치시켜서 fileType이 문자열 (I,F) //책은 boolean타입인데 우리는 String I, F로 바꿨기 때문에 무조건 값이 있어서 true이여서 여기를 실행하게 됨
				if(attach.fileType == "I" ){
					
					//썸네일 이미지 파일 이름 생성
					var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
					str += "	<div>";
					str += "		<span>" + attach.fileName+"</span>";
					str += "		<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "		<image src='/display?fileName="+fileCallPath+"'>";
					str += "	</div>";
					str += "</li>";
					
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
					str += "	<div>";
					str += "		<span>" + attach.fileName+"</span><br/>";
					str += "		<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'"
					str += "		class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
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

</html>