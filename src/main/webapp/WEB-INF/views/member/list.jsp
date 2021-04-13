<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>


		<table width="100%" class="table table-striped" >
            <thead>
                <tr>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>회원이름</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>가입일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${memberList}" var="member">
	            <tr onclick='location.href="/member/read?memberId=${member.memberId}"'>
	            	<td><c:out value="${member.memberId}" /></td>
	            	<td><c:out value="${member.memberPw}" /></td>
	            	<td><c:out value="${member.memberName}"/></td>
	            	<td><c:out value="${member.memberEmail}" /></td>
	            	<td><c:out value="${member.memberPhoneNumber}" /></td>
	            	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.joinDate}"/></td>
	            </tr>
            </c:forEach>
            </tbody>
        </table>


</body>
</html>