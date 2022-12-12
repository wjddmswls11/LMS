<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js'></script>

<title>공지사항</title>
<style>
body{
    background:#f3f3f3;
    margin-top:20px;
    color: #616f80;
}

.search-box {
	margin: 0 1rem 0 0;
}

.table-responsive {
	overflow: hidden;
}

table a {color: #111;}

table a:hover {color: #4e73df;}

</style>
</head>
<body>
	<form method='post' action='list.no'>
	<input type='hidden' name='curPage' value='1'/>
		<div class='card mb-4'>
			<div class='card-header py-3'>
				<h6 class='m-0 font-weight-bold text-primary' style="font-size: 20px; font-weight: 800;">검색</h6>
			</div>
			<div class='card-body d-flex'>
				<div class='dataTables_filter search-box'>
					<select 
						class='custom-select custom-select-sm form-control form-control-sm'
						name="search" style="font-size: 15px; font-weight: 600; color: #333333;">
						
								
						<option value='all' ${page.search eq 'all' ? 'selected' : '' } style="font-size: 15px; font-weight: 600; color: #333333;">전체</option>
						<option value='title' ${page.search eq 'title' ? 'selected' : '' } style="font-size: 15px; font-weight: 600; color: #333333;">제목</option>
						<option value='content' ${page.search eq 'content' ? 'selected' : '' } style="font-size: 15px; font-weight: 600; color: #333333;">내용</option>
						<option value='writer' ${page.search eq 'writer' ? 'selected' : '' } style="font-size: 15px; font-weight: 600; color: #333333;">작성자</option>
					</select>
				</div>
				<div class='dataTables_filter search-box'>
					<input type="search" class='names form-control form-control-sm' placeholder="검색어입력" name="keyword"
						onkeyup="if(window.event.keyCode==13){$('form').submit()}"
					value="${page.keyword}" style="font-size: 15px; font-weight: 600; color: #333333;">
				</div>
			</div>
		</div>
	</form>
    <!-- end row -->





	
    <div class="card shadow mb-4">
        <div class="card-header py-3">
        	<h6 class="m-0 font-weight-bold text-primary" style="font-size: 20px; font-weight: 800;">공지사항</h6>
        </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="70%" cellspacing="0">
                            <thead>
                                <tr class="bg-gray-100">
                                    <th style="text-align: center; font-size: 18px; font-weight: 600; color: #333333;">제목</th>
                                    <th style="text-align: center; font-size: 18px; font-weight: 600; color: #333333;">작성자</th>
                                    <th style="text-align: center; width: 250px; font-size: 18px; font-weight: 600; color: #333333;">작성일</th>
                                    <th style="text-align: center; font-size: 18px; font-weight: 600; color: #333333;">조회수</th>
                                    <th style="text-align: center; font-size: 18px; font-weight: 600; color: #333333;">첨부파일</th>
                                </tr>
                            </thead>
                            <tbody>
                           <c:forEach items='${page.list}' var='vo'>
                                   
							<tr >
								<td style=" font-size: 16px; color: #333333; "><a href="info.no?id=${vo.id}">${vo.title }</a></td>
								<td style="text-align: center; font-size: 16px; color: #333333; ">${vo.writer}</td>
								<td style="text-align: center; font-size: 16px; color: #333333; ">${vo.writedate }</td>
								<td style="text-align: left; font-size: 16px; color: #333333;">${vo.readcnt }</td>
								<td style="text-align: center; font-size: 16px;  color: #333333;">${empty vo.filename ? '' : '<i class="font-c fa-solid fa-paperclip"></i>'}</td>
						
							</tr>
						</c:forEach>

                             </tbody>
                        </table>
                    </div>
                    
                    	<div class='info' style="text-align: right; margin-right: 30px; font-size: 18px; font-weight: 600; color: #333333;">
				<!-- 직원인 경우만 글쓰기 가능 -->
				<c:if test='${loginInfo.info_cd eq 4 }'>
					<a href='new.no' class='btn btn-primary' style="text-align: right; margin-right: 30px; font-size: 18px; font-weight: 600; ">글쓰기</a>
				</c:if>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-5">
					<div class="dataTables_info" id="dataTable_info" role="status"
						aria-live="polite"> </div>
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTable_paginate">
						<ul class="pagination">
							<li class="paginate_button page-item previous  "
								id="dataTable_previous"><a onclick="go_page(1)"
								aria-controls="dataTable" data-dt-idx="0" tabindex="0"
								class="page-link" style="text-align: right; font-size: 18px; font-weight: 600;">처음</a></li>
							
						<c:forEach var="no" begin="${page.beginPage}" end="${page.endPage}">
						<c:if test="${no eq page.curPage}"><!-- 현재페이지인 경우 -->
						<li class="paginate_button page-item active"><a href="#"
								aria-controls="dataTable" data-dt-idx="${no}" 
								class="page-link" style="text-align: right; font-size: 18px; font-weight: 600;">${no}</a></li>
						</c:if>
						 <c:if test="${no ne page.curPage}"><!-- 현재페이지 아닌 경우 -->
							<li class="paginate_button page-item "><a onclick="go_page(${no})"
								aria-controls="dataTable" data-dt-idx="${no}" 
								class="page-link" style="text-align: right; font-size: 18px; font-weight: 600;">${no}</a></li>
						</c:if> 
						</c:forEach>
						
							
						
							<li class="paginate_button page-item next" id="dataTable_next"><a
								onclick="go_page(${page.totalPage})" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
								class="page-link" style="text-align: right; margin-right: 30px; font-size: 18px; font-weight: 600;">마지막</a></li>
						</ul>
					</div>
				</div>
			</div>
		
		
                  
                </div>
            </div>
    <!-- end row -->
</div>
	</form>







<script type="text/javascript">
function go_page(page){
	$('[name=curPage]').val( page );
	$('[name=keyword]').val( '${page.keyword}' );
	$('form').submit();
}
</script>


</body>
</html>