<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<h1>/board/modify.jsp</h1>

${bno}

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">/board/modify.jsp</h3>
	</div>
	
	

		<form role="form" action="" method="post">
			<input type="hidden" name="bno" value="${resultVO.bno }">
			<input type="hidden" name="page" value="${param.page }">
			<input type="hidden" name="bno" value="${param.pageSize}">
	


		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">번호 </label> 
				<input type="text" name="bno" class="form-control" 
				id="exampleInputEmail1"  value="${resultVO.bno }" readonly="readonly">
			</div>
				<label for="exampleInputEmail1">제 목</label> 
				<input type="text" name="title" class="form-control" 
				id="exampleInputEmail1"  value="${resultVO.title }" >
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label> 
				<input type="text" name="writer" class="form-control" 
				id="exampleInputEmail1"  value="${resultVO.writer }" >
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="content" 
				rows="3" >${resultVO.content }
				</textarea>
			</div>
		</div>


		<div class="box-footer">
			<button type="submit" class="btn btn-danger">수정하기</button>
			<button type="submit" class="btn btn-warning">취소하기</button>
		</div>
	
	</form>	
</div>


<script type="text/javascript">
	$(document).ready(function(){
	// '취소하기' 클릭시 리스트 페이지 이동

		$(".btn-warning").click(function(){
// 			alert("클릭!");
			location.href="/controller/board/listALL";
		})
		
		
	});
</script>




<%@ include file="../include/footer.jsp"%>