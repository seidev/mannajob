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
              <li><a href="#">게시판</a><i class="icon-angle-right"></i></li>
              <li class="active">공지사항 <i class="icon-angle-right"></i></li>
              <li class="active">등록 </li>
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
                <h5 class="widgetheading height_40">게&nbsp&nbsp시&nbsp&nbsp판</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i><a href="/notice/list">공지사항</a></li>
                  <li><i class="icon-angle-right"></i><a href="/qna/list">QnA</a></li>
                </ul>
              </div>
            </aside>
          </div>
          <div class="span8">
            <article>
              <form method="post" action="/notice/insert" id="commentform" name="comment-form">
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>공지사항 </strong> 등록</h3>
                    <p class="line_9"></p>
                  </div>

                  <!-- <div class="row"> -->
                  <div class="span9">
                    <form>                    
                     <table class="table table-bordered">
                      <colgroup>
                        <col style="width: 20%">
                        <col style="width: 30%">
                        <col style="width: 20%">
                        <col style="width: 30%">
                      </colgroup>
                      <tr>
                        <td>
                          <p class="center">제 &emsp; 목</p>
                        </td>
                        <td colspan="3">
                          <!-- 제목 -->
                          <input type="text" name="n_subject">
                        </td>
                      </tr>
                      <tr> 
                        <td>
                          <p class="center">작성자</p>
                        </td>
                        <td>
                        <!--///////////////////////// 관리자 권한에 대한 수정이 필요 -->
                          <!-- 작성자 -->
                          <input type="text" name="ad_id" value="admin">
                        </td>
                        <td>
                          <p class="center">작&nbsp성&nbsp일</p>
                        </td>
                        <td>
                          <!-- 작성일 -->
                          <c:set var="now" value="<%=new java.util.Date()%>" />
						  <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
	                      <span><c:out value="${sysYear}"/></span>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="4">
                          <!-- 내용 -->
                          <textarea rows="15" name="n_contents"></textarea>
                        </td>
                      </tr>
                    </table>
                    <div class="span9">
                      <div class="box aligncenter">
                        <p class="center">
                          <input class="btn btn-theme margintop10 i_btn2" type="submit" value="등록하기">
                          <input class="btn btn-inverse margintop10 i_btn2" type="button" onclick="location.href='/notice/list'" value="취소">
                    </form>                          
                          <!--
                          <a href="#" class="btn btn-theme margintop10 a_btn2" type="button">수정하기</a>
                          <a href="#" class="btn btn-inverse margintop10 a_btn2" type="button">취소</a>
                          <button class="btn btn-theme margintop10" style="width: 100px; height: 40px;"
                            type="submit">수정하기</button>
                          <button class="btn btn-inverse margintop10" style="width: 100px; height: 40px;"
                            type="submit">취소</button>
                          -->
                        </p>
                      </div>
                    </div> 
                  </div>
                </div>
              </form>
            </article>
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>