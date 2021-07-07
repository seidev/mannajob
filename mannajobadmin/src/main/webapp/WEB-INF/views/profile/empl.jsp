<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>



<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">마이페이지</a><i class="icon-angle-right"></i></li>
              <li class="active">현직자 지원</li>
            </ul>
          </div>
        </div>
      </div>
    </section>


    <section id="" style="min-height:680px">
      <div class="container">
        <div class="row">
          <div class="span3">
            <aside class="left-sidebar">
              <div class="widget">
              </div>
              <div class="widget">
                <h5 class="widgetheading height_40">마이페이지</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i><a href="/match/matlist">매칭내역관리</a></li>
                  <c:set var="now" value="<%=new java.util.Date()%>" />
				  <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM" /></c:set> 
                  <li><i class="icon-angle-right"></i><a href="/mypage/calendar?yearmonth=${sysYear}">일정관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/profile/main">회원정보관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/profile/emplprofile">현직자 프로필관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/profile/empl">현직자 지원</a></li>
                </ul>
              </div>
            </aside>
          </div>
          <div class="span8">
            <article>
              <form method="post" action="/profile/empl" enctype="multipart/form-data" id="commentform" name="comment-form">
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <!-- <h3><a href="#">&nbsp&nbsp&nbsp프로필 관리하기</a></h3> -->
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>현직자</strong> 지원</h3>
                    <p class="line_9"></p>
                  </div>
                  <div class="row">
                    <div class="span4">
                      <div class="box aligncenter">
                        <div class="post-image">
                          <img src="/resources/img/avatar.png" alt="" style="width:240px;height:240px;" />
                        </div>
                      </div>
                    </div>
                    <div class="span4">
                      <div class="box aligncenter">
                      <input class="form-control" type="hidden" name="m_id" value="<%= request.getAttribute("userId")%>">
                        <input class="form-control" type="text"	name="e_corp" class="span4" placeholder="*회사명 입력" /><br>
                        <input class="form-control" type="text" name="e_dept" class="span4" placeholder="*부서 입력" /><br>
                        <input class="form-control" type="text"	name="e_rank" class="span4" placeholder="*직급 입력" /><br>
                          <select name="e_task" style="width: 100%" >
							 <option value="사업관리">사업관리</option>
							<option value="경영·회계·사무">경영·회계·사무</option>
							<option value="금융·보험">금융·보험</option>
							<option value="교육·자연·사회과학">교육·자연·사회과학</option>
							<option value="법률·경찰·소방·교도·국방">법률·경찰·소방·교도·국방</option>
							<option value="보건·의료">보건·의료</option>
							<option value="사회복지·종교">사회복지·종교</option>
							<option value="문화·예술·디자인·방송">문화·예술·디자인·방송</option>
							<option value="운전·운송">운전·운송</option>
							<option value="영업판매">영업판매</option>
							<option value="경비·청소">경비·청소</option>
							<option value="이용·숙박·여행·오락·스포츠">이용·숙박·여행·오락·스포츠</option>
							<option value="음식서비스">음식서비스</option>
							<option value="건설">건설</option>
							<option value="기계">기계</option>
							<option value="재료">재료</option>
							<option value="화학">화학</option>
							<option value="섬유·의복">섬유·의복</option>
							<option value="전기·전자">전기·전자</option>
							<option value="정보통신">정보통신</option>
							<option value="식품가공">식품가공</option>
							<option value="인쇄·목재·가구·공예">인쇄·목재·가구·공예</option>
							<option value="환경·에너지·안전">환경·에너지·안전</option>
							<option value="농림어업">농림어업</option>
                          </select>
                      </div>
                    </div>

                    <div class="span4"> 
                        <!-- 사진이미지 -->
                        <input type="file" name="e_image" value="프로필 사진">
                        <span>사진이미지 등록 </span>    
                        <!-- 재직증명서 or 경력증명서 -->
                        <input type="file" name="e_certifi" value="증명확인서"> 
                        <span>재직(경력) 증명서</span> 
                    </div>
                      
                     
                  </div>

                    <div class="row">
                      <div class="span8">
                        <div class="box aligncenter">
                          <p>
                            <textarea rows="8" name="e_career" class="input-block-level" placeholder="*주요경력 입력"
                              style="margin-left: 30px;"></textarea>
                          </p>
                          <p>
                            <textarea rows="8" name="e_intro" class="input-block-level" placeholder="*현직자 소개글 입력"
                              style="margin-left: 30px;"></textarea>
                          </p>
                          <div class="span8">
                            <div class="box aligncenter">
                              <p class="center">
                              <input type="submit" value="지원하기" class="btn btn-theme margintop10 i_btn2">
                              </p>
                            </div>
                          </div>

                        </div>
                      </div>

                    </div>
              </form>
            </article>
            <!-- author info -->
          </div>
        </div>
      </div>
    </section>

<%@ include file="../includes/footer.jsp" %>
<script>
	$('document').ready(function(){
		var error = "${error}"
		if(error==1){
			alert("현직자 지원이 필요합니다.");
		}
	});
</script>