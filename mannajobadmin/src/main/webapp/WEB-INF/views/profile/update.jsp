<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

    <!-- 상단 black bar breadcrumb --> 
    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">마이페이지</a><i class="icon-angle-right"></i></li>
              <li class="active">회원정보관리</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    
    
    <section id=""style="min-height:680px">
      <div class="container">
        
        <!-- divider      -->
        <div class="row">
 			<!-- 왼쪽 menu -->
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
        	         	          		        		
	        <form action="/profile/update" method="post" class="form-horizontal span9"
	       		 name="registerForm" onsubmit="return registerValidate_update();">
				<div class="post-heading center">                
	              <p class="line_9"></p>
	              <p class="line_9"></p>
	              <h4>Change an <strong>account</strong></h4>             
	            </div>  
		
		        <div class="control-group center">   
		        	<div class="">	          	             	        
			            <p class="line_9"></p>	
			            <p style="margin-left: -180px;" >아이디</p>
			            <input type="text" name="m_id" id="inputId" value="${member.m_id}" readonly="readonly">
		            </div> 	             
		        </div>	          
		          <div class="control-group  center">               
		            <div class="">
		              <p style="margin-left: -180px;" >이 &ensp; 름</p>
		              <input type="text" name="m_name" id="inputName" value="${member.m_name}">
		            </div>
		          </div>
		          <div class="control-group  center">               
		            <div class="">
		              <p style="margin-left: -180px;" >연락처</p>
		              <input type="text" name="m_phone" id="inputPhone" value="${member.m_phone}">
		            </div>
		          </div>
		          <div class="control-group  center">               
		            <div class="">
		              <p style="margin-left: -180px;" >E-mail</p>
		              <input type="text" name="m_email" id="inputEmail" value="${member.m_email}">
		            </div>
		          </div>
		          <div class="control-group  center">
		            <div class="">
		              <p class="line_9"></p>
		              <input type="submit" 
		                       class="btn btn-theme margintop10"
		                       style="width: 210px; height: 36px; font-size: 14px;"
		                       value="수정완료"> 
		            </div>
		          </div>
		
		          <p class="line_9"></p>
		                 
	
	        </form>
          </div>
      </div>
    </section>

<%@ include file="../includes/footer.jsp" %>