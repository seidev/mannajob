<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../includes/header.jsp" %>
<script>
	window.name = 'matlist'; 
</script>
  <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">마이페이지</a><i class="icon-angle-right"></i></li>
              <li class="active">매칭내역 관리</li>
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
                <h5 class="widgetheading height_40">매&nbsp&nbsp&nbsp&nbsp칭</h5>
                                                                                            
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
          <div class="span8">
            <article>
             

                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong></strong>매칭 내역 관리(현직자, 취준생)</h3>
                    <p class="line_9"></p>
                  </div>
                  
                  <!-- 작성 내역 -->
                  <div class="span9">                   
                    <h5>▶ 작성 내역</h5>
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 10%">
                          <col style="width: auto">
                          <col style="width: 10%">
                          <col style="width: 10%">
                          <col style="width: 10%">
                        </colgroup>
                        <tr>
                          <td>
                            <p class="center" >번호</p>    
                          </td>
                          <td>
                            <p class="center" >제목</p>    
                          </td>
                          <td>
                            <p class="center">진행상태</p>    
                          </td>
                          <td>
                            <p class="center">신청현황</p>    
                          </td>
                          <td>
                            <p class="center">취소</p>    
                          </td>
                          <td>
                            <p class="center">리뷰</p>    
                          </td>
                        </tr> 
                      	<c:forEach items="${wmatlist}" var="wlist">
                        <tr>
                          <td>
                            <!-- 번호 -->
                            <p class="center">${wlist.b_num}</p>
                          </td>
                          <td style="width: 400px;">
                            <!-- 제목 -->
                            <p><c:out value="${wlist.b_subject}" /></p>
                          </td>
                          <td>
                            <!-- 진행상태 -->
                            <c:choose>
                            <c:when test="${wlist.b_state eq 'A'}"><p class="center">대기</p></c:when>
                            <c:when test="${wlist.b_state eq 'B'}"><p class="center">완료</p></c:when>
                            <c:otherwise ><p class="center">취소</p></c:otherwise>                           
                            </c:choose>
                          </td>
                          
                          <td>
                          	<c:if test="${wlist.b_state eq 'A'}">
                            <!-- 신청현황-->
                            
                            <p class="center"><button class="btn btn-mini btn-theme" onclick="window.open('/match/bmatlist?b_num=${wlist.b_num}', '신청 현황', 'width=600, height=500, location=no, status=no, scrollbars=yes');">신청 현황</button></p>
                            
                            </c:if>
                            <c:if test="${wlist.b_state eq 'B'}" >
                            <p class="center">매칭완료</p>
                            </c:if>
                            <c:if test="${wlist.b_state eq 'C'}" >
                            <p class="center">취소됨</p>
                            </c:if>
                          </td>
                          <td>
                          	<c:if test="${wlist.b_state ne 'C'}">
                            <!-- 취소-->
                            <p class="center"><a href="/bmatch/cancel?b_num=${wlist.b_num}" class="btn btn-mini btn-theme">취소</a></p>
                          	</c:if>
                          </td>
                          <td>
                          	<c:if test="${wlist.b_state eq 'B'}">
                          		<c:choose>
									<c:when test="${wlist.reviewVO.r_num eq null || wlist.reviewVO.r_w_m_id ne userId }">
										<p class="center"><a href="/review/insertB?b_num=${wlist.b_num}"
										 class="btn btn-mini btn-theme" onClick="window.open(this.href, '리뷰 작성', 'width=500, height=400'); return false">작성</a></p>
									</c:when>
									<c:otherwise>
										<p class="center"><a href="/review/update?r_num=${wlist.reviewVO.r_num}&r_mat_m_id=${wlist.reviewVO.r_mat_m_id}&r_contents=${wlist.reviewVO.r_contents}"
										 class="btn btn-mini btn-theme" onClick="window.open(this.href, '리뷰 수정', 'width=500, height=400'); return false">수정</a></p>
									</c:otherwise>
								</c:choose>
                          	</c:if>
                          </td>
                        </tr>  
                        </c:forEach>
                                             
                      </table>
                    </div>
                    <!-- 페이징 -->
                     
                    <div class="span8 center">
                      		<c:if test="${pageWmat.prev}">
								<a href="/match/matlist?pageNum=${pageWmat.startPage - 1}&amount=5&pageNumP=${pageMat.scri.pageNumP}&amountP=${pageMat.scri.amountP}">◀</a>
							</c:if>
							<c:forEach var="num" begin="${pageWmat.startPage}" end="${pageWmat.endPage}">
							<c:if test="${pageWmat.cri.pageNum == num}">
								${num}
							</c:if>
							<c:if test="${pageWmat.cri.pageNum != num}">
                				<a href="/match/matlist?pageNum=${num}&amount=5&pageNumP=${pageMat.scri.pageNumP}&amountP=${pageMat.scri.amountP}">${num}</a>
                			</c:if>
                			</c:forEach>
							<c:if test="${pageWmat.next}">
								<a href="/match/matlist?pageNum=${pageWmat.endPage + 1}&amount=5&pageNumP=${pageMat.scri.pageNumP}&amountP=${pageMat.scri.amountP}">▶</a>
							</c:if>
                    </div>
                     
                  </div>


                  <!-- 신청 내역 -->
                  <div class="span9">                   
                    <h5>▶ 신청 내역</h5>
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 10%">
                          <col style="width: auto">
                          <col style="width: 10%">
                          <col style="width: 10%">
                          <col style="width: 10%">
                        </colgroup>
                        <tr>
                          <td>
                            <p class="center" >번호</p>    
                          </td>
                          <td>
                            <p class="center" >제목</p>    
                          </td>
                          <td>
                            <p class="center">진행상태</p>    
                          </td>
                          <td>
                            <p class="center">취소</p>    
                          </td>
                          <td>
                            <p class="center">리뷰</p>    
                          </td>
                        </tr>
                        <c:forEach items="${matlist}" var="mlist"> 
                        <tr>
                          <td>
                            <!-- 번호 -->
                            <p class="center">${mlist.mat_num}</p>
                          </td>
                          <td style="width: 400px;">
                            <!-- 제목 -->
                            <p>${mlist.b_subject}</p>
                          </td>
                          <td>
                            <!-- 진행상태 -->
                             <c:choose>
                            <c:when test="${mlist.mat_state eq 'A'}"><p class="center">요청</p></c:when>
                            <c:when test="${mlist.mat_state eq 'B'}"><p class="center">거절</p></c:when>
                            <c:when test="${mlist.mat_state eq 'C'}"><p class="center">완료</p></c:when>
                            <c:otherwise ><p class="center">취소</p></c:otherwise>                           
                            </c:choose>                    
                          </td>
                          <td>
                            <!-- 취소-->
                            <c:choose>
                            <c:when test="${mlist.mat_state eq 'A'}">
                            <p class="center"><a href="/match/cancel?mat_num=${mlist.mat_num}" onClick="window.open(this.href, '매칭 취소', 'width=400, height=200'); return false" class="btn btn-mini btn-theme">취소</a></p>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                            </c:choose>
                          </td>
                          <td>
                          <c:if test="${mlist.mat_state eq 'C' }">
                          	<c:choose>

                          		<c:when test="${mlist.reviewVO.r_num ne null}">
									<c:choose>
										<c:when test="${mlist.reviewVO.r_w_m_id eq userId }">
											<p class="center"><a href="/review/update?r_num=${mlist.reviewVO.r_num}&r_mat_m_id=${mlist.reviewVO.r_mat_m_id}&r_contents=${mlist.reviewVO.r_contents}" class="btn btn-mini btn-theme" onClick="window.open(this.href, '리뷰 수정', 'width=500, height=400'); return false">수정</a></p>
										</c:when>
										<c:otherwise>
											<p class="center"><a href="/review/insertM?mat_num=${mlist.matchVO.mat_num}&r_mat_m_id=${mlist.m_id}" class="btn btn-mini btn-theme" onClick="window.open(this.href, '리뷰 작성', 'width=500, height=400'); return false">작성</a></p>
										</c:otherwise>
									</c:choose>

                          		</c:when>
                          		<c:otherwise>

									<p class="center"><a href="/review/insertM?mat_num=${mlist.matchVO.mat_num}&r_mat_m_id=${mlist.m_id}" class="btn btn-mini btn-theme" onClick="window.open(this.href, '리뷰 작성', 'width=500, height=400'); return false">작성</a></p>
                          		</c:otherwise>
                          	</c:choose>
							</c:if>
                          </td>
                        </tr>  
                        </c:forEach>
                      </table>
                    </div>
                    <!-- 페이징 -->
                     
                    <div class="span8 center">
                      <c:if test="${pageMat.prev}">
						<a href="/match/matlist?pageNumP=${pageMat.startPage - 1}&amountP=10&pageNum=${pageWmat.cri.pageNum}&amount=${pageWmat.cri.amount}">◀</a>
					  </c:if>
					  
					  <c:forEach var="num" begin="${pageMat.startPage}" end="${pageMat.endPage}">
					  <c:if test="${pageMat.scri.pageNumP == num}">
					  	${num}
					  </c:if>
					  <c:if test="${pageMat.scri.pageNumP != num}">
                	  	<a href="/match/matlist?pageNumP=${num}&amountP=10&pageNum=${pageWmat.cri.pageNum}&amount=${pageWmat.cri.amount}">${num}</a>
                      </c:if>
                      </c:forEach>
				  	  <c:if test="${pageMat.next}">
			          	<a href="/match/matlist?pageNumP=${pageMat.endPage + 1}&amountP=10&pageNum=${pageWmat.cri.pageNum}&amount=${pageWmat.cri.amount}">▶</a>
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
