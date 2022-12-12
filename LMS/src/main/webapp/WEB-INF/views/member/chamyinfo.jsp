<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js'></script>

</head>
<style>
@font-face {
	font-family: 'SEBANG_Gothic_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

h3 {
	font-family: 'SEBANG_Gothic_Bold';
}
</style>
<body>
	<div class="card shadow mb-6" style="width: 100%;">

		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Edit My info</h6>
		</div>
		<div class="card-body">
			<div class="row gutters-sm">
				<div class="col-md-4 mb-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center"> 
								
								<c:choose>
									<c:when
										test="${empty vo.profile and vo.gender eq '남'}">
										<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
											alt="Admin" class="rounded-circle" width="150">
									</c:when>
									<c:when
										test="${empty vo.profile and vo.gender eq '여'}">
										<img src="https://bootdey.com/img/Content/avatar/avatar8.png"
											alt="Admin" class="rounded-circle" width="150">
									</c:when>
									<c:otherwise>
										<img src="${vo.profile }" alt="Admin"
											class="rounded-circle" width="150">
									</c:otherwise>
								</c:choose>



								<div class="mt-3">
									<h4>${vo.name}</h4>
									<p class="text-secondary mb-1">${vo.department_name }</p>
								</div>

							</div>
						</div>
					</div>
					<div class="card mt-3">
						<ul class="list-group list-group-flush">
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<i class="fa-solid fa-venus-mars"></i>성별
								</h6> <span class="text-secondary"> ${vo.gender} </span>
							</li>
							<c:choose>

								<c:when test="${vo.info_cd eq 3 }">
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<i class="fa-solid fa-graduation-cap"></i>직책
										</h6> <span class="text-secondary"> 교수 </span>
									</li>
								</c:when>
								<c:when test="${vo.info_cd eq 1 }">
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<i class="fa-solid fa-graduation-cap"></i>학년
										</h6> <span class="text-secondary"> ${vo.grade} </span>
									</li>
								</c:when>
							</c:choose>
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<i class="fa-solid fa-graduation-cap"></i>입학 상태
								</h6> <span class="text-secondary"> ${vo.state} </span>
							</li>

						</ul>
					</div>

				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">

							<form action="updateinfo" method="post"
								enctype='multipart/form-data'>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name='email'
											class='chk form-control col-sm-6 mb-3 mb-sm-0' value='${vo.email }'>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Phone</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name="phone"
											class='date form-control col-sm-6 mb-3 mb-sm-0' value='${vo.phone }'>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Mobile</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name='mobile'
											class='date form-control col-sm-6 mb-3 mb-sm-0' value='(062) 362-7797'>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Address</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<a class='btn btn-primary btn-icon-split' style="padding: .5rem" id='post'>우편번호찾기</a> <input type='text'
											name='post' style="width: 7rem; margin-top:.5rem"
											class='w-px60 form-control ' value='${vo.post }' readonly>
										<input type='text' name='addr'
											class='form-control ' style="margin-top: .5rem; width: 21rem" value='${vo.addr }' readonly>
										<input type='text' name='addr' style="margin-top: .5rem; width: 21rem;"
											class='form-control'>
									</div>
								</div>
								<input type="hidden" name="id" value='${vo.id }'>
							</form>
							<hr>
							<div class="row">
								<div class="col-sm-12"
									style='text-align: center;'>
									<a class="btn btn-primary btn-icon-split"
										style="padding-right: 1rem; padding-left: 1rem; padding-top:.5rem; padding-bottom: .5rem; margin-right: .5rem" id='save' target="__blank">확인</a> <a
										class="btn btn-secondary btn-icon-split "
										style="padding-right: 1rem; padding-left: 1rem; padding-top:.5rem; padding-bottom: .5rem;" target="__blank" href="myinfo">취소</a>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${vo.info_cd eq 1}">
						<div class="row gutters-sm">
							<div class="col-md-12">
								<div class="card mb-3">
									<div class="card-body">
										<h6 class="d-flex align-items-center mb-3">
											<i class="material-icons text-info mr-2">입학일</i>${vo.start_date }</h6>
										<%-- <small>졸업까지 ${vo.end_date }</small>
										<div class="progress mb-3" style="height: 5px">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: 80%" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div> --%>

									</div>
								</div>
							</div>

						</div>
					</c:if>


				</div>
			</div>

		</div>
	</div>

	<script src='js/member.js?<%=new java.util.Date()%>'></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		$('#save').click(function() {
			console.log('zz');
			$('form').submit();
		});

		$('#post')
				.click(
						function() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											console.log(data);
											$('[name=post]').val(data.zonecode);
											var address = data.userSelectedType == 'R' ? data.roadAddress
													: data.jibunAddress;
											if (data.buildingName != '')
												address += ' ('
														+ data.buildingName
														+ ')';
											$('[name=addr]').eq(0).val(address);
										}
									}).open();
						});
	</script>

</body>
</html>