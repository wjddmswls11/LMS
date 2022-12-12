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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
</head>
<body>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary" style="font-size: 20px; font-weight: 800;">공지사항 상세보기</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th style="vertical-align: inherit; width: 11rem; font-size: 18px; font-weight: 800;">제목</th>
								<td colspan="5"><div class='form-control form-control-user' style="font-weight: 600; color: #333333; ">${vo.title }</div></td>
							</tr>
							<tr>
								<th style="vertical-align: inherit; width: 11rem; font-size: 18px; font-weight: 800;">작성자</th>
								<td><div class='form-control form-control-user' style="font-weight: 600; color: #333333; ">${vo.writer }</div></td>
								<th style="vertical-align: inherit; width: 11rem; font-size: 18px; font-weight: 800;">작성일자</th>
								<td><div class='form-control form-control-user' style="font-weight: 600; color: #333333; ">${vo.writedate }</div></td>
								<th style="vertical-align: inherit; width: 11rem; font-size: 18px; font-weight: 800;">조회수</th>
								<td><div class='form-control form-control-user' style="font-weight: 600; color: #333333; ">${vo.readcnt }</div></td>
							</tr>
							<tr>
								<th style="vertical-align: baseline; width: 11rem; font-size: 18px; font-weight: 800;">내용</th>
								<td colspan='5'><div class='form-control form-control-user'
										style="font-weight: 600; color: #333333; height: 27rem">${vo.content}</div></td>
							</tr>
							<tr>
								<th style="font-size: 18px; font-weight: 800; ">첨부파일</th>
								<td colspan='5'>
									 <div class='form-control form-control-user'>
										<span id='file-name' style=" font-size: 18px; font-weight: 800;">${vo.filename}</span>
										<c:if test='${not empty vo.filename }'>
											<a id='download'><i
												class="font-b fa-solid fa-file-arrow-down"></i></a>
										</c:if>
									</div>
								</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		
	<div class='btn_blue' style='padding: 2rem; text-align: center;'>
		<a class='btn btn-secondary btn-icon-split'
			href='list.no'>목록으로</a>
		<c:if test='${loginInfo.info_cd eq 4 }'>
			<a class='btn btn-primary btn-icon-split'
				href='modify.no?id=${vo.id}&${hrefParam}'>정보수정</a>
			<a class='btn btn-danger btn-icon-split' id='remove' onclick="if(confirm('삭제 할까요?')) location='delete.no?id=${vo.id}'">정보삭제</a>
		</c:if>
	</div>
	
	<script>

	$('#download').click(function(){
		$(this).attr('href'
				, 'download.no?id=${vo.id}&url=' + $(location).attr('href'));
	});
	if( isImage( "${vo.filename}" ) ){
		$('#file-name').after( '<span id="preview"><img src="${vo.filepath}"></span>' );
	}

	 
	</script>
		
</body>
</html>