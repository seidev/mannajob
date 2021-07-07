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
              <li class="active">회원정보 관리</li>
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
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong></strong>회원 정보 관리</h3>
                    <p class="line_9"></p>
                  </div>

                  <div class="span9">
                    <div class="">
                      <h5>▶ 검색조건</h5>
                      <form method="get" action="/admin/manage">
                        <div class="media-body">
                        <p>
                          <span>
                            <select name="searchType">
								<option value="All">전체</option>
								<option value="Worker">현직자</option>
								<option value="Seeker">취준생</option>
							</select>
                          </span>
                          <span><input type="text" name="keyword" placeholder="아이디 입력" style="width: 200px; min-height: 30px;" /></span>
                          <!-- 버튼영역 -->
                          <span style="vertical-align: top;"><input type="submit" value="조회" class="btn btn-theme"></span>
                        </p>
                        </div>
                      </form>
                    </div>
                    <br>
                  </div> 
                  <div class="span9">                   
                    <h5>▶ 회원 정보</h5>
                    <p>
                      <span>조회결과 </span>
                      
                    </p>
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 10%">
                          <col style="width: 16%">
                          <col style="width: 10%">
                          <col style="width: 22%">
                          <col style="width: 22%">
                          <col style="width: 14%">
                        </colgroup>
                        <tr>
                          <td>
                            <p class="center" >번호</p>    
                          </td>
                          <td>
                            <p class="center">아이디</p>    
                          </td>
                          <td>
                            <p class="center">상태</p>    
                          </td>
                          <td>
                            <p class="center">가입일자</p>    
                          </td>
                          <td>
                            <p class="center">정지일자</p>    
                          </td>
                          <td>
                            <p class="center">비밀번호</p>
                            <p class="center" style="margin-top: -8px;margin-bottom: -8px;">초기화</p>    
                          </td>
                        </tr>
                        <c:forEach items="${memlist}" var="mem"> 
                        <tr>
                          <td>
                            <!-- 번호 -->
                            <p class="center">
                          		${mem.rn}  
                            </p>
                          </td>
                          
                          <td>
                            <!-- 아이디 -->
                            <p class="center"><a href="#"><c:out value="${mem.m_id }" /></a></p>
                          </td>
                          <td>
                            <!-- 상태 -->
                            <p class="center" >
                            <c:choose>
								<c:when test="${mem.m_del eq 'Y'}">탈퇴</c:when>
								<c:otherwise>정상</c:otherwise>
							</c:choose>
                            </p>
                          </td>
                          <td>
                            <!-- 가입일-->
                            <p class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${mem.m_cdate}" /></p>
                          </td>
                          <td>
                            <!-- 정지일자-->
                            <p class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${mem.m_stop}" /></p>
                          </td>
                          <td>
                            <!-- 비밀번호 초기화-->
                            <form method="get" action="/admin/reset" style="margin:0 auto;">
								<input type="hidden" name="m_id" value="${mem.m_id}">
								<p class="center" style="height: 10px;"><input type="submit" class="btn btn-mini btn-theme" value="초기화"></p>
							</form>
                            
                          </td>
                        </tr>  
                        </c:forEach>                 
                      </table>
                    </div>
                    <!-- 페이징 -->
                     <div class = "span8 center">
	                     <c:if test="${mempageMaker.prev}">
							<a href="/admin/manage?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${mempageMaker.startPage - 1}&amount=10">◀</a>
						</c:if>
						<c:forEach var="num" begin="${mempageMaker.startPage}" end="${mempageMaker.endPage}">
							<c:if test="${mempageMaker.cri.pageNum == num}">
				    		${num}	
				    		</c:if>
							<c:if test="${mempageMaker.cri.pageNum != num}">
				    			<a href="/admin/manage?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${num}&amount=10">${num}</a>
				    		</c:if>
				    		
						</c:forEach>
						<c:if test="${mempageMaker.next}">
							<a href="/admin/manage?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${mempageMaker.endPage + 1}&amount=10">▶</a>
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