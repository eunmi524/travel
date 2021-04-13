<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>


<c:set var="memberId" value="${sessionScope.memberId }" />

<c:if test="${sessionScope.memberId eq 'admin'}">
	<button type="button" class="btn btn-primary" onclick="location.href='insert'">글쓰기</button>
</c:if>


	
		<table class="table table-striped" >
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>수정일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${postList}" var="postList">
	            <tr onclick='location.href="/post/read?postBno=${postList.postBno}"'>
	            	<td><c:out value="${postList.postBno}" /></td>
	            	<td><c:out value="${postList.postTitle}"/></td>
	            	<td><c:out value="${postList.memberId}" /></td>
	            	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${postList.postRegDate}" /></td>
	            	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${postList.postUpdateDate}" /></td>
	            </tr>
            </c:forEach>
            </tbody>
        </table>

</body>
</html>