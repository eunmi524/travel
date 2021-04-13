<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section style="width: 1100px; margin-left: auto; margin-right: auto; margin-top: 200px;">
<div class="container-fluid">
  <div class="row" style="text-align: center;">
	<span style="font-size: 100px; color: indigo;">여행을 사랑하는 사람들</span>
	<div class="col-md-6">
		<a class="btn blue" href="/board/list">여행추천 & 후기 - 게시글 목록 이동</a>
	</div>
	<div class="col-md-6">
		<a class="btn blue" href="/post/list">관리자 - 관리자 페이지 </a>
	</div>

  </div>
</div>
</section>
	 
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	 
	 <style>
	 	.btn{
	 		text-decoration: none;
	 		font-size:2rem;
	 		color:white;
	 		padding:10px 20px 10px 20px;
	 		margin:100px;
	 		display:inline-block;
	 		border-radius: 10px;
	 		transition:all 0.1s;
	 		text-shadow: 0px -2px black;
 	 		font-family: 'Nanum Pen Script', cursive;
	 		}
	 		.btn:active{
	 			transform: translateY(3px);
	 		}
	 		.btn.blue{
	 		background-color: #1f75d9;
	 		border-bottom: 5px solid blue;
	 		}
	 		.btn.blue:active{
	 		border-bottom:2px solid blue;}
	 			
	 </style>
</body>
</html>