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
              <li><a href="#">매칭</a><i class="icon-angle-right"></i></li>
              <li class="active">취업준비생 매칭 리스트</li>
               
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
                <h5 class="widgetheading height_40">매&nbsp&nbsp&nbsp&nbsp칭</h5>

                <ul class="cat">
                   <li><i class="icon-angle-right"></i><a href="/bmatch/list?b_category=A">현직자 매칭 리스트</a></li>
                  <li><i class="icon-angle-right"></i><a href="/bmatch/list?b_category=B">쥐업준비생 매칭 리스트</a></li>
                   


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
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>취업준비생</strong> 매칭 리스트</h3>
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
                        <col style="width:6%"/>
                        <col style="width:30%"/>
                        <col style="width:14%"/>
                        <col style="width:10%"/>
                        <col style="width:12%"/>
                        <col style="width:14%"/>
                        <col style="width:12%"/>
                      </colgroup>
                      <thead>
                        <tr>
                          <th>  번호 </th>
                          <th> 제 &nbsp;&nbsp;&nbsp; 목</th>
                          <th> 기 &nbsp&nbsp&nbsp 간</th>
                          <th> 가 &nbsp&nbsp 격</th>
                          <th> 분 &nbsp&nbsp 야</th>
                          <th> 기 &nbsp&nbsp 업 &nbsp&nbsp 명</th>
                          <th> 지 &nbsp&nbsp 역</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="bmatch" items="${list}">
                        <tr>
                          <!-- 번호 -->
                          <td><c:out value="${bmatch.b_num}" /></td>
                          <!-- 제목 -->
                          <td><a href="/bmatch/view?b_num=${bmatch.b_num}&pageNum=${page.cri.pageNum}&b_category=${bmatch.b_category}&m_id=${bmatch.m_id}">${bmatch.b_subject}</a></td>
                          <td> 
                            <!-- 기간 from ~ to  -->
                            <span><c:out value="${bmatch.b_stdate}" /></span><br>
                            <span> ~ </span>
                            <span><c:out value="${bmatch.b_endate}" /></span>
                          </td>
                          <!-- 가격 -->
                          <td><c:out value="${bmatch.b_price}" /></td>
                          <!-- 직무 -->
                          <td><c:out value="${bmatch.b_task}" /></td>
                          <!-- 기업명 -->
                          <td><c:out value= "${bmatch.b_corp}"/></td>
                          <!-- 지역 -->
                          <td><c:out value= "${bmatch.b_location}"/></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                  </table>
                  <div class = "span8 center">
                  <c:if test="${page.prev}">
    				<a href="/bmatch/list?b_category=B&pageNum=${page.startPage-1}&amount=10">◀</a>
    			  </c:if>
    			  <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
    				<c:if test="${page.cri.pageNum == num}">
    				${num}	
    			  </c:if>
    			  <c:if test="${page.cri.pageNum != num}">
    				<a href="/bmatch/list?b_category=B&pageNum=${num}&amount=10">${num}</a>
    			  </c:if>
    			  </c:forEach>
    			  <c:if test="${page.next}">
    				<a href="/bmatch/list?b_category=B&pageNum=${page.endPage+1}&amount=10">▶</a>
    			  </c:if>
    			  </div>
                  <p class="line_9"></p>
                  <p class="line_9"></p>   
                  <p class="line_9"></p>        
                  <p class="line_9"></p>
                  </div>  


                  <div class="span8">
                    <div class="box aligncenter">
                      <p class="center">
                        <a href="/bmatch/insert?b_category=B&pageNum=${page.cri.pageNum}" class="btn btn-theme margintop10 a_btn1" type="button">매칭글쓰기</a>
                      </p>
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