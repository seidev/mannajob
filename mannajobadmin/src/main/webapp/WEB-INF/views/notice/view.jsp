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
              <li class="active">상세 </li>
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
              
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>공지사항 </strong> 상세</h3>
                    <p class="line_9"></p>
                  </div>

                  <!-- <div class="row"> -->
                  <div class="span9">
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
                          <c:out value="${notice.n_subject}" />
                        </td>
                      </tr>
                      <tr> 
                        <td>
                          <p class="center">작성자</p>
                        </td>
                        <td>
                          <!-- 작성자 -->
                          <c:out value="${notice.ad_id}" />
                        </td>
                        <td>
                          <p class="center">작&nbsp성&nbsp일</p>
                        </td>
                        <td>
                          <!-- 작성일 -->
                          <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${notice.n_udate}" />
                        </td>
                      </tr>
                      <tr>
                        <td colspan="4">
                          <!-- 내용 -->
                          <c:out value="${notice.n_contents}" escapeXml="false" />
                        </td>
                      </tr>
                    </table>
                    <div class="span9">
                      <div class="box aligncenter">
                        <p class="center">
                          <a href="/notice/update?n_num=${notice.n_num}&pageNum=${cri.pageNum}" class="btn btn-theme margintop10 i_btn4" >수정하기</a>
                          <a href="/notice/delete?n_num=${notice.n_num}&pageNum=${cri.pageNum}" class="btn btn-inverse margintop10 i_btn4">삭제하기</a>
                          <a href="/notice/list?pageNum=${cri.pageNum}&amount=10" class="btn btn-inverse margintop10 i_btn4" >리스트</a>
                          <!--
                          <a href="#" class="btn btn-theme margintop10 a_btn2" type="button">수정하기</a>
                          <a href="#" class="btn btn-inverse margintop10 a_btn2" type="button">삭제하기</a>
                          <a href="#" class="btn btn-inverse margintop10 a_btn2" type="button">리스트</a>
                          <button class="btn btn-inverse margintop10" style="width: 100px; height: 40px;"
                            type="submit">리스트</button> 
                          <button class="btn btn-theme margintop10" style="width: 100px; height: 40px;"
                            type="submit">수정하기</button>                         
                          <button class="btn btn-inverse margintop10" style="width: 100px; height: 40px;"
                            type="submit">삭제하기</button>
                          -->
                        </p>
                      </div>
                    </div> 
                  </div>
                </div>
              
            </article>
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>