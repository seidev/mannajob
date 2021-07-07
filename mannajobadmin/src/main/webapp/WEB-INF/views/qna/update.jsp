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
              <li class="active">QnA <i class="icon-angle-right"></i></li>
              <li class="active">수정 </li>
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
              <form id="commentform" action="#" method="post" name="comment-form">
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>QnA </strong> 수정</h3>
                    <p class="line_9"></p>
                  </div>

                  <!-- <div class="row"> -->
                  <div class="span9">
                    <form method="post" action="/qna/update">
                     	<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="q_num" value="${qna.q_num}">
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
                          <input type="text" name="q_subject" value="<c:out value="${qna.q_subject}" />">
                        </td>
                      </tr>
                      <tr> 
                        <td>
                          <p class="center">카테고리</p>
                        </td>
                        <td>
                          <!-- 카테고리 -->
                          <select name="q_category">
                            <option value="A">선택</option>
                            <option value="B">매칭</option>
                            <option value="C" selected>현직자</option>
                            <option value="D">취준생</option>
                            <option value="E">운영</option>
                            <option value="Q">일정</option>
                            <option value="X">기타</option>
                          </select>
                        </td>
                        <td>
                          <p class="center">작&nbsp성&nbsp자</p>
                        </td>
                        <td>
                          <!-- 작성자 -->
                          <c:out value="${qna.m_id}" />
                        </td>
                      </tr>
                      <tr>
                        <td colspan="4">
                          <!-- 내용 -->
                         <textarea rows="15" name="q_contents"><c:out value="${qna.q_contents}" escapeXml="false" /></textarea>
                        </td>
                      </tr>
                    </table>
                    
                    <!-- 버튼영역 -->
                    <div class="box aligncenter">
                      <p class="center">
                        <input class="btn btn-theme margintop10 i_btn2" type="submit" value="수정하기">
                        <input class="btn btn-inverse margintop10 i_btn2" type="button" onclick="location.href='/qna/view?q_num=${qna.q_num}&pageNum=${cri.pageNum}'"  value="취소">
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
              </form>
            </article>
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>