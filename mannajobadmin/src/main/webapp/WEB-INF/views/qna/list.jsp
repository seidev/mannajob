<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>

<section id="inner-headline">
      <div class="container">
        <div class="row">
          <!-- <div class="span4">
            <div class="inner-heading">
                <h4>&nbsp</h4>
              <h4>마이페이지&nbsp >&nbsp 현직자&nbsp 지원</h4>
            </div>
          </div> -->
          <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">게시판</a><i class="icon-angle-right"></i></li>
              <li class="active">QnA</li>
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
                <!-- <form class="form-search">
                   
                    <input placeholder="Type something" type="text" class="input-medium search-query">
                    <button type="submit" class="btn btn-square btn-theme">Search</button>
                  </form>  -->

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
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>QnA</strong></h3>
                    <p class="line_9"></p>
                  </div>

                  <!-- divider -->
                  <div class="span9">
                    <div class="solidline">
                    </div>
                  </div>

                  <div class="span9">

                    <table class="table table-hover">
                      <colgroup>
                        <col style="width: 5%">
                        <col style="width: 10%">
                        <col style="width: 50%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: 15%">
                      </colgroup>
                      <thead>
                        <tr>
                          <th> 번호 </th>
                          <th> 카테고리 </th>
                          <th> 제 &ensp; 목 </th>
                          <th> 답변상태 </th>
                          <th> 작&nbsp성&nbsp자 </th>
                          <th> 작&nbsp성&nbsp일 </th>
                        </tr>
                      </thead>
                      <tbody>
                      		<c:forEach items="${list}" var="qna">
	                     		<tr>
									<td><c:out value="${qna.q_num}" /></td>
									<td>                        	
									<c:choose>
		                       		<c:when test="${qna.q_category == 'A'}">선택</c:when>
									<c:when test="${qna.q_category == 'B'}">매칭</c:when>
		                        	<c:when test="${qna.q_category == 'C'}">현직자</c:when>
									<c:when test="${qna.q_category == 'D'}">취준생</c:when>
		                            <c:when test="${qna.q_category == 'E'}">운영</c:when>
									<c:when test="${qna.q_category == 'Q'}">일정</c:when>
									<c:when test="${qna.q_category == 'X'}">기타</c:when>
									</c:choose>
									</td>
									<td><a href='/qna/view?q_num=${qna.q_num}&pageNum=${pageMaker.cri.pageNum}'>${qna.q_subject}</a></td>
									<td>
										<c:choose>
											<c:when test="${qna.reply_chk==1}">
												<p>답변완료</p>
											</c:when>
											<c:otherwise>
												<p>미답변</p>
											</c:otherwise>
										</c:choose>
									</td>
									<td><c:out value="${qna.m_id}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.q_udate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
                    </table>
                    <div class = "span8 center">
			        <c:if test="${pageMaker.prev}">
			    		<a href="/qna/list?pageNum=${pageMaker.startPage-1}&amount=10">◀</a>
			    	</c:if>
			    	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			    		<c:if test="${pageMaker.cri.pageNum == num}">
			    			${num}	
			    		</c:if>
			    		<c:if test="${pageMaker.cri.pageNum != num}">
			    			<a href="/qna/list?pageNum=${num}&amount=10">${num}</a>	
			    		</c:if>
			    	</c:forEach>
				    <c:if test="${pageMaker.next}">
				    	<a href="/qna/list?pageNum=${pageMaker.endPage+1}&amount=10">▶</a>
				    </c:if>
			   		</div>
                  <p class="line_9"></p>
                  <p class="line_9"></p>   
                  <p class="line_9"></p>        
                  <p class="line_9"></p>        


                  <div class="span8">
                    <div class="box aligncenter">
                      <p class="center">
                        <a href="/qna/insert/" class="btn btn-theme margintop10 a_btn1" >등록</a>
                        <!--
                        <button class="btn btn-theme margintop10" style="width: 200px; height: 45px;"
                          type="submit">공지사항 쓰기</button>
                        -->
                      </p>
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