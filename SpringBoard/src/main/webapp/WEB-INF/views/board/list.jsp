<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<h1>/board/list/jsp</h1>

<%-- ${boardList } --%>
${pageVO }
전달정보 : ${msg }
<hr>

<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">게시판 리스트(ALL)</h3>
	</div>

	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 10px">BNO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 40px">VIEWCNT</th>
				</tr>
				<c:forEach var="vo" items="#{boardList}">
					<tr>
						<td>${vo.bno}</td>
						<td>
						<a href="/controller/board/read?bno=${vo.bno }&page=${param.page==null?1:param.page}">${vo.title}</a>
						</td>
						<td>${vo.writer}</td>
						<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><span class="badge bg-blue">${vo.viewcnt}</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="modal fade" id="myModal" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">아이티윌 게시판</h4>
					</div>
					<div class="modal-body">
						<p>확인할 내용 정보</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>

			</div>

		</div>
	</div>

	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageVO.prev }">
			<li><a href="/controller/board/listPage?page=${pageVO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
		
			<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/controller/board/listPage?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageVO.next && pageVO.endPage > 0 }">
			<li><a href="/controller/board/listPage?page=${pageVO.endPage+1 }">»</a></li>
			</c:if>
			
			
	
		</ul>
	</div>
</div>

<!-- Jquery 사용 -->
<script>
	$(document).ready(function() {
		/* 
			JSP 페이지 구성요소의 실행 순서
			JAVA - JSTL/EL - HTML - JS - CSS - Jquery
		 */
		// 		alert("${msg}");
		// 		var a = 10;
		// 		alert(a);
		// 		alert(abc);
		var result = "${msg}";
		if (result == "createOK") {
// 			alert("글쓰기 완료! 리스트 페이지로 이동")
			$("#myModal").modal("show");
			Swal.fire("글쓰기 완료!");
		
		}
		if(result == "modifyOK"){
			Swal.fire("글 수정 완료");
		}
		if(result == "deleteOK"){
			Swal.fire("게시판 글 삭제 완료");
		}
		

		

</script>





<%@ include file="../include/footer.jsp"%>