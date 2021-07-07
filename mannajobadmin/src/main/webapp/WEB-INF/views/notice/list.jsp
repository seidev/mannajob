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
              <li class="active">공지사항</li>
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
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>공지사항</strong></h3>
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
                        <col style="width: 50%">
                        <col style="width: 15%">
                        <col style="width: 15%">
                        <col style="width: 15%">
                      </colgroup>
                      <thead>
                        <tr>
                          <th> 번호 </th>
                          <th> 제 &emsp; 목 </th>
                          <th> 작성자 </th>
                          <th> 작&nbsp성&nbsp일 </th>
                          <th> 조&nbsp회&nbsp수 </th>
                        </tr>
                      </thead>
                      <tbody>
                      		<c:forEach items="${list}" var="notice">
                        <tr>
                          <!-- 번호 -->
                          <td><c:out value="${notice.n_num}" /> </td>
                          <!-- 제목 -->
                          <td><a href='/notice/view?n_num=${notice.n_num}&pageNum=${pageMaker.cri.pageNum}'>${notice.n_subject}</a></td>
                          <!-- 작성자  -->
                          <td><c:out value="${notice.ad_id}" /></td>
                          <!-- 작성일 -->
                          <td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.n_udate}" /></td>
                          <!-- 조회수 -->
                          <td><c:out value="${notice.n_cnt}" /></td>
                          </c:forEach>
                        
                    </tbody>
                  </table>
                  <div class = "span8 center">
                  	<c:if test="${pageMaker.prev}">
    					<a href="/notice/list?pageNum=${pageMaker.startPage-1}&amount=10">◀</a>
    				</c:if>
    				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
    				<c:if test="${pageMaker.cri.pageNum == num}">
			    		${num}	
    				</c:if>
    				<c:if test="${pageMaker.cri.pageNum != num}">
    					<a href="/notice/list?pageNum=${num}&amount=10">${num}</a>	
    				</c:if>
    				</c:forEach>
				    <c:if test="${pageMaker.next}">
    					<a href="/notice/list?pageNum=${pageMaker.endPage+1}&amount=10">▶</a>
    				</c:if>
    				</div>
                  <p class="line_9"></p>
                  <p class="line_9"></p>   
                  <p class="line_9"></p>        
                  <p class="line_9"></p>        


                  <div class="span8">
                    <div class="box aligncenter">
                      <p class="center">
                        <a href="/notice/insert" class="btn btn-theme margintop10 a_btn1" type="button">등록</a>
                        <!-- 
                        <button class="btn btn-theme margintop10" style="width: 200px; height: 45px;"
                        type="submit">등록</button> 
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