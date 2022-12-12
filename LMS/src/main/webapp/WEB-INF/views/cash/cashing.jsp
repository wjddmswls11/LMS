<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% Date nowTime = new Date();
	SimpleDateFormat day = new SimpleDateFormat("YYYY년"); %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원 월급 관리 페이지</title>
<style type="text/css">

.bp{color: #333;}

h1{font-weight: bold; margin-bottom: 10rem;}
th{
	background: rgb(248,249,252);
}
span.btn{
	display:block;
}
.search-box{
	margin:0 1rem 0 0;
}
.table-responsive{
	overflow:hidden;
}
.count-box{
	padding: 0;
    margin-bottom: 1rem;
    max-width: 10%;
}

.show{
	display: block !important;
}
.d-none{
	display: none !important;
}

.oo{
	position: absolute;
	z-index: 999;
	top: 10%;
  left: 37%;
  margin: -50px 0 0 -50px;
}
th{
font-size:20px;
 color: #333;
}
td{
font-size:18px;
 color: #333;
}
</style>
</head>
<body>


					
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800 mt-2 mb-2"></h1>

<div id ="menub" class="d-none oo">
	<%@ include file="scholarship/sc_insert.jsp" %>
</div>          

<div class="container-fluid">


					
					



<h1 class="h3 mb-2 text-gray-800 mt-2 mb-2">재무 관리</h1>

									
					<div class="dd">
					<!-- Page Heading -->
                    <ul class="nav nav-tabs mb-3">
                    	                   

                    
					  <li class="nav-item">
					    <a class="nav-link co1  ${category eq 'all' ? 'active' : ''}" onclick="choice(c1)" aria-current="page" href="cash.ing?category=all">전체 관리</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link co2 ${category eq 'salary' ? 'active' : ''}"  onclick="choice(c2)" href="cash.ing?category=salary">급여 관리</a>
					  </li>
					 <li class="nav-item">
					    <a class="nav-link co3 ${category eq 'tuition' ? 'active' : ''}"   onclick="choice(c3)"href="cash.ing?category=tuition">등록금 현황</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link co4 ${category eq 'scholarship' ? 'active' : ''}"   onclick="choice(c4)"href="cash.ing?category=scholarship">장학금 현황</a>
					  </li>
					</ul>
					
					<!-- 필터 -->
					
					<div class='card mb-4'>
					<form id='all_manage' action='cash.ing' method='post'>
					<input type="hidden" value="${category }" name="category">
						<div class='card-header py-3'>
							<h6 class='m-0 font-weight-bold text-primary'>검색</h6>
						</div>
						<div class='card-body d-flex'>
							<!-- 연도 별 검색 -->
							<div class='dataTables_filter search-box'>
								<select name='cash_year' class='bp custom-select custom-select-sm form-control form-control-sm' onchange='$("form#all_manage").submit()'>
									<option value=''
									> 연도별</option>
									<option
									${temp_map.cash_year eq 2020 ? 'selected' : '' }
									 value="2020"> 2020월 </option>
									<option 
										${temp_map.cash_year eq 2021 ? 'selected' : '' }
									value="2021"> 2021월 </option>
									<option 
										${temp_map.cash_year eq 2022 ? 'selected' : '' }
									value="2022"> 2022월 </option>
								</select>
							</div>
							
							<!-- 월별 검색 -->
							<div class='dataTables_filter search-box'>
								<select name='cash_month'  class='bp custom-select custom-select-sm form-control form-control-sm' onchange='$("form#all_manage").submit()'>
									<option value=''> 월별</option>
									<c:forEach var='mm' begin='1' end='12'>
									<option 
													${mm  eq temp_map.cash_month ? 'selected' : '' }
									value="0${mm}"  > ${mm}월 </option>
									</c:forEach>
								</select>
							</div>
							
							<!-- 아이디로 검색 -->
							<div class='dataTables_filter search-box'>
								<input name="id" type="search" class='bp ids form-control form-control-sm' placeholder='아이디로 검색'
								onkeyup="if(window.event.keyCode==13){$('form').submit()}"
								 value="${temp_map.id }">
							</div>
							
							<!-- 이름으로 검색 -->
							<div class='dataTables_filter search-box'>
								<input name="name" type="search" class='bp names form-control form-control-sm' placeholder='이름으로 검색'
								onkeyup="if(window.event.keyCode==13){$('form').submit()}"
								 value="${temp_map.name }">
							</div>
							
							<!-- 직책으로 검색 -->
							<div class='dataTables_filter search-box bp'>
							<select name="info_cd" onchange='$("form").submit()'
											class='bp custom-select custom-select-sm form-control form-control-sm'>
												<option  value=''>전체 보기</option>
								
									<c:forEach items="${info_list }" var="info">
									
									<option ${info.info_cd eq temp_map.info_cd ? 'selected' : ''} 
									value='${info.info_cd }'> ${info.info_name }</option>
									</c:forEach>

										</select>
							</div>
							
							<%--시간없어서 그냥 없앰.. <!-- 수당으로 검색 -->
							<div class='dataTables_filter search-box'>
								<select name="cash_code" class='custom-select custom-select-sm form-control form-control-sm' onchange='$("form").submit()'>
									<option value='' > 수당검색</option>
									<c:forEach items="${info_list }" var="info">
									<option ${info_cd eq info.info_cd ? 'selected' : ''} 
									value='${info.info_cd }'> ${info.info_name }</option>
									</c:forEach>
								</select>
							</div> --%>
							
							<!-- 학과로 검색 -->
							<div class='dataTables_filter search-box'>
								<select name="department"class='bp custom-select custom-select-sm form-control form-control-sm' onchange='$("form").submit()'>
									<option value='' > 학과검색</option>
									<c:forEach items="${department_list }" var="vo">
									<option
									${vo.department_name eq temp_map.department ? 'selected' : ''} 
									value='${vo.department_name }'> ${vo.department_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>
					</div>
					<!-- 필터 끝 -->
					
                    <!-- 데이터 테이블 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">재무 현황</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <div id='dataTable_wrapper' class='bp dataTables_wrapper dt-bootstrap4'>
                            <!-- 테이블 자리 -->
                            
                           <%--  ${category } --%>
                   
<c:choose>  
	<c:when test="${category eq 'salary'}"> 
	      <c:import url="/WEB-INF/views/cash/salary/salary_list.jsp"/>
	</c:when> 
	<c:when test="${category eq 'tuition'}"> 
	      <c:import url="/WEB-INF/views/cash/tuition/tuition_list.jsp"/>
	</c:when> 
	<c:when test="${category eq 'scholarship'}"> 
	      <c:import url="/WEB-INF/views/cash/scholarship/sc_list.jsp"/>
	</c:when> 
	<c:otherwise> 
       <c:import url="/WEB-INF/views/cash/common/cm_list.jsp"/>
	</c:otherwise> 
</c:choose>   
                                
                            </div>
                            </div>
                        </div>
                    </div>
                </div><!-- container-fluid -->
					
					
					
					</div>

                					



                    
<script>


function choice(e){
	if(e == 'c1'){
		$('.co1').classList.add('active');
		$('.co2').classList.remove('active');
		$('.co3').classList.remove('active');
		$('.co4').classList.remove('active');
	}else if (e == 'c2'){
		$('.co1').classList.remove('active');
		$('.co2').classList.add('active');
		$('.co3').classList.remove('active');
		$('.co4').classList.remove('active');
	}else if (e == 'c3'){
		$('.co1').classList.remove('active');
		$('.co2').classList.remove('active');
		$('.co3').classList.add('active');
		$('.co4').classList.remove('active');
	}else if (e == 'c4'){
		$('.co1').classList.remove('active');
		$('.co2').classList.remove('active');
		$('.co3').classList.remove('active');
		$('.co4').classList.add('active');
	}
}



</script>      
</body>
</html>