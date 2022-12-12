<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/functions' prefix='fn'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn {
	padding: 7px;
}
</style>
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js'></script>
</head>
<body>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary" style="font-size: 20px; font-weight: 800;">자유 게시판 수정</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form method='post' action='update.br' enctype='multipart/form-data'>
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th style="vertical-align: inherit; width: 11rem; font-size: 18px; font-weight: 800;">제목</th>
								<td colspan="5"><input type="text" value="${fn: escapeXml(vo.title) }" name='title' class='form-control form-control-user' title='제목' style="font-weight: 600; color: #333333;"></td>
							</tr>
							<tr>
								<th style="vertical-align: baseline; width: 11rem; font-size: 18px; font-weight: 800;">내용</th>
								<td colspan='5'><textarea name='content' title='내용' class='form-control form-control-user'
										style="font-weight: 600; color: #333333; height: 27rem">${vo.content}</textarea></td>
							</tr>
							<tr>
								<th style="font-size: 18px; font-weight: 800; ">첨부파일</th>
								<td colspan='5' style=" font-size: 18px; font-weight: 800;">
									 <div class='form-control form-control-user'>
									<label style=" font-size: 18px; font-weight: 800;">
										<input type='file' name='file' id='attach-file' style=" font-size: 18px; font-weight: 800;">
										<a><i class="font-b fa-solid fa-file-circle-plus" style=" font-size: 18px; font-weight: 800;"></i></a>									
									</label>
									<span id='file-name' style=" font-size: 18px; font-weight: 800;">${vo.filename }</span>
									<span id='preview' style=" font-size: 18px; font-weight: 800;"></span>
									<a id='delete-file' style='display:${empty vo.filename ? "none" : "inline"}'><i class="font-r fa-solid fa-trash-can"></i></a>
									</div>
								</td>
							</tr>
						</thead>
					</table>
					<input type='hidden' name='id' value='${vo.id }'>
					<input type='hidden' name='filename'>
					</form >
				</div>
			</div>
		</div>
		
	<div class='btn_blue' style='padding: 2rem; text-align: center;'>
		<a class='btn btn-primary btn-icon-split' id='save' style="font-size: 18px; font-weight: 600; ">저장</a>
		<a class='btn btn-danger btn-icon-split' href="list.br" style="font-size: 18px; font-weight: 600; ">취소</a>
	</div>
	
	<script>

	
	$('#save').click(function(){
		$('[name=filename]').val( $('#file-name').text() );
		if( emptyCheck() ) $('form').submit();
	});
	 
	function emptyCheck(){
		var ok = true;
		$('.chk').each(function(){
			if( $(this).val()=='' ){
				var item = $(this).attr('placeholder')
							? $(this).attr('placeholder') : $(this).attr('title');
				alert(item + ' 입력하세요!');
				$(this).focus();
				ok = false;
				return ok;			
			}
		});
		return ok;
	}
	 
	</script>
		
</body>
</html>