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
	<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">Post Register</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        	<form role="form" action="/post/insert" method="post">
                        		<div class="form-group">
                        			<label>PostTitle</label> <input class="form-control" name='postTitle'>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>Text area</label>
                        			<textarea class="form-control" rows="3" name='postContent'></textarea> <!-- /textarea는 반드시 붙여써야함.(아래에 따로 띄어 쓰면 안됨) -->
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>memberId</label> <input class="form-control" name='memberId' value='<c:out value="${sessionScope.memberId }"/>'>
                        			
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