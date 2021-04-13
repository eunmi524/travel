<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    
	        <div class="panel-heading">회원가입</div>
	        <!-- /.panel-heading -->
	        
	<div class="panel-body">
	
		<form role="form" action="/member/insert" method="post">
			<div class="form-group">
				<label>memberId</label> <input class="form-control" name='memberId'>
			</div>
			
			<div class="form-group">
				<label>memberPw</label> <input class="form-control" name='memberPw'>
			</div>
			
			<div class="form-group">
				<label>memberName</label> <input class="form-control" name='memberName'>
			</div>
			
			<div class="form-group">
				<label>memberEmail</label> <input class="form-control" name='memberEmail'>
			</div>
			
			<div class="form-group">
				<label>memberPhoneNumber</label> <input class="form-control" name='memberPhoneNumber'>
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