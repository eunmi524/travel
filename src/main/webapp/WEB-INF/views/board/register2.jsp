<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>   
<%@ include file="../includes/header.jsp" %>

<style>
	.uploadResult { width:100%; background-color: gray;}
	.uploadResult ul{ display:flex; flex-flow: row; justify-content: center; align-items: center; }  /* flex-flow: row -> 파일이 왼쪽에서 오른쪽으로 옆으로 보여줌 */
	.uploadResult ul li{ list-style: none; padding: 10px; align-content: center; text-align: center; }
	.uploadResult ul li img{ width: 100px; }
	.uploadResult ul li span { color: white; }
	.bigPictureWrapper { position: absolute; display: none; justify-content: center; align-items: center; top:0%; width:100%; height:100%; background-color:gray; z-index:100; background:rgba(255,255,255,0.5);}
	.bigPicture {position: relative; display:flex; justify-content: center; align-items: center;}
	.bigPicture img { width: 600px; }
</style>
    
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">Board Register</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        	<form role="form" action="/board/register" method="post">
                        		<div class="form-group">
                        			<label>Title</label> <input class="form-control" name='title'>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>Text area</label>
                        			<textarea class="form-control" rows="3" name='content'></textarea> <!-- /textarea는 반드시 붙여써야함.(아래에 따로 띄어 쓰면 안됨) -->
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
            
            
<!-- 첨부파일 -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">File Attach</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        	<div class="form-group uploadDiv">
                        		<input type="file"  name='uploadFile' multiple>
                        	</div>
                        	
                        	<div class='uploadResult'>
                        		<ul>
                        			<!-- 업로드 결과 표시 -->
                        		</ul>
                        	</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel panel-default -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->            
            
            
            
  		</div>
        <!-- /#page-wrapper -->
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

//게시물(위의 form)+첨부파일 정보 등록(아래 추가된 코드)

var formObj = $("form[role='form']");

$("button[type='submit']").on("click", function(e){
	
	e.preventDefault();
	
	console.log("submit clicked");
	
	var str = "";
	
	//업로드 결과의 li요소 선택하여 각각에 대하여 다음을 처리
	$(".uploadResult ul li").each(function(i, obj){
		
		var jobj = $(obj);
		
		console.dir(jobj); 
		
		//boardVO의 private List<BoardAttachVO> attachList 필드에 전달되도록 name 속성 설정
		str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
	});
	
	formObj.append(str).submit(); //기존 게시물 정보+첨부파일 정보 추가된걸 submit함
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
		
		alert("asd00");
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		formData.append("uploadFile", files[i]);
	}
	
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false, 
			contentType: false, 
			data:formData, 
			type: 'POST',
			dataType:'json',
			success: function(result){
				console.log(result);
				showUploadResult(result); //업로드 결과 처리 함수
			}
		}); 
	
	});
	
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		var uploadUL = $(".uploadResult ul");
		var str ="";
		
		$(uploadResultArr).each(function(i, obj){
			
			//image type 
			if(obj.image){
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
		
		uploadUL.append(str); 
	}
	
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
</script>

