<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

	<c:out value="${sessionScope.memberId }" />
	
	<button type="button" class="btn btn-primary" onclick="location.href='register'">글쓰기</button>
	<button type="button" class="btn btn-warning" onclick="location.href='/member/read?memberId=${member.memberId}'">내정보수정</button>

<div class="container-fluid">
  <div class="row" style="text-align: center;">
	<div class="col-md-1"></div>
	<div class="col-md-10">
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
            <c:forEach items="${list}" var="board">
	            <%-- <tr onclick='location.href="/board/read?bno=${board.bno}"'> --%>
	            
 	<!-- 방법1: get 페이지로 pageNum, amount 값을 전달 페이지로 값을 아래처럼 URL에 추가 -->
                	<td><a href='/board/read?bno=<c:out value="${board.bno}"/>'><c:out value="${board.bno}"/>
                	</a></td> <!--p.314 이렇게 할수도 있다. -->
	            
	            	<%-- <td><c:out value="${board.bno}" /></td> --%>
	            	<td><c:out value="${board.title}"/></td>
	            	<td><c:out value="${board.memberId}" /></td>
	            	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
	            	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
	            </tr>
            </c:forEach>
            </tbody>
        </table>
        
        <div class='row'>
        	<div class="col-lg-12">
        	
        	<form id='searchForm' action="/board/list" method='get'>
        		<select name='type'>
        			<option value="" 
        				<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>검색범위</option>
       				<option value="T"
       					<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
       				<option value="C"
       				<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
       				<option value="W"
       				<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
       				<option value="TC"
       				<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
       				<option value="TW"
       				<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
       				<option value="CW"
       				<c:out value="${pageMaker.cri.type eq 'CW'?'selected':''}"/>>내용 or 작성자</option>
       				<option value="TCW"
       				<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
        			</select>
        			<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
        			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
        			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
        			<button class='btn btn-default'>Search</button>
        			</form>
        	</div>

        </div>
                            <!-- /.table-responsive -->
        
        
<!-- Modal -->       
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.model-content -->
		</div><!-- /.model-dialog -->
	</div><!-- modal -->
	
	
<%-- 	    <!-- Pagination 표시 -->
		<div class='pull-right'>
		  <ul class="pagination">
		  
		  	<c:if test="${pageMaker.prev}">
		  		<li class="paginate_button previous"><a href="">Previous</a>
		  		</li>
		  	</c:if>
		  	
		  	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		  		<li class="paginate_button"><a href="">${num }</a></li>
		  	</c:forEach>
		  	
		  	<c:if test="${pageMaker.next}">
		  		<li class="paginate_button next"><a href="">Next</a></li>
		  	</c:if>
		  	
		  </ul>
		</div>
		<!-- end Pagination --> --%>

  
	    <!-- Pagination 표시 -->
	    
	    <!-- 페이징 번호 클릭시 자바스크립트를 이용하여 컨트롤러에 전달한 값을 가진 form -->
	    <form id='actionForm' action="/board/list" method='get'>
	    	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>  
	    	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'> <!-- amount는 Criteria에서 준 값 -->
	    	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>' />
	    	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
	    </form>
	    
	    
		<div class='pull-right'>
		  <ul class="pagination">
		  
		  	<c:if test="${pageMaker.prev}">
		  		<li class="paginate_button previous">
		  			<a href="${pageMaker.startPage -1 }">이전</a>
		  		</li>
		  	</c:if>
		  	
		  	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		  		<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'> <!-- num이 pageNum과 같으면 active로 설정해라 -->
		  			<a href="${num}">${num}</a></li>
		  	</c:forEach>
		  	
		  	<c:if test="${pageMaker.next}">
		  		<li class="paginate_button next">
		  			<a href="${pageMaker.endPage + 1 }">다음</a></li>
		  			
		  		<%-- <li class="paginate_button next">
		  			<a href="${pageMaker.realEnd }">맨끝값</a></li> --%>
		  	</c:if>
		  	
		  	
		  	
		  </ul>
		<br><br><br><br>
		</div>
		<!-- end Pagination -->

</div>
</div>
</div>        
	
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(
	function(){
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		
		function checkModal(result){
			
			if(result == '') {
				return;
			}
			
			if(parseInt(result) > 0 ){
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
});

//페이징 고려
//현재 페이지의 페이지 번호와 행수를 가진 폼을 변수에 저장
var actionForm = $("#actionForm");

//페이징 번호 클릭시, 폼의 현재번호를 클릭한 페이지 번호로 변경하여 전송
$(".paginate_button a").on("click", function(e){ /* a링크가 li에 들어있다? */
	
	e.preventDefault();  /* board/숫자  (board뒤에 숫자가되는걸 막음) */
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));  /* 여기서 this는 ".paginate_button a"를 말함(a객체) */
	
	actionForm.submit();
});

//글제목 클릭시, 폼의 현재번호와 행수를 get페이지로 전송
$(".move").on("click", function(e){ /* move가 a링크에 들어있어서 move만 주면 됨 */
	e.preventDefault();  /* board/5되는걸 막고 */
	actionForm.append("<input type='hidden' name='bno' value='" +$(this).attr("href") + "'/>"); /* href속성으로 글번호 가져옴 */
	actionForm.attr("action", "/board/get");
	alert("글 제목 클릭")
	console.log('click');
	
	actionForm.submit();
});
</script>



</html>