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
</body>


</html>