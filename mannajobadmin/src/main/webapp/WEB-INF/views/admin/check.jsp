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
              <li><a href="#">관리자</a><i class="icon-angle-right"></i></li>
              <li><a href="#">현직자 지원신청 검토</a></li>
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
                <h5 class="widgetheading height_40">관&nbsp&nbsp리&nbsp&nbsp자</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i><a href="/admin/manage">회원정보 관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/compl/manage">악성회원 신고관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/admin/check">현직자 신청 승인관리</a></li>
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
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp 현직자<strong></strong> 지원신청 검토</h3>
                    <p class="line_9"></p>
                  </div>

                  <div class="span9">
                    <div class="">
                      <h5>▶ 검색조건</h5>
                      <form method="get" action="/admin/check">
                        <div class="media-body">
                        <p>
                          <span>
                            <select name="searchType">
                              	<option value="All">전체</option>
								<option value="Ok">인증</option>
								<option value="Not">미인증</option>
                            </select>
                          </span>
                          <span><input type="text" name="keyword" style="width: 200px; min-height: 30px;" placeholder="아이디 입력" /></span>
                          <!-- 버튼영역 -->
                          <span style="vertical-align: top;"><input	type="submit" class="btn btn-theme" value="조회"></span>
                        </p>
                        </div>
               		</form>
                    </div>
                    <br>
                  </div> 
                  <div class="span9">                   
                    <h5>▶ 지원신청 검토</h5>
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 10%">
                          <col style="width: 20%">
                          <col style="width: 20%">
                          <col style="width: 20%">
                          <col style="width: 10%">
                          <col style="width: 10%">
                        </colgroup>
                        
                        <tr>
                          <td>
                            <p class="center" >번호</p>    
                          </td>
                          <td>
                            <p class="center" >아이디</p>    
                          </td>
                          <td>
                            <p class="center">지원서</p>    
                          </td>
                          <td>
                            <p class="center">신청일</p>    
                          </td>
                          <td>
                            <p class="center">인증여부</p>    
                          </td>
                          <td>
                            <p class="center">인증</p>    
                          </td>
                        </tr> 
                        <c:forEach items="${empllist}" var="empl">
                        <tr>
                          <td>
                            <!-- 번호 -->
                            <p class="center"><c:out value="${empl.e_num }" /></p>
                          </td>
                          <td style="width: 400px;">
                            <!-- 아이디 -->
                            <p class="center"><c:out value="${empl.m_id }" /></p>
                          </td>
                          <td>
                            <!-- 지원서 -->
                            <form method="get" action="/admin/emplapply" style="height: 10px; margin:0 auto;">
								<input type="hidden" name="e_num" value="${empl.e_num}">
								<p class="center"><input type="submit" class="btn btn-mini btn-theme" value="지원서 확인"></p>
							</form>
							
                          </td>
                          <td>
                            <!-- 신청일 -->
                            <p class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${empl.e_applydate}" /></p>
                          </td>
                          <td>
                            <!-- 인증여부-->
                            <p class="center">
                            <c:choose>
							<c:when test="${empl.e_ok eq 'Y'}">승인</c:when>
							<c:otherwise>미승인</c:otherwise>
							</c:choose>
							</p>
                          </td>
                          <td>
                          	<!-- 인증 버튼 -->
                          	<p class="cneter">
                          	<c:choose>
							<c:when test="${empl.e_ok eq 'Y'}">
							</c:when>
							<c:otherwise>
	                          	<form method="get" action="/admin/emplOk" style="height: 10px; margin:0 auto;">
								<input type="hidden" name="e_num" value="${empl.e_num}">
								<p class="center"><input type="submit" value="인증" class="btn btn-mini btn-theme"></p>
	                 			</form>
							</c:otherwise>
							</c:choose>
                          	</p>
                          </td>
                        </tr>  
                        </c:forEach>
                                       
                      </table>
                    </div>
                    <!-- 페이징 -->
                    <div class = "span8 center">
                      <c:if test="${emplpageMaker.prev}">
						<a href="/admin/check?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${emplpageMaker.startPage - 1}&amount=10">◀</a>
					  </c:if>
					  <c:forEach var="num" begin="${emplpageMaker.startPage}" end="${emplpageMaker.endPage}">
					  <c:if test="${emplpageMaker.cri.pageNum == num}">
    					${num}	
    				  </c:if>
					  <c:if test="${emplpageMaker.cri.pageNum != num}">
    				  	<a href="/admin/check?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${num}&amount=10">${num}</a>	
    				  </c:if>
					  </c:forEach>
					  <c:if test="${emplpageMaker.next}">
						<a href="/admin/check?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${emplpageMaker.endPage + 1}&amount=10">▶</a>
					  </c:if>
                    </div>
                  </div>
                </div>               
                    
            </article>
          </div>
        </div>
      </div>
    </section>

<%@ include file="../includes/footer.jsp" %>