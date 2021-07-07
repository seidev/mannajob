<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./includes/header.jsp" %>


    
    <section id="" style="min-height:680px">
      <div class="container">
        
        <!-- divider      -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider --> 
        <div class="row">
          <div class="span12" >
            <div class="inner-heading center">
              <h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspLogin to your <strong>account</strong></h4>
            </div>       
          </div>
        </div>

        <!-- divider      -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider --> 


        <form action="/logincheck" method="post" class="form-horizontal span12">
          <div class="control-group center">            
            <div class="">
              <p class="line_9"></p>
              <p class="line_9"></p>
              <p class="line_9"></p>
              <input type="text" name="m_id" id="id" placeholder="아이디를 입력하세요">
            </div>
          </div>
          <div class="control-group  center">            
            <div class="">
              <input type="password" id="passwd" name="m_passwd" placeholder="패스워드를 입력하세요">
            </div>
          </div>
          <div class="control-group  center">
            <div class="">
              <input type="submit" class="btn" style="width: 100px; height: 45px;" value="로그인" name="sumbit">
              <span>&nbsp&nbsp&nbsp&nbsp</span>
              <input type="button" value="회원가입" onclick="location.href='/join/member_agree'"class="btn" style="width: 100px;height: 45px;">
              <p class="line_9"></p> 
              <p class="line_9"></p> 
                      
          </div>
         
          <div class="control-group  center">
            <div  id="naver_id_login" class="">
              <a href="${naverurl}"> <img width="223"
                src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
              <p class="line_9"></p>
          </div>
          <div class="control-group  center">
            <div  id="kakao_id_login" class="">
              <a href="${kakaourl}"> <img width="223"
                src="/resources/img/kakao_login_medium_narrow.png" /></a>
              <p class="line_9"></p>
          </div>
          
            <p class="aligncenter margintop20">
              비밀번호를 잊으셨나요? <a href="#myReset" data-dismiss="modal" aria-hidden="true" data-toggle="modal">Reset</a>
            </p>
          </div>
        </form>
      </div>
     
    </section>





<%@ include file="./includes/footer.jsp" %>

