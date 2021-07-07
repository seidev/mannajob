<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../includes/header.jsp" %>


<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">마이페이지</a><i class="icon-angle-right"></i></li>
              <li class="active">현직자 프로필 관리</li>
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

                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <!-- <h3><a href="#">&nbsp&nbsp&nbsp프로필 관리하기</a></h3> -->
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>현직자</strong> 프로필 관리</h3>
                    <p class="line_9"></p>
                  </div>
                  <div class="row">
                    <div class="span4">
                      <div class="box aligncenter">
                        <div class="post-image">
                          <img src="/resources/certifi/${imageFile}" alt="" style="width:240px;height:240px;"/>
                        </div>
                      </div>
                    </div>
                    <div class="span4">
                      <div class="box aligncenter">
                        <label style="text-align: left;">회사명<input type="text" class="span4"  value="${emplcorp}" disabled><br></label>
                        <label style="text-align: left;">부서명<input type="text" class="span4"  value="${empldept}" disabled /><br></label>
                        <label style="text-align: left;">직급<input type="text" class="span4" value="${emplrank}" disabled /><br></label>
                        <label style="text-align: left;">직무<input type="text" class="span4" value="${empltask}" disabled /></label>
                      </div>
                    </div>

                    <div class="span4"> 
                        <!-- 사진이미지 등록 되었을 경우, 안되었을 경우-->
                        <p class="right">사진이미지 등록됨 </p>  
                        <!-- <p class="right">사진이미지를 등록해 주세요.. </p>   -->
                        <!-- 재직(경력)증명서 등록 되었을 경우, 안되었을 경우 -->
                        <p class="right">재직(경력) 증명서 등록됨</p> 
                        <!-- <p class="right">재직(경력) 증명서를 등록해 주세요..</p>  -->
                    </div>
                      
                     
                  </div>

                  <div class="row">
                    <div class="span8">
                      
                      <div class="box aligncenter">
                        <h5 class="left">▶ 주요경력</h5>  
                        <% pageContext.setAttribute("line", "\n");%>
                        <textarea rows="4" class="input-block-level"  
                          style="margin-left: 30px; " disabled>${emplcareer}
                        </textarea> 

                        <h5 class="left">▶ 소   개</h5>  
                        <textarea rows="6" class="input-block-level" 
                          style="margin-left: 30px;" disabled>${emplintro}
                        </textarea>
                        
                        <div class="span8">
                          <div class="box aligncenter">
                            <p class="center">
                                <a href="/profile/updateEmpl" class="btn btn-theme margintop10 a_btn2" type="submit">수정하기</a>
                                <a href="/file/deleteEmpl" class="btn btn-inverse margintop10 a_btn2" type="submit">삭제하기</a>
                            </p>
                          </div>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>
 
            </article>
            <!-- author info -->
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>
